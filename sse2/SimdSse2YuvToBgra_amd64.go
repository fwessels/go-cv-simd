package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Yuv420pToBgra(y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int, width, height int, bgra unsafe.Pointer, bgraStride int, alpha uint64/*uint8*/)

//go:noescape
func _SimdSse2Yuv422pToBgra(y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int, width, height int, bgra unsafe.Pointer, bgraStride int, alpha uint64/*uint8*/)

//go:noescape
func _SimdSse2Yuv444pToBgra(y unsafe.Pointer, yStride int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int, width, height int, bgra unsafe.Pointer, bgraStride int, alpha uint64/*uint8*/)
// SimdSse2Yuv420pToBgra converts YUV420P image to 32-bit BGRA image.
// 	The input Y and output BGRA images must have the same width and height.
// 	The input U and V images must have the same width and height (half size relative to Y component).
func SimdSse2Yuv420pToBgra(y, u, v, bgra View, alpha uint64/*uint8*/) {
	_SimdSse2Yuv420pToBgra(y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride(), y.GetWidth(), y.GetHeight(), bgra.GetData(), bgra.GetStride(), alpha)
}
// SimdSse2Yuv422pToBgra converts YUV422P image to 32-bit BGRA image.
// 	The input Y and output BGRA images must have the same width and height.
// 	The input U and V images must have the same width and height (their width is equal to half width of Y component).
func SimdSse2Yuv422pToBgra(y, u, v, bgra View, alpha uint64/*uint8*/) {
	_SimdSse2Yuv422pToBgra(y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride(), y.GetWidth(), y.GetHeight(), bgra.GetData(), bgra.GetStride(), alpha)
}
// SimdSse2Yuv444pToBgra converts YUV444P image to 32-bit BGRA image.
// 	The input Y, U, V and output BGRA images must have the same width and height.
func SimdSse2Yuv444pToBgra(y, u, v, bgra View, alpha uint64/*uint8*/) {
	_SimdSse2Yuv444pToBgra(y.GetData(), y.GetStride(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride(), y.GetWidth(), y.GetHeight(), bgra.GetData(), bgra.GetStride(), alpha)
}
