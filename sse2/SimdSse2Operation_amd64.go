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

type Operation uint64

const (
	BINARY_AVERAGE Operation = iota
	BINARY_AND
	BINARY_OR
	BINARY_MAXIMUM
	BINARY_MINIMUM
	BINARY_SATURATED_SUBTRACTION
	BINARY_SATURATED_ADDITION
)

//go:noescape
func _SimdSse2OperationBinary8u(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64, _type uint64/*uint8*/)

//go:noescape
func _SimdSse2OperationBinary16i(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, width, height uint64, dst unsafe.Pointer, dstStride uint64, _type uint64/*uint8*/)

//go:noescape
func _SimdSse2VectorProduct(vertical, horizontal, dst unsafe.Pointer, stride, width, height uint64)

// SimdSse2OperationBinary8u performs given operation between two images.
// All images must have the same width, height and format (8-bit gray, 16-bit UV (UV plane of NV12 pixel format), 24-bit BGR or 32-bit BGRA).
func SimdSse2OperationBinary8u(a, b, dst View, _type uint64/*uint8*/)  {

	_SimdSse2OperationBinary8u(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), uint64(a.GetWidth()), uint64(a.GetHeight()), uint64(ChannelCount(a.GetFormat())), dst.GetData(), uint64(dst.GetStride()), _type)
}

// SimdSse2OperationBinary16i performs given operation between two images.
// All images must have the same width, height and ::SimdPixelFormatInt16 pixel format.
func SimdSse2OperationBinary16i(a, b, dst View, _type uint64/*uint8*/)  {

	_SimdSse2OperationBinary16i(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), uint64(a.GetWidth()), uint64(a.GetHeight()), dst.GetData(), uint64(dst.GetStride()), _type)
}

// SimdSse2VectorProduct calculates result 8-bit gray image as product of two vectors.
//	For all points:
//		dst[x, y] = horizontal[x]*vertical[y]/255;
func SimdSse2VectorProduct(vertical, horizontal, dst View)  {

	_SimdSse2VectorProduct(vertical.GetData(), horizontal.GetData(), dst.GetData(), uint64(dst.GetStride()), uint64(dst.GetWidth()), uint64(dst.GetHeight()))
}
