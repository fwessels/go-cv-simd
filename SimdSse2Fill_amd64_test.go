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

func TestSse2FillBgr(t *testing.T) {
	out := View{}
	out.RecreateWithStride(Resolution, Resolution, dstStride*3, BGR24)

	const blue = 0x22
	const green = 0x44
	const red = 0x66

	SimdSse2FillBgr(out, blue, green, red)

	dst := make([]byte, Resolution*dstStride*3)

	copy(dst[:], (*[Resolution * dstStride * 3]byte)(out.GetData())[:])

	for r := 0; r < Resolution; r++ {
		for c := 0; c < Resolution; c++ {
			b, g, r := dst[out.GetStride()*r+c*3], dst[out.GetStride()*r+c*3+1], dst[out.GetStride()*r+c*3+2]
			if b != blue || g != green || r != red {
				t.Errorf("For [%d, %d]: Expected %x%x%x, got %x%x%x", r, c, blue, green, red, b, g, r)
			}
		}
	}
}

func TestSse2FillBgra(t *testing.T) {
	out := View{}
	out.RecreateWithStride(Resolution, Resolution, dstStride*4, BGRA32)

	const blue = 0x11
	const green = 0xAA
	const red = 0x77
	const alpha = 0xFF

	SimdSse2FillBgra(out, blue, green, red, alpha)

	dst := make([]byte, Resolution*dstStride*4)

	copy(dst[:], (*[Resolution*dstStride*4]byte)(out.GetData())[:])

	for r := 0; r < Resolution; r++ {
		for c := 0; c < Resolution; c++ {
			b, g, r := dst[out.GetStride()*r+c*4], dst[out.GetStride()*r+c*4+1], dst[out.GetStride()*r+c*4+2]
			if b != blue || g != green || r != red {
				t.Errorf("For [%d, %d]: Expected %x%x%x, got %x%x%x", r, c, blue, green, red, b, g, r)
			}
		}
	}
}
