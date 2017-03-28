package gocvsimd

import "unsafe"

// Allocate allocates an aligned memory block.
// The memory allocated by this function is must be deleted by function Free
// [in] size - a size of memory block.
// [in] align - a required alignment of memory block.
// return a pointer to allocated memory.
func Allocate(size, align int) unsafe.Pointer {
	buf := make([]byte, size)
	return unsafe.Pointer(&buf[0])
}

// Free frees aligned memory block.
// This function frees a memory allocated by function Allocate.
// [in] ptr - a pointer to the memory to be deleted.
func Free(ptr unsafe.Pointer) {
	*(*[]byte)(ptr) = nil
}

// Align gets aligned size.
// [in] size - an original size.
// [in] align - a required alignment.
// return an aligned size.
func Align(size, align int) int {
	return (size + align - 1) & ^(align - 1)
}

// Alignment gets alignment required for the most productive work of the Simd Library.
// a required alignment.
func Alignment() int {
	// FIXME: fix this to be processor capability specific.
	return 32
}

const Resolution = 2048
