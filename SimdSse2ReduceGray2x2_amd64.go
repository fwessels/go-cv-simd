//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2ReduceGray2x2(src unsafe.Pointer, srcWidth, srcHeight, srcStride uint64, dst unsafe.Pointer, dstWidth, dstStride uint64)

//
func SimdSse2ReduceGray2x2(src, dst View) {

	_SimdSse2ReduceGray2x2(src.GetData(), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(src.GetStride()), dst.GetData(), uint64(dst.GetWidth()), uint64(dst.GetStride()))
}
