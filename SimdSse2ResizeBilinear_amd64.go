//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2EstimateAlphaIndexX(srcSize, dstSize uint64, indexes, alphas unsafe.Pointer)

//go:noescape
func _SimdSse2ResizeBilinear(src unsafe.Pointer, srcWidth, srcHeight, srcStride uint64, dst unsafe.Pointer, dstWidth, dstHeight, dstStride uint64, channelCount uint64, pbuffer unsafe.Pointer)


//
func SimdSse2EstimateAlphaIndexX(srcSize, dstSize uint64, indexes, alphas unsafe.Pointer) {

	SimdSse2EstimateAlphaIndexX(srcSize, dstSize, indexes, alphas)
}

//
func SimdSse2ResizeBilinear(src, dst View) {

	size := 1024
	pbuffer := Allocate(size, 32)

	_SimdSse2ResizeBilinear(src.GetData(), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(src.GetStride()),
		dst.GetData(), uint64(dst.GetWidth()), uint64(dst.GetHeight()), uint64(dst.GetStride()), uint64(ChannelCount(src.GetFormat())), pbuffer)
}
