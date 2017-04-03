package gocvsimd

import (
	"unsafe"
)

//go:noescape
func _SimdSse2ReduceGray4x4BufAllocSize(width int) int

//go:noescape
func _SimdSse2ReduceGray4x4(src unsafe.Pointer, srcWidth int, srcHeight int, srcStride int, dst unsafe.Pointer, dstWidth int, dstHeight int, dstStride int, buffer unsafe.Pointer)

func SimdSse2ReduceGray4x4(src, dst View) {
	pbuffer := Allocate(_SimdSse2ReduceGray4x4BufAllocSize(dst.GetWidth()), 32)
	_SimdSse2ReduceGray4x4(src.GetData(), src.GetWidth(), src.GetHeight(), src.GetStride(),
		dst.GetData(), dst.GetWidth(), dst.GetHeight(), dst.GetStride(), pbuffer)
}
