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
	"github.com/fwessels/go-cv"
)

func TestSse2BgraToGray(t *testing.T) {

	src := make([]byte, Resolution*Resolution*4)

	for i := 0; i < Resolution*Resolution; i++ {
		src[0+i*4] = byte(i)
		src[1+i*4] = byte(i)
		src[2+i*4] = byte(i)
		src[3+i*4] = byte(i)
	}

	bgra, _ := SimdSetup(gocv.BGRA32)
	_, gray := SimdSetup(gocv.GRAY8)

	copy((*[Resolution*Resolution*4]byte)(bgra.GetData())[:], src[:])

	SimdSse2BgraToGray(bgra, gray)

	dst := make([]byte, Resolution*Resolution)

	copy(dst[:], (*[Resolution*Resolution]byte)(gray.GetData())[:])

	fmt.Println(dst[:64])
}

