package gocvsimd

import (
	"fmt"
	"testing"
)

func TestSimdSse2AbsSecondDerivativeHistogram(t *testing.T) {
	grayin, histo := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	histo.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2AbsSecondDerivativeHistogram(grayin, 1, 2, histo)

	//dst := make([]byte, histo.GetDataLen())
	//
	//copy(dst[:], (*[Resolution*Resolution]byte)(histo.GetData())[:])
	//
	//fmt.Println(dst[:64])
}

func TestSimdSse2HistogramMasked(t *testing.T) {
	grayin, mask := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	mask.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = 1 + byte(i % 3)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	histo := SimdSse2HistogramMasked(grayin, mask, 0)

	fmt.Println(histo[:32])
	fmt.Println(histo[12+1*4])
	fmt.Println(histo[12+2*4])
	fmt.Println(histo[12+3*4])
}
