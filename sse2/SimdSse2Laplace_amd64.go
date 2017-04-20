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
func _SimdSse2Laplace(src unsafe.Pointer, srcStride int, width int, height int, dst unsafe.Pointer, dstStride int)

// SimdSse2Laplace calculates Laplace's filter.
// All images must have the same width and height. Input image must has 8-bit gray format, output image must has 16-bit integer format.
func SimdSse2Laplace(src, dst View) {
	_SimdSse2Laplace(src.GetData(), src.GetStride(), src.GetWidth(), src.GetHeight(), dst.GetData(), dst.GetStride())
}
