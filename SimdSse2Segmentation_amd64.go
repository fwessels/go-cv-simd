//+build !noasm
//+build !appengine

package gocvsimd

import (
	"unsafe"
	"github.com/fwessels/go-cv"
	"github.com/ipfs/go-ipfs/Godeps/_workspace/src/github.com/whyrusleeping/multiaddr-filter"
)

//go:noescape
func _SimdSse2SegmentationFillSingleHoles(mask unsafe.Pointer, stride, width, height uint64, index uint8)

//go:noescape
func _SimdSse2SegmentationChangeIndex(mask unsafe.Pointer, stride, width, height uint64, oldIndex, newIndex uint8)

//go:noescape
func _SimdSse2SegmentationPropagate2x2(parent unsafe.Pointer, parentStride, width, height uint64, child unsafe.Pointer, childStride uint64, difference unsafe.Pointer, differenceStride uint64, currentIndex, invalidIndex, emptyIndex, differenceThreshold uint8)

//
func SimdSse2SegmentationFillSingleHoles(mask gocv.View, index uint8)  {

	_SimdSse2SegmentationFillSingleHoles(mask.GetData(), uint64(mask.GetStride()), uint64(mask.GetWidth()), uint64(mask.GetHeight()), index)
}

//
func SimdSse2SegmentationChangeIndex(mask gocv.View, oldIndex, newIndex uint8)  {

	_SimdSse2SegmentationChangeIndex(mask.GetData(), uint64(mask.GetStride()), uint64(mask.GetWidth()), uint64(mask.GetHeight()), oldIndex, newIndex)
}

//
func SimdSse2SegmentationPropagate2x2(parent, child, difference gocv.View, currentIndex, invalidIndex, emptyIndex, differenceThreshold uint8)  {

	_SimdSse2SegmentationPropagate2x2(parent.GetData(), uint64(parent.GetStride()), uint64(parent.GetWidth()), uint64(parent.GetHeight()), child.GetData(), uint64(child.GetStride()), difference.GetData(), uint64(difference.GetStride()), currentIndex, invalidIndex, emptyIndex, differenceThreshold)
}



