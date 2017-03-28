package gocvsimd

import (
	"fmt"
	"unsafe"
)

// buffer of pending write data
const (
	bufSize = 8
)

var buf [bufSize]byte
var nbuf uintptr

func PrintBytes(str string, p unsafe.Pointer, len uintptr) {

	copy(buf[0:], (*[bufSize]byte)(p)[:len])
	fmt.Println(str, "bytes:", buf)
}

func SimdSetup(f Format) (View, View) {

	a, b := View{}, View{}
	a.Recreate(Resolution, Resolution, f)
	b.Recreate(Resolution, Resolution, f)

	return a, b
}
