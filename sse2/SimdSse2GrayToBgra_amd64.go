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
func _SimdSse2GrayToBgra(gray unsafe.Pointer, width uint64, height uint64, grayStride uint64, bgra unsafe.Pointer, bgraStride uint64)

// SimdSse2GrayToBgra converts 8-bit gray image to 32-bit BGRA image.
// All images must have the same width and height.
func SimdSse2GrayToBgra(gray, bgra View) {
	_SimdSse2GrayToBgra(gray.GetData(), uint64(gray.GetWidth()), uint64(gray.GetHeight()), uint64(gray.GetStride()), bgra.GetData(), uint64(bgra.GetStride()))
}
