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
func _ClibFloor32(fl float32) float32

//go:noescape
func _ClibFloor64(fl float64) float64

//go:noescape
func _ClibMemcpy(dst, src unsafe.Pointer, n uint) unsafe.Pointer

//go:noescape
func _ClibMemset(dst unsafe.Pointer, c int, n uint) unsafe.Pointer
