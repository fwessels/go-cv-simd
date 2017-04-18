//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2AlphaBlending(src unsafe.Pointer, srcStride, width, height, channelCount uint64, alpha unsafe.Pointer, alphaStride uint64, dst unsafe.Pointer, dstStride uint64)

// SimdSse2AlphaBlending performs alpha blending operation.
// All images must have the same width and height. Source and destination images must have the same format (8 bit per channel, for example GRAY8, BGR24 or BGRA32). Alpha must be 8-bit gray image.
// 	For every point:
// 		dst[i] = (src[i]*alpha[i] + dst[i]*(255 - alpha[i]))/255;
//This function is used for image drawing.
func SimdSse2AlphaBlending(src, alpha, dst View) {

	_SimdSse2AlphaBlending(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), alpha.GetData(), uint64(alpha.GetStride()), dst.GetData(), uint64(dst.GetStride()))
}
