package gocvsimd

import "testing"

func TestSimdSse2ReduceGray4x4(t *testing.T) {
	src, dst := View{}, View{}
	src.Recreate(Resolution, Resolution, GRAY8)
	dst.Recreate(Resolution, Resolution, GRAY8)
	SimdSse2ReduceGray4x4(src, dst)
}
