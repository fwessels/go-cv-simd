//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2BgraToGray(bgra unsafe.Pointer, width uint64, height uint64, bgraStride uint64, gray unsafe.Pointer, grayStride uint64)

func SimdSse2BgraToGray(bgra, gray View) {

	_SimdSse2BgraToGray(bgra.GetData(), uint64(bgra.GetWidth()), uint64(bgra.GetHeight()), uint64(bgra.GetStride()), gray.GetData(), uint64(gray.GetStride()))
}
