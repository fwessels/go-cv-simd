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
func _SimdSse2ReduceGray4x4BufAllocSize(width int) (alloc int)

//go:noescape
func _SimdSse2ReduceGray4x4(src unsafe.Pointer, srcWidth int, srcHeight int, srcStride int, dst unsafe.Pointer, dstWidth int, dstHeight int, dstStride int, buffer unsafe.Pointer)

func SimdSse2ReduceGray4x4(src, dst View) {
	pbuffer := Allocate(_SimdSse2ReduceGray4x4BufAllocSize(dst.GetWidth()), 32)

	_SimdSse2ReduceGray4x4(src.GetData(), src.GetWidth(), src.GetHeight(), src.GetStride(),
		dst.GetData(), dst.GetWidth(), dst.GetHeight(), dst.GetStride(), pbuffer)
}
