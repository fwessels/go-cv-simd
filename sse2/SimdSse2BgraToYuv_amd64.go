package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2BgraToYuv420p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

func SimdSse2BgraToYuv420p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv420p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}

//go:noescape
func _SimdSse2BgraToYuv422p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

func SimdSse2BgraToYuv422p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv422p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}

//go:noescape
func _SimdSse2BgraToYuv444p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

func SimdSse2BgraToYuv444p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv444p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}
