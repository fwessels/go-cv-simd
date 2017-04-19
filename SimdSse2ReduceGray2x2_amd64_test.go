package gocvsimd

import (
	"testing"
)

func TestSimdSse2ReduceGray2x2(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution/2, Resolution/2, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 2)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2ReduceGray2x2(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution/2*Resolution/2]byte)(grayout.GetData())[:])

	for r := 0; r < Resolution;  r += 2 {
		for c := 0; c < Resolution; c += 2 {
			v := (int(src[Resolution*(r)  +c]) + int(src[Resolution*(r)+c+1]) +
				int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1])) >> 2
			got := dst[grayout.GetStride()*(r>>1)+(c>>1)]
			if byte(v) != got {
				t.Errorf("For [%d, %d], expected %d, got %d", r, c, v, got)
			}
		}
	}
}
