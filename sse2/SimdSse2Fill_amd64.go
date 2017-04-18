package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2FillBgr(dst unsafe.Pointer, stride int, width int, height int, blue int, green int, red int)

//go:noescape
func _SimdSse2FillBgra(dst unsafe.Pointer, stride int, width int, height int, blue int, green int, red int, alpha int)

// SimdSse2FillBgr fills pixels data of 24-bit BGR image by given color(blue, green, red).
func SimdSse2FillBgr(dst View, blue, green, red int) {
	_SimdSse2FillBgr(dst.GetData(), dst.GetStride(), dst.GetWidth(), dst.GetHeight(), blue, green, red)
}
// SimdSse2FillBgra fills pixels data of 32-bit BGRA image by given color(blue, green, red, alpha).
func SimdSse2FillBgra(dst View, blue, green, red, alpha int) {
	_SimdSse2FillBgra(dst.GetData(), dst.GetStride(), dst.GetWidth(), dst.GetHeight(), blue, green, red, alpha)
}
