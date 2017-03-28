//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2ShiftBilinear(src unsafe.Pointer, srcStride, width, height, channelCount uint64, bkg unsafe.Pointer, bkgStride uint64, shiftX, shiftY unsafe.Pointer, cropLeft, cropTop, cropRight, cropBottom uint64, dst unsafe.Pointer, dstStride uint64)

//
func SimdSse2ShiftBilinear(src, bkg View, dst View) {

	shiftX, shiftY := float64(0.0), float64(0.0)
	cropLeft, cropTop, cropRight, cropBottom := uint64(0), uint64(0), uint64(255), uint64(255)

	_SimdSse2ShiftBilinear(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())),
		bkg.GetData(), uint64(bkg.GetStride()),
		unsafe.Pointer(&shiftX), unsafe.Pointer(&shiftY),
		cropLeft, cropTop, cropRight, cropBottom,
		dst.GetData(), uint64(dst.GetStride()))
}
