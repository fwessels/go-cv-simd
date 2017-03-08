//+build !noasm
//+build !appengine

/*
 * Minio Cloud Storage, (C) 2017 Minio, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package gocvsimd

import (
	"fmt"
	"github.com/fwessels/go-cv"
	"io/ioutil"
	"unsafe"
)

//go:noescape
func _SimdAvx2Detection(hid unsafe.Pointer, imageMask unsafe.Pointer, rect unsafe.Pointer, imageDst unsafe.Pointer, buffer unsafe.Pointer, stack unsafe.Pointer)

const Resolution = 256

func setupDectection(path string) (unsafe.Pointer, unsafe.Pointer, int, int, int, int, gocv.View, gocv.View, gocv.View) {

	throughColumn, int16 := 0, 0

	srcdata, err := ioutil.ReadFile("./sample_zoomed_out.data")
	if err != nil {
		panic("Reading source input data")
	}

	src := gocv.View{}
	src.Recreate(Resolution, Resolution, gocv.GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:Resolution*Resolution], srcdata[:])

	width, height := src.GetWidth(), src.GetHeight()

	sum, sqsum, tilted := gocv.View{}, gocv.View{}, gocv.View{}
	sum.Recreate(width+1, height+1, gocv.INT32)
	sqsum.Recreate(width+1, height+1, gocv.INT32)
	tilted.Recreate(width+1, height+1, gocv.INT32)

	dat := gocv.DetectionLoadA(path)
	if dat == nil {
		panic("Cannot load cascade")
	}

	hid := gocv.DetectionInit(dat, sum, sqsum, tilted, throughColumn, int16)
	if hid == nil {
		panic("Cannot initialize haar cascade")
	}

	mask := gocv.View{}
	mask.Recreate(width, height, gocv.GRAY8)
	gocv.Fill(mask, 255)

	w, h, _ := gocv.DetectionInfo(dat)

	// if ((flags &SimdDetectionInfoFeatureMask) == SimdDetectionInfoFeatureLbp)
	//     Simd::Integral(src, sum);
	// if (flags&SimdDetectionInfoHasTilted)
	//     Simd::Integral(src, sum, sqsum, tilted);
	// else
	gocv.Integral(src, sum, sqsum, tilted)

	gocv.DetectionPrepare(hid)

	dst := gocv.View{}
	dst.Recreate(width, height, gocv.GRAY8)

	gocv.Fill(dst, 0)

	return dat, hid, width, height, w, h, src, mask, dst
}

type SimdBuffer struct {
	m, d unsafe.Pointer
}

type SimdRect struct {
	left   uint64
	top    uint64
	right  uint64
	bottom uint64
}

// &Simd::View               = 0x7fff500ee240
// &(const size_t width)     = 0x7fff500ee240
// &(const size_t height)    = 0x7fff500ee248
// &(const ptrdiff_t stride) = 0x7fff500ee250
// &(const Format format)    = 0x7fff500ee258
// &(uint8_t * const data)   = 0x7fff500ee260

type SimdView struct {
	width  uint64
	height uint64
	stride uint64
	format uint64
	data   unsafe.Pointer
}

func Detection() {

	_, hid, width, height, w, h, src, maskView, dstView := setupDectection("/home/minio/fwessels/Simd/data/cascade/haar_face_0.xml")

	_ = src // hang on to src

	rect := SimdRect{left: uint64(width / 9), top: uint64(height / 11), right: uint64(width - w), bottom: uint64(height - h)}

	m := make([]byte, 256*8*2)
	d := make([]byte, 256*8*2)
	buffer := SimdBuffer{m: unsafe.Pointer(&m[0]), d: unsafe.Pointer(&d[0])}

	mask := SimdView{width: uint64(maskView.GetWidth()), height: uint64(maskView.GetHeight()), stride: uint64(maskView.GetStride()), format: uint64(maskView.GetFormat()), data: maskView.GetData()}
	dst := SimdView{width: uint64(dstView.GetWidth()), height: uint64(dstView.GetHeight()), stride: uint64(dstView.GetStride()), format: uint64(dstView.GetFormat()), data: dstView.GetData()}

	localstack := make([]byte, 1024)
	alignedStack := (uintptr(unsafe.Pointer(&localstack[0])) &^ uintptr(31))

	// Call into golang assembly
	_SimdAvx2Detection(hid, unsafe.Pointer(&mask), unsafe.Pointer(&rect), unsafe.Pointer(&dst), unsafe.Pointer(&buffer), unsafe.Pointer(alignedStack+uintptr(32-8)))

	Annotate(dstView, w, h)
}

func Annotate(dst gocv.View, w, h int) {

	mask := make([]byte, dst.GetStride()*dst.GetHeight())

	copy(mask[:], (*[Resolution * Resolution]byte)(dst.GetData())[:])

	for i, b := range mask {
		if b != 0 {
			row := i / Resolution
			col := i % Resolution
			fmt.Println("bounding box: col =", col, ", row =", row, ", col + w =", col+w, ", row + h =", row+h)
		}
	}
}
