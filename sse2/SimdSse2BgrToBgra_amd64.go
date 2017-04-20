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
func _SimdSse2Bgr48pToBgra32(blue unsafe.Pointer, blueStride int, width int, height int, green unsafe.Pointer, greenStride int, red unsafe.Pointer, redStride int, bgra unsafe.Pointer, bgraStride int, alpha uint64/*uint8*/)

// SimdSse2Bgr48pToBgra32 converts 48-bit planar BGR image to 32-bit BGRA image.
// All images must have the same width and height.
func SimdSse2Bgr48pToBgra32(blue, green, red, bgra View, alpha uint64/*uint8*/) {

	_SimdSse2Bgr48pToBgra32(blue.GetData(), blue.GetStride(), blue.GetWidth(), blue.GetHeight(), green.GetData(), green.GetStride(), red.GetData(), red.GetStride(), bgra.GetData(), bgra.GetStride(), alpha)
}
