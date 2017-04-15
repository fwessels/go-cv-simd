package gocvsimd

import (
	"testing"
)

func TestSimdSse2StretchGray2x2(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution/2, Resolution/2, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 2)
	}

	copy((*[Resolution/2*Resolution/2]byte)(grayin.GetData())[:], src[:])

	SimdSse2StretchGray2x2(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	for r := 0; r < Resolution/2;  r++ {
		for c := 0; c < Resolution/2; c++ {
			v := int(src[Resolution/2*(r)  +c])
			got := dst[grayout.GetStride()*(r<<1)+(c<<1)]
			if byte(v) != got {
				t.Errorf("For [%d, %d], expected %d, got %d", r, c, v, got)
			}
		}
	}
}
