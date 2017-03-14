//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
	"github.com/fwessels/go-cv"
)

//go:noescape
func _SimdSse2AlphaBlending(src unsafe.Pointer, srcStride, width, height, channelCount uint64, alpha unsafe.Pointer, alphaStride uint64, dst unsafe.Pointer, dstStride uint64)

func SimdSse2AlphaBlending(src, alpha, dst gocv.View) {

	_SimdSse2AlphaBlending(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(gocv.ChannelCount(src.GetFormat())), alpha.GetData(), uint64(alpha.GetStride()), dst.GetData(), uint64(dst.GetStride()))
}
