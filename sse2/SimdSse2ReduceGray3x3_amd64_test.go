package gocvsimd

import (
	"testing"
	"fmt"
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

	fmt.Println(dst[:128])
	
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
