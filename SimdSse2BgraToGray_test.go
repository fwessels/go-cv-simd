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
	"math"
)

func TestSse2BgraToGray(t *testing.T) {

	src := make([]byte, Resolution*Resolution*4)

	for i := 0; i < Resolution*Resolution; i++ {
		src[0+i*4] = byte(i)
		src[1+i*4] = byte(i)
		src[2+i*4] = byte(i)
		src[3+i*4] = byte(i)
	}

	bgra, _ := SimdSetup(BGRA32)
	_, gray := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution * 4]byte)(bgra.GetData())[:], src[:])

	SimdSse2BgraToGray(bgra, gray)

	dst := make([]byte, Resolution*Resolution)

	copy(dst[:], (*[Resolution * Resolution]byte)(gray.GetData())[:])

	const BGR_TO_GRAY_AVERAGING_SHIFT uint = 14
	const BGR_TO_GRAY_ROUND_TERM int = (1 << (BGR_TO_GRAY_AVERAGING_SHIFT - 1))
	BLUE_TO_GRAY_WEIGHT := int(math.Floor(0.114*float64(1 << BGR_TO_GRAY_AVERAGING_SHIFT) + 0.5))
	GREEN_TO_GRAY_WEIGHT := int(math.Floor(0.587*float64(1 << BGR_TO_GRAY_AVERAGING_SHIFT) + 0.5))
	RED_TO_GRAY_WEIGHT := int(math.Floor(0.299*float64(1 << BGR_TO_GRAY_AVERAGING_SHIFT) + 0.5))

	for index, got := range dst {
		blue, green, red := int(src[0+index*4]), int(src[1+index*4]), int(src[2+index*4])

		gray := (BLUE_TO_GRAY_WEIGHT*blue + GREEN_TO_GRAY_WEIGHT*green +
			RED_TO_GRAY_WEIGHT*red + BGR_TO_GRAY_ROUND_TERM) >> BGR_TO_GRAY_AVERAGING_SHIFT

		if byte(gray) != got {
			t.Errorf("For [%d]: Expected %d, got %d", index, gray, got)
		}
	}
}
