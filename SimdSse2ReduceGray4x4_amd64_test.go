package gocvsimd

import (
	"testing"
	"fmt"
)

func TestSimdSse2ReduceGray4x4(t *testing.T) {
	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution*2, Resolution*2, GRAY8)
	grayout.Recreate(Resolution/2, Resolution/2, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i << 2)
	}

	copy((*[Resolution*2*Resolution*2]byte)(grayin.GetData())[:], src[:])

	SimdSse2ReduceGray4x4(grayin, grayout)

	dst := make([]byte, grayout.GetDataLen())

	copy(dst[:], (*[Resolution/2*Resolution/2]byte)(grayout.GetData())[:])

	fmt.Println(dst[:64])
}
