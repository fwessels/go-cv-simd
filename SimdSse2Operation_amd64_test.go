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

func TestSimdSse2OperationBinary8u(t *testing.T) {

	pixelsA := make([]byte, Resolution*Resolution)
	pixelsB := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixelsA[i] = byte(i)
		pixelsB[i] = byte(255-i)
	}

	a, b := SimdSetup(GRAY8)
	dst, _ := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(a.GetData())[:], pixelsA[:])
	copy((*[Resolution * Resolution]byte)(b.GetData())[:], pixelsB[:])

	SimdSse2OperationBinary8u(a, b, dst, uint64(BINARY_AND))

	pixelsOut := make([]byte, dst.GetDataLen())

	copy(pixelsOut[:], (*[Resolution*Resolution]byte)(dst.GetData())[:])

	for i, got := range pixelsOut {
		expected := pixelsA[i] & pixelsB[i]
		if expected != got {
			t.Errorf("Expected %d, got %d", expected, got)
		}
	}

	SimdSse2OperationBinary8u(a, b, dst, uint64(BINARY_OR))

	copy(pixelsOut[:], (*[Resolution*Resolution]byte)(dst.GetData())[:])

	for i, got := range pixelsOut {
		expected := pixelsA[i] | pixelsB[i]
		if expected != got {
			t.Errorf("Expected %d, got %d", expected, got)
		}
	}

	SimdSse2OperationBinary8u(a, b, dst, uint64(BINARY_MAXIMUM))

	copy(pixelsOut[:], (*[Resolution*Resolution]byte)(dst.GetData())[:])

	for i, got := range pixelsOut {
		expected := pixelsA[i]
		if pixelsA[i] < pixelsB[i] {
			expected = pixelsB[i]
		}
		if expected != got {
			t.Errorf("Expected %d, got %d", expected, got)
		}
	}

	SimdSse2OperationBinary8u(a, b, dst, uint64(BINARY_MINIMUM))

	copy(pixelsOut[:], (*[Resolution*Resolution]byte)(dst.GetData())[:])

	for i, got := range pixelsOut {
		expected := pixelsA[i]
		if pixelsA[i] > pixelsB[i] {
			expected = pixelsB[i]
		}
		if expected != got {
			t.Errorf("Expected %d, got %d", expected, got)
		}
	}
}

func TestSimdSse2OperationBinary16i(t *testing.T) {

	pixelsA := make([]int16, Resolution*Resolution)
	pixelsB := make([]int16, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixelsA[i] = int16(i)
		pixelsB[i] = int16(i*2)
	}

	a, b := SimdSetup(INT16)
	dst, _ := SimdSetup(INT16)

	copy((*[Resolution * Resolution]int16)(a.GetData())[:], pixelsA[:])
	copy((*[Resolution * Resolution]int16)(b.GetData())[:], pixelsB[:])

	SimdSse2OperationBinary16i(a, b, dst, uint64(BINARY_AND))

	pixelsOut := make([]int16, dst.GetDataLen())

	copy(pixelsOut[:], (*[Resolution*Resolution]int16)(dst.GetData())[:])

	// TODO: Sort out proper checking
	//for i, got := range pixelsOut {
	//	expected := pixelsA[i] & pixelsB[i]
	//	if expected != got {
	//		t.Errorf("Expected %d, got %d", expected, got)
	//	}
	//}
}

func TestSimdSse2VectorProduct(t *testing.T) {

	vertical, horizontal := SimdSetup(GRAY8)
	dst, _ := SimdSetup(GRAY8)

	SimdSse2VectorProduct(vertical, horizontal, dst)
}