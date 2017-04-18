//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2SquaredDifferenceSum(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, width, height uint64, sum unsafe.Pointer)

//go:noescape
func _SimdSse2SquaredDifferenceSumMasked(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, mask unsafe.Pointer, maskStride uint64, index uint64/*uint8*/, width, height uint64, sum unsafe.Pointer)

// SimdSse2SquaredDifferenceSum calculates sum of squared differences for two 8-bit gray images.
// All images must have the same width and height.
// 	For every point:
//		sum += (a[i] - b[i])*(a[i] - b[i]);
func SimdSse2SquaredDifferenceSum(a, b View) uint64 {

	sum := uint64(0)

	_SimdSse2SquaredDifferenceSum(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), uint64(a.GetWidth()), uint64(a.GetHeight()), unsafe.Pointer(&sum))

	return sum
}

// SimdSse2SquaredDifferenceSumMasked calculates sum of squared differences for two images with using mask.
// All images must have the same width, height and format (8-bit gray).
// 	For every point:
//		if(mask[i] == index)
//			sum += (a[i] - b[i])*(a[i] - b[i]);
func SimdSse2SquaredDifferenceSumMasked(a, b, mask View, index uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2SquaredDifferenceSumMasked(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), mask.GetData(), uint64(mask.GetStride()), index, uint64(a.GetWidth()), uint64(a.GetHeight()), unsafe.Pointer(&sum))

	return sum
}
