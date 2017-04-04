package gocvsimd

import (
	"fmt"
	"testing"
)

func TestSimdSse2TextureGetDifferenceSum(t *testing.T) {
	grayin, lo, hi := View{}, View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	lo.Recreate(Resolution, Resolution, GRAY8)
	hi.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	sum := SimdSse2TextureGetDifferenceSum(grayin, lo, hi)

	fmt.Println(sum)
}
