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
	"testing"
)

func TestSimdSse2Binarization(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	const v = 64
	const pos = 111
	const neg = 0

	SimdSse2Binarization(grayin, v, pos, neg, grayout, 3)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	for r := 0; r < Resolution; r++ {
		for c := 0; c < Resolution; c++ {
			val := int(src[Resolution*r+c])
			b := neg
			if val >= v {
				b = pos
			}
			got := dst[grayout.GetStride()*r+c]
			if byte(b) != got {
				t.Errorf("Expected %d, got %d", b, got)
			}
		}
	}
}

func TestSimdSse2AveragingBinarization(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	const v = 64
	const neighbor = 1
	const th = 128
	const pos = 222
	const neg = 64

	SimdSse2AveragingBinarization(grayin, v, neighbor, th, pos, neg, grayout, 3)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	for r := 0; r < Resolution; r++ {
		for c := 0; c < Resolution; c++ {
			val := int(src[Resolution*r+c])
			b := neg
			if val >= v {
				b = pos
			}
			got := dst[grayout.GetStride()*r+c]
			if byte(b) != got {
				t.Errorf("Expected %d, got %d", b, got)
			}
		}
	}

}
