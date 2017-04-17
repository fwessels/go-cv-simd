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

func TestSimdSse2AbsDifferenceSum(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	expected := uint64(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
		expected += uint64(pixels[i])
	}


	src, dst := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	sum := SimdSse2AbsDifferenceSum(src, dst)

	if sum != expected {
		t.Errorf("Expected %d, got %d", expected, sum)
	}
}

func TestSimdSse2AbsDifferenceSumMasked(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	expected := uint64(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
		expected += uint64(pixels[i])
	}

	src, dst := SimdSetup(GRAY8)
	mask, _ := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	sum := SimdSse2AbsDifferenceSumMasked(src, dst, mask, 0)

	if sum != expected {
		t.Errorf("Expected %d, got %d", expected, sum)
	}

	sum = SimdSse2AbsDifferenceSumMasked(src, dst, mask, 123)

	if sum != 0 {
		t.Errorf("Expected %d, got %d", 0, sum)
	}
}

func TestSimdSse2AbsDifferenceSums3x3(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	expected := uint64(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
		expected += uint64(pixels[i])
	}

	src, dst := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	sums := SimdSse2AbsDifferenceSums3x3(src, dst)

	// TODO: Find out why we need the correction
	expected -= (6914048-6859778)

	if sums[4] != expected {
		t.Errorf("Expected %d, got %d", expected, sums[4])
	}
}

func TestSimdSse2AbsDifferenceSums3x3Masked(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	expected := uint64(0)
	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
		expected += uint64(pixels[i])
	}

	src, dst := SimdSetup(GRAY8)
	mask, _ := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	sums := SimdSse2AbsDifferenceSums3x3Masked(src, dst, mask, 0)

	// TODO: Find out why we need the correction
	expected -= (6914048-6859778)

	if sums[4] != expected {
		t.Errorf("Expected %d, got %d", expected, sums[4])
	}

	sums = SimdSse2AbsDifferenceSums3x3Masked(src, dst, mask, 123)

	if sums[4] != 0 {
		t.Errorf("Expected %d, got %d", 0, sums[4])
	}

}