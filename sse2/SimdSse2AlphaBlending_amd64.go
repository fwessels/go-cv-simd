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
func _SimdSse2AlphaBlending(src unsafe.Pointer, srcStride, width, height, channelCount uint64, alpha unsafe.Pointer, alphaStride uint64, dst unsafe.Pointer, dstStride uint64)

// SimdSse2AlphaBlending performs alpha blending operation.
// All images must have the same width and height. Source and destination images must have the same format (8 bit per channel, for example GRAY8, BGR24 or BGRA32). Alpha must be 8-bit gray image.
// 	For every point:
// 		dst[i] = (src[i]*alpha[i] + dst[i]*(255 - alpha[i]))/255;
//This function is used for image drawing.
func SimdSse2AlphaBlending(src, alpha, dst View) {

	_SimdSse2AlphaBlending(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), alpha.GetData(), uint64(alpha.GetStride()), dst.GetData(), uint64(dst.GetStride()))
}
