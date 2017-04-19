package gocvsimd

import (
	"image"
	"image/draw"
	"unsafe"
	"image/color"
	"os"
)

type Format uint8

const (
	NONE Format = iota
	GRAY8
	UV16
	BGR24
	BGRA32
	INT16
	INT32
	INT64
	FLOAT
	DOUBLE
	BAYERGRBG
	BAYERGBRG
	BAYERRGGB
	BAYERBGGR
	HSV24
	HSL24
)

func PixelSize(f Format) int {
	switch f {
	case NONE:
		return 0
	case GRAY8:
		return 1
	case UV16:
		return 2
	case BGR24:
		return 3
	case BGRA32:
		return 4
	case INT16:
		return 2
	case INT32:
		return 4
	case INT64:
		return 8
	case FLOAT:
		return 4
	case DOUBLE:
		return 8
	case BAYERGRBG:
		return 1
	case BAYERGBRG:
		return 1
	case BAYERRGGB:
		return 1
	case BAYERBGGR:
		return 1
	case HSV24:
		return 3
	case HSL24:
		return 3
	default:
		return 0
	}
}

func ChannelCount(f Format) int {
	switch f {
	case NONE:
		return 0
	case GRAY8:
		return 1
	case UV16:
		return 2
	case BGR24:
		return 3
	case BGRA32:
		return 4
	case INT16:
		return 1
	case INT32:
		return 1
	case INT64:
		return 1
	case FLOAT:
		return 1
	case DOUBLE:
		return 1
	case BAYERGRBG:
		return 1
	case BAYERGBRG:
		return 1
	case BAYERRGGB:
		return 1
	case BAYERBGGR:
		return 1
	case HSV24:
		return 3
	case HSL24:
		return 3
	default:
		return 0
	}
}

type View struct {
	width, height int
	format        Format
	stride        int
	owner         bool
	data          unsafe.Pointer
}

func (v *View) GetData() unsafe.Pointer {
	return v.data
}

func (v *View) GetDataLen() int {
	return v.stride*v.height
}

func (v *View) GetWidth() int {
	return v.width
}

func (v *View) GetHeight() int {
	return v.height
}

func (v *View) GetStride() int {
	return v.stride
}

func (v *View) GetFormat() Format {
	return v.format
}

// Recreate --
func (v *View) Recreate(w, h int, f Format) {
	if v.owner && v.data != nil {
		Free(v.data)
		v.data = nil
		v.owner = false
	}
	v.width = w
	v.height = h
	v.format = f
	v.stride = Align(v.width*PixelSize(v.format), Alignment())
	v.data = Allocate(v.height*v.stride, Alignment())
}

// Recreate --
func (v *View) RecreateWithStride(w, h, s int, f Format) {
	if v.owner && v.data != nil {
		Free(v.data)
		v.data = nil
		v.owner = false
	}
	v.width = w
	v.height = h
	v.format = f
	v.stride = Align(s, Alignment())
	v.data = Allocate(v.height*v.stride, Alignment())
}

// Load --
func (v *View) Load(path string) error {

	return nil
}

// AsRGBA returns an RGBA copy of the supplied image.
func AsRGBA(src image.Image) *image.RGBA {
	bounds := src.Bounds()
	img := image.NewRGBA(bounds)
	draw.Draw(img, bounds, src, bounds.Min, draw.Src)
	return img
}

func LoadImage(name string) (View, error) {

	// Load jpeg image
	file, err := os.Open(name)
	if err != nil {
		return View{}, err
	}
	defer file.Close()

	// Decode file using go's image API
	img, _, err := image.Decode(file)
	if err != nil {
		return View{}, err
	}

	// go-cv loads image
	view := View{}
	view.LoadPixels(img)

	return view, nil
}

// LoadImage loads a go Image object into the view
func (v *View) LoadPixels(img image.Image) {

	// TODO: Optimize this function

	w := img.Bounds().Dx()
	h := img.Bounds().Dy()

	v.Recreate(w, h, BGRA32)

	data := make([]byte, w*v.GetStride())

	for y := 0; y < h; y++ {
		index := y*v.GetStride()
		for x := 0; x < w; x++ {
			r, g, b, a := color.GrayModel.Convert(img.At(x, y)).RGBA()
			data[index+0] = byte(b)
			data[index+1] = byte(g)
			data[index+2] = byte(r)
			data[index+3] = byte(a)
			index += 4
		}
	}

	copy((*[Resolution*Resolution*4]byte)(v.GetData())[:], data[:])
}
