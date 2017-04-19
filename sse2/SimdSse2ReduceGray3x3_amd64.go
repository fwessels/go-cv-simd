//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2ReduceGray3x3(src unsafe.Pointer, srcWidth, srcHeight, srcStride uint64, dst unsafe.Pointer, dstWidth, dstHeight, dstStride uint64, compensation int)

//
func SimdSse2ReduceGray3x3(src, dst View, compensation int) {

	_SimdSse2ReduceGray3x3(src.GetData(), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(src.GetStride()), dst.GetData(), uint64(dst.GetWidth()), uint64(dst.GetHeight()), uint64(dst.GetStride()), compensation)
}
