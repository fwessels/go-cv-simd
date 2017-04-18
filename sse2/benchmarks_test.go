package gocvsimd

import (
	"testing"
)

func GoCVSimdSetup(f Format) (View, View) {

	a, b := View{}, View{}
	a.Recreate(Resolution, Resolution, f)
	b.Recreate(Resolution, Resolution, f)

	return a, b
}

//func benchmarkGoCVSimdReorder16b(b *testing.B, f Format) {
//
//	src, dst := GoCVSimdSetup(f)
//
//	for i := 0; i < b.N; i++ {
//		SimdSse2Reorder16bit(src, uint64(src.GetDataLen()), dst)
//	}
//}
//
//func BenchmarkReorder16b(b *testing.B) {
//
//	benchmarkGoCVSimdReorder16b(b, GRAY8)
//}
//
//func BenchmarkReorderBGRA16b(b *testing.B) {
//
//	benchmarkGoCVSimdReorder16b(b, BGRA32)
//}
//
//func benchmarkGoCVSimdReorder32b(b *testing.B, f Format) {
//
//	src, dst := GoCVSimdSetup(f)
//
//	for i := 0; i < b.N; i++ {
//		SimdSse2Reorder32bit(src, uint64(src.GetDataLen()), dst)
//	}
//}
//
//func BenchmarkReorder32b(b *testing.B) {
//
//	benchmarkGoCVSimdReorder32b(b, GRAY8)
//}
//
//func BenchmarkReorderBGRA32b(b *testing.B) {
//
//	benchmarkGoCVSimdReorder32b(b, BGRA32)
//}
//
//func benchmarkGoCVSimdReorder64b(b *testing.B, f Format) {
//
//	src, dst := GoCVSimdSetup(f)
//
//	for i := 0; i < b.N; i++ {
//		SimdSse2Reorder64bit(src, uint64(src.GetDataLen()), dst)
//	}
//}
//
//func BenchmarkReorder64b(b *testing.B) {
//
//	benchmarkGoCVSimdReorder64b(b, GRAY8)
//}

//func BenchmarkReorderBGRA64b(b *testing.B) {
//
//	benchmarkGoCVSimdReorder64b(b, BGRA32)
//}

func benchmarkGoCVSimdMedianFilterRhomb3x3(b *testing.B, f Format) {

	src, dst := GoCVSimdSetup(f)

	for i := 0; i < b.N; i++ {
		SimdSse2MedianFilterRhomb3x3(src, dst)
	}
}

func BenchmarkFilterRhomb3x3(b *testing.B) {

	benchmarkGoCVSimdMedianFilterRhomb3x3(b, GRAY8)
}

func BenchmarkFilterRhomb3x3RGB(b *testing.B) {

	benchmarkGoCVSimdMedianFilterRhomb3x3(b, BGR24)
}

func benchmarkGoCVSimdMedianFilterRhomb5x5(b *testing.B, f Format) {

	src, dst := GoCVSimdSetup(f)

	for i := 0; i < b.N; i++ {
		SimdSse2MedianFilterRhomb5x5(src, dst)
	}
}

func BenchmarkFilterRhomb5x5(b *testing.B) {

	benchmarkGoCVSimdMedianFilterRhomb5x5(b, GRAY8)
}

func BenchmarkFilterRhomb5x5RGB(b *testing.B) {

	benchmarkGoCVSimdMedianFilterRhomb5x5(b, BGR24)
}

func benchmarkGoCVSimdMedianFilterSquare3x3(b *testing.B, f Format) {

	src, dst := GoCVSimdSetup(f)

	for i := 0; i < b.N; i++ {
		SimdSse2MedianFilterSquare3x3(src, dst)
	}
}

func BenchmarkFilterSquare3x3(b *testing.B) {

	benchmarkGoCVSimdMedianFilterSquare3x3(b, GRAY8)
}

func BenchmarkFilterSquare3x3RGB(b *testing.B) {

	benchmarkGoCVSimdMedianFilterSquare3x3(b, BGR24)
}

func benchmarkGoCVSimdMedianFilterSquare5x5(b *testing.B, f Format) {

	src, dst := GoCVSimdSetup(f)

	for i := 0; i < b.N; i++ {
		SimdSse2MedianFilterSquare5x5(src, dst)
	}
}

func BenchmarkFilterSquare5x5(b *testing.B) {

	benchmarkGoCVSimdMedianFilterSquare5x5(b, GRAY8)
}

