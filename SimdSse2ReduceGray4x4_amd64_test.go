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

	for r := 0; r < 4/*Resolution*/;  r += 4 {
		for c := 0; c < 4/*Resolution*/; c += 4 {
			v := (int(src[Resolution*2*(r)  +c]) + int(src[Resolution*2*(r)+c+1]) + int(src[Resolution*2*(r)+c+2]) + int(src[Resolution*2*(r)+c+3]) +
			      int(src[Resolution*2*(r+1)+c]) + int(src[Resolution*2*(r+1)+c+1]) + int(src[Resolution*2*(r+1)+c+2]) + int(src[Resolution*2*(r+1)+c+3]) +
			      int(src[Resolution*2*(r+2)+c]) + int(src[Resolution*2*(r+2)+c+1]) + int(src[Resolution*2*(r+2)+c+2]) + int(src[Resolution*2*(r+2)+c+3]) +
			      int(src[Resolution*2*(r+3)+c]) + int(src[Resolution*2*(r+3)+c+1]) + int(src[Resolution*2*(r+3)+c+2]) + int(src[Resolution*2*(r+3)+c+3])) >> 4
			got := dst[grayout.GetStride()*(r>>2)+(c>>2)]
			if byte(v) != got {
				t.Errorf("For [%d, %d], expected %d, got %d", r, c, v, got)
			}
		}
	}

	//v := int(src[0]) + int(src[1]) + int(src[2]) + int(src[3]) +
	//	int(src[Resolution*2+0]) + int(src[Resolution*2+1]) + int(src[Resolution*2+2]) + int(src[Resolution*2+3]) +
	//	int(src[(Resolution*2)*2+0]) + int(src[(Resolution*2)*2+1]) + int(src[(Resolution*2)*2+2]) + int(src[(Resolution*2)*2+3]) +
	//	int(src[(Resolution*2)*3+0]) + int(src[(Resolution*2)*3+1]) + int(src[(Resolution*2)*3+2]) + int(src[(Resolution*2)*3+3])
	//
	//fmt.Println(v / 8)
	//fmt.Println(dst[0])
}
