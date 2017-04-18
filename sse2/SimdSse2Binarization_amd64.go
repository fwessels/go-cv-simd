//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2AveragingBinarizationBufAllocSize(width, neighborhood uint64) (alloc int)

//go:noescape
func _SimdSse2Binarization(src unsafe.Pointer, srcStride, width, height uint64, value, positive, negative uint64/*uint8*/, dst unsafe.Pointer, dstStride uint64, compareType uint64/*uint8*/)

//go:noescape
func _SimdSse2AveragingBinarization(src unsafe.Pointer, srcStride, width, height uint64, value uint64/*uint8*/, neighborhood uint64, threshold, positive, negative uint64/*uint8*/, dst unsafe.Pointer, dstStride uint64, compareType uint64/*uint8*/, pbuffer unsafe.Pointer)

// SimdSse2Binarization performs binarization of 8-bit gray image.
// All images must have 8-bit gray format and must have the same width and height.
// 	For every point:
//		dst[i] = compare(src[i], value) ? positive : negative;
// where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2Binarization(src View, value, positive, negative uint64/*uint8*/, dst View, compareType uint64/*uint8*/) {

	_SimdSse2Binarization(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, positive, negative, dst.GetData(), uint64(dst.GetStride()), compareType)
}

// SimdSse2AveragingBinarization performs averaging binarization of 8-bit gray image.
// All images must have 8-bit gray format and must have the same width and height.
// 	For every point:
//		sum = 0; area = 0;
//		for(dy = -neighborhood; dy <= neighborhood; ++dy)
//		{
//			for(dx = -neighborhood; dx <= neighborhood; ++dx)
//			{
//				if(x + dx >= 0 && x + dx < width && y + dy >= 0 && y + dy < height)
//				{
//					area++;
//					if(compare(src[x + dx, x + dy], value))
//						sum++;
//				}
//			}
//		}
//		dst[x, y] = sum*255 > area*threshold ? positive : negative;
//where compare(a, b) depends from compareType (see ::SimdCompareType).
func SimdSse2AveragingBinarization(src View, value uint64/*uint8*/, neighborhood uint64, threshold, positive, negative uint64/*uint8*/, dst View, compareType uint64/*uint8*/) {

	size := _SimdSse2AveragingBinarizationBufAllocSize(uint64(src.GetWidth()), neighborhood)
	pbuffer := Allocate(size, 32)

	_SimdSse2AveragingBinarization(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), value, neighborhood, threshold, positive, negative, dst.GetData(), uint64(dst.GetStride()), compareType, pbuffer)
}
