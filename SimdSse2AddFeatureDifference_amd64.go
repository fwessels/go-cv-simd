//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
	"github.com/fwessels/go-cv"
)

//go:noescape
func _SimdSse2AddFeatureDifference(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, weight uint16, difference unsafe.Pointer, differenceStride uint64)

//
func SimdSse2AddFeatureDifference(value, lo, hi gocv.View, weight uint16, difference gocv.View) {

	_SimdSse2AbsDifferenceSum(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), weight, difference.GetData(), uint64(difference.GetStride()))
}
