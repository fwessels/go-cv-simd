package gocvsimd

import (
	"testing"
)

func TestSimdSse2Binarization(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	const v = 64
	const pos = 111
	const neg = 0

	SimdSse2Binarization(grayin, v, pos, neg, grayout, 3)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	for r := 0; r < Resolution; r++ {
		for c := 0; c < Resolution; c++ {
			val := int(src[Resolution*r+c])
			b := neg
			if val >= v {
				b = pos
			}
			got := dst[grayout.GetStride()*r+c]
			if byte(b) != got {
				t.Errorf("Expected %d, got %d", b, got)
			}
		}
	}
}

func TestSimdSse2AveragingBinarization(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	const v = 64
	const neighbor = 1
	const th = 128
	const pos = 222
	const neg = 64

	SimdSse2AveragingBinarization(grayin, v, neighbor, th, pos, neg, grayout, 3)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	for r := 0; r < Resolution; r++ {
		for c := 0; c < Resolution; c++ {
			val := int(src[Resolution*r+c])
			b := neg
			if val >= v {
				b = pos
			}
			got := dst[grayout.GetStride()*r+c]
			if byte(b) != got {
				t.Errorf("Expected %d, got %d", b, got)
			}
		}
	}

}
