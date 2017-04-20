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

func TestSimdSse2TextureGetDifferenceSum(t *testing.T) {
	grayin, lo, hi := View{}, View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	lo.Recreate(Resolution, Resolution, GRAY8)
	hi.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TextureGetDifferenceSum(grayin, lo, hi)
}

func TestSimdSse2TextureBoostedUv(t *testing.T) {

	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TextureBoostedUv(grayin, 123, grayout)
}

func TestSimdSse2TextureBoostedSaturatedGradient(t *testing.T) {

	grayin, dx, dy := View{}, View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	dx.Recreate(Resolution, Resolution, GRAY8)
	dy.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TextureBoostedSaturatedGradient(grayin, 12, 24, dx, dy)
}

func TestSimdSse2TexturePerformCompensation(t *testing.T) {

	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution * Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TexturePerformCompensation(grayin, 123, grayout)
}