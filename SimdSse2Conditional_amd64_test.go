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

func TestSimdSse2ConditionalCount8u(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	const check = 100
	equals, lower, higher := uint32(0), uint32(0), uint32(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)

		if byte(i) == check {
			equals++
		} else if byte(i) > check {
			higher++
		} else if byte(i) < check {
			lower++
		}
	}

	src, _ := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	count := SimdSse2ConditionalCount8u(src, check, 0)

	if count != equals {
		t.Errorf("Expected %d, got %d", equals, count)
	}

	count = SimdSse2ConditionalCount8u(src, check, 1)
	if count != Resolution*Resolution-equals {
		t.Errorf("Expected %d, got %d", Resolution*Resolution-equals, count)
	}

	count = SimdSse2ConditionalCount8u(src, check, 2)
	if count != higher {
		t.Errorf("Expected %d, got %d", higher, count)
	}

	count = SimdSse2ConditionalCount8u(src, check, 3)
	if count != higher+equals {
		t.Errorf("Expected %d, got %d", higher+equals, count)
	}

	count = SimdSse2ConditionalCount8u(src, check, 4)
	if count != lower {
		t.Errorf("Expected %d, got %d", lower, count)
	}

	count = SimdSse2ConditionalCount8u(src, check, 5)
	if count != lower+equals {
		t.Errorf("Expected %d, got %d", lower+equals, count)
	}
}

func TestSimdSse2ConditionalCount16i(t *testing.T) {

	pixels := make([]uint16, Resolution*Resolution)

	const check = 100
	equals, lower, higher := uint32(0), uint32(0), uint32(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = uint16(i)

		if byte(i) == check {
			equals++
		} else if byte(i) > check {
			higher++
		} else if byte(i) < check {
			lower++
		}
	}

	src, _ := SimdSetup(INT16)

	copy((*[Resolution * Resolution]uint16)(src.GetData())[:], pixels[:])

	SimdSse2ConditionalCount16i(src, check, 0)
}

func testSimdSse2ConditionalSum(t *testing.T, f func(src, mask View, value, compareType uint64) uint64) {

	pixels := make([]byte, Resolution*Resolution)

	const check = 100
	equals, lower, higher := uint32(0), uint32(0), uint32(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)

		if byte(i) == check {
			equals++
		} else if byte(i) > check {
			higher++
		} else if byte(i) < check {
			lower++
		}
	}

	src, mask := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	f(src, mask, 0, 0)
}

func TestSimdSse2ConditionalSum(t *testing.T) {

	testSimdSse2ConditionalSum(t, SimdSse2ConditionalSum)
}

func TestSimdSse2ConditionalSquareSum(t *testing.T) {

	testSimdSse2ConditionalSum(t, SimdSse2ConditionalSquareSum)
}

func TestSimdSse2ConditionalSquareGradientSum(t *testing.T) {

	testSimdSse2ConditionalSum(t, SimdSse2ConditionalSquareGradientSum)
}

func TestSimdSse2ConditionalFill(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	const check = 100
	equals, lower, higher := uint32(0), uint32(0), uint32(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)

		if byte(i) == check {
			equals++
		} else if byte(i) > check {
			higher++
		} else if byte(i) < check {
			lower++
		}
	}

	src, dst := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	SimdSse2ConditionalFill(src, 123, 0, 234, dst)
}
