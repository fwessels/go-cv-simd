//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2GrayToBgra(gray unsafe.Pointer, width uint64, height uint64, grayStride uint64, bgra unsafe.Pointer, bgraStride uint64)

// SimdSse2GrayToBgra converts 8-bit gray image to 32-bit BGRA image.
// All images must have the same width and height.
func SimdSse2GrayToBgra(gray, bgra View) {
	_SimdSse2GrayToBgra(gray.GetData(), uint64(gray.GetWidth()), uint64(gray.GetHeight()), uint64(gray.GetStride()), bgra.GetData(), uint64(bgra.GetStride()))
}
