package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2ReduceGray4x4(src unsafe.Pointer, srcWidth int, srcHeight int, srcStride int, dst unsafe.Pointer, dstWidth int, dstHeight int, dstStride int)

func SimdSse2ReduceGray4x4(src, dst View) {
	_SimdSse2ReduceGray4x4(src.GetData(), src.GetWidth(), src.GetHeight(), src.GetStride(),
		dst.GetData(), dst.GetWidth(), dst.GetHeight(), dst.GetStride())
}
