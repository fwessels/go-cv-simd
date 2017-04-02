/*
 * Minio Cloud Storage, (C) 2017 Minio, Inc.
 *
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
	"testing"
)

//func TestSse2FillBgr(t *testing.T) {
//	dst1 := View{}
//	dst1.Recreate(Resolution, Resolution, BGR24)
//
//	red := 0x22
//	blue := 0x44
//	green := 0x66
//
//	SimdSse2FillBgr(dst1, blue, green, red)
//
//	dst := make([]byte, Resolution*Resolution*4)
//
//	copy(dst[:], (*[Resolution * Resolution * 4]byte)(dst1.GetData())[:])
//
//	fmt.Println(dst[:128])
//}


func TestSse2FillBgra(t *testing.T) {
	dst2 := View{}
	dst2.Recreate(Resolution, Resolution, BGRA32)

	red := 0x77
	blue := 0x11
	green := 0xAA
	alpha := 0xFF

	SimdSse2FillBgra(dst2, blue, green, red, alpha)

	dst := make([]byte, Resolution*Resolution*4)

	copy(dst[:], (*[Resolution * Resolution * 4]byte)(dst2.GetData())[:])

	fmt.Println(dst[:128])
}
