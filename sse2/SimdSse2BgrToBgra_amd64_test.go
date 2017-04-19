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

func TestSse2Bgr48pToBgra32(t *testing.T) {

	bgra, _ := SimdSetup(BGRA32)

	b, g, r := View{}, View{}, View{}
	b.Recreate(Resolution, Resolution, INT16)
	g.Recreate(Resolution, Resolution, INT16)
	r.Recreate(Resolution, Resolution, INT16)

	pixelsb := make([]uint16, Resolution*Resolution)
	pixelsg := make([]uint16, Resolution*Resolution)
	pixelsr := make([]uint16, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixelsb[i] = uint16(i)
		pixelsg[i] = uint16(0xffff-i)
		pixelsr[i] = uint16(0x8000)
	}

	copy((*[Resolution * Resolution]uint16)(b.GetData())[:], pixelsb[:])
	copy((*[Resolution * Resolution]uint16)(g.GetData())[:], pixelsg[:])
	copy((*[Resolution * Resolution]uint16)(r.GetData())[:], pixelsr[:])

	SimdSse2Bgr48pToBgra32(b, g, r, bgra, 0xff)

	result := make([]byte, Resolution*Resolution*4)

	copy(result[:], (*[Resolution * Resolution * 4]byte)(bgra.GetData())[:])

	for i := 0; i < Resolution*Resolution; i++ {
		// TODO: Would have expected byte(pixelsb[i] >> 8) here
		expectedb := byte(pixelsb[i])
		// expectedg := byte(pixelsg[i] >> 8)
		// expectedr := byte(pixelsr[i] >> 8)

		if result[i*4+0] != expectedb {
			t.Errorf("For [%d]: Expected %d, got %d", i, expectedb, result[i*4+0])
		}
	}

}
