//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)

//go:noescape
func _SimdSse2AbsDifferenceSum(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, width, height uint64, sum unsafe.Pointer)

//go:noescape
func _SimdSse2AbsDifferenceSumMasked(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, mask unsafe.Pointer, maskStride uint64, index uint64/*uint8*/, width, height uint64, sum unsafe.Pointer)

//go:noescape
func _SimdSse2AbsDifferenceSums3x3(current unsafe.Pointer, currentStride uint64, background unsafe.Pointer, backgroundStride uint64, width, height uint64, sums unsafe.Pointer)

//go:noescape
func _SimdSse2AbsDifferenceSums3x3Masked(current unsafe.Pointer, currentStride uint64, background unsafe.Pointer, backgroundStride uint64, mask unsafe.Pointer, maskStride uint64, index uint64/*uint8*/, width, height uint64, sums unsafe.Pointer)

//
func SimdSse2AbsDifferenceSum(a, b View) uint64 {

	sum := uint64(0)

	_SimdSse2AbsDifferenceSum(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), uint64(a.GetWidth()), uint64(a.GetHeight()), unsafe.Pointer(&sum))

	return sum
}

//
func SimdSse2AbsDifferenceSumMasked(a, b, mask View, index uint64/*uint8*/) uint64 {

	sum := uint64(0)

	_SimdSse2AbsDifferenceSumMasked(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), mask.GetData(), uint64(mask.GetStride()), index, uint64(a.GetWidth()), uint64(a.GetHeight()), unsafe.Pointer(&sum))

	return sum
}

// SimdSse2AbsDifferenceSums3x3 gets 9 sums of absolute difference of two gray 8-bit images with various relative shifts in neighborhood 3x3.
// Both images must have the same width and height. The image height and width must be equal or greater 3.
// The sums are calculated with central part (indent width = 1) of the current image and with part of the background image with corresponding shift.
// The shifts are lain in the range [-1, 1] for axis x and y.
func SimdSse2AbsDifferenceSums3x3(current, background View) [9]uint64 {

	sums := [9]uint64{}

	_SimdSse2AbsDifferenceSums3x3(current.GetData(), uint64(current.GetStride()), background.GetData(), uint64(background.GetStride()), uint64(current.GetWidth()), uint64(current.GetHeight()), unsafe.Pointer(&sums[0]))

	return sums
}
// SimdSse2AbsDifferenceSums3x3Masked gets 9 sums of absolute difference of two gray 8-bit images with various relative shifts in neighborhood 3x3 based on gray 8-bit mask.
// Gets the absolute difference sums for all points when mask[i] == index.
// Both images and mask must have the same width and height. The image height and width must be equal or greater 3.
// The sums are calculated with central part (indent width = 1) of the current image and with part of the background image with the corresponding shift.
// The shifts are lain in the range [-1, 1] for axis x and y.
func SimdSse2AbsDifferenceSums3x3Masked(current, background, mask View, index uint64/*uint8*/) [9]uint64 {

	sums := [9]uint64{}

	_SimdSse2AbsDifferenceSums3x3Masked(current.GetData(), uint64(current.GetStride()), background.GetData(), uint64(background.GetStride()), mask.GetData(), uint64(mask.GetStride()), index, uint64(current.GetWidth()), uint64(current.GetHeight()), unsafe.Pointer(&sums[0]))

	return sums
}
