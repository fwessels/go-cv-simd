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
func _SimdSse2BgraToYuv420p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2BgraToYuv420p converts 32-bit BGRA image to YUV420P.
// 	The input BGRA and output Y images must have the same width and height.
// The input U and V images must have the same width and height (half size relative to Y component).
func SimdSse2BgraToYuv420p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv420p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}

//go:noescape
func _SimdSse2BgraToYuv422p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2BgraToYuv422p converts 32-bit BGRA image to YUV422P.
// 	The input BGRA and output Y images must have the same width and height.
// The input U and V images must have the same width and height (their width is equal to half width of Y component).
func SimdSse2BgraToYuv422p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv422p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}

//go:noescape
func _SimdSse2BgraToYuv444p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2BgraToYuv444p converts 32-bit BGRA image to YUV444P.
// The input BGRA and output Y, U and V images must have the same width and height.
func SimdSse2BgraToYuv444p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv444p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}
