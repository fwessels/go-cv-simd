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

func TestSimdSse2ReduceGray4x4(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution*2, Resolution*2, GRAY8)
	grayout.Recreate(Resolution/2, Resolution/2, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 2)
	}

	copy((*[Resolution*2*Resolution*2]byte)(grayin.GetData())[:], src[:])

	SimdSse2ReduceGray4x4(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution/2*Resolution/2]byte)(grayout.GetData())[:])

	//for r := 1; r < 4/*Resolution*/;  r += 4 {
	//	for c := 1; c < 4/*Resolution*/; c += 4 {
	//		v := (int(src[Resolution*2*(r-1)  +c-1]) + int(3*src[Resolution*2*(r-1)+c+0]) + int(3*src[Resolution*2*(r-1)+c+1]) + int(src[Resolution*2*(r-1)+c+2]) +
	//		      3*(int(src[Resolution*2*(r+0)+c-1]) + int(3*src[Resolution*2*(r+0)+c+0]) + int(3*src[Resolution*2*(r+0)+c+1]) + int(src[Resolution*2*(r+0)+c+2])) +
	//		      3*(int(src[Resolution*2*(r+1)+c-1]) + int(3*src[Resolution*2*(r+1)+c+0]) + int(3*src[Resolution*2*(r+1)+c+1]) + int(src[Resolution*2*(r+1)+c+2])) +
	//		      int(src[Resolution*2*(r+2)+c-1]) + int(3*src[Resolution*2*(r+2)+c+0]) + int(3*src[Resolution*2*(r+2)+c+1]) + int(src[Resolution*2*(r+2)+c+2]) + 32) / 64
	//		got := dst[grayout.GetStride()*((r-1)>>2)+((c-1)>>2)]
	//		if byte(v) != got {
	//			t.Errorf("For [%d, %d], expected %d, got %d", r, c, v, got)
	//		}
	//	}
	//}
}
