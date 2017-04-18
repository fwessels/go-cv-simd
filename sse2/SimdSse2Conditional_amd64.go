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


// SimdSse2ConditionalCount8u calculates number of points satisfying certain condition for 8-bit gray image.
//	For every point:
//		if(compare(src[i], value))
//		count++;
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2ConditionalCount8u(src View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint32 {

	count := uint32(0)

	_SimdSse2ConditionalCount8u(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, compareType, unsafe.Pointer(&count))

	return count
}

// SimdSse2ConditionalCount16i calculates the number of points satisfying certain condition for 16-bit signed integer image.
// 	For every point:
//		if(compare(src[i], value))
//		count++;
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2ConditionalCount16i(src View, value uint64/*int16*/, compareType uint64/*uint8*/) uint32 {

	count := uint32(0)

	_SimdSse2ConditionalCount16i(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, compareType, unsafe.Pointer(&count))

	return count
}

// SimdSse2ConditionalSum calculates sum of image points when mask points satisfying certain condition.
// All images must have 8-bit gray format and must have the same width and height.
// 	For every point:
//		if(compare(mask[i], value))
//		sum += src[i];
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2ConditionalSum(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2ConditionalSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, unsafe.Pointer(&sum))

	return sum
}

// SimdSse2ConditionalSquareSum calculates sum of squared image points when mask points satisfying certain condition.
// All images must have 8-bit gray format and must have the same width and height.
//	For every point:
//		if(compare(mask[i], value))
//		sum += src[i]*src[i];
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2ConditionalSquareSum(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2ConditionalSquareSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, unsafe.Pointer(&sum))

	return sum
}

// SimdSse2ConditionalSquareGradientSum calculates sum of squared gradient of image points when mask points satisfying certain condition.
// All images must have 8-bit gray format and must have the same width and height. The image height and width must be equal or greater 3.
// 	For every point except border:
//		if(compare(mask[x, y], value))
//		{
//			dx = src[x + 1, y] - src[x - 1, y];
//			dy = src[x, y + 1] - src[x, y - 1];
//			sum += dx*dx + dy*dy;
//		}
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2ConditionalSquareGradientSum(src, mask View, value uint64/*uint8*/, compareType uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2ConditionalSquareGradientSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), mask.GetData(), uint64(mask.GetStride()), value, compareType, unsafe.Pointer(&sum))

	return sum
}

// SimdSse2ConditionalFill fills pixels of 8-bit gray image by given value if corresponding pixels of input 8-bit gray image satisfy certain condition.
// All images must have the same width and height.
// 	For every point:
//		if(compare(src[i], threshold))
//		dst[i] = value;
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2ConditionalFill(src View, threshold uint64/*uint8*/, compareType uint64/*uint8*/, value uint64/*uint8*/, dst View) {

	_SimdSse2ConditionalFill(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), threshold, compareType, value, dst.GetData(), uint64(dst.GetStride()))
}
