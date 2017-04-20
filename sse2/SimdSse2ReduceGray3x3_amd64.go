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
func _SimdSse2ReduceGray3x3(src unsafe.Pointer, srcWidth, srcHeight, srcStride uint64, dst unsafe.Pointer, dstWidth, dstHeight, dstStride uint64, compensation int)

//
func SimdSse2ReduceGray3x3(src, dst View, compensation int) {

	_SimdSse2ReduceGray3x3(src.GetData(), uint64(src.GetWidth()), uint64(src.GetHeight()), uint64(src.GetStride()), dst.GetData(), uint64(dst.GetWidth()), uint64(dst.GetHeight()), uint64(dst.GetStride()), compensation)
}
