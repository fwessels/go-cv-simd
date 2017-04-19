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
