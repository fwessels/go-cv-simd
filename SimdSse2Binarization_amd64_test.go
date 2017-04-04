package gocvsimd

import (
	"fmt"
	"testing"
)

func TestSimdSse2Binarization(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = 128 // byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2Binarization(grayin, 1, 192, 64, grayout, 3)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution*Resolution]byte)(grayout.GetData())[:])

	fmt.Println(dst[:Resolution])
	fmt.Println(dst[Resolution:Resolution*2])
	fmt.Println(dst[Resolution*2:Resolution*3])
	fmt.Println(dst[Resolution*3:Resolution*4])
}
