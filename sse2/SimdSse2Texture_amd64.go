//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)


//go:noescape
func _SimdSse2TextureBoostedSaturatedGradient(src unsafe.Pointer, srcStride, width, height uint64, saturation, boost uint64/*uint8*/, dx unsafe.Pointer, dxStride uint64, dy unsafe.Pointer, dyStride uint64)

//go:noescape
func _SimdSse2TextureBoostedUv(src unsafe.Pointer, srcStride, width, height uint64, boost uint64/*uint8*/, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2TextureGetDifferenceSum(src unsafe.Pointer, srcStride, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, sum unsafe.Pointer)

//go:noescape
func _SimdSse2TexturePerformCompensation(src unsafe.Pointer, srcStride, width, height uint64, shift int, dst unsafe.Pointer, dstStride uint64)

//
func SimdSse2TextureBoostedSaturatedGradient(src View, saturation, boost uint64/*uint8*/, dx, dy View) {

	_SimdSse2TextureBoostedSaturatedGradient(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), saturation, boost, dx.GetData(), uint64(dx.GetStride()), dy.GetData(), uint64(dy.GetStride()))
}

//
func SimdSse2TextureBoostedUv(src View, boost uint64/*uint8*/, dst View) {

	_SimdSse2TextureBoostedUv(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), boost, dst.GetData(), uint64(dst.GetStride()))
}

//
func SimdSse2TextureGetDifferenceSum(src, lo, hi View) int64 {

	sum := int64(0)
	_SimdSse2TextureGetDifferenceSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), unsafe.Pointer(&sum))

	return sum
}

//
func SimdSse2TexturePerformCompensation(src View, shift int, dst View) {

	_SimdSse2TexturePerformCompensation(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), shift, dst.GetData(), uint64(dst.GetStride()))
}
