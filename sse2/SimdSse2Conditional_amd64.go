//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)

//go:noescape
func _SimdSse2ConditionalCount8u(src unsafe.Pointer, stride, width, height uint64, value uint64/*uint8*/, compareType uint64/*uint8*/, count unsafe.Pointer)

//go:noescape
func _SimdSse2ConditionalCount16i(src unsafe.Pointer, stride, width, height uint64, value uint64/*int16*/, compareType uint64/*uint8*/, count unsafe.Pointer)

//go:noescape
func _SimdSse2ConditionalSum(src unsafe.Pointer, srcStride, width, height uint64, mask unsafe.Pointer, maskStride uint64, value uint64/*uint8*/, compareType uint64/*uint8*/, sum unsafe.Pointer)

//go:noescape
func _SimdSse2ConditionalSquareSum(src unsafe.Pointer, srcStride, width, height uint64, mask unsafe.Pointer, maskStride uint64, value uint64/*uint8*/, compareType uint64/*uint8*/, sum unsafe.Pointer)

//go:noescape
func _SimdSse2ConditionalSquareGradientSum(src unsafe.Pointer, srcStride, width, height uint64, mask unsafe.Pointer, maskStride uint64, value uint64/*uint8*/, compareType uint64/*uint8*/, sum unsafe.Pointer)

//go:noescape
func _SimdSse2ConditionalFill(src unsafe.Pointer, srcStride, width, height uint64, threshold uint64/*uint8*/, compareType uint64/*uint8*/, value uint64/*uint8*/, dst unsafe.Pointer, dstStride uint64)


//
func SimdSse2ConditionalCount8u(src View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint32 {

	count := uint32(0)

	_SimdSse2ConditionalCount8u(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, compareType, unsafe.Pointer(&count))

	return count
}

//
func SimdSse2ConditionalCount16i(src View, value uint64/*int16*/, compareType uint64/*uint8*/) uint32 {

	count := uint32(0)

	_SimdSse2ConditionalCount16i(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, compareType, unsafe.Pointer(&count))

	return count
}

//
func SimdSse2ConditionalSum(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2ConditionalSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, unsafe.Pointer(&sum))

	return sum
}

//
func SimdSse2ConditionalSquareSum(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2ConditionalSquareSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, unsafe.Pointer(&sum))

	return sum
}

//
func SimdSse2ConditionalSquareGradientSum(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2ConditionalSquareGradientSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, unsafe.Pointer(&sum))

	return sum
}

//
func SimdSse2ConditionalFill(src View, threshold uint64/*uint8*/, compareType uint64/*uint8*/, value uint64/*uint8*/, dst View) {

	_SimdSse2ConditionalFill(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), threshold, compareType, value, dst.GetData(), uint64(dst.GetStride()))
}
