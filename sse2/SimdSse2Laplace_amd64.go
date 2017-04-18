//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Laplace(src unsafe.Pointer, srcStride int, width int, height int, dst unsafe.Pointer, dstStride int)

// SimdSse2Laplace calculates Laplace's filter.
// All images must have the same width and height. Input image must has 8-bit gray format, output image must has 16-bit integer format.
func SimdSse2Laplace(src, dst View) {
	_SimdSse2Laplace(src.GetData(), src.GetStride(), src.GetWidth(), src.GetHeight(), dst.GetData(), dst.GetStride())
}
