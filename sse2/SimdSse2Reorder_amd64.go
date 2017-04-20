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
func _SimdSse2Reorder16bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//go:noescape
func _SimdSse2Reorder32bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//go:noescape
func _SimdSse2Reorder64bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//
func SimdSse2Reorder16bit(src View, size uint64, dst View) {

	_SimdSse2Reorder16bit(src.GetData(), size, dst.GetData())
}

//
func SimdSse2Reorder32bit(src View, size uint64, dst View) {

	_SimdSse2Reorder32bit(src.GetData(), size, dst.GetData())
}

//
func SimdSse2Reorder64bit(src View, size uint64, dst View) {

	_SimdSse2Reorder64bit(src.GetData(), size, dst.GetData())
}
