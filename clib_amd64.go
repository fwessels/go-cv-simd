//+build !noasm
//+build !appengine

package gocvsimd

//go:noescape
func _ClibFloor32(fl float32) float32
