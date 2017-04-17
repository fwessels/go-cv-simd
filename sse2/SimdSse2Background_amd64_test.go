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


func TestSimdSse2BackgroundInitMask(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
	}

	src, dst := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	SimdSse2BackgroundInitMask(src, 123, 234, dst)
}

func testSse2BackgroundGrowRange(t *testing.T, f func(value, lo, hi View)) {

	pixels := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
	}

	src, _ := SimdSetup(GRAY8)
	lo, hi := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	f(src, lo, hi)
}

func TestSse2BackgroundGrowRangeSlow(t *testing.T) {

	testSse2BackgroundGrowRange(t, SimdSse2BackgroundGrowRangeSlow)
}

func TestSse2BackgroundGrowRangeFast(t *testing.T) {

	testSse2BackgroundGrowRange(t, SimdSse2BackgroundGrowRangeFast)
}

func TestSse2BackgroundIncrementCount(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
	}

	src, _ := SimdSetup(GRAY8)
	lo, hi := SimdSetup(GRAY8)
	loCount, hiCount := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	SimdSse2BackgroundIncrementCount(src, lo, hi, loCount, hiCount)
}

func TestSimdSse2BackgroundAdjustRange(t *testing.T) {

	loCount, hiCount := SimdSetup(GRAY8)
	loValue, hiValue := SimdSetup(GRAY8)

	SimdSse2BackgroundAdjustRange(loCount, loValue, hiCount, hiValue, 123)
}

func TestSimdSse2BackgroundAdjustRangeMasked(t *testing.T) {

	loCount, hiCount := SimdSetup(GRAY8)
	loValue, hiValue := SimdSetup(GRAY8)
	mask, _ := SimdSetup(GRAY8)

	SimdSse2BackgroundAdjustRangeMasked(loCount, loValue, hiCount, hiValue, 123, mask)
}

func TestSimdSse2BackgroundShiftRange(t *testing.T) {

	testSse2BackgroundGrowRange(t, SimdSse2BackgroundShiftRange)
}

func TestSimdSse2BackgroundShiftRangeMasked(t *testing.T) {

	src, mask := SimdSetup(GRAY8)
	lo, hi := SimdSetup(GRAY8)

	SimdSse2BackgroundShiftRangeMasked(src, lo, hi, mask)
}
