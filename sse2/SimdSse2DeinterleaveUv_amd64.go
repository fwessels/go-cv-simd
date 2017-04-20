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
func _SimdSse2DeinterleaveUv(uv unsafe.Pointer, uvStride int, width int, height int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2DeinterleaveUv deinterleaves 16-bit UV interleaved image into separated 8-bit U and V planar images.
// All images must have the same width and height.
// This function used for NV12 to YUV420P conversion.
func SimdSse2DeinterleaveUv(uv, u, v View) {
	_SimdSse2DeinterleaveUv(uv.GetData(), uv.GetStride(), uv.GetWidth(), uv.GetHeight(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}
