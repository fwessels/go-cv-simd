package gocvsimd

import (
	"testing"
)

const dstStride = Resolution+0x60

func TestSimdSse2MedianFilterRhomb3x3(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.RecreateWithStride(Resolution, Resolution, dstStride, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2MedianFilterRhomb3x3(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*dstStride]byte)(grayout.GetData())[:])

	for r := 1; r < Resolution-1; r++ {
		for c := 1; c < Resolution-1; c++ {
			median := (int(src[Resolution*(r-1)+c-1]) + int(src[Resolution*(r-1)+c]) + int(src[Resolution*(r-1)+c+1]) +
				int(src[Resolution*r+c-1]) + int(src[Resolution*r+c]) + int(src[Resolution*r+c+1]) +
				int(src[Resolution*(r+1)+c-1]) + int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1]) + 4) / 9
			got := dst[grayout.GetStride()*r+c]
			if byte(median) != got {
				t.Errorf("For [%d, %d]: Expected %d, got %d", r, c, median, got)
			}
		}
	}
}

func TestSimdSse2MedianFilterSquare3x3(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.RecreateWithStride(Resolution, Resolution, dstStride, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2MedianFilterSquare3x3(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*dstStride]byte)(grayout.GetData())[:])

	for r := 1; r < Resolution-1; r++ {
		for c := 1; c < Resolution-1; c++ {
			median := (int(src[Resolution*(r-1)+c-1]) + int(src[Resolution*(r-1)+c]) + int(src[Resolution*(r-1)+c+1]) +
				int(src[Resolution*r+c-1]) + int(src[Resolution*r+c]) + int(src[Resolution*r+c+1]) +
				int(src[Resolution*(r+1)+c-1]) + int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1]) + 4) / 9
			got := dst[grayout.GetStride()*r+c]
			if byte(median) != got {
				t.Errorf("For [%d, %d]: Expected %d, got %d", r, c, median, got)
			}
		}
	}
}

func TestSimdSse2MedianFilterRhomb5x5(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.RecreateWithStride(Resolution, Resolution, dstStride, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2MedianFilterRhomb5x5(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*dstStride]byte)(grayout.GetData())[:])

	for r := 2; r < Resolution-2; r++ {
		for c := 2; c < Resolution-2; c++ {
			median := (int(src[Resolution*(r-2)+c-2]) + int(src[Resolution*(r-2)+c-1]) + int(src[Resolution*(r-2)+c]) + int(src[Resolution*(r-2)+c+1]) + int(src[Resolution*(r-2)+c+2]) +
				 int(src[Resolution*(r-1)+c-2]) + int(src[Resolution*(r-1)+c-1]) + int(src[Resolution*(r-1)+c]) + int(src[Resolution*(r-1)+c+1]) + int(src[Resolution*(r-1)+c+2]) +
				 int(src[Resolution*(r+0)+c-2]) + int(src[Resolution*(r+0)+c-1]) + int(src[Resolution*(r+0)+c]) + int(src[Resolution*(r+0)+c+1]) + int(src[Resolution*(r+0)+c+2]) +
				 int(src[Resolution*(r+1)+c-2]) + int(src[Resolution*(r+1)+c-1]) + int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1]) + int(src[Resolution*(r+1)+c+2]) +
				 int(src[Resolution*(r+2)+c-2]) + int(src[Resolution*(r+2)+c-1]) + int(src[Resolution*(r+2)+c]) + int(src[Resolution*(r+2)+c+1]) + int(src[Resolution*(r+2)+c+2]) + 12) / 25
			got := dst[grayout.GetStride()*r+c]
			if byte(median) != got {
				t.Errorf("For [%d, %d]: Expected %d, got %d", r, c, median, got)
			}
		}
	}
}

func TestSimdSse2MedianFilterSquare5x5(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.RecreateWithStride(Resolution, Resolution, dstStride, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2MedianFilterSquare5x5(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*dstStride]byte)(grayout.GetData())[:])

	for r := 2; r < Resolution-2; r++ {
		for c := 2; c < Resolution-2; c++ {
			median := (int(src[Resolution*(r-2)+c-2]) + int(src[Resolution*(r-2)+c-1]) + int(src[Resolution*(r-2)+c]) + int(src[Resolution*(r-2)+c+1]) + int(src[Resolution*(r-2)+c+2]) +
				int(src[Resolution*(r-1)+c-2]) + int(src[Resolution*(r-1)+c-1]) + int(src[Resolution*(r-1)+c]) + int(src[Resolution*(r-1)+c+1]) + int(src[Resolution*(r-1)+c+2]) +
				int(src[Resolution*(r+0)+c-2]) + int(src[Resolution*(r+0)+c-1]) + int(src[Resolution*(r+0)+c]) + int(src[Resolution*(r+0)+c+1]) + int(src[Resolution*(r+0)+c+2]) +
				int(src[Resolution*(r+1)+c-2]) + int(src[Resolution*(r+1)+c-1]) + int(src[Resolution*(r+1)+c]) + int(src[Resolution*(r+1)+c+1]) + int(src[Resolution*(r+1)+c+2]) +
				int(src[Resolution*(r+2)+c-2]) + int(src[Resolution*(r+2)+c-1]) + int(src[Resolution*(r+2)+c]) + int(src[Resolution*(r+2)+c+1]) + int(src[Resolution*(r+2)+c+2]) + 12) / 25
			got := dst[grayout.GetStride()*r+c]
			if byte(median) != got {
				t.Errorf("For [%d, %d]: Expected %d, got %d", r, c, median, got)
			}
		}
	}
}