func BenchmarkFilterSquare5x5RGB(b *testing.B) {

	benchmarkGoCVSimdMedianFilterSquare5x5(b, BGR24)
}

//func BenchmarkHistogramMasked(b *testing.B) {
//
//        src, mask := GoCVSimdSetup(GRAY8)
//
//        for i := 0; i < b.N; i++ {
//                SimdSse2HistogramMasked(src, mask, uint64(0))
//        }
//
//}

func BenchmarkGaussianBlur(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2GaussianBlur3x3(src, dst)
        }
}

func BenchmarkGaussianBlurRGB(b *testing.B) {

	src, dst := GoCVSimdSetup(BGR24)

	for i := 0; i < b.N; i++ {
		SimdSse2GaussianBlur3x3(src, dst)
	}
}

func BenchmarkBgraToGray(b *testing.B) {

        src, _ := GoCVSimdSetup(BGRA32)
        _, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2BgraToGray(src, dst)
        }
}

func benchmarkMeanFilter(b *testing.B, f Format) {

        src, dst := GoCVSimdSetup(f)

        for i := 0; i < b.N; i++ {
                SimdSse2MeanFilter3x3(src, dst)
        }
}

func BenchmarkMeanFilter(b *testing.B) {

	benchmarkMeanFilter(b, GRAY8)
}

func BenchmarkMeanFilterRGB(b *testing.B) {

        benchmarkMeanFilter(b, BGRA32)
}

func BenchmarkFillBgr(b *testing.B) {

        _, dst := GoCVSimdSetup(BGR24)

        for i := 0; i < b.N; i++ {
                SimdSse2FillBgr(dst, 0x12, 0x34, 0x56)
        }
}

func BenchmarkFillBgra(b *testing.B) {

        _, dst := GoCVSimdSetup(BGRA32)

        for i := 0; i < b.N; i++ {
                SimdSse2FillBgra(dst, 0x12, 0x34, 0x56, 0x78)
        }
}

func BenchmarkLaplace(b *testing.B) {

        src, dst := GoCVSimdSetup(INT16)

        for i := 0; i < b.N; i++ {
                SimdSse2Laplace(src, dst)
        }
}

func BenchmarkInt16ToGray(b *testing.B) {

        src, _ := GoCVSimdSetup(INT16)
        _, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2Laplace(src, dst)
        }
}

func BenchmarkGrayToBgra(b *testing.B) {

        src, _ := GoCVSimdSetup(GRAY8)
        _, dst := GoCVSimdSetup(BGRA32)

        for i := 0; i < b.N; i++ {
                SimdSse2GrayToBgra(src, dst)
        }
}

func BenchmarkDeinterleaveUv(b *testing.B) {

        uv, _ := GoCVSimdSetup(UV16)
        u, v := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2DeinterleaveUv(uv, u, v)
        }
}

func BenchmarkBinarization(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
		SimdSse2Binarization(src, 64, 111, 0, dst, 3)
	}
}

func BenchmarkAveragingBinarization(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AveragingBinarization(src, 64, 5, 128, 255, 1, dst, 3)
        }
}

func benchmarkSse2BgraToYuv(b *testing.B, f func(bgra, y, u, v View)) {

	bgra, _ := GoCVSimdSetup(BGRA32)
	_, y := GoCVSimdSetup(GRAY8)
	u, v := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
		f(bgra, y, u, v)
	}
}

func BenchmarkBgraToYuv420p(b *testing.B) {

	benchmarkSse2BgraToYuv(b, SimdSse2BgraToYuv420p)
}

func BenchmarkBgraToYuv422p(b *testing.B) {

        benchmarkSse2BgraToYuv(b, SimdSse2BgraToYuv422p)
}

func BenchmarkBgraToYuv444p(b *testing.B) {

        benchmarkSse2BgraToYuv(b, SimdSse2BgraToYuv444p)
}

func BenchmarkAlphaBlending(b *testing.B) {

        src, alpha := GoCVSimdSetup(BGRA32)
        dst, _ := GoCVSimdSetup(BGRA32)

        for i := 0; i < b.N; i++ {
                SimdSse2AlphaBlending(src, alpha, dst)
        }
}

func benchmarkReduceGray(b *testing.B, f func(src, dst View)) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
		f(src, dst)
        }
}

func benchmarkReduceGrayWithComp(b *testing.B, f func(src, dst View, comp int)) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                f(src, dst, 1)
        }
}

