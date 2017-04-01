//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Laplace(src unsafe.Pointer, srcStride int, width int, height int, dst unsafe.Pointer, dstStride int)

func SimdSse2Laplace(src, dst View) {
	_SimdSse2Laplace(src.GetData(), src.GetStride(), src.GetWidth(), src.GetHeight(), dst.GetData(), dst.GetStride())
}
