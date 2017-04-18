package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2DeinterleaveUv(uv unsafe.Pointer, uvStride int, width int, height int, u unsafe.Pointer, uStride int, v unsafe.Pointer, vStride int)

// SimdSse2DeinterleaveUv deinterleaves 16-bit UV interleaved image into separated 8-bit U and V planar images.
// All images must have the same width and height.
// This function used for NV12 to YUV420P conversion.
func SimdSse2DeinterleaveUv(uv, u, v View) {
	_SimdSse2DeinterleaveUv(uv.GetData(), uv.GetStride(), uv.GetWidth(), uv.GetHeight(), u.GetData(), u.GetStride(), v.GetData(), v.GetStride())
}
