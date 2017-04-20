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
	"fmt"
	"unsafe"
)

// buffer of pending write data
const (
	bufSize = 8
)

var buf [bufSize]byte
var nbuf uintptr

func PrintBytes(str string, p unsafe.Pointer, len uintptr) {

	copy(buf[0:], (*[bufSize]byte)(p)[:len])
	fmt.Println(str, "bytes:", buf)
}

func SimdSetup(f Format) (View, View) {

	a, b := View{}, View{}
	a.Recreate(Resolution, Resolution, f)
	b.Recreate(Resolution, Resolution, f)

	return a, b
}
