//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2GrayToBgra(gray unsafe.Pointer, width uint64, height uint64, grayStride uint64, bgra unsafe.Pointer, bgraStride uint64)

func SimdSse2GrayToBgra(gray, bgra View) {
	_SimdSse2GrayToBgra(gray.GetData(), uint64(gray.GetWidth()), uint64(gray.GetHeight()), uint64(gray.GetStride()), bgra.GetData(), uint64(bgra.GetStride()))
}
