//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2BackgroundInitMask(src unsafe.Pointer, srcStride uint64, width, height uint64, index, value uint64/*uint8*/, dst unsafe.Pointer, dstStride uint64)

//go:noescape
func _SimdSse2BackgroundGrowRangeSlow(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64)

//go:noescape
func _SimdSse2BackgroundGrowRangeFast(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64)

//go:noescape
func _SimdSse2BackgroundIncrementCount(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, loCount unsafe.Pointer, loCountStride uint64, hiCount unsafe.Pointer, hiCountStride uint64)

//go:noescape
func _SimdSse2BackgroundAdjustRange(loCount unsafe.Pointer, loCountStride uint64, width, height uint64, loValue unsafe.Pointer, loValueStride uint64, hiCount unsafe.Pointer, hiCountStride uint64, hiValue unsafe.Pointer, hiValueStride uint64, threshold uint64/*uint8*/)

//go:noescape
func _SimdSse2BackgroundAdjustRangeMasked(loCount unsafe.Pointer, loCountStride uint64, width, height uint64, loValue unsafe.Pointer, loValueStride uint64, hiCount unsafe.Pointer, hiCountStride uint64, hiValue unsafe.Pointer, hiValueStride uint64, threshold uint64/*uint8*/, mask unsafe.Pointer, maskStride uint64)

//go:noescape
func _SimdSse2BackgroundShiftRange(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64)

//go:noescape
func _SimdSse2BackgroundShiftRangeMasked(value unsafe.Pointer, valueStride uint64, width, height uint64, lo unsafe.Pointer, loStride uint64, hi unsafe.Pointer, hiStride uint64, mask unsafe.Pointer, maskStride uint64)

// SimdSse2BackgroundInitMask creates background update mask.
// All images must have the same width, height and format (8-bit gray).
//     For every point:
//         if(mask[i] == index)
//         dst[i] = value;
// This function is used for background updating in motion detection algorithm.
func SimdSse2BackgroundInitMask(src View, index, value uint64/*uint8*/, dst View) {

	_SimdSse2BackgroundInitMask(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), index, value, dst.GetData(), uint64(dst.GetStride()))
}

// SimdSse2BackgroundGrowRangeSlow performs background update (initial grow, slow mode).
// All images must have the same width, height and format (8-bit gray).
// 	For every point:
// 		lo[i] -= value[i] < lo[i] ? 1 : 0;
// 		hi[i] += value[i] > hi[i] ? 1 : 0;
// This function is used for background updating in motion detection algorithm.
func SimdSse2BackgroundGrowRangeSlow(value, lo, hi View) {

	_SimdSse2BackgroundGrowRangeSlow(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()))
}

// SimdSse2BackgroundGrowRangeFast performs background update (initial grow, fast mode).
// All images must have the same width, height and format (8-bit gray).
//     For every point:
//         lo[i] = value[i] < lo[i] ? value[i] : lo[i];
//         hi[i] = value[i] > hi[i] ? value[i] : hi[i];
// This function is used for background updating in motion detection algorithm.
func SimdSse2BackgroundGrowRangeFast(value, lo, hi View) {

	_SimdSse2BackgroundGrowRangeFast(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()))
}

// SimdSse2BackgroundAdjustRange performs collection of background statistic.
// All images must have the same width, height and format (8-bit gray).
//     Updates background statistic counters for every point:
//         loCount[i] += (value[i] < loValue[i] && loCount[i] < 255) ? 1 : 0;
//         hiCount[i] += (value[i] > hiValue[i] && hiCount[i] < 255) ? 1 : 0;
// This function is used for background updating in motion detection algorithm.
func SimdSse2BackgroundIncrementCount(value, lo, hi, loCount, hiCount View) {

	_SimdSse2BackgroundIncrementCount(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), loCount.GetData(), uint64(loCount.GetStride()), hiCount.GetData(), uint64(hiCount.GetStride()))
}

