# go-cv-simd

## Generate assembly

Use `-n` to see full commands
```
$ make -n Users/frankw/c_apps/Simd/src/Simd/SimdAvx2AbsDifferenceSum.cpp.s
Compiling CXX source to assembly CMakeFiles/SimdAvx2.dir/Users/frankw/c_apps/Simd/src/Simd/SimdAvx2AbsDifferenceSum.cpp.s
```

See all targets
```
$ make help | grep "\.s"
```

## OSX

Output Intel syntax (`-mllvm --x86-asm-syntax=intel`)
```
$ /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   -I/Users/frankw/c_apps/Simd/prj/cmake/../../src  -O3 -DNDEBUG    -std=c++11 -fPIC -O3 -mavx2 -mfma -S -mllvm --x86-asm-syntax=intel /Users/frankw/c_apps/Simd/src/Simd/SimdAvx2Reorder.cpp -o CMakeFiles/SimdAvx2.dir/Users/frankw/c_apps/Simd/src/Simd/SimdAvx2Reorder.cpp.s
```

Prevent Call Stack Information (`-fno-asynchronous-unwind-tables`)
```
$ /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   -I/Users/frankw/c_apps/Simd/prj/cmake/../../src  -O3 -DNDEBUG    -std=c++11 -fPIC -O3 -mavx2 -mfma -S -mllvm --x86-asm-syntax=intel -fno-asynchronous-unwind-tables /Users/frankw/c_apps/Simd/src/Simd/SimdAvx2Reorder.cpp -o CMakeFiles/SimdAvx2.dir/Users/frankw/c_apps/Simd/src/Simd/SimdAvx2Reorder.cpp.s
```

## Linux

Output Intel syntax (`-masm=intel`)

Prevent Call Stack Information (`-fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti`)
