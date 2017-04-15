package gocvsimd

import (
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

	SimdSse2TextureGetDifferenceSum(grayin, lo, hi)
}

func TestSimdSse2TextureBoostedUv(t *testing.T) {

	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TextureBoostedUv(grayin, 123, grayout)
}

func TestSimdSse2TextureBoostedSaturatedGradient(t *testing.T) {

	grayin, dx, dy := View{}, View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	dx.Recreate(Resolution, Resolution, GRAY8)
	dy.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution*Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TextureBoostedSaturatedGradient(grayin, 12, 24, dx, dy)
}

func TestSimdSse2TexturePerformCompensation(t *testing.T) {

	grayin, grayout := View{}, View{}
	grayin.Recreate(Resolution, Resolution, GRAY8)
	grayout.Recreate(Resolution, Resolution, GRAY8)

	src := make([]byte, grayin.GetDataLen())

	for i := 0; i < grayin.GetDataLen(); i++ {
		src[i] = byte(i)
	}

	copy((*[Resolution * Resolution]byte)(grayin.GetData())[:], src[:])

	SimdSse2TexturePerformCompensation(grayin, 123, grayout)
}