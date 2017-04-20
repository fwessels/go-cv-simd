//+build !noasm
//+build !appengine

/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package gocvsimd

import "unsafe"

//go:noescape
func _SimdSse2SegmentationFillSingleHoles(mask unsafe.Pointer, stride, width, height uint64, index uint64/*uint8*/)

//go:noescape
func _SimdSse2SegmentationChangeIndex(mask unsafe.Pointer, stride, width, height uint64, oldIndex, newIndex uint64/*uint8*/)

//go:noescape
func _SimdSse2SegmentationPropagate2x2(parent unsafe.Pointer, parentStride, width, height uint64, child unsafe.Pointer, childStride uint64, difference unsafe.Pointer, differenceStride uint64, currentIndex, invalidIndex, emptyIndex, differenceThreshold uint64/*uint8*/)

// SimdSse2SegmentationFillSingleHoles fills single holes in mask.
// Mask must has 8-bit gray pixel format.
func SimdSse2SegmentationFillSingleHoles(mask View, index uint64/*uint8*/) {

	_SimdSse2SegmentationFillSingleHoles(mask.GetData(), uint64(mask.GetStride()), uint64(mask.GetWidth()), uint64(mask.GetHeight()), index)
}

// SimdSse2SegmentationChangeIndex changes certain index in mask.
// Mask must has 8-bit gray pixel format.
// 	For every point:
//		if(mask[i] == oldIndex)
//		mask[i] = newIndex;
func SimdSse2SegmentationChangeIndex(mask View, oldIndex, newIndex uint64/*uint8*/) {

	_SimdSse2SegmentationChangeIndex(mask.GetData(), uint64(mask.GetStride()), uint64(mask.GetWidth()), uint64(mask.GetHeight()), oldIndex, newIndex)
}

// SimdSse2SegmentationPropagate2x2 propagates mask index from parent (upper) to child (lower) level of mask pyramid with using 2x2 scan window.
// For parent and child image the following must be true:  parentWidth = (childWidth + 1)/2, parentHeight = (childHeight + 1)/2.
// All images must have 8-bit gray pixel format. Size of different image is equal to the child image.
func SimdSse2SegmentationPropagate2x2(parent, child, difference View, currentIndex, invalidIndex, emptyIndex, differenceThreshold uint64/*uint8*/) {

	_SimdSse2SegmentationPropagate2x2(parent.GetData(), uint64(parent.GetStride()), uint64(parent.GetWidth()), uint64(parent.GetHeight()), child.GetData(), uint64(child.GetStride()), difference.GetData(), uint64(difference.GetStride()), currentIndex, invalidIndex, emptyIndex, differenceThreshold)
}
