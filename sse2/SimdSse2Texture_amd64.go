//+build !noasm
//+build !appengine

/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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

// SimdSse2TextureBoostedSaturatedGradient calculates boosted saturated gradients for given input image.
// All images must have the same width, height and format (8-bit gray).
// 	For border pixels:
//		dx[x, y] = 0;
//		dy[x, y] = 0;
//	For other pixels:
//		dx[x, y] = (saturation + max(-saturation, min(saturation, (src[x + 1, y] - src[x - 1, y]))))*boost;
//		dy[x, y] = (saturation + max(-saturation, min(saturation, (src[x, y + 1] - src[x, y - 1]))))*boost;
func SimdSse2TextureBoostedSaturatedGradient(src View, saturation, boost uint64/*uint8*/, dx, dy View) {

	_SimdSse2TextureBoostedSaturatedGradient(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), saturation, boost, dx.GetData(), uint64(dx.GetStride()), dy.GetData(), uint64(dy.GetStride()))
}

// SimdSse2TextureBoostedUv calculates boosted colorized texture feature of input image (actual for U and V components of YUV format).
// All images must have the same width, height and format (8-bit gray).
// 	For every pixel:
//		lo = 128 - (128/boost);
//		hi = 255 - lo;
//		dst[x, y] = max(lo, min(hi, src[i]))*boost;
func SimdSse2TextureBoostedUv(src View, boost uint64/*uint8*/, dst View) {

	_SimdSse2TextureBoostedUv(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), boost, dst.GetData(), uint64(dst.GetStride()))
}

// SimdSse2TextureGetDifferenceSum calculates difference between current image and background.
// All images must have the same width, height and format (8-bit gray).
// 	For every pixel:
//		sum += current - average(lo[i], hi[i]);
func SimdSse2TextureGetDifferenceSum(src, lo, hi View) int64 {

	sum := int64(0)
	_SimdSse2TextureGetDifferenceSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), lo.GetData(), uint64(lo.GetStride()), hi.GetData(), uint64(hi.GetStride()), unsafe.Pointer(&sum))

	return sum
}

// SimdSse2TexturePerformCompensation performs brightness compensation of input image.
// All images must have the same width, height and format (8-bit gray).
// 	For every pixel:
//		dst[i] = max(0, min(255, src[i] + shift));
func SimdSse2TexturePerformCompensation(src View, shift int, dst View) {

	_SimdSse2TexturePerformCompensation(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), shift, dst.GetData(), uint64(dst.GetStride()))
}
