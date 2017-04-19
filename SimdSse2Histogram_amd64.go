//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)

//go:noescape
func _SimdSse2HistogramBufAllocSize(width int) (alloc int)

//go:noescape
func _SimdSse2AbsSecondDerivativeHistogram(src unsafe.Pointer, width, height, stride, step, indent uint64, histogram unsafe.Pointer, buffer unsafe.Pointer)

//go:noescape
func _SimdSse2HistogramMasked(src unsafe.Pointer, srcStride, width, height uint64, mask unsafe.Pointer, maskStride uint64, index uint64/*uint8*/, histogram unsafe.Pointer, buffer unsafe.Pointer)

//go:noescape
func _SimdSse2HistogramConditional(src unsafe.Pointer, srcStride, width, height uint64, mask unsafe.Pointer, maskStride uint64, value uint64/*uint8*/, compareType uint64/*uint8*/, histogram unsafe.Pointer, buffer unsafe.Pointer)

//
func SimdSse2AbsSecondDerivativeHistogram(src View, step, indent uint64, histo View) {

	size := _SimdSse2HistogramBufAllocSize(src.GetWidth())
	// TODO: Find out why we need to pass size*4 here
	pbuffer := Allocate(size*4, 32)

	_SimdSse2AbsSecondDerivativeHistogram(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), step, indent, histo.GetData(), pbuffer)
}

//
func SimdSse2HistogramMasked(src, mask View, index uint64/*uint8*/) []uint32 {

	size := _SimdSse2HistogramBufAllocSize(src.GetWidth())
	// TODO: Find out why we need to pass size*4 here
	pbuffer := Allocate(size*4, 32)

	histo := make([]uint32, 256)

	_SimdSse2HistogramMasked(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), index, unsafe.Pointer(&histo[0]), pbuffer)

	return histo
}

//
func SimdSse2HistogramConditional(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/, histo View) {

	size := _SimdSse2HistogramBufAllocSize(src.GetWidth())
	// TODO: Find out why we need to pass size*4 here
	pbuffer := Allocate(size*4, 32)

	_SimdSse2HistogramConditional(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, histo.GetData(), pbuffer)
}
