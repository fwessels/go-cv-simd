//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Int16ToGray(src unsafe.Pointer, width, height, srcStride int, dst unsafe.Pointer, dstStride int)

// SimdSse2Int16ToGray converts 16-bit signed integer image to 8-bit gray image with saturation.
// All images must have the same width and height.
func SimdSse2Int16ToGray(src, dst View) {
	_SimdSse2Int16ToGray(src.GetData(), src.GetWidth(), src.GetHeight(), src.GetStride(), dst.GetData(), dst.GetStride())
}
