package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Yuv420pToBgra(y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int, width, height int, bgra unsafe.Pointer, bgraStride int, alpha uint8)

func SimdSse2Yuv420pToBgra(y, u, v, bgra View, alpha uint8) {
	_SimdSse2Yuv420pToBgra(y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride(), y.GetWidth(), y.GetHeight(), bgra.GetData(), bgra.GetStride(), alpha)
}

//go:noescape
func _SimdSse2Yuv422pToBgra(y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int, width, height int, bgra unsafe.Pointer, bgraStride int, alpha uint8)

func SimdSse2Yuv422pToBgra(y, u, v, bgra View, alpha uint8) {
	_SimdSse2Yuv422pToBgra(y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride(), y.GetWidth(), y.GetHeight(), bgra.GetData(), bgra.GetStride(), alpha)
}

//go:noescape
func _SimdSse2Yuv444pToBgra(y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int, width, height int, bgra unsafe.Pointer, bgraStride int, alpha uint8)

func SimdSse2Yuv444pToBgra(y, u, v, bgra View, alpha uint8) {
	_SimdSse2Yuv444pToBgra(y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride(), y.GetWidth(), y.GetHeight(), bgra.GetData(), bgra.GetStride(), alpha)
}
