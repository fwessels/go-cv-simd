package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2BgraToYuv420p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2BgraToYuv420p converts 32-bit BGRA image to YUV420P.
// 	The input BGRA and output Y images must have the same width and height.
// The input U and V images must have the same width and height (half size relative to Y component).
func SimdSse2BgraToYuv420p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv420p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}

//go:noescape
func _SimdSse2BgraToYuv422p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2BgraToYuv422p converts 32-bit BGRA image to YUV422P.
// 	The input BGRA and output Y images must have the same width and height.
// The input U and V images must have the same width and height (their width is equal to half width of Y component).
func SimdSse2BgraToYuv422p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv422p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}

//go:noescape
func _SimdSse2BgraToYuv444p(bgra unsafe.Pointer, width, height int, bgraStride int, y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2BgraToYuv444p converts 32-bit BGRA image to YUV444P.
// The input BGRA and output Y, U and V images must have the same width and height.
func SimdSse2BgraToYuv444p(bgra, y, u, v View) {
	_SimdSse2BgraToYuv444p(bgra.GetData(), bgra.GetWidth(), bgra.GetHeight(), bgra.GetStride(), y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}
