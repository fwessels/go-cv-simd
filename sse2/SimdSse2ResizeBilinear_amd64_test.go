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

func TestSimdSse2ResizeBilinear(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution*4)

	for i := 0; i < Resolution*Resolution*4; i++ {
		pixels[i] = byte(i)
	}

	src, _ := SimdSetup(GRAY8)
	dst := View{}
	dst.Recreate(Resolution/2, Resolution/2, GRAY8)

	copy((*[Resolution * Resolution * 4]byte)(src.GetData())[:], pixels[:])

	SimdSse2ResizeBilinear(src, dst)

	result := make([]byte, Resolution/2*Resolution/2)

	copy(result[:], (*[Resolution * Resolution * 4]byte)(dst.GetData())[:])

	for r := 0; r < Resolution;  r += 2 {
		for c := 0; c < Resolution; c += 2 {
			v := (int(pixels[Resolution*(r)  +c]) + int(pixels[Resolution*(r)+c+1]) +
				int(pixels[Resolution*(r+1)+c]) + int(pixels[Resolution*(r+1)+c+1]) + 2) >> 2
			got := result[dst.GetStride()*(r>>1)+(c>>1)]
			if byte(v) != got {
				t.Errorf("For [%d, %d], expected %d, got %d", r, c, v, got)
			}
		}
	}
}
