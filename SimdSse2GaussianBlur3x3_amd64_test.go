package gocvsimd

import (
	"fmt"
	"testing"
)

func TestSimdSse2GaussianBlur3x3(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 3)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2GaussianBlur3x3(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	fmt.Println(dst[:64])
	for r := 1; r < Resolution-1; r++ {
		for c := 1; c < Resolution-1; c++ {
			gaus := (int(src[Resolution*(r-1)+c-1]) + 2*int(src[Resolution*(r-1)+c]) + int(src[Resolution*(r-1)+c+1]) +
				2*int(src[Resolution*r+c-1]) + 4*int(src[Resolution*r+c]) + 2*int(src[Resolution*r+c+1]) +
				int(src[Resolution*(r+1)+c-1]) + 2*int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1]) + 8) / 16
			if byte(gaus) != dst[Resolution+c] {
				t.Errorf("Expected %d, got %d", gaus, dst[Resolution+c])
			}
		}
	}
}
