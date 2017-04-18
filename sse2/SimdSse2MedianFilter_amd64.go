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

// SimdSse2MedianFilterRhomb3x3 performs median filtration of input image (filter window is a rhomb 3x3).
// All images must have the same width, height and format (8-bit gray, 16-bit UV, 24-bit BGR or 32-bit BGRA).
func SimdSse2MedianFilterRhomb3x3(src, dst View) {

	_SimdSse2MedianFilterRhomb3x3(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}

// SimdSse2MedianFilterSquare3x3 performs median filtration of input image (filter window is a square 3x3).
// All images must have the same width, height and format (8-bit gray, 16-bit UV, 24-bit BGR or 32-bit BGRA).
func SimdSse2MedianFilterSquare3x3(src, dst View) {

	_SimdSse2MedianFilterSquare3x3(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}

// SimdSse2MedianFilterRhomb5x5 performs median filtration of input image (filter window is a rhomb 5x5).
// All images must have the same width, height and format (8-bit gray, 16-bit UV, 24-bit BGR or 32-bit BGRA).
func SimdSse2MedianFilterRhomb5x5(src, dst View) {

	_SimdSse2MedianFilterRhomb5x5(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}

// SimdSse2MedianFilterSquare5x5 performs median filtration of input image (filter window is a square 5x5).
// All images must have the same width, height and format (8-bit gray, 16-bit UV, 24-bit BGR or 32-bit BGRA).
func SimdSse2MedianFilterSquare5x5(src, dst View) {

	_SimdSse2MedianFilterSquare5x5(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()))
}