//func BenchmarkReduceGray2x2(b *testing.B) {
//
//	benchmarkReduceGray(b, SimdSse2ReduceGray2x2)
//}
//
//func BenchmarkReduceGray3x3(b *testing.B) {
//
//        benchmarkReduceGrayWithComp(b, SimdSse2ReduceGray3x3)
//}
//
//func BenchmarkReduceGray4x4(b *testing.B) {
//
//        benchmarkReduceGray(b, SimdSse2ReduceGray4x4)
//}

//func BenchmarkReduceGray5x5(b *testing.B) {
//
//        benchmarkReduceGrayWithComp(b, SimdSse2ReduceGray5x5)
//}

func BenchmarkAbsGradientSaturatedSum(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AbsGradientSaturatedSum(src, dst)
        }
}

func BenchmarkSquaredDifferenceSum(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2SquaredDifferenceSum(src, dst)
        }
}

func BenchmarkSquaredDifferenceSumMasked(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)
        mask, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2SquaredDifferenceSumMasked(src, dst, mask, 17)
        }
}

func BenchmarkAbsDifferenceSum(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AbsDifferenceSum(src, dst)
        }
}

func BenchmarkAbsDifferenceSumMasked(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)
        mask, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AbsDifferenceSumMasked(src, dst, mask, 234)
        }
}

func BenchmarkAbsDifferenceSums3x3(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AbsDifferenceSums3x3(src, dst)
        }
}

func BenchmarkAbsDifferenceSums3x3Masked(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)
        mask, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AbsDifferenceSums3x3Masked(src, dst, mask, 234)
        }
}

func BenchmarkAddFeatureDifference(b *testing.B) {

	src, diff := GoCVSimdSetup(GRAY8)
	lo, hi := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2AddFeatureDifference(src, lo, hi ,128, diff)
        }
}

func BenchmarkBackgroundInitMask(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2BackgroundInitMask(src, 123, 234, dst)
        }
}

func benchmarkBackgroundGrowRange(b *testing.B, f func(value, lo, hi View)) {

        src, _ := GoCVSimdSetup(GRAY8)
	lo, hi := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                f(src, lo, hi)
        }
}

func BenchmarkBackgroundGrowRangeSlow(b *testing.B) {

	benchmarkBackgroundGrowRange(b, SimdSse2BackgroundGrowRangeSlow)
}

func BenchmarkBackgroundGrowRangeFast(b *testing.B) {

        benchmarkBackgroundGrowRange(b, SimdSse2BackgroundGrowRangeFast)
}

func BenchmarkBackgroundIncrementCount(b *testing.B) {

	src, _ := GoCVSimdSetup(GRAY8)
	lo, hi := GoCVSimdSetup(GRAY8)
	loCount, hiCount := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
		SimdSse2BackgroundIncrementCount(src, lo, hi, loCount, hiCount)
        }
}

func BenchmarkBackgroundAdjustRange(b *testing.B) {

        loCount, hiCount := GoCVSimdSetup(GRAY8)
        loValue, hiValue := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2BackgroundAdjustRange(loCount, loValue, hiCount, hiValue, 123)
        }
}

func BenchmarkBackgroundAdjustRangeMasked(b *testing.B) {

        loCount, hiCount := GoCVSimdSetup(GRAY8)
        loValue, hiValue := GoCVSimdSetup(GRAY8)
        mask, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2BackgroundAdjustRangeMasked(loCount, loValue, hiCount, hiValue, 123, mask)
        }
}

func BenchmarkBackgroundShiftRange(b *testing.B) {

	benchmarkBackgroundGrowRange(b, SimdSse2BackgroundShiftRange)
}

func BenchmarkBackgroundShiftRangeMasked(b *testing.B) {

        src, mask := GoCVSimdSetup(GRAY8)
        lo, hi := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2BackgroundShiftRangeMasked(src, lo, hi, mask)
        }
}

func BenchmarkSegmentationFillSingleHoles(b *testing.B) {

        mask, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2SegmentationFillSingleHoles(mask, 111)
        }
}

func BenchmarkSegmentationChangeIndex(b *testing.B) {

        mask, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2SegmentationChangeIndex(mask, 111, 222)
        }
}

func BenchmarkSegmentationPropagate2x2(b *testing.B) {

        parent, child := GoCVSimdSetup(GRAY8)
        difference, _ := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2SegmentationPropagate2x2(parent, child, difference, 1, 2, 3, 4)
        }
}

