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
func _SimdSse2GaussianBlur3x3BufAllocSize(width, channelCount int) (alloc int)

//go:noescape
func _SimdSse2GaussianBlur3x3(src unsafe.Pointer, srcStride, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64, buffer unsafe.Pointer)

// SimdSse2GaussianBlur3x3 performs Gaussian blur filtration with window 3x3.
// 	For every point:
//		dst[x, y] = (src[x-1, y-1] + 2*src[x, y-1] + src[x+1, y-1] +
//		2*(src[x-1, y] + 2*src[x, y] + src[x+1, y]) +
//		src[x-1, y+1] + 2*src[x, y+1] + src[x+1, y+1] + 8) / 16;
//All images must have the same width, height and format (8-bit gray, 16-bit UV, 24-bit BGR or 32-bit BGRA).
func SimdSse2GaussianBlur3x3(src, dst View) {

	size := _SimdSse2GaussianBlur3x3BufAllocSize(src.GetWidth(), ChannelCount(src.GetFormat()))
	pbuffer := Allocate(size, 32)

	_SimdSse2GaussianBlur3x3(src.GetData(), uint64(src.GetStride()), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(ChannelCount(src.GetFormat())), dst.GetData(), uint64(dst.GetStride()), pbuffer)
}
