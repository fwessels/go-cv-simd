//+build !noasm
//+build !appengine

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2Reorder16bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//go:noescape
func _SimdSse2Reorder32bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//go:noescape
func _SimdSse2Reorder64bit(src unsafe.Pointer, size uint64, dst unsafe.Pointer)

//
func SimdSse2Reorder16bit(src View, size uint64, dst View) {

	_SimdSse2Reorder16bit(src.GetData(), size, dst.GetData())
}

//
func SimdSse2Reorder32bit(src View, size uint64, dst View) {

	_SimdSse2Reorder32bit(src.GetData(), size, dst.GetData())
}

//
func SimdSse2Reorder64bit(src View, size uint64, dst View) {

	_SimdSse2Reorder64bit(src.GetData(), size, dst.GetData())
}
