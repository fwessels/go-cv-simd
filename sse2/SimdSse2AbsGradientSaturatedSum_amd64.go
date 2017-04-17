//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2AbsGradientSaturatedSum(src unsafe.Pointer, srcStride, width, height uint64, dst unsafe.Pointer, dstStride uint64)

func SimdSse2AbsGradientSaturatedSum(src, dst View) {

	_SimdSse2AbsGradientSaturatedSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), dst.GetData(), uint64(dst.GetStride()))
}
