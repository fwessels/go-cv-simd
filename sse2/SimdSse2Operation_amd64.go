//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
)

type Operation uint64

const (
	BINARY_AVERAGE Operation = iota
	BINARY_AND
	BINARY_OR
	BINARY_MAXIMUM
	BINARY_MINIMUM
	BINARY_SATURATED_SUBTRACTION
	BINARY_SATURATED_ADDITION
)

//go:noescape
func _SimdSse2OperationBinary8u(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, width, height, channelCount uint64, dst unsafe.Pointer, dstStride uint64, _type uint64/*uint8*/)

//go:noescape
func _SimdSse2OperationBinary16i(a unsafe.Pointer, aStride uint64, b unsafe.Pointer, bStride uint64, width, height uint64, dst unsafe.Pointer, dstStride uint64, _type uint64/*uint8*/)

//go:noescape
func _SimdSse2VectorProduct(vertical, horizontal, dst unsafe.Pointer, stride, width, height uint64)

//
func SimdSse2OperationBinary8u(a, b, dst View, _type uint64/*uint8*/)  {

	_SimdSse2OperationBinary8u(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), uint64(a.GetWidth()), uint64(a.GetHeight()), uint64(ChannelCount(a.GetFormat())), dst.GetData(), uint64(dst.GetStride()), _type)
}

//
func SimdSse2OperationBinary16i(a, b, dst View, _type uint64/*uint8*/)  {

	_SimdSse2OperationBinary16i(a.GetData(), uint64(a.GetStride()), b.GetData(), uint64(b.GetStride()), uint64(a.GetWidth()), uint64(a.GetHeight()), dst.GetData(), uint64(dst.GetStride()), _type)
}

//
func SimdSse2VectorProduct(vertical, horizontal, dst View)  {

	_SimdSse2VectorProduct(vertical.GetData(), horizontal.GetData(), dst.GetData(), uint64(dst.GetStride()), uint64(dst.GetWidth()), uint64(dst.GetHeight()))
}
