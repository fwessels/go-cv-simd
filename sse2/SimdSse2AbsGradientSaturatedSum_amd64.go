//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2AbsGradientSaturatedSum(src unsafe.Pointer, srcStride, width, height uint64, dst unsafe.Pointer, dstStride uint64)

// SimdSse2AbsGradientSaturatedSum puts to destination 8-bit gray image saturated sum of absolute gradient for every point of source 8-bit gray image.
// Both images must have the same width and height.
// 	For border pixels:
// 		dst[x, y] = 0;
// 	For other pixels:
// 		dx = abs(src[x + 1, y] - src[x - 1, y]);
// 		dy = abs(src[x, y + 1] - src[x, y - 1]);
// 		dst[x, y] = min(dx + dy, 255);
func SimdSse2AbsGradientSaturatedSum(src, dst View) {

	_SimdSse2AbsGradientSaturatedSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), dst.GetData(), uint64(dst.GetStride()))
}
