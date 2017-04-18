//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)

//go:noescape
func _SimdSse2AddFeatureDifference(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, weight uint64/*uint16*/, difference unsafe.Pointer, differenceStride uint64)

// SimdSse2AddFeatureDifference adds feature difference to common difference in sum.
// All images must have the same width, height and format (8-bit gray).
// 	For every point:
// 		excess = max(lo[i] - value[i], 0) + max(value[i] - hi[i], 0);
// 		difference[i] += (weight * excess*excess) >> 16;
// This function is used for difference estimation in algorithm of motion detection.
func SimdSse2AddFeatureDifference(value, lo, hi View, weight uint64/*uint16*/, difference View) {

	_SimdSse2AddFeatureDifference(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), weight, difference.GetData(), uint64(difference.GetStride()))
}
