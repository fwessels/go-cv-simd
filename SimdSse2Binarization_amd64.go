//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2AveragingBinarizationBufAllocSize(width, neighborhood uint64) int


//go:noescape
func _SimdSse2Binarization(src unsafe.Pointer, srcStride, width, height uint64, value, positive, negative uint8, dst unsafe.Pointer, dstStride uint64, compareType uint8)

//go:noescape
func _SimdSse2AveragingBinarization(src unsafe.Pointer, srcStride, width, height uint64, value uint8, neighborhood uint64, threshold, positive, negative uint8, dst unsafe.Pointer, dstStride uint64, compareType uint8, pbuffer unsafe.Pointer)

//
func SimdSse2Binarization(src View, value, positive, negative uint8, dst View, compareType uint8) {

	_SimdSse2Binarization(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, positive, negative, dst.GetData(), uint64(dst.GetStride()), compareType)
}

//
func SimdSse2AveragingBinarization(src View, value uint8, neighborhood uint64, threshold, positive, negative uint8, dst View, compareType uint8) {

	size := _SimdSse2AveragingBinarizationBufAllocSize(uint64(src.GetWidth()), neighborhood)
	pbuffer := Allocate(size, 32)

	_SimdSse2AveragingBinarization(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, neighborhood, threshold, positive, negative, dst.GetData(), uint64(dst.GetStride()), compareType, pbuffer)
}
