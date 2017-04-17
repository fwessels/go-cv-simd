package gocvsimd

import (
	"testing"
)

func TestSimdSse2MeanFilter3x3(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.RecreateWithStride(Resolution, Resolution, dstStride, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 3)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2MeanFilter3x3(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*dstStride]byte)(grayout.GetData())[:])

	for r := 1; r < Resolution-1; r++ {
		for c := 1; c < Resolution-1; c++ {
			mean := (int(src[Resolution*(r-1)+c-1]) + int(src[Resolution*(r-1)+c]) + int(src[Resolution*(r-1)+c+1]) +
				int(src[Resolution*r+c-1]) + int(src[Resolution*r+c]) + int(src[Resolution*r+c+1]) +
				int(src[Resolution*(r+1)+c-1]) + int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1]) + 4) / 9
			got := dst[grayout.GetStride()*r+c]
			if byte(mean) != got {
				t.Errorf("Expected %d, got %d", mean, got)
			}
		}
	}
}
