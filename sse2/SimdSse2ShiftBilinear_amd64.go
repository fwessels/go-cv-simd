//+build !noasm
//+build !appengine

/*
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

import "unsafe"

//go:noescape
func _SimdSse2ShiftBilinear(src unsafe.Pointer, srcStride, width, height, channelCount uint64, bkg unsafe.Pointer, bkgStride uint64, shiftX, shiftY unsafe.Pointer, cropLeft, cropTop, cropRight, cropBottom uint64, dst unsafe.Pointer, dstStride uint64)

//
func SimdSse2ShiftBilinear(src, bkg View, dst View) {

	shiftX, shiftY := float64(0.0), float64(0.0)
	cropLeft, cropTop, cropRight, cropBottom := uint64(0), uint64(0), uint64(0), uint64(0)

	_SimdSse2ShiftBilinear(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())),
		bkg.GetData(), uint64(bkg.GetStride()),
		unsafe.Pointer(&shiftX), unsafe.Pointer(&shiftY),
		cropLeft, cropTop, cropRight, cropBottom,
		dst.GetData(), uint64(dst.GetStride()))
}
