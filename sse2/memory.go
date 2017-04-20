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
	_ "fmt"
	"unsafe"
)

// Allocate allocates an aligned memory block.
// The memory allocated by this function is must be deleted by function Free
// [in] size - a size of memory block.
// [in] align - a required alignment of memory block.
// return a pointer to allocated memory.
func Allocate(size, align int) unsafe.Pointer {
	buf := make([]byte, size + align)

	for index := 0; index < len(buf); index += 8 {
		p := unsafe.Pointer(&buf[index])
		if uint(uintptr(p)) & uint(align-1) == 0 {
			//fmt.Printf("%v\n", p)
			return p
		}
	}

	panic("Failed to allocate at aligned address")
}

// Free frees aligned memory block.
// This function frees a memory allocated by function Allocate.
// [in] ptr - a pointer to the memory to be deleted.
func Free(ptr unsafe.Pointer) {
	*(*[]byte)(ptr) = nil
}

// Align gets aligned size.
// [in] size - an original size.
// [in] align - a required alignment.
// return an aligned size.
func Align(size, align int) int {
	return (size + align - 1) & ^(align - 1)
}

// Alignment gets alignment required for the most productive work of the Simd Library.
// a required alignment.
func Alignment() int {
	// FIXME: fix this to be processor capability specific.
	return 32
}

const Resolution = 256
