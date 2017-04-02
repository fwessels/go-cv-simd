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

func testYuvToBgra(f func(y, u, v, bgra View, alpha uint8)) {

	src := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		src[i] = byte(i)
	}

	y, u := SimdSetup(GRAY8)
	v, _ := SimdSetup(GRAY8)
	bgra, _ := SimdSetup(BGRA32)

	copy((*[Resolution * Resolution]byte)(y.GetData())[:], src[:])
	copy((*[Resolution * Resolution]byte)(u.GetData())[:], src[:])
	copy((*[Resolution * Resolution]byte)(v.GetData())[:], src[:])

	f(y, u, v, bgra, 128)

	dst := make([]byte, Resolution*Resolution*4)

	copy(dst[:], (*[Resolution * Resolution * 4]byte)(bgra.GetData())[:])

	fmt.Println(dst[:128])
}

func TestSse2Yuv420pToBgra(t *testing.T) {

	testYuvToBgra(SimdSse2Yuv420pToBgra)
}

func TestSse2Yuv422pToBgra(t *testing.T) {

	testYuvToBgra(SimdSse2Yuv422pToBgra)
}

func TestSse2Yuv444pToBgra(t *testing.T) {

	testYuvToBgra(SimdSse2Yuv444pToBgra)
}
