# go-cv-simd

## Generate assembly

```
$ make Users/frankw/c_apps/Simd/src/Simd/SimdAvx2AbsDifferenceSum.cpp.s
Compiling CXX source to assembly CMakeFiles/SimdAvx2.dir/Users/frankw/c_apps/Simd/src/Simd/SimdAvx2AbsDifferenceSum.cpp.s
```

See all targets
```
$ make help | grep "\.s"
```

Output Intel syntax (`-mllvm --x86-asm-syntax=intel`)
```
$ /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   -I/Users/frankw/c_apps/Simd/prj/cmake/../../src  -O3 -DNDEBUG    -std=c++11 -fPIC -O3 -mavx2 -mfma -S -mllvm --x86-asm-syntax=intel /Users/frankw/c_apps/Simd/src/Simd/SimdAvx2Reorder.cpp -o CMakeFiles/SimdAvx2.dir/Users/frankw/c_apps/Simd/src/Simd/SimdAvx2Reorder.cpp.s
```
