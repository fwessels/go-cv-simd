//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
	"github.com/fwessels/go-cv"
	"github.com/ipfs/go-ipfs/Godeps/_workspace/src/github.com/whyrusleeping/multiaddr-filter"
)

//go:noescape
func _SimdSse2BackgroundGrowRangeSlow(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64)

//go:noescape
func _SimdSse2BackgroundGrowRangeFast(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64)

//go:noescape
func _SimdSse2BackgroundIncrementCount(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, loCount unsafe.Pointer, loCountStride uint64, hiCount unsafe.Pointer, hiCountStride uint64)

//go:noescape
func _SimdSse2BackgroundAdjustRange(loCount unsafe.Pointer, loCountStride uint64, width, height uint64, loValue unsafe.Pointer, loValueStride uint64, hiCount unsafe.Pointer, hiCountStride uint64, hiValue unsafe.Pointer, hiValueStride uint64, threshold uint8)

//go:noescape
func _SimdSse2BackgroundAdjustRangeMasked(loCount unsafe.Pointer, loCountStride uint64, width, height uint64, loValue unsafe.Pointer, loValueStride uint64, hiCount unsafe.Pointer, hiCountStride uint64, hiValue unsafe.Pointer, hiValueStride uint64, threshold uint8, mask unsafe.Pointer, maskStride uint64)

//go:noescape
func _SimdSse2BackgroundShiftRange(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64)

//go:noescape
func _SimdSse2BackgroundShiftRangeMasked(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, mask unsafe.Pointer, maskStride uint64)

//go:noescape
func _SimdSse2BackgroundInitMask(src unsafe.Pointer, srcStride uint64, width, height uint64, index, value uint8, src unsafe.Pointer, srcStride uint64)

//
func SimdSse2BackgroundGrowRangeSlow(value, lo, hi gocv.View) {

	_SimdSse2BackgroundGrowRangeSlow(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()))
}

//
func SimdSse2BackgroundGrowRangeFast(value, lo, hi gocv.View) {

	_SimdSse2BackgroundGrowRangeFast(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()))
}

//
func SimdSse2BackgroundIncrementCount(value, lo, hi, loCount, hiCount gocv.View) {

	_SimdSse2BackgroundIncrementCount(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), loCount.GetData(), uint64(loCount.GetStride()), hiCount.GetData(), uint64(hiCount.GetStride()))
}

//
func SimdSse2BackgroundAdjustRange(loCount, loValue, hiCount, hiValue gocv.View, threshold uint8) {

	_SimdSse2BackgroundAdjustRange(loCount.GetData(), uint64(loCount.GetStride()), uint64(loCount.GetWidth()), uint64(loCount.GetHeight()), loValue.GetData(), uint64(loValue.GetStride()), hiCount.GetData(), uint64(hiCount.GetStride()), hiValue.GetData(), uint64(hiValue.GetStride()), threshold)
}


//
func SimdSse2BackgroundAdjustRangeMasked(loCount, loValue, hiCount, hiValue gocv.View, threshold uint8, mask gocv.View) {

	_SimdSse2BackgroundAdjustRangeMasked(loCount.GetData(), uint64(loCount.GetStride()), uint64(loCount.GetWidth()), uint64(loCount.GetHeight()), loValue.GetData(), uint64(loValue.GetStride()), hiCount.GetData(), uint64(hiCount.GetStride()), hiValue.GetData(), uint64(hiValue.GetStride()), threshold, mask.GetData(), uint64(mask.GetStride()))
}

//
func SimdSse2BackgroundShiftRange(value, lo, hi gocv.View) {

	_SimdSse2BackgroundShiftRange(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()))
}

//
func SimdSse2BackgroundShiftRangeMasked(value, lo, hi, mask gocv.View) {

	_SimdSse2BackgroundShiftRangeMasked(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), mask.GetData(), uint64(mask.GetStride()))
}

//
func SimdSse2BackgroundInitMask(src gocv.View, index, value uint8, dst gocv.View) {

	_SimdSse2BackgroundInitMask(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), index, value, dst.GetData(), uint64(dst.GetStride()))
}
