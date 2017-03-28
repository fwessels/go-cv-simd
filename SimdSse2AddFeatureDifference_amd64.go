//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2AddFeatureDifference(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, weight uint16, difference unsafe.Pointer, differenceStride uint64)

//
func SimdSse2AddFeatureDifference(value, lo, hi View, weight uint16, difference View) {
	// FIXME: AddFeatureDifference
}
