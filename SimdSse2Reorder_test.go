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

func TestSse2Reorder(t *testing.T) {

	src := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		src[i] = byte(i)
	}

	bgra, gray := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(bgra.GetData())[:], src[:])

	SimdSse2Reorder16bit(bgra, Resolution*Resolution, gray)

	dst16 := make([]byte, Resolution*Resolution)

	copy(dst16[:], (*[Resolution * Resolution]byte)(gray.GetData())[:])

	fmt.Println(dst16[:32])

	SimdSse2Reorder32bit(bgra, Resolution*Resolution, gray)

	dst32 := make([]byte, Resolution*Resolution)

	copy(dst32[:], (*[Resolution * Resolution]byte)(gray.GetData())[:])

	fmt.Println(dst32[:32])

	SimdSse2Reorder64bit(bgra, Resolution*Resolution, gray)

	dst64 := make([]byte, Resolution*Resolution)

	copy(dst64[:], (*[Resolution * Resolution]byte)(gray.GetData())[:])

	fmt.Println(dst64[:32])
}
