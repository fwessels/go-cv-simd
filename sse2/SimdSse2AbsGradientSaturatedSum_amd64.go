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

import "unsafe"

//go:noescape
func _SimdSse2AbsGradientSaturatedSum(src unsafe.Pointer, srcStride, width, height uint64, dst unsafe.Pointer, dstStride uint64)

// SimdSse2AbsGradientSaturatedSum puts to destination 8-bit gray image saturated sum of absolute gradient for every point of source 8-bit gray image.
// Both images must have the same width and height.
// 	For border pixels:
// 		dst[x, y] = 0;
// 	For other pixels:
// 		dx = abs(src[x + 1, y] - src[x - 1, y]);
// 		dy = abs(src[x, y + 1] - src[x, y - 1]);
// 		dst[x, y] = min(dx + dy, 255);
func SimdSse2AbsGradientSaturatedSum(src, dst View) {

	_SimdSse2AbsGradientSaturatedSum(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), dst.GetData(), uint64(dst.GetStride()))
}
