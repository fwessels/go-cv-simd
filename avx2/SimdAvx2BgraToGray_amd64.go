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
func _SimdAvx2BgraToGray(bgra unsafe.Pointer, width uint64, height uint64, bgraStride uint64, gray unsafe.Pointer, grayStride uint64)

func SimdAvx2BgraToGray(bgra, gray View) {

	// Call into golang assembly
	_SimdAvx2BgraToGray(bgra.GetData(), uint64(bgra.GetWidth()), uint64(bgra.GetHeight()), uint64(bgra.GetStride()), gray.GetData(), uint64(gray.GetStride()))
}
