//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
	"github.com/fwessels/go-cv"
)

//go:noescape
func _SimdSse2Reorder16bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//go:noescape
func _SimdSse2Reorder32bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//go:noescape
func _SimdSse2Reorder64bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//
func SimdSse2Reorder16bit(src gocv.View, size uint64, dst gocv.View) {

	_SimdSse2Reorder16bit(src.GetData(), size, dst.GetData())
}

//
func SimdSse2Reorder32bit(src gocv.View, size uint64, dst gocv.View) {

	_SimdSse2Reorder32bit(src.GetData(), size, dst.GetData())
}

//
func SimdSse2Reorder64bit(src gocv.View, size uint64, dst gocv.View) {

	_SimdSse2Reorder64bit(src.GetData(), size, dst.GetData())
}
