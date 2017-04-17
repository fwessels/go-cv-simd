# go-cv-simd

This is a works-in-progress Go wrapper around [Simd](https://github.com/ermig1979/Simd).

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
