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

func TestSse2AddFeatureDifference(t *testing.T) {

	pixels := make([]byte, Resolution*Resolution)

	for i := 0; i < Resolution*Resolution; i++ {
		pixels[i] = byte(i)*byte(i)
	}

	src, diff := SimdSetup(GRAY8)
	lo, hi := SimdSetup(GRAY8)

	copy((*[Resolution * Resolution]byte)(src.GetData())[:], pixels[:])

	SimdSse2AddFeatureDifference(src, lo, hi ,128, diff)

	result := make([]byte, Resolution*Resolution)

	copy(result[:], (*[Resolution * Resolution]byte)(diff.GetData())[:])
}
