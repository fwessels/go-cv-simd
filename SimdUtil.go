package gocvsimd

import (
	"fmt"
	"unsafe"
	"github.com/fwessels/go-cv"
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

func SimdSetup(f gocv.Format) (gocv.View, gocv.View) {

	a, b := gocv.View{}, gocv.View{}
	a.Recreate(Resolution, Resolution, f)
	b.Recreate(Resolution, Resolution, f)

	return a, b
}