// SimdSse2BackgroundAdjustRange performs adjustment of background range.
// All images must have the same width, height and format (8-bit gray).
//     Adjusts background range for every point:
//         loValue[i] -= (loCount[i] > threshold && loValue[i] > 0) ? 1 : 0;
//         loValue[i] += (loCount[i] < threshold && loValue[i] < 255) ? 1 : 0;
//         loCount[i] = 0;
//         hiValue[i] += (hiCount[i] > threshold && hiValue[i] < 255) ? 1 : 0;
//         hiValue[i] -= (hiCount[i] < threshold && hiValue[i] > 0) ? 1 : 0;
//         hiCount[i] = 0;
// This function is used for background updating in motion detection algorithm.
func SimdSse2BackgroundAdjustRange(loCount, loValue, hiCount, hiValue View, threshold uint64/*uint8*/) {

	_SimdSse2BackgroundAdjustRange(loCount.GetData(), uint64(loCount.GetStride()), uint64(loCount.GetWidth()), uint64(loCount.GetHeight()), loValue.GetData(), uint64(loValue.GetStride()), hiCount.GetData(), uint64(hiCount.GetStride()), hiValue.GetData(), uint64(hiValue.GetStride()), threshold)
}

// SimdSse2BackgroundAdjustRangeMasked performs adjustment of background range with using adjust range mask.
// All images must have the same width, height and format (8-bit gray).
//     Adjusts background range for every point:
//         if(mask[i])
//         {
//             loValue[i] -= (loCount[i] > threshold && loValue[i] > 0) ? 1 : 0;
//             loValue[i] += (loCount[i] < threshold && loValue[i] < 255) ? 1 : 0;
//             loCount[i] = 0;
//             hiValue[i] += (hiCount[i] > threshold && hiValue[i] < 255) ? 1 : 0;
//             hiValue[i] -= (hiCount[i] < threshold && hiValue[i] > 0) ? 1 : 0;
//             hiCount[i] = 0;
//         }
// This function is used for background updating in motion detection algorithm.
func SimdSse2BackgroundAdjustRangeMasked(loCount, loValue, hiCount, hiValue View, threshold uint64/*uint8*/, mask View) {

	_SimdSse2BackgroundAdjustRangeMasked(loCount.GetData(), uint64(loCount.GetStride()), uint64(loCount.GetWidth()), uint64(loCount.GetHeight()), loValue.GetData(), uint64(loValue.GetStride()), hiCount.GetData(), uint64(hiCount.GetStride()), hiValue.GetData(), uint64(hiValue.GetStride()), threshold, mask.GetData(), uint64(mask.GetStride()))
}

// SimdSse2BackgroundShiftRange shifts background range.
//All images must have the same width, height and format (8-bit gray).
// 	For every point:
// 		if (value[i] > hi[i])
// 		{
// 			lo[i] = min(lo[i] + value[i] - hi[i], 255);
// 			hi[i] = value[i];
// 		}
// 		if (lo[i] > value[i])
// 		{
// 			lo[i] = value[i];
// 			hi[i] = max(hi[i] - lo[i] + value[i], 0);
//		}
// This function is used for fast background updating in motion detection algorithm.
func SimdSse2BackgroundShiftRange(value, lo, hi View) {

	_SimdSse2BackgroundShiftRange(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()))
}

// SimdSse2BackgroundShiftRangeMasked shifts background range with using shift range mask.
// All images must have the same width, height and format (8-bit gray).
// 	For every point:
// 		if(mask[i])
// 		{
// 			if (value[i] > hi[i])
// 			{
// 				lo[i] = min(lo[i] + value[i] - hi[i], 255);
// 				hi[i] = value[i];
// 			}
// 			if (lo[i] > value[i])
// 			{
// 				lo[i] = value[i];
// 				hi[i] = max(hi[i] - lo[i] + value[i], 0);
// 			}
// 		}
// This function is used for fast background updating in motion detection algorithm.
func SimdSse2BackgroundShiftRangeMasked(value, lo, hi, mask View) {

	_SimdSse2BackgroundShiftRangeMasked(value.GetData(), uint64(value.GetStride()), uint64(value.GetWidth()), uint64(value.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), mask.GetData(), uint64(mask.GetStride()))
}
