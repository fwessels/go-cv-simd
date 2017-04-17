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

func TestSimdSse2SegmentationFillSingleHoles(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
	}

	mask, _ := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(mask.GetData())[:], pixels[:])

	SimdSse2SegmentationFillSingleHoles(mask, 111)
}

func TestSimdSse2SegmentationChangeIndex(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
	}

	mask, _ := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(mask.GetData())[:], pixels[:])

	SimdSse2SegmentationChangeIndex(mask, 111, 222)
}

func TestSimdSse2SegmentationPropagate2x2(t *testing.T) {

	parent, child := SimdSetup(GRAY8)
	difference, _ := SimdSetup(GRAY8)

	SimdSse2SegmentationPropagate2x2(parent, child, difference, 1, 2, 3 , 4)
}
