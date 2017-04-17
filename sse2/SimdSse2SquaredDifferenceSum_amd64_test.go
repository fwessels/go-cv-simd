package gocvsimd

import "testing"

func TestSimdSse2SquaredDifferenceSum(t *testing.T) {
	a, b := View{}, View{}
	a.Recreate(Resolution, Resolution, GRAY8)
	b.Recreate(Resolution, Resolution, GRAY8)
	SimdSse2SquaredDifferenceSum(a, b)

	a, b = View{}, View{}
	a.Recreate(Resolution, Resolution, FLOAT)
	b.Recreate(Resolution, Resolution, FLOAT)
	SimdSse2SquaredDifferenceSum(a, b)
}

func TestSimdSse2SquaredDifferenceSumMasked(t *testing.T) {

	a, b, m := View{}, View{}, View{}
	a.Recreate(Resolution, Resolution, GRAY8)
	b.Recreate(Resolution, Resolution, GRAY8)
	m.Recreate(Resolution, Resolution, GRAY8)
	SimdSse2SquaredDifferenceSumMasked(a, b, m, 17)

	a, b, m = View{}, View{}, View{}
	a.Recreate(Resolution, Resolution, FLOAT)
	b.Recreate(Resolution, Resolution, FLOAT)
	m.Recreate(Resolution, Resolution, FLOAT)
	SimdSse2SquaredDifferenceSumMasked(a, b, m, 17)
}
