//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)

//go:noescape
func _SimdSse2MeanFilter3x3BufAllocSize(width, channelCount int) int

//go:noescape
func _SimdSse2MeanFilter3x3(src unsafe.Pointer, srcStride, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64, buffer unsafe.Pointer)

//
func SimdSse2MeanFilter3x3(src, dst View) {

	size := _SimdSse2MeanFilter3x3BufAllocSize(src.GetWidth(), ChannelCount(src.GetFormat()))
	pbuffer := Allocate(size, 32)

	_SimdSse2MeanFilter3x3(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()), pbuffer)
}
