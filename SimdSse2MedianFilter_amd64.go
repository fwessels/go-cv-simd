//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2MedianFilterRhomb3x3(src unsafe.Pointer, srcStride, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2MedianFilterSquare3x3(src unsafe.Pointer, srcStride, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2MedianFilterRhomb5x5(src unsafe.Pointer, srcStride, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2MedianFilterSquare5x5(src unsafe.Pointer, srcStride, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64)

//
func SimdSse2MedianFilterRhomb3x3(src, dst View) {

	_SimdSse2MedianFilterRhomb3x3(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}

//
func SimdSse2MedianFilterSquare3x3(src, dst View) {

	_SimdSse2MedianFilterSquare3x3(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}

//
func SimdSse2MedianFilterRhomb5x5(src, dst View) {

	_SimdSse2MedianFilterRhomb5x5(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}

//
func SimdSse2MedianFilterSquare5x5(src, dst View) {

	_SimdSse2MedianFilterSquare5x5(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}
