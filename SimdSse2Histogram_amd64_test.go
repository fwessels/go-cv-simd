package gocvsimd

import (
	"testing"
	"time"
	"math/rand"
)

func TestSimdSse2AbsSecondDerivativeHistogram(t *testing.T) {
	grayin, histo := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	histo.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i*2)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2AbsSecondDerivativeHistogram(grayin, 2, 4, histo)

	dst := make([]byte, histo.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(histo.GetData())[:])
}

const maskStride = Resolution+0x40

func TestSimdSse2HistogramMasked(t *testing.T) {

	rand.Seed(time.Now().UTC().UnixNano())

	grayin, mask := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	mask.RecreateWithStride(Resolution, Resolution, maskStride, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	h := make([]uint32, 256)

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(rand.Intn(256))
		h[src[i]]++
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	mdata := make([]byte, mask.GetDataLen())

	maskValue := rand.Intn(256)

	for i := 0; i < mask.GetDataLen(); i++ {
		mdata[i] = byte(maskValue)
	}

	copy((*[Resolution*maskStride]byte)(mask.GetData())[:], mdata[:])

	// Make mask match
	histo := SimdSse2HistogramMasked(grayin, mask, uint64(maskValue))

	for i := range histo {
		if h[i] != histo[i] {
			t.Errorf("For [%d]: Expected %d, got %d", i, h[i], histo[i])
		}
	}

	// Make mask fail
	for m := 0; m < 256; m++ {

		if m == maskValue {
			continue // skip this one
		}

		histo = SimdSse2HistogramMasked(grayin, mask, uint64(m))
		for i := range histo {
			if 0 != histo[i] {
				t.Errorf("For [%d]: Expected %d, got %d", i, 0, histo[i])
			}
		}
	}
}
