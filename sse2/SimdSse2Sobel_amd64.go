//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2SobelDx(src unsafe.Pointer, srcStride, srcWidth, srcHeight uint64, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2SobelDy(src unsafe.Pointer, srcStride, srcWidth, srcHeight uint64, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2ContourAnchors(src unsafe.Pointer, srcStride, srcWidth, srcHeight uint64, step uint64, threshold uint64/*int16*/, dst unsafe.Pointer, dstStride uint64)

// SimdSse2SobelDx calculates Sobel's filter along x axis.
// All images must have the same width and height. Input image must has 8-bit gray format, output image must has 16-bit integer format.
// 	For every point:
//		n dst[x, y] = (src[x+1,y-1] + 2*src[x+1, y] + src[x+1, y+1]) - (src[x-1,y-1] + 2*src[x-1, y] + src[x-1, y+1]).
func SimdSse2SobelDx(src, dst View) {

	_SimdSse2SobelDx(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), dst.GetData(), uint64(dst.GetStride()))
}

// SimdSse2SobelDy calculates Sobel's filter along y axis.
// All images must have the same width and height. Input image must has 8-bit gray format, output image must have a 16-bit integer format.
// 	For every point:
//		dst[x, y] = (src[x-1,y+1] + 2*src[x, y+1] + src[x+1, y+1]) - (src[x-1,y-1] + 2*src[x, y-1] + src[x+1, y-1]);
func SimdSse2SobelDy(src, dst View) {

	_SimdSse2SobelDy(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), dst.GetData(), uint64(dst.GetStride()))
}

//
func SimdSse2ContourAnchors(src View, step uint64, threshold uint64/*int16*/, dst View) {

	_SimdSse2ContourAnchors(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), step, threshold, dst.GetData(), uint64(dst.GetStride()))
}