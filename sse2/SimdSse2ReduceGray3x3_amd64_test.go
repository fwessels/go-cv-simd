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
	_ "fmt"
)

func TestSimdSse2ReduceGray3x3(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution*3, Resolution*3, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 2)
	}

	copy((*[Resolution*3*Resolution*3]byte)(grayin.GetData())[:], src[:])

	SimdSse2ReduceGray3x3(grayin, grayout, 123)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	//fmt.Println(dst[:128])

	//for r := 0; r < Resolution;  r += 2 {
	//	for c := 0; c < Resolution; c += 2 {
	//		v := (int(src[Resolution*(r)  +c]) + int(src[Resolution*(r)+c+1]) +
	//			int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1])) >> 2
	//		got := dst[grayout.GetStride()*(r>>1)+(c>>1)]
	//		if byte(v) != got {
	//			t.Errorf("For [%d, %d], expected %d, got %d", r, c, v, got)
	//		}
	//	}
	//}
}