func benchmarkSobel(b *testing.B, f func(src, view View)) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                f(src, dst)
        }
}

func BenchmarkSobelDx(b *testing.B) {

	benchmarkSobel(b, SimdSse2SobelDx)
}

func BenchmarkSobelDy(b *testing.B) {

        benchmarkSobel(b, SimdSse2SobelDy)
}

func benchmarkConditional(b *testing.B, format Format, f func(View, uint64, uint64) uint32) {

        src, _ := GoCVSimdSetup(format)

        for i := 0; i < b.N; i++ {
                f(src, 123,  0)
        }
}

func BenchmarkConditionalCount8u(b *testing.B) {

	benchmarkConditional(b, GRAY8, SimdSse2ConditionalCount8u)
}

func BenchmarkConditionalCount16i(b *testing.B) {

        benchmarkConditional(b, INT16, SimdSse2ConditionalCount16i)
}

func benchmarkConditionalSum(b *testing.B, format Format, f func(src, mask View, value, compareType uint64) uint64) {

        src, mask := GoCVSimdSetup(format)

        for i := 0; i < b.N; i++ {
                f(src, mask, 123,  0)
        }
}

func BenchmarkConditionalSum(b *testing.B) {

        benchmarkConditionalSum(b, GRAY8, SimdSse2ConditionalSum)
}

func BenchmarkConditionalSquareSum(b *testing.B) {

        benchmarkConditionalSum(b, GRAY8, SimdSse2ConditionalSquareSum)
}

func BenchmarkConditionalSquareGradientSum(b *testing.B) {

        benchmarkConditionalSum(b, GRAY8, SimdSse2ConditionalSquareGradientSum)
}

func BenchmarkConditionalFill(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2ConditionalFill(src, 123, 0, 234, dst)
        }
}

func benchmarkOperation(b *testing.B, format Format, f func(a, b, dst View, _type uint64)) {

        aa, bb := GoCVSimdSetup(format)
        dst, _ := GoCVSimdSetup(format)

        for i := 0; i < b.N; i++ {
                f(aa, bb, dst, 1)
        }
}

func BenchmarkOperationBinary8u(b *testing.B) {

        benchmarkOperation(b, GRAY8, SimdSse2OperationBinary8u)
}

func BenchmarkOperationBinary16i(b *testing.B) {

        benchmarkOperation(b, INT16, SimdSse2OperationBinary16i)
}

func BenchmarkStretchGray2x2(b *testing.B) {

	src := View{}
	src.Recreate(Resolution/2, Resolution/2, GRAY8)
        _, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2StretchGray2x2(src, dst)
        }

}

func benchmarkYuvToBgra(b *testing.B, f func(y, u, v, bgra View, alpha uint64/*uint8*/)) {
	y, u := GoCVSimdSetup(GRAY8)
	v, _ := GoCVSimdSetup(GRAY8)
	bgra, _ := GoCVSimdSetup(BGRA32)

        for i := 0; i < b.N; i++ {
		f(y, u, v, bgra, 128)
	}
}

func BenchmarkYuv420pToBgra(b *testing.B) {

	benchmarkYuvToBgra(b, SimdSse2Yuv420pToBgra)
}

func BenchmarkYuv422pToBgra(b *testing.B) {

        benchmarkYuvToBgra(b, SimdSse2Yuv422pToBgra)
}

func BenchmarkYuv444pToBgra(b *testing.B) {

        benchmarkYuvToBgra(b, SimdSse2Yuv444pToBgra)
}

func BenchmarkTextureGetDifferenceSum(b *testing.B) {

        src, _ := GoCVSimdSetup(GRAY8)
        lo, hi := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2TextureGetDifferenceSum(src, lo, hi)
        }
}

func BenchmarkTextureBoostedUv(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2TextureBoostedUv(src, 200, dst)
        }
}

func BenchmarkTextureBoostedSaturatedGradient(b *testing.B) {

        src, _ := GoCVSimdSetup(GRAY8)
        dx, dy := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2TextureBoostedSaturatedGradient(src, 200, 100, dx, dy)
        }
}

func BenchmarkTexturePerformCompensation(b *testing.B) {

        src, dst := GoCVSimdSetup(GRAY8)

        for i := 0; i < b.N; i++ {
                SimdSse2TexturePerformCompensation(src, 210, dst)
        }
}

