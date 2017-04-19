package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Bgr48pToBgra32(blue unsafe.Pointer, blueStride int, width int, height int, green unsafe.Pointer, greenStride int, red unsafe.Pointer, redStride int, bgra unsafe.Pointer, bgraStride int, alpha uint64/*uint8*/)

func SimdSse2Bgr48pToBgra32(blue, green, red, bgra View, alpha uint64/*uint8*/) {

	_SimdSse2Bgr48pToBgra32(blue.GetData(), blue.GetStride(), blue.GetWidth(), blue.GetHeight(), green.GetData(), green.GetStride(), red.GetData(), red.GetStride(), bgra.GetData(), bgra.GetStride(), alpha)
}
