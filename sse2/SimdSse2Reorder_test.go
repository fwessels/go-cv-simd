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

	for i := 0; i < len(dst16); i += 2 {
		if dst16[i] != src[i+1] {
			t.Errorf("For [%d], expected %d, got %d", i, dst16[i], src[i+1])
		} else if dst16[i+1] != src[i] {
			t.Errorf("For [%d], expected %d, got %d", i, dst16[i+1], src[i])
		}
	}

	SimdSse2Reorder32bit(bgra, Resolution*Resolution, gray)

	dst32 := make([]byte, Resolution*Resolution)

	copy(dst32[:], (*[Resolution * Resolution]byte)(gray.GetData())[:])

	for i := 0; i < len(dst32); i += 4 {
		if dst32[i] != src[i+3] {
			t.Errorf("For [%d], expected %d, got %d", i, dst32[i], src[i+3])
		} else if dst32[i+1] != src[i+2] {
			t.Errorf("For [%d], expected %d, got %d", i, dst32[i+1], src[i+2])
		} else if dst32[i+2] != src[i+1] {
			t.Errorf("For [%d], expected %d, got %d", i, dst32[i+2], src[i+1])
		} else if dst32[i+3] != src[i] {
			t.Errorf("For [%d], expected %d, got %d", i, dst32[i+3], src[i])
		}
	}

	SimdSse2Reorder64bit(bgra, Resolution*Resolution, gray)

	dst64 := make([]byte, Resolution*Resolution)

	copy(dst64[:], (*[Resolution * Resolution]byte)(gray.GetData())[:])

	for i := 0; i < len(dst64); i += 8 {
		if dst64[i] != src[i+7] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i], src[i+7])
		} else if dst64[i+1] != src[i+6] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+1], src[i+6])
		} else if dst64[i+2] != src[i+5] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+2], src[i+5])
		} else if dst64[i+3] != src[i+4] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+3], src[i+4])
		} else if dst64[i+4] != src[i+3] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+4], src[i+3])
		} else if dst64[i+5] != src[i+2] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+5], src[i+2])
		} else if dst64[i+6] != src[i+1] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+6], src[i+1])
		} else if dst64[i+7] != src[i] {
			t.Errorf("For [%d], expected %d, got %d", i, dst64[i+7], src[i])
		}
	}
}
