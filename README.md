# go-cv-simd

This is a works-in-progress Go wrapper around [Simd](https://github.com/ermig1979/Simd). For now most work has been done on the SSE2 version.

## SIMD
The [Simd](https://github.com/ermig1979/Simd) Library is a highly optimized image processing library. It provides many useful high performance algorithms for image processing such as:
- pixel format conversion
- image scaling and filtration
- extraction of statistic information from images
- motion detection
- object detection (HAAR and LBP classifier cascades)
- classification
- neural network

The algorithms are optimized using different SIMD CPU extensions. In particular the library supports following CPU extensions:
- x86/x64: SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, AVX and AVX2
- ARM: NEON

## c2goasm

This wrapper depends on [c2goasm](https://github.com/minio/c2goasm) for embedding the assembly from the individual functions into Go. 

## Performance

Below are the performance figures for SSE2

```
BenchmarkFilterRhomb3x3-8                    	  200000	     11114 ns/op
BenchmarkFilterRhomb3x3RGB-8                 	   50000	     30721 ns/op
BenchmarkFilterRhomb5x5-8                    	   20000	     64515 ns/op
BenchmarkFilterRhomb5x5RGB-8                 	   10000	    207618 ns/op
BenchmarkFilterSquare3x3-8                   	   50000	     24205 ns/op
BenchmarkFilterSquare3x3RGB-8                	   20000	     89507 ns/op
BenchmarkFilterSquare5x5-8                   	   10000	    133944 ns/op
BenchmarkFilterSquare5x5RGB-8                	    5000	    373998 ns/op
BenchmarkGaussianBlur-8                      	  100000	     18290 ns/op
BenchmarkBgraToGray-8                        	  100000	     21582 ns/op
BenchmarkMeanFilter-8                        	  100000	     16248 ns/op
BenchmarkMeanFilterRGB-8                     	   20000	     65692 ns/op
BenchmarkFillBgr-8                           	  300000	      5859 ns/op
BenchmarkFillBgra-8                          	  200000	      7691 ns/op
BenchmarkLaplace-8                           	   50000	     23146 ns/op
BenchmarkInt16ToGray-8                       	  100000	     23108 ns/op
BenchmarkGrayToBgra-8                        	  200000	      9651 ns/op
BenchmarkDeinterleaveUv-8                    	  200000	     11442 ns/op
BenchmarkBinarization-8                      	  300000	      3910 ns/op
BenchmarkAveragingBinarization-8             	   20000	     71418 ns/op
BenchmarkBgraToYuv420p-8                     	   30000	     46726 ns/op
BenchmarkBgraToYuv422p-8                     	   30000	     55859 ns/op
BenchmarkBgraToYuv444p-8                     	   20000	     61443 ns/op
BenchmarkAlphaBlending-8                     	   30000	     57316 ns/op
BenchmarkAbsGradientSaturatedSum-8           	  200000	      7354 ns/op
BenchmarkSquaredDifferenceSum-8              	  200000	      6192 ns/op
BenchmarkSquaredDifferenceSumMasked-8        	  200000	      8200 ns/op
BenchmarkAbsDifferenceSum-8                  	  500000	      3169 ns/op
BenchmarkAbsDifferenceSumMasked-8            	  300000	      4378 ns/op
BenchmarkAbsDifferenceSums3x3-8              	  100000	     12497 ns/op
BenchmarkAbsDifferenceSums3x3Masked-8        	  100000	     18695 ns/op
BenchmarkAddFeatureDifference-8              	  200000	      9140 ns/op
BenchmarkBackgroundInitMask-8                	  500000	      3883 ns/op
BenchmarkBackgroundGrowRangeSlow-8           	  200000	      7023 ns/op
BenchmarkBackgroundGrowRangeFast-8           	  300000	      5264 ns/op
BenchmarkBackgroundIncrementCount-8          	  200000	     10248 ns/op
BenchmarkBackgroundAdjustRange-8             	  100000	     11832 ns/op
BenchmarkBackgroundAdjustRangeMasked-8       	  100000	     14080 ns/op
BenchmarkBackgroundShiftRange-8              	  200000	      6310 ns/op
BenchmarkBackgroundShiftRangeMasked-8        	  200000	      8252 ns/op
BenchmarkSegmentationFillSingleHoles-8       	   50000	     26726 ns/op
BenchmarkSegmentationChangeIndex-8           	  500000	      3430 ns/op
BenchmarkSegmentationPropagate2x2-8          	   50000	     38551 ns/op
BenchmarkSobelDx-8                           	  100000	     17599 ns/op
BenchmarkSobelDy-8                           	  100000	     17063 ns/op
BenchmarkConditionalCount8u-8                	  500000	      3159 ns/op
BenchmarkConditionalCount16i-8               	  200000	      6549 ns/op
BenchmarkConditionalSum-8                    	  500000	      3284 ns/op
BenchmarkConditionalSquareSum-8              	  300000	      5789 ns/op
BenchmarkConditionalSquareGradientSum-8      	  100000	     15947 ns/op
BenchmarkConditionalFill-8                   	  300000	      4195 ns/op
BenchmarkOperationBinary8u-8                 	  500000	      4055 ns/op
BenchmarkOperationBinary16i-8                	  200000	     11250 ns/op
BenchmarkStretchGray2x2-8                    	  500000	      3548 ns/op
BenchmarkYuv420pToBgra-8                     	   30000	     50043 ns/op
BenchmarkYuv422pToBgra-8                     	   30000	     54433 ns/op
BenchmarkYuv444pToBgra-8                     	   30000	     54661 ns/op
BenchmarkTextureGetDifferenceSum-8           	  300000	      5642 ns/op
BenchmarkTextureBoostedUv-8                  	  300000	      5139 ns/op
BenchmarkTextureBoostedSaturatedGradient-8   	  100000	     22974 ns/op
BenchmarkTexturePerformCompensation-8        	  500000	      2801 ns/op
```
