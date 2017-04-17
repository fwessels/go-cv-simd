package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2DeinterleaveUv(uv unsafe.Pointer, uvStride int, width int, height int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

func SimdSse2DeinterleaveUv(uv, u, v View) {
	_SimdSse2DeinterleaveUv(uv.GetData(), uv.GetStride(), uv.GetWidth(), uv.GetHeight(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}
