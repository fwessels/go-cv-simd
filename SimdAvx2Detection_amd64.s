
TEXT ·_SimdAvx2Dectection(SB), 7, $0

//    push    rbp
//    mov    rbp, rsp
//    push    r15
//    push    r14
//    push    r13
//    push    r12
    WORD $0x8949; BYTE $0xfc     // mov    r12, rdi
//    push    rbx
//    and    rsp, -32
//    sub    rsp, 448
    LEAQ LC1<>(SB), BP
    WORD $0x8b48; BYTE $0x02     // mov    rax, QWORD [rdx]
    LONG $0x24748948; BYTE $0x30 //    mov    QWORD 48[rsp], rsi
    LONG $0x10728b48             //    mov    rsi, QWORD 16[rdx]
    LONG $0x244c8948; BYTE $0x28 //    mov    QWORD 40[rsp], rcx
    WORD $0x8948; BYTE $0xd1     //    mov    rcx, rdx
    LONG $0x24548948; BYTE $0x48 //    mov    QWORD 72[rsp], rdx
    LONG $0x08528b48             //    mov    rdx, QWORD 8[rdx]
    LONG $0x2484894c; LONG $0x00000138 //    mov    QWORD 312[rsp], r8
    LONG $0x24b48948; LONG $0x00000130 //    mov    QWORD 304[rsp], rsi
    LONG $0x24842948; LONG $0x00000130 //    sub    QWORD 304[rsp], rax
    LONG $0x24bc8b48; LONG $0x00000130 //    mov    rdi, QWORD 304[rsp]
    LONG $0x24948948; LONG $0x000000f0 //    mov    QWORD 240[rsp], rdx
    WORD $0x8948; BYTE $0xfe     //    mov    rsi, rdi
    LONG $0xf8e68348             //    and    rsi, -8
    WORD $0x8948; BYTE $0xf3     //    mov    rbx, rsi
    LONG $0x24b48948; LONG $0x00000128 //    mov    QWORD 296[rsp], rsi
    WORD $0x8948; BYTE $0xfe     //    mov    rsi, rdi
    LONG $0xfee78348             //    and    rdi, -2
    LONG $0x18513948             //    cmp    QWORD 24[rcx], rdx
    LONG $0x247c8948; BYTE $0x40 //    mov    QWORD 64[rsp], rdi
	  JLE  L223
    LONG $0x02c38348             //    add    rbx, 2
    LONG $0x08ef8348             //    sub    rdi, 8
    LEAQ LC2<>(SB), BP
    LONG $0x556f7dc5; BYTE $0x00 //    vmovdqa    ymm10, [rbp] /* .LC2[rip] */
    LONG $0x245c8948; BYTE $0x38 //    mov    QWORD 56[rsp], rbx
    WORD $0x8948; BYTE $0xf3     //    mov    rbx, rsi
    LONG $0x247c8948; BYTE $0x08 //    mov    QWORD 8[rsp], rdi
    LONG $0xe0e38348             //    and    rbx, -32
    LONG $0x02e7c148             //    sal    rdi, 2
    LONG $0x4d6f7dc5; BYTE $0x00 //    vmovdqa    ymm9, [rbp] /* .LC3[rip] */
    LONG $0x249c8948; LONG $0x00000120 //    mov    QWORD 288[rsp], rbx
    LONG $0xb51c8d48; LONG $0x00000000 //    lea    rbx, 0[0+rsi*4]
    LONG $0x247c8948; BYTE $0x10 //    mov    QWORD 16[rsp], rdi
    LONG $0xf657c8c5             //    vxorps    xmm6, xmm6, xmm6
    LONG $0x20ee8348             //    sub    rsi, 32
    LONG $0x807b8d48             //    lea    rdi, -128[rbx]
    LONG $0x6d6f7dc5; BYTE $0x00 //    vmovdqa    ymm13, [rbp] /* .LC5[rip] */
    LONG $0x249c8948; LONG $0x000000e8 //    mov    QWORD 232[rsp], rbx
    LONG $0x456f7dc5; BYTE $0x00 //    vmovdqa    ymm8, [rbp] /* .LC10[rip]*/
    LONG $0x24748948; BYTE $0x18 //    mov    QWORD 24[rsp], rsi
    LONG $0x65287cc5; BYTE $0x00 //    vmovaps    ymm12, [rbp] /* .LC11[rip] */
    LONG $0x247c8948; BYTE $0x20 //    mov    QWORD 32[rsp], rdi
    LONG $0x5d107ac5; BYTE $0x00 //    vmovss    xmm11, DWORD [rbp] /* .LC1[rip] */
L144:
    LONG $0x248c8b48; LONG $0x000000f0 //    mov    rcx, QWORD 240[rsp]
    LONG $0x247c8b48; BYTE $0x30 //    mov    rdi, QWORD 48[rsp]
    WORD $0x8948; BYTE $0xca     //    mov    rdx, rcx
    LONG $0x94af0f49; LONG $0x0000f824; BYTE $0x00 //    imul    rdx, QWORD 248[r12]
    LONG $0x02eac148             //    shr    rdx, 2
    LONG $0x02348d48             //    lea    rsi, [rdx+rax]
    WORD $0x8948; BYTE $0xca     //    mov    rdx, rcx
    LONG $0x94af0f49; LONG $0x00012824; BYTE $0x00 //    imul    rdx, QWORD 296[r12]
    LONG $0x4faf0f48; BYTE $0x10 //    imul    rcx, QWORD 16[rdi]
    LONG $0x24b48948; LONG $0x000000f8 //    mov    QWORD 248[rsp], rsi
    LONG $0x02eac148             //    shr    rdx, 2
    LONG $0x02348d48             //    lea    rsi, [rdx+rax]
    WORD $0x0148; BYTE $0xc1     //    add    rcx, rax
    LONG $0x204f0348             //    add    rcx, QWORD 32[rdi]
    LONG $0x24bc8348; LONG $0x00000120; BYTE $0x00 //    cmp    QWORD 288[rsp], 0
    LONG $0x24748948; BYTE $0x50 //    mov    QWORD 80[rsp], rsi
    LONG $0x24b48b48; LONG $0x00000138 //    mov    rsi, QWORD 312[rsp]
    WORD $0x8b48; BYTE $0x36     //    mov    rsi, QWORD [rsi]
	  JE   L6
    LONG $0xdbefe1c5             //    vpxor    xmm3, xmm3, xmm3
    LONG $0x24bc8b48; LONG $0x00000120 //    mov    rdi, QWORD 288[rsp]
    WORD $0x8948; BYTE $0xf0     //    mov    rax, rsi
    LONG $0xc0eff9c5             //    vpxor    xmm0, xmm0, xmm0
    WORD $0xd231                 //    xor    edx, edx
L7:
    LONG $0x0c6ffec5; BYTE $0x11 //    vmovdqu    ymm1, [rcx+rdx]
    LONG $0x20c28348             //    add    rdx, 32
    LONG $0x80e88348             //    sub    rax, -128
    LONG $0xc9dbadc5             //    vpand    ymm1, ymm10, ymm1
    LONG $0x3635e2c4; BYTE $0xc9 //    vpermd    ymm1, ymm9, ymm1
    LONG $0xd360f5c5             //    vpunpcklbw    ymm2, ymm1, ymm3
    LONG $0xcb68f5c5             //    vpunpckhbw    ymm1, ymm1, ymm3
    LONG $0xe061edc5             //    vpunpcklwd    ymm4, ymm2, ymm0
    LONG $0xd069edc5             //    vpunpckhwd    ymm2, ymm2, ymm0
    LONG $0x607ffec5; BYTE $0x80 //    vmovdqu -128[rax], ymm4
    LONG $0x507ffec5; BYTE $0xa0 //    vmovdqu -96[rax], ymm2
    LONG $0xd061f5c5             //    vpunpcklwd    ymm2, ymm1, ymm0
    LONG $0xc869f5c5             //    vpunpckhwd    ymm1, ymm1, ymm0
    LONG $0x507ffec5; BYTE $0xc0 //    vmovdqu -64[rax], ymm2
    LONG $0x487ffec5; BYTE $0xe0 //    vmovdqu -32[rax], ymm1
    WORD $0x3948; BYTE $0xfa     //    cmp    rdx, rdi
	  JB    L7
L6:
    LONG $0x24848b48; LONG $0x00000120 //    mov    rax, QWORD 288[rsp]
    LONG $0x24843948; LONG $0x00000130 //    cmp    QWORD 304[rsp], rax
    JE    L5
    LONG $0x24448b48; BYTE $0x18 //    mov    rax, QWORD 24[rsp]
    LONG $0x6d6ffdc5; BYTE $0x00 //    vmovdqa    ymm5, [rbp] /* .LC3[rip] */
    LONG $0xc9eff1c5             //    vpxor    xmm1, xmm1, xmm1
    LONG $0x24740348; BYTE $0x20 //    add    rsi, QWORD 32[rsp]
    LONG $0xc0eff9c5             //    vpxor    xmm0, xmm0, xmm0
    LONG $0x146ffec5; BYTE $0x01 //    vmovdqu    ymm2, [rcx+rax]
    LONG $0x55dbedc5; BYTE $0x00 //    vpand    ymm2, ymm2, [rbp] /* .LC2[rip] */
    LONG $0x3655e2c4; BYTE $0xd2 //    vpermd    ymm2, ymm5, ymm2
    LONG $0xd960edc5             //    vpunpcklbw    ymm3, ymm2, ymm1
    LONG $0xc968edc5             //    vpunpckhbw    ymm1, ymm2, ymm1
    LONG $0xe061e5c5             //    vpunpcklwd    ymm4, ymm3, ymm0
    LONG $0xd061f5c5             //    vpunpcklwd    ymm2, ymm1, ymm0
    LONG $0xd869e5c5             //    vpunpckhwd    ymm3, ymm3, ymm0
    LONG $0xc069f5c5             //    vpunpckhwd    ymm0, ymm1, ymm0
    LONG $0x267ffec5             //    vmovdqu    [rsi], ymm4
    LONG $0x567ffec5; BYTE $0x40 //    vmovdqu    64[rsi], ymm2
    LONG $0x5e7ffec5; BYTE $0x20 //    vmovdqu    32[rsi], ymm3
    LONG $0x467ffec5; BYTE $0x60 //    vmovdqu    96[rsi], ymm0
L5:
    LONG $0x24bc8348; LONG $0x000000e8; BYTE $0x00 //    cmp    QWORD 232[rsp], 0
	  JE   L21
    LONG $0x24848b48; LONG $0x00000138 //    mov    rax, QWORD 312[rsp]
    LONG $0x24b48b48; LONG $0x000000e8 //    mov    rsi, QWORD 232[rsp]
    LONG $0x08508b48             //    mov    rdx, QWORD 8[rax]
    WORD $0x8948; BYTE $0xf1     //    mov    rcx, rsi
    WORD $0x8948; BYTE $0xd0     //    mov    rax, rdx
    WORD $0xe083; BYTE $0x1f     //    and    eax, 31
    LONG $0x02e8c148             //    shr    rax, 2
    WORD $0xf748; BYTE $0xd8     //    neg    rax
    WORD $0xe083; BYTE $0x07     //    and    eax, 7
    WORD $0x3948; BYTE $0xc6     //    cmp    rsi, rax
    LONG $0xc6460f48             //    cmovbe    rax, rsi
    LONG $0x21fe8348             //    cmp    rsi, 33
	  JA   L233
L11:
    WORD $0xc031                 //    xor    eax, eax
L14:
    WORD $0x0489; BYTE $0x82     //    mov    DWORD [rdx+rax*4], eax
    LONG $0x01c08348             //    add    rax, 1
    WORD $0x3948; BYTE $0xc8     //    cmp    rax, rcx
	  JNE  L14
    LONG $0x24843b48; LONG $0x000000e8 //    cmp    rax, QWORD 232[rsp]
	  JE   L21
L12:
    LONG $0x248c8b4c; LONG $0x000000e8 //    mov    r9, QWORD 232[rsp]
    WORD $0x2949; BYTE $0xc9     //    sub    r9, rcx
    WORD $0x894d; BYTE $0xca     //    mov    r10, r9
    LONG $0x05eac149             //    shr    r10, 5
    WORD $0x894d; BYTE $0xd0     //    mov    r8, r10
    LONG $0x05e0c149             //    sal    r8, 5
    WORD $0x854d; BYTE $0xc0     //    test    r8, r8
	  JE   L212
    LONG $0x02788d48             //    lea    rdi, 2[rax]
    LONG $0x01708d48             //    lea    rsi, 1[rax]
    LONG $0x8a0c8d48             //    lea    rcx, [rdx+rcx*4]
    LONG $0x24bc8948; LONG $0x00000160 //    mov    QWORD 352[rsp], rdi
    LONG $0x03788d48             //    lea    rdi, 3[rax]
    LONG $0xac7efac5; LONG $0x00016024; BYTE $0x00 //    vmovq    xmm5, QWORD 352[rsp]
    LONG $0x24848948; LONG $0x00000160 //    mov    QWORD 352[rsp], rax
    LONG $0xbc7efac5; LONG $0x00016024; BYTE $0x00 //    vmovq    xmm7, QWORD 352[rsp]
    LONG $0x22d1e3c4; WORD $0x01c7 //    vpinsrq    xmm0, xmm5, rdi, 1
    LONG $0x22c1e3c4; WORD $0x01ce //    vpinsrq    xmm1, xmm7, rsi, 1
    WORD $0xf631                 //    xor    esi, esi
    LONG $0x3875e3c4; WORD $0x01c0 //    vinserti128    ymm0, ymm1, xmm0, 0x1
	  JMP  L22
L17:
    LONG $0xc56ffdc5             //    vmovdqa    ymm0, ymm5
L22:
    LONG $0xd47d41c4; BYTE $0xfd //    vpaddq    ymm15, ymm0, ymm13
    LONG $0x6dd4fdc5; BYTE $0x00 //    vpaddq    ymm5, ymm0, [rbp] /* .LC4[rip] */
    LONG $0x467dc3c4; WORD $0x20cf //    vperm2i128    ymm1, ymm0, ymm15, 32
    LONG $0x467dc3c4; WORD $0x31c7 //    vperm2i128    ymm0, ymm0, ymm15, 49
    LONG $0xd405c1c4; BYTE $0xfd //    vpaddq    ymm7, ymm15, ymm13
    LONG $0xd44541c4; BYTE $0xf5 //    vpaddq    ymm14, ymm7, ymm13
    LONG $0xd40dc1c4; BYTE $0xdd //    vpaddq    ymm3, ymm14, ymm13
    LONG $0xd465c1c4; BYTE $0xe5 //    vpaddq    ymm4, ymm3, ymm13
    LONG $0xd45dc1c4; BYTE $0xd5 //    vpaddq    ymm2, ymm4, ymm13
    LONG $0xc970fdc5; BYTE $0xd8 //    vpshufd    ymm1, ymm1, 216
    LONG $0x01c68348             //    add    rsi, 1
    LONG $0xc070fdc5; BYTE $0xd8 //    vpshufd    ymm0, ymm0, 216
    LONG $0x80e98348             //    sub    rcx, -128
    LONG $0xf86c75c5             //    vpunpcklqdq    ymm15, ymm1, ymm0
    LONG $0x4645c3c4; WORD $0x20ce //    vperm2i128    ymm1, ymm7, ymm14, 32
    LONG $0x4645c3c4; WORD $0x31c6 //    vperm2i128    ymm0, ymm7, ymm14, 49
    LONG $0x0005e2c4; WORD $0x007d //    vpshufb    ymm7, ymm15, [rbp] /* .LC6[rip] */
    LONG $0xc970fdc5; BYTE $0xd8 //    vpshufd    ymm1, ymm1, 216
    LONG $0xc070fdc5; BYTE $0xd8 //    vpshufd    ymm0, ymm0, 216
    LONG $0xc06cf5c5             //    vpunpcklqdq    ymm0, ymm1, ymm0
    LONG $0x4665e3c4; WORD $0x20cc //    vperm2i128    ymm1, ymm3, ymm4, 32
    LONG $0x007de2c4; WORD $0x0045 //    vpshufb    ymm0, ymm0, [rbp] /* .LC7[rip] */
    LONG $0xc970fdc5; BYTE $0xd8 //    vpshufd    ymm1, ymm1, 216
    LONG $0xf8ebc5c5             //    vpor    ymm7, ymm7, ymm0
    LONG $0x4665e3c4; WORD $0x31c4 //    vperm2i128    ymm0, ymm3, ymm4, 49
    LONG $0x00fde3c4; WORD $0xd8ff //    vpermq    ymm7, ymm7, 216
    LONG $0xc070fdc5; BYTE $0xd8 //    vpshufd    ymm0, ymm0, 216
    LONG $0x0045e2c4; WORD $0x007d //    vpshufb    ymm7, ymm7, [rbp] /* .LC8[rip] */
    LONG $0xd86cf5c5             //    vpunpcklqdq    ymm3, ymm1, ymm0
    LONG $0xd46dc1c4; BYTE $0xc5 //    vpaddq    ymm0, ymm2, ymm13
    LONG $0x466de3c4; WORD $0x20c8 //    vperm2i128    ymm1, ymm2, ymm0, 32
    LONG $0x466de3c4; WORD $0x31c0 //    vperm2i128    ymm0, ymm2, ymm0, 49
    LONG $0x0065e2c4; WORD $0x0055 //    vpshufb    ymm2, ymm3, [rbp] /* .LC6[rip] */ 
    LONG $0xc970fdc5; BYTE $0xd8 //    vpshufd    ymm1, ymm1, 216
    LONG $0xc070fdc5; BYTE $0xd8 //    vpshufd    ymm0, ymm0, 216
    LONG $0xc06cf5c5             //    vpunpcklqdq    ymm0, ymm1, ymm0
    LONG $0x007de2c4; WORD $0x0045 //    vpshufb    ymm0, ymm0, [rbp] /* .LC7[rip] */
    LONG $0xc0ebedc5             //    vpor    ymm0, ymm2, ymm0
    LONG $0x00fde3c4; WORD $0xd8c0 //    vpermq    ymm0, ymm0, 216
    LONG $0x007de2c4; WORD $0x0045 //    vpshufb    ymm0, ymm0, [rbp] /* .LC9[rip] */
    LONG $0xc0ebc5c5             //    vpor    ymm0, ymm7, ymm0
    LONG $0x00fde3c4; WORD $0xd8c0 //    vpermq    ymm0, ymm0, 216
    LONG $0x307de2c4; BYTE $0xc8 //    vpmovzxbw    ymm1, xmm0
    LONG $0x397de3c4; WORD $0x01c0 //    vextracti128    xmm0, ymm0, 0x1
    LONG $0x337de2c4; BYTE $0xd1 //    vpmovzxwd    ymm2, xmm1
    LONG $0x397de3c4; WORD $0x01c9 //    vextracti128    xmm1, ymm1, 0x1
    LONG $0x307de2c4; BYTE $0xc0 //    vpmovzxbw    ymm0, xmm0
    LONG $0x517ffdc5; BYTE $0x80 //    vmovdqa    -128[rcx], ymm2
    LONG $0x337de2c4; BYTE $0xc9 //    vpmovzxwd    ymm1, xmm1
    LONG $0x497ffdc5; BYTE $0xa0 //    vmovdqa    -96[rcx], ymm1
    LONG $0x337de2c4; BYTE $0xc8 //    vpmovzxwd    ymm1, xmm0
    LONG $0x397de3c4; WORD $0x01c0 //    vextracti128    xmm0, ymm0, 0x1
    LONG $0x497ffdc5; BYTE $0xc0 //    vmovdqa    -64[rcx], ymm1
    LONG $0x337de2c4; BYTE $0xc0 //    vpmovzxwd    ymm0, xmm0
    LONG $0x417ffdc5; BYTE $0xe0 //    vmovdqa    -32[rcx], ymm0
    WORD $0x394c; BYTE $0xd6     //    cmp    rsi, r10
	  JB   L17
    WORD $0x014c; BYTE $0xc0     //    add    rax, r8
    WORD $0x394d; BYTE $0xc8     //    cmp    r8, r9
	  JE   L21
L212:
    LONG $0x24b48b48; LONG $0x000000e8 //    mov    rsi, QWORD 232[rsp]
L20:
    WORD $0xb60f; BYTE $0xc8     //    movzx    ecx, al
    WORD $0x0c89; BYTE $0x82     //    mov    DWORD [rdx+rax*4], ecx
    LONG $0x01c08348             //    add    rax, 1
    WORD $0x3948; BYTE $0xc6     //    cmp    rsi, rax
	  JA   L20
L21:
    LONG $0x24bc8348; LONG $0x00000128; BYTE $0x00 //    cmp    QWORD 296[rsp], 0
	  JE   L234
    LONG $0x24848b48; LONG $0x000000f8 //    mov    rax, QWORD 248[rsp]
    LONG $0x24748b48; BYTE $0x50 //    mov    rsi, QWORD 80[rsp]
    WORD $0xdb31                 //    xor    ebx, ebx
    LONG $0xff57c0c5             //    vxorps    xmm7, xmm7, xmm7
    WORD $0x2948; BYTE $0xc6     //    sub    rsi, rax
    LONG $0x852c8d4c; LONG $0x00000000 //    lea    r13, 0[0+rax*4]
    WORD $0x8948; BYTE $0xf0     //    mov    rax, rsi
    LONG $0x02e0c148             //    sal    rax, 2
    LONG $0x24848948; LONG $0x000000c0 //    mov    QWORD 192[rsp], rax
	  JMP  L63
L23:
    LONG $0x08c38348             //    add    rbx, 8
    LONG $0x20c58349             //    add    r13, 32
    LONG $0x249c3b48; LONG $0x00000128 //    cmp    rbx, QWORD 296[rsp]
	  JAE  L235
L63:
    LONG $0x24bc8b48; LONG $0x00000138 //    mov    rdi, QWORD 312[rsp]
    LONG $0x9d048d48; LONG $0x00000000 //    lea    rax, 0[0+rbx*4]
    LONG $0x24848948; LONG $0x00000100 //    mov    QWORD 256[rsp], rax
    WORD $0x0348; BYTE $0x07     //    add    rax, QWORD [rdi]
    LONG $0x006ffec5             //    vmovdqu    ymm0, [rax]
    LONG $0x177dc2c4; BYTE $0xc0 //    vptest    ymm0, ymm8
    LONG $0x847ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    352[rsp], ymm0
	  JE   L23
    LONG $0x24848b48; LONG $0x000000c0 //    mov    rax, QWORD 192[rsp]
    LONG $0x187dc2c4; LONG $0x00a02494; WORD $0x0000 //    vbroadcastss    ymm2, DWORD 160[r12]
    WORD $0x3145; BYTE $0xc0     //    xor    r8d, r8d
    WORD $0x014c; BYTE $0xe8     //    add    rax, r13
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000c8 //    add    rdx, QWORD 200[r12]
    LONG $0x226ffec5             //    vmovdqu    ymm4, [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000d0 //    add    rdx, QWORD 208[r12]
    LONG $0x1a6ffec5             //    vmovdqu    ymm3, [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000d8 //    add    rdx, QWORD 216[r12]
    LONG $0xdbfaddc5             //    vpsubd    ymm3, ymm4, ymm3
    LONG $0x2a6ffec5             //    vmovdqu    ymm5, [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000e0 //    add    rdx, QWORD 224[r12]
    LONG $0x0a6ffec5             //    vmovdqu    ymm1, [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000a8 //    add    rdx, QWORD 168[r12]
    LONG $0xc9fad5c5             //    vpsubd    ymm1, ymm5, ymm1
    LONG $0xc9fae5c5             //    vpsubd    ymm1, ymm3, ymm1
    LONG $0xc95bfcc5             //    vcvtdq2ps    ymm1, ymm1
    LONG $0xc959f4c5             //    vmulps    ymm1, ymm1, ymm1
    LONG $0x2a6ffec5             //    vmovdqu    ymm5, [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000b0 //    add    rdx, QWORD 176[r12]
    LONG $0x226ffec5             //    vmovdqu    ymm4, [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24840349; LONG $0x000000c0 //    add    rax, QWORD 192[r12]
    LONG $0x24940349; LONG $0x000000b8 //    add    rdx, QWORD 184[r12]
    LONG $0xe4fad5c5             //    vpsubd    ymm4, ymm5, ymm4
    LONG $0xedefd1c5             //    vpxor    xmm5, xmm5, xmm5
    LONG $0x186ffec5             //    vmovdqu    ymm3, [rax]
    LONG $0x24848b48; LONG $0x000000f8 //    mov    rax, QWORD 248[rsp]
    LONG $0x326f7ec5             //    vmovdqu    ymm14, [rdx]
    LONG $0xdbfa8dc5             //    vpsubd    ymm3, ymm14, ymm3
    LONG $0xdbfaddc5             //    vpsubd    ymm3, ymm4, ymm3
    LONG $0xdb5bfcc5             //    vcvtdq2ps    ymm3, ymm3
    LONG $0xd259e4c5             //    vmulps    ymm2, ymm3, ymm2
    WORD $0x0148; BYTE $0xd8     //    add    rax, rbx
    LONG $0x24848948; LONG $0x000000a0 //    mov    QWORD 160[rsp], rax
    LONG $0x24448b49; BYTE $0x70 //    mov    rax, QWORD 112[r12]
    LONG $0x24848948; LONG $0x000000e0 //    mov    QWORD 224[rsp], rax
    WORD $0x8949; BYTE $0xc2     //    mov    r10, rax
    LONG $0x24448b49; BYTE $0x28 //    mov    rax, QWORD 40[r12]
    LONG $0xc95cecc5             //    vsubps    ymm1, ymm2, ymm1
    LONG $0x24448948; BYTE $0x58 //    mov    QWORD 88[rsp], rax
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x24448b49; BYTE $0x58 //    mov    rax, QWORD 88[r12]
    LONG $0xd7c2f4c5; BYTE $0x1e //    vcmpps    ymm2, ymm1, ymm7, 30
    WORD $0x8948; BYTE $0xc6     //    mov    rsi, rax
    LONG $0x24848948; LONG $0x00000080 //    mov    QWORD 128[rsp], rax
    LONG $0x24448b49; BYTE $0x60 //    mov    rax, QWORD 96[r12]
    LONG $0x087e8d48             //    lea    rdi, 8[rsi]
    LONG $0x556cc1c4; BYTE $0xdc //    vandnps    ymm3, ymm2, ymm12
    LONG $0xd154ecc5             //    vandps    ymm2, ymm2, ymm1
    LONG $0x24448948; BYTE $0x60 //    mov    QWORD 96[rsp], rax
    WORD $0x2948; BYTE $0xf0     //    sub    rax, rsi
    LONG $0x04f8c148             //    sar    rax, 4
    WORD $0xc085                 //    test    eax, eax
    WORD $0x8941; BYTE $0xc3     //    mov    r11d, eax
    LONG $0xd356ecc5             //    vorps    ymm2, ymm2, ymm3
    LONG $0xd251fcc5             //    vsqrtps    ymm2, ymm2
	  JLE  L25
L208:
    LONG $0x00057f80             //    cmp    BYTE 5[rdi], 0
	  JNE  L26
    LONG $0xfc4f6348             //    movsxd    rcx, DWORD -4[rdi] /* movsx -> movsxd */
    LONG $0x04e1c148             //    sal    rcx, 4
    WORD $0x014c; BYTE $0xc9     //    add    rcx, r9
    LONG $0x00047f80             //    cmp    BYTE 4[rdi], 0
	  JNE  L27
    WORD $0x394c; BYTE $0xc9     //    cmp    rcx, r9
	  JBE  L147
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    LONG $0x24b48b49; LONG $0x00000088 //    mov    rsi, QWORD 136[r12]
    WORD $0x894d; BYTE $0xd6     //    mov    r14, r10
    WORD $0x894c; BYTE $0xca     //    mov    rdx, r9
L34:
    WORD $0x6348; BYTE $0x02     //    movsxd    rax, DWORD [rdx] /* movsx -> movsxd */
    LONG $0x10c28348             //    add    rdx, 16
    LONG $0x08c68349             //    add    r14, 8
    LONG $0xc53c8d4c; LONG $0x00000000 //    lea    r15, 0[0+rax*8]
    LONG $0x07e0c148             //    sal    rax, 7
    WORD $0x294c; BYTE $0xf8     //    sub    rax, r15
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    WORD $0x0148; BYTE $0xf0     //    add    rax, rsi
    LONG $0x2878034c             //    add    r15, QWORD 40[rax]
    LONG $0x6f7ec1c4; BYTE $0x1f //    vmovdqu    ymm3, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x3078034c             //    add    r15, QWORD 48[rax]
    LONG $0x6f7ec1c4; BYTE $0x27 //    vmovdqu    ymm4, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x3878034c             //    add    r15, QWORD 56[rax]
    LONG $0xdcfae5c5             //    vpsubd    ymm3, ymm3, ymm4
    LONG $0x187de2c4; WORD $0x4860 //    vbroadcastss    ymm4, DWORD 72[rax]
    LONG $0x6f7e41c4; BYTE $0x37 //    vmovdqu    ymm14, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x4078034c             //    add    r15, QWORD 64[rax]
    LONG $0x6f7ec1c4; BYTE $0x0f //    vmovdqu    ymm1, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    WORD $0x034c; BYTE $0x38     //    add    r15, QWORD [rax]
    LONG $0xc9fa8dc5             //    vpsubd    ymm1, ymm14, ymm1
    LONG $0xd9fae5c5             //    vpsubd    ymm3, ymm3, ymm1
    LONG $0xdb5bfcc5             //    vcvtdq2ps    ymm3, ymm3
    LONG $0xdc59e4c5             //    vmulps    ymm3, ymm3, ymm4
    LONG $0x6f7ec1c4; BYTE $0x0f //    vmovdqu    ymm1, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x0878034c             //    add    r15, QWORD 8[rax]
    LONG $0x6f7e41c4; BYTE $0x37 //    vmovdqu    ymm14, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x1078034c             //    add    r15, QWORD 16[rax]
    LONG $0xfa75c1c4; BYTE $0xce //    vpsubd    ymm1, ymm1, ymm14
    LONG $0x6f7e41c4; BYTE $0x3f //    vmovdqu    ymm15, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x1878034c             //    add    r15, QWORD 24[rax]
    LONG $0x6f7ec1c4; BYTE $0x27 //    vmovdqu    ymm4, [r15]
    LONG $0xe4fa85c5             //    vpsubd    ymm4, ymm15, ymm4
    LONG $0xccfaf5c5             //    vpsubd    ymm1, ymm1, ymm4
    LONG $0x187de2c4; WORD $0x2060 //    vbroadcastss    ymm4, DWORD 32[rax]
    LONG $0xc95bfcc5             //    vcvtdq2ps    ymm1, ymm1
    LONG $0xcc59f4c5             //    vmulps    ymm1, ymm1, ymm4
    LONG $0x187dc2c4; WORD $0xf866 //    vbroadcastss    ymm4, DWORD -8[r14]
    LONG $0xcb58f4c5             //    vaddps    ymm1, ymm1, ymm3
    LONG $0x187de2c4; WORD $0xfc5a //    vbroadcastss    ymm3, DWORD -4[rdx]
    LONG $0xda59e4c5             //    vmulps    ymm3, ymm3, ymm2
    LONG $0xc9c2e4c5; BYTE $0x1e //    vcmpps    ymm1, ymm3, ymm1, 30
    LONG $0x187dc2c4; WORD $0xfc5e //    vbroadcastss    ymm3, DWORD -4[r14]
    WORD $0x3948; BYTE $0xd1     //    cmp    rcx, rdx
    LONG $0x4a65e3c4; WORD $0x10cc //    vblendvps    ymm1, ymm3, ymm4, ymm1
    LONG $0xc158fcc5             //    vaddps    ymm0, ymm0, ymm1
	  JA   L34
L225:
    WORD $0x294c; BYTE $0xc9     //    sub    rcx, r9
    LONG $0x00000fb8; BYTE $0x00 //    mov    eax, 15
    LONG $0x01448d48; BYTE $0xf0 //    lea    rax, -16[rcx+rax]
    LONG $0x04e8c148             //    shr    rax, 4
    LONG $0x01c08348             //    add    rax, 1
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0xc2148d4d             //    lea    r10, [r10+rax*8]
    LONG $0x04e2c148             //    sal    rdx, 4
    WORD $0x0149; BYTE $0xd1     //    add    r9, rdx
L29:
    LONG $0x187de2c4; BYTE $0x0f //    vbroadcastss    ymm1, DWORD [rdi]
    LONG $0xc0c2f4c5; BYTE $0x1e //    vcmpps    ymm0, ymm1, ymm0, 30
    LONG $0x84dffdc5; LONG $0x00016024; BYTE $0x00 //    vpandn    ymm0, ymm0, 352[rsp]
    LONG $0x847ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    352[rsp], ymm0
    LONG $0x846ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    ymm0, 352[rsp]
    LONG $0xe5f6fdc5             //    vpsadbw    ymm4, ymm0, ymm5
    LONG $0xa47ffdc5; LONG $0x0001a024; BYTE $0x00 //    vmovdqa    416[rsp], ymm4
    LONG $0xa47ffdc5; LONG $0x00014024; BYTE $0x00 //    vmovdqa    320[rsp], ymm4
    LONG $0x4024848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 320[rsp]
    LONG $0xa8248403; WORD $0x0001; BYTE $0x00 //    add    eax, DWORD 424[rsp]
    LONG $0xb0248403; WORD $0x0001; BYTE $0x00 //    add    eax, DWORD 432[rsp]
    LONG $0xb8248403; WORD $0x0001; BYTE $0x00 //    add    eax, DWORD 440[rsp]
	  JE   L25
    WORD $0xf883; BYTE $0x01     //    cmp    eax, 1
	  JE   L236
L26:
    LONG $0x01c08341             //    add    r8d, 1
    LONG $0x10c78348             //    add    rdi, 16
    WORD $0x3945; BYTE $0xc3     //    cmp    r11d, r8d
	  JG   L208
    LONG $0x846ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    ymm0, 352[rsp]
L25:
    LONG $0x24b48b48; LONG $0x00000138 //    mov    rsi, QWORD 312[rsp]
    LONG $0x24848b48; LONG $0x00000100 //    mov    rax, QWORD 256[rsp]
    LONG $0x08460348             //    add    rax, QWORD 8[rsi]
    LONG $0x007ffec5             //    vmovdqu    [rax], ymm0
	  JMP  L23
L233:
    WORD $0x8548; BYTE $0xc0     //    test    rax, rax
	  JNE  L237
    WORD $0xc931                 //    xor    ecx, ecx
    WORD $0xc031                 //    xor    eax, eax
	  JMP  L12
L27:
    WORD $0x394c; BYTE $0xc9     //    cmp    rcx, r9
    JBE  L147
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    LONG $0x24b48b49; LONG $0x00000088 //    mov    rsi, QWORD 136[r12]
    WORD $0x894d; BYTE $0xd6     //    mov    r14, r10
    WORD $0x894c; BYTE $0xca     //    mov    rdx, r9
L32:
    WORD $0x6348; BYTE $0x02     //    movsxd    rax, DWORD [rdx] /* movsx -> movsxd */
    LONG $0xc53c8d4c; LONG $0x00000000 //    lea    r15, 0[0+rax*8]
    LONG $0x07e0c148             //    sal    rax, 7
    WORD $0x294c; BYTE $0xf8     //    sub    rax, r15
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    WORD $0x0148; BYTE $0xf0     //    add    rax, rsi
    LONG $0x2878034c             //    add    r15, QWORD 40[rax]
    LONG $0x6f7ec1c4; BYTE $0x1f //    vmovdqu    ymm3, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x3078034c             //    add    r15, QWORD 48[rax]
    LONG $0x6f7ec1c4; BYTE $0x27 //    vmovdqu    ymm4, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x3878034c             //    add    r15, QWORD 56[rax]
    LONG $0xdcfae5c5             //    vpsubd    ymm3, ymm3, ymm4
    LONG $0x187de2c4; WORD $0x4860 //    vbroadcastss    ymm4, DWORD 72[rax]
    LONG $0x6f7e41c4; BYTE $0x37 //    vmovdqu    ymm14, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x4078034c             //    add    r15, QWORD 64[rax]
    LONG $0x6f7ec1c4; BYTE $0x0f //    vmovdqu    ymm1, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    WORD $0x034c; BYTE $0x38     //    add    r15, QWORD [rax]
    LONG $0xc9fa8dc5             //    vpsubd    ymm1, ymm14, ymm1
    LONG $0xd9fae5c5             //    vpsubd    ymm3, ymm3, ymm1
    LONG $0xdb5bfcc5             //    vcvtdq2ps    ymm3, ymm3
    LONG $0xdc59e4c5             //    vmulps    ymm3, ymm3, ymm4
    LONG $0x6f7ec1c4; BYTE $0x0f //    vmovdqu    ymm1, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x0878034c             //    add    r15, QWORD 8[rax]
    LONG $0x6f7e41c4; BYTE $0x37 //    vmovdqu    ymm14, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x1078034c             //    add    r15, QWORD 16[rax]
    LONG $0xfa75c1c4; BYTE $0xce //    vpsubd    ymm1, ymm1, ymm14
    LONG $0x6f7e41c4; BYTE $0x3f //    vmovdqu    ymm15, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x1878034c             //    add    r15, QWORD 24[rax]
    LONG $0x6f7ec1c4; BYTE $0x27 //    vmovdqu    ymm4, [r15]
    LONG $0x50788b4c             //    mov    r15, QWORD 80[rax]
    LONG $0xe4fa85c5             //    vpsubd    ymm4, ymm15, ymm4
    LONG $0xccfaf5c5             //    vpsubd    ymm1, ymm1, ymm4
    LONG $0x187de2c4; WORD $0x2060 //    vbroadcastss    ymm4, DWORD 32[rax]
    LONG $0xc95bfcc5             //    vcvtdq2ps    ymm1, ymm1
    WORD $0x854d; BYTE $0xff     //    test    r15, r15
    LONG $0xcc59f4c5             //    vmulps    ymm1, ymm1, ymm4
    LONG $0xcb58f4c5             //    vaddps    ymm1, ymm1, ymm3
	  JE   L30
    LONG $0x6f7e81c4; WORD $0x2f1c //    vmovdqu    ymm3, [r15+r13]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x5878034c             //    add    r15, QWORD 88[rax]
    LONG $0x6f7e41c4; BYTE $0x37 //    vmovdqu    ymm14, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x6078034c             //    add    r15, QWORD 96[rax]
    LONG $0xfa65c1c4; BYTE $0xde //    vpsubd    ymm3, ymm3, ymm14
    LONG $0x6f7e41c4; BYTE $0x3f //    vmovdqu    ymm15, [r15]
    WORD $0x894d; BYTE $0xef     //    mov    r15, r13
    LONG $0x6878034c             //    add    r15, QWORD 104[rax]
    LONG $0x6f7ec1c4; BYTE $0x27 //    vmovdqu    ymm4, [r15]
    LONG $0xe4fa85c5             //    vpsubd    ymm4, ymm15, ymm4
    LONG $0xdcfae5c5             //    vpsubd    ymm3, ymm3, ymm4
    LONG $0x187de2c4; WORD $0x7060 //    vbroadcastss    ymm4, DWORD 112[rax]
    LONG $0xdb5bfcc5             //    vcvtdq2ps    ymm3, ymm3
    LONG $0xdc59e4c5             //    vmulps    ymm3, ymm3, ymm4
    LONG $0xcb58f4c5             //    vaddps    ymm1, ymm1, ymm3
L30:
    LONG $0x187de2c4; WORD $0x0c5a //    vbroadcastss    ymm3, DWORD 12[rdx]
    LONG $0x10c28348             //    add    rdx, 16
    LONG $0x08c68349             //    add    r14, 8
    LONG $0x187dc2c4; WORD $0xf866 //    vbroadcastss    ymm4, DWORD -8[r14]
    LONG $0xda59e4c5             //    vmulps    ymm3, ymm3, ymm2
    LONG $0xc9c2e4c5; BYTE $0x1e //    vcmpps    ymm1, ymm3, ymm1, 30
    LONG $0x187dc2c4; WORD $0xfc5e //    vbroadcastss    ymm3, DWORD -4[r14]
    WORD $0x3948; BYTE $0xd1     //    cmp    rcx, rdx
    LONG $0x4a65e3c4; WORD $0x10cc //    vblendvps    ymm1, ymm3, ymm4, ymm1
    LONG $0xc158fcc5             //    vaddps    ymm0, ymm0, ymm1
	  JA   L32
	  JMP  L225
L147:
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
	  JMP  L29
L235:
    LONG $0x249c8948; LONG $0x00000140 //    mov    QWORD 320[rsp], rbx
L10:
    LONG $0x24448b48; BYTE $0x38 //    mov    rax, QWORD 56[rsp]
    LONG $0x24443948; BYTE $0x40 //    cmp    QWORD 64[rsp], rax
	  JA   L238
L64:
    LONG $0x24848b48; LONG $0x00000140 //    mov    rax, QWORD 320[rsp]
    LONG $0x24843948; LONG $0x00000130 //    cmp    QWORD 304[rsp], rax
	  JBE  L138
    LONG $0x85348d48; LONG $0x00000000 //    lea    rsi, 0[0+rax*4]
    LONG $0x24b48948; LONG $0x00000160 //    mov    QWORD 352[rsp], rsi
    LONG $0x24b48b48; LONG $0x000000f8 //    mov    rsi, QWORD 248[rsp]
    WORD $0x0148; BYTE $0xc6     //    add    rsi, rax
    LONG $0x24448b48; BYTE $0x50 //    mov    rax, QWORD 80[rsp]
    LONG $0xb53c8d4c; LONG $0x00000000 //    lea    r15, 0[0+rsi*4]
    LONG $0x02e0c148             //    sal    rax, 2
    LONG $0x24848948; LONG $0x000000f8 //    mov    QWORD 248[rsp], rax
L139:
    LONG $0x24848b48; LONG $0x00000138 //    mov    rax, QWORD 312[rsp]
    LONG $0x24bc8b48; LONG $0x00000160 //    mov    rdi, QWORD 352[rsp]
    WORD $0x8b48; BYTE $0x00     //    mov    rax, QWORD [rax]
    WORD $0x048b; BYTE $0x38     //    mov    eax, DWORD [rax+rdi]
    WORD $0xc085                 //    test    eax, eax
	  JE   L107
    WORD $0x8948; BYTE $0xf8     //    mov    rax, rdi
    LONG $0x24840348; LONG $0x000000f8 //    add    rax, QWORD 248[rsp]
    LONG $0x248c8b49; LONG $0x000000d0 //    mov    rcx, QWORD 208[r12]
    LONG $0x24948b49; LONG $0x000000c8 //    mov    rdx, QWORD 200[r12]
    LONG $0x2878c1c4; BYTE $0xd3 //    vmovaps    xmm2, xmm11
    WORD $0x148b; BYTE $0x02     //    mov    edx, DWORD [rdx+rax]
    WORD $0x142b; BYTE $0x01     //    sub    edx, DWORD [rcx+rax]
    LONG $0x248c8b49; LONG $0x000000d8 //    mov    rcx, QWORD 216[r12]
    WORD $0x142b; BYTE $0x01     //    sub    edx, DWORD [rcx+rax]
    LONG $0x248c8b49; LONG $0x000000e0 //    mov    rcx, QWORD 224[r12]
    WORD $0x1403; BYTE $0x01     //    add    edx, DWORD [rcx+rax]
    LONG $0x248c8b49; LONG $0x000000b0 //    mov    rcx, QWORD 176[r12]
    LONG $0x2afae1c4; BYTE $0xc2 //    vcvtsi2ss    xmm0, xmm0, rdx
    LONG $0x24948b49; LONG $0x000000a8 //    mov    rdx, QWORD 168[r12]
    WORD $0x148b; BYTE $0x02     //    mov    edx, DWORD [rdx+rax]
    WORD $0x142b; BYTE $0x01     //    sub    edx, DWORD [rcx+rax]
    LONG $0x248c8b49; LONG $0x000000b8 //    mov    rcx, QWORD 184[r12]
    WORD $0x142b; BYTE $0x01     //    sub    edx, DWORD [rcx+rax]
    LONG $0x248c8b49; LONG $0x000000c0 //    mov    rcx, QWORD 192[r12]
    WORD $0x1403; BYTE $0x01     //    add    edx, DWORD [rcx+rax]
    LONG $0xc059fac5             //    vmulss    xmm0, xmm0, xmm0
    LONG $0x2af2e1c4; BYTE $0xca //    vcvtsi2ss    xmm1, xmm1, rdx
    LONG $0x9b79c2c4; LONG $0x00a0248c; WORD $0x0000 //    vfmsub132ss    xmm1, xmm0, DWORD 160[r12]
    LONG $0xf12ef8c5             //    vucomiss    xmm6, xmm1
	  JA   L112
    LONG $0xc151fac5             //    vsqrtss    xmm0, xmm0, xmm1
    LONG $0xc02ef8c5             //    vucomiss    xmm0, xmm0
	  JP   L239
L113:
    LONG $0xd028f8c5             //    vmovaps    xmm2, xmm0
L112:
    LONG $0x24b48b48; LONG $0x00000138 //    mov    rsi, QWORD 312[rsp]
    LONG $0x24848b48; LONG $0x00000160 //    mov    rax, QWORD 352[rsp]
    LONG $0x247c8b49; BYTE $0x58 //    mov    rdi, QWORD 88[r12]
    LONG $0x24548b49; BYTE $0x70 //    mov    rdx, QWORD 112[r12]
    LONG $0x08460348             //    add    rax, QWORD 8[rsi]
    LONG $0x24848948; LONG $0x00000100 //    mov    QWORD 256[rsp], rax
    WORD $0x078b                 //    mov    eax, DWORD [rdi]
    WORD $0x634c; BYTE $0xc0     //    movsxd    r8, eax /* mov movsx -> movsxd */
    WORD $0xc001                 //    add    eax, eax
    WORD $0x9848                 //    cdqe
    LONG $0x04e0c149             //    sal    r8, 4
    LONG $0x2444034d; BYTE $0x28 //    add    r8, QWORD 40[r12]
    LONG $0x82148d4c             //    lea    r10, [rdx+rax*4]
    LONG $0x24448b49; BYTE $0x60 //    mov    rax, QWORD 96[r12]
    WORD $0x2948; BYTE $0xf8     //    sub    rax, rdi
    LONG $0x04f8c148             //    sar    rax, 4
    WORD $0xc085                 //    test    eax, eax
    WORD $0x8941; BYTE $0xc3     //    mov    r11d, eax
	  JLE  L231
    WORD $0x3145; BYTE $0xc9     //    xor    r9d, r9d
    WORD $0x894d; BYTE $0xe5     //    mov    r13, r12
L137:
    LONG $0x000d7f80             //    cmp    BYTE 13[rdi], 0
	  JNE  L116
    LONG $0x044f6348             //    movsxd    rcx, DWORD 4[rdi] /* movsx -> movsxd */
    LONG $0x04e1c148             //    sal    rcx, 4
    WORD $0x014c; BYTE $0xc1     //    add    rcx, r8
    LONG $0x000c7f80             //    cmp    BYTE 12[rdi], 0
	  JNE  L117
    WORD $0x394c; BYTE $0xc1     //    cmp    rcx, r8
	  JBE  L174
    LONG $0x88b58b49; WORD $0x0000; BYTE $0x00 //    mov    rsi, QWORD 136[r13]
    LONG $0xce28f8c5             //    vmovaps    xmm1, xmm6
    WORD $0x894d; BYTE $0xd4     //    mov    r12, r10
    WORD $0x894c; BYTE $0xc3     //    mov    rbx, r8
L136:
    WORD $0x6348; BYTE $0x03     //    movsxd    rax, DWORD [rbx]  /* movsx -> movsxd */
    LONG $0xc5148d48; LONG $0x00000000 //    lea    rdx, 0[0+rax*8]
    LONG $0x07e0c148             //    sal    rax, 7
    WORD $0x2948; BYTE $0xd0     //    sub    rax, rdx
    WORD $0x0148; BYTE $0xf0     //    add    rax, rsi
    LONG $0x30708b4c             //    mov    r14, QWORD 48[rax]
    LONG $0x28508b48             //    mov    rdx, QWORD 40[rax]
    LONG $0x3a148b42             //    mov    edx, DWORD [rdx+r15]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x38708b4c             //    mov    r14, QWORD 56[rax]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x40708b4c             //    mov    r14, QWORD 64[rax]
    LONG $0x3e140343             //    add    edx, DWORD [r14+r15]
    LONG $0x08708b4c             //    mov    r14, QWORD 8[rax]
    LONG $0x2ae2e1c4; BYTE $0xda //    vcvtsi2ss    xmm3, xmm3, rdx
    WORD $0x8b48; BYTE $0x10     //    mov    rdx, QWORD [rax]
    LONG $0x3a148b42             //    mov    edx, DWORD [rdx+r15]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x10708b4c             //    mov    r14, QWORD 16[rax]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x18708b4c             //    mov    r14, QWORD 24[rax]
    LONG $0x3e140343             //    add    edx, DWORD [r14+r15]
    LONG $0x5859e2c5; BYTE $0x48 //    vmulss    xmm3, xmm3, DWORD 72[rax]
    LONG $0x2afae1c4; BYTE $0xc2 //    vcvtsi2ss    xmm0, xmm0, rdx
    LONG $0x9961e2c4; WORD $0x2040 //    vfmadd132ss    xmm0, xmm3, DWORD 32[rax]
    LONG $0x5b59eac5; BYTE $0x0c //    vmulss    xmm3, xmm2, DWORD 12[rbx]
    LONG $0xc32ef8c5             //    vucomiss    xmm0, xmm3
    WORD $0x1948; BYTE $0xc0     //    sbb    rax, rax
    LONG $0x10c38348             //    add    rbx, 16
    LONG $0x08c48349             //    add    r12, 8
    WORD $0xf748; BYTE $0xd0     //    not    rax
    WORD $0xe083; BYTE $0x04     //    and    eax, 4
    LONG $0x5872c1c4; WORD $0x044c; BYTE $0xf8 //    vaddss    xmm1, xmm1, DWORD -8[r12+rax]
    WORD $0x3948; BYTE $0xd9     //    cmp    rcx, rbx
	  JA   L136
L230:
    WORD $0x294c; BYTE $0xc1     //    sub    rcx, r8
    LONG $0x00000fb8; BYTE $0x00 //    mov    eax, 15
    LONG $0x01448d48; BYTE $0xf0 //    lea    rax, -16[rcx+rax]
    LONG $0x4710fac5; BYTE $0x08 //    vmovss    xmm0, DWORD 8[rdi]
    LONG $0x04e8c148             //    shr    rax, 4
    LONG $0x01c08348             //    add    rax, 1
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0xc2148d4d             //    lea    r10, [r10+rax*8]
    LONG $0x04e2c148             //    sal    rdx, 4
    WORD $0x0149; BYTE $0xd0     //    add    r8, rdx
    LONG $0xc12ef8c5             //    vucomiss    xmm0, xmm1
	  JA   L176
L116:
    LONG $0x01c18341             //    add    r9d, 1
    LONG $0x10c78348             //    add    rdi, 16
    WORD $0x3945; BYTE $0xcb     //    cmp    r11d, r9d
	  JG   L137
    WORD $0x894d; BYTE $0xec     //    mov    r12, r13
L231:
    LONG $0x000001b8; BYTE $0x00 //    mov    eax, 1
L115:
    LONG $0x24b48b48; LONG $0x00000100 //    mov    rsi, QWORD 256[rsp]
    WORD $0x0689                 //    mov    DWORD [rsi], eax
L107:
    LONG $0x24848348; LONG $0x00000140; BYTE $0x01 //    add    QWORD 320[rsp], 1
    LONG $0x24848348; LONG $0x00000160; BYTE $0x04 //    add    QWORD 352[rsp], 4
    LONG $0x04c78349             //    add    r15, 4
    LONG $0x24848b48; LONG $0x00000140 //    mov    rax, QWORD 320[rsp]
    LONG $0x24843948; LONG $0x00000130 //    cmp    QWORD 304[rsp], rax
	  JA   L139
L138:
    LONG $0x24448b48; BYTE $0x28 //    mov    rax, QWORD 40[rsp]
    LONG $0x248c8b48; LONG $0x000000f0 //    mov    rcx, QWORD 240[rsp]
    WORD $0xd231                 //    xor    edx, edx
    LONG $0x24748b48; BYTE $0x48 //    mov    rsi, QWORD 72[rsp]
    LONG $0x24bc8b48; LONG $0x00000120 //    mov    rdi, QWORD 288[rsp]
    LONG $0x48af0f48; BYTE $0x10 //    imul    rcx, QWORD 16[rax]
    WORD $0x0348; BYTE $0x0e     //    add    rcx, QWORD [rsi]
    LONG $0x20480348             //    add    rcx, QWORD 32[rax]
    LONG $0x24848b48; LONG $0x00000138 //    mov    rax, QWORD 312[rsp]
    LONG $0x24bc8348; LONG $0x00000120; BYTE $0x00 //    cmp    QWORD 288[rsp], 0
    LONG $0x08708b48             //    mov    rsi, QWORD 8[rax]
    LONG $0x20468d48             //    lea    rax, 32[rsi]
	  JE   L106
L199:
    LONG $0x006ffec5             //    vmovdqu    ymm0, [rax]
    LONG $0x80e88348             //    sub    rax, -128
    LONG $0x886ffec5; LONG $0xffffff60 //    vmovdqu    ymm1, -160[rax]
    LONG $0x506ffec5; BYTE $0xa0 //    vmovdqu    ymm2, -96[rax]
    LONG $0xc86bf5c5             //    vpackssdw    ymm1, ymm1, ymm0
    LONG $0x406ffec5; BYTE $0xc0 //    vmovdqu    ymm0, -64[rax]
    LONG $0xc06bedc5             //    vpackssdw    ymm0, ymm2, ymm0
    LONG $0x00fde3c4; WORD $0xd8c9 //    vpermq    ymm1, ymm1, 216
    LONG $0x00fde3c4; WORD $0xd8c0 //    vpermq    ymm0, ymm0, 216
    LONG $0xc067f5c5             //    vpackuswb    ymm0, ymm1, ymm0
    LONG $0x00fde3c4; WORD $0xd8c0 //    vpermq    ymm0, ymm0, 216
    LONG $0x047ffec5; BYTE $0x11 //    vmovdqu    [rcx+rdx], ymm0
    LONG $0x20c28348             //    add    rdx, 32
    WORD $0x3948; BYTE $0xfa     //    cmp    rdx, rdi
	  JB   L199
L106:
    LONG $0x24848b48; LONG $0x00000120 //    mov    rax, QWORD 288[rsp]
    LONG $0x24843948; LONG $0x00000130 //    cmp    QWORD 304[rsp], rax
	  JE   L141
    LONG $0x24740348; BYTE $0x20 //    add    rsi, QWORD 32[rsp]
    LONG $0x24448b48; BYTE $0x18 //    mov    rax, QWORD 24[rsp]
    LONG $0x466ffec5; BYTE $0x20 //    vmovdqu    ymm0, 32[rsi]
    LONG $0x0e6ffec5             //    vmovdqu    ymm1, [rsi]
    LONG $0x566ffec5; BYTE $0x40 //    vmovdqu    ymm2, 64[rsi]
    LONG $0xc86bf5c5             //    vpackssdw    ymm1, ymm1, ymm0
    LONG $0x466ffec5; BYTE $0x60 //    vmovdqu    ymm0, 96[rsi]
    LONG $0xc06bedc5             //    vpackssdw    ymm0, ymm2, ymm0
    LONG $0x00fde3c4; WORD $0xd8c9 //    vpermq    ymm1, ymm1, 216
    LONG $0x00fde3c4; WORD $0xd8c0 //    vpermq    ymm0, ymm0, 216
    LONG $0xc067f5c5             //    vpackuswb    ymm0, ymm1, ymm0
    LONG $0x00fde3c4; WORD $0xd8c0 //    vpermq    ymm0, ymm0, 216
    LONG $0x047ffec5; BYTE $0x01 //    vmovdqu    [rcx+rax], ymm0
L141:
    LONG $0x24448b48; BYTE $0x48 //    mov    rax, QWORD 72[rsp]
    LONG $0x24848348; LONG $0x000000f0; BYTE $0x01 //    add    QWORD 240[rsp], 1
    LONG $0x24b48b48; LONG $0x000000f0 //    mov    rsi, QWORD 240[rsp]
    LONG $0x18703948             //    cmp    QWORD 24[rax], rsi
	  JLE  L222
    WORD $0x8b48; BYTE $0x00     //    mov    rax, QWORD [rax]
	  JMP  L144
L117:
    WORD $0x394c; BYTE $0xc1     //    cmp    rcx, r8
	  JBE  L174
    LONG $0x88b58b49; WORD $0x0000; BYTE $0x00 //    mov    rsi, QWORD 136[r13]
    LONG $0xce28f8c5             //    vmovaps    xmm1, xmm6
    WORD $0x894d; BYTE $0xd4     //    mov    r12, r10
    WORD $0x894c; BYTE $0xc3     //    mov    rbx, r8
L130:
    WORD $0x6348; BYTE $0x03     //    movsxd    rax, DWORD [rbx] /* movsx -> movsxd */
    LONG $0xc5148d48; LONG $0x00000000 //    lea    rdx, 0[0+rax*8]
    LONG $0x07e0c148             //    sal    rax, 7
    WORD $0x2948; BYTE $0xd0     //    sub    rax, rdx
    WORD $0x0148; BYTE $0xf0     //    add    rax, rsi
    LONG $0x30708b4c             //    mov    r14, QWORD 48[rax]
    LONG $0x28508b48             //    mov    rdx, QWORD 40[rax]
    LONG $0x3a148b42             //    mov    edx, DWORD [rdx+r15]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x38708b4c             //    mov    r14, QWORD 56[rax]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x40708b4c             //    mov    r14, QWORD 64[rax]
    LONG $0x3e140343             //    add    edx, DWORD [r14+r15]
    LONG $0x08708b4c             //    mov    r14, QWORD 8[rax]
    LONG $0x2ae2e1c4; BYTE $0xda //    vcvtsi2ss    xmm3, xmm3, rdx
    WORD $0x8b48; BYTE $0x10     //    mov    rdx, QWORD [rax]
    LONG $0x3a148b42             //    mov    edx, DWORD [rdx+r15]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x10708b4c             //    mov    r14, QWORD 16[rax]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x18708b4c             //    mov    r14, QWORD 24[rax]
    LONG $0x3e140343             //    add    edx, DWORD [r14+r15]
    LONG $0x5859e2c5; BYTE $0x48 //    vmulss    xmm3, xmm3, DWORD 72[rax]
    LONG $0x2afae1c4; BYTE $0xc2 //    vcvtsi2ss    xmm0, xmm0, rdx
    LONG $0x50508b48             //    mov    rdx, QWORD 80[rax]
    WORD $0x8548; BYTE $0xd2     //    test    rdx, rdx
    LONG $0x9961e2c4; WORD $0x2040 //    vfmadd132ss    xmm0, xmm3, DWORD 32[rax]
	  JE   L124
    LONG $0x58708b4c             //    mov    r14, QWORD 88[rax]
    LONG $0x3a148b42             //    mov    edx, DWORD [rdx+r15]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x60708b4c             //    mov    r14, QWORD 96[rax]
    LONG $0x3e142b43             //    sub    edx, DWORD [r14+r15]
    LONG $0x68708b4c             //    mov    r14, QWORD 104[rax]
    LONG $0x3e140343             //    add    edx, DWORD [r14+r15]
    LONG $0x2ae2e1c4; BYTE $0xda //    vcvtsi2ss    xmm3, xmm3, rdx
    LONG $0xb961e2c4; WORD $0x7040 //    vfmadd231ss    xmm0, xmm3, DWORD 112[rax]
L124:
    LONG $0x5b59eac5; BYTE $0x0c //    vmulss    xmm3, xmm2, DWORD 12[rbx]
    LONG $0xc32ef8c5             //    vucomiss    xmm0, xmm3
    WORD $0x1948; BYTE $0xc0     //    sbb    rax, rax
    LONG $0x10c38348             //    add    rbx, 16
    LONG $0x08c48349             //    add    r12, 8
    WORD $0xf748; BYTE $0xd0     //    not    rax
    WORD $0xe083; BYTE $0x04     //    and    eax, 4
    LONG $0x5872c1c4; WORD $0x044c; BYTE $0xf8 //    vaddss    xmm1, xmm1, DWORD -8[r12+rax]
    WORD $0x3948; BYTE $0xd9     //    cmp    rcx, rbx
	  JA   L130
	  JMP  L230
L174:
    LONG $0xce28f8c5             //    vmovaps    xmm1, xmm6
    LONG $0x4710fac5; BYTE $0x08 //    vmovss    xmm0, DWORD 8[rdi]
    LONG $0xc12ef8c5             //    vucomiss    xmm0, xmm1
	  JBE  L116
L176:
    WORD $0x894d; BYTE $0xec     //    mov    r12, r13
    WORD $0xc031                 //    xor    eax, eax
	  JMP  L115
L236:
    LONG $0x6024848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 352[rsp]
    LONG $0xac6ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    ymm5, 352[rsp]
    LONG $0x9429fcc5; LONG $0x0001a024; BYTE $0x00 //    vmovaps    416[rsp], ymm2
    LONG $0xac7ffdc5; LONG $0x00018024; BYTE $0x00 //    vmovdqa    384[rsp], ymm5
    WORD $0xc085                 //    test    eax, eax
	  JNE  L148
    LONG $0x8424848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 388[rsp]
    WORD $0xc085                 //    test    eax, eax
	  JNE  L149
    LONG $0x8824848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 392[rsp]
    WORD $0xc085                 //    test    eax, eax
	  JNE  L150
    LONG $0x8c24848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 396[rsp]
    WORD $0xc085                 //    test    eax, eax
	  JNE  L151
    LONG $0x9024848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 400[rsp]
    WORD $0xc085                 //    test    eax, eax
	  JNE  L152
    LONG $0x9424848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 404[rsp]
    WORD $0xc085                 //    test    eax, eax
	  JNE  L153
    LONG $0x24bc8b44; LONG $0x00000198 //    mov    r15d, DWORD 408[rsp]
    WORD $0x8545; BYTE $0xff     //    test    r15d, r15d
	  JNE  L154
    LONG $0x24b48b44; LONG $0x0000019c //    mov    r14d, DWORD 412[rsp]
    LONG $0x000007b8; BYTE $0x00 //    mov    eax, 7
    LONG $0x000007ba; BYTE $0x00 //    mov    edx, 7
    WORD $0x8545; BYTE $0xf6     //    test    r14d, r14d
	  JE   L25
L35:
    WORD $0x6348; BYTE $0xf2     //    movsxd    rsi, edx
    LONG $0x01588d45             //    lea    r11d, 1[r8]
    LONG $0x24948b48; LONG $0x000000a0 //    mov    rdx, QWORD 160[rsp]
    LONG $0x24348948             //    mov    QWORD [rsp], rsi
    LONG $0x9410fac5; LONG $0x0001a0b4; BYTE $0x00 //    vmovss    xmm2, DWORD 416[rsp+rsi*4]
    LONG $0x24b48b48; LONG $0x00000080 //    mov    rsi, QWORD 128[rsp]
    WORD $0x6349; BYTE $0xfb     //    movsxd    rdi, r11d
    LONG $0x248c8b48; LONG $0x000000e0 //    mov    rcx, QWORD 224[rsp]
    LONG $0x04e7c148             //    sal    rdi, 4
    WORD $0x0148; BYTE $0xc2     //    add    rdx, rax
    WORD $0x0148; BYTE $0xf7     //    add    rdi, rsi
    WORD $0x078b                 //    mov    eax, DWORD [rdi]
    WORD $0x634c; BYTE $0xf0     //    movsxd    r14, eax
    WORD $0xc001                 //    add    eax, eax
    WORD $0x9848                 //    cdqe
    LONG $0x04e6c149             //    sal    r14, 4
    LONG $0x2474034c; BYTE $0x58 //    add    r14, QWORD 88[rsp]
    LONG $0x813c8d4c             //    lea    r15, [rcx+rax*4]
    LONG $0x24448b48; BYTE $0x60 //    mov    rax, QWORD 96[rsp]
    WORD $0x2948; BYTE $0xf0     //    sub    rax, rsi
    LONG $0x04f8c148             //    sar    rax, 4
    WORD $0x3941; BYTE $0xc3     //    cmp    r11d, eax
    WORD $0x8941; BYTE $0xc0     //    mov    r8d, eax
	  JGE  L227
    LONG $0x95048d48; LONG $0x00000000 //    lea    rax, 0[0+rdx*4]
    LONG $0x24ac894c; LONG $0x00000140 //    mov    QWORD 320[rsp], r13
    LONG $0x0dc78348             //    add    rdi, 13
    WORD $0x8949; BYTE $0xdd     //    mov    r13, rbx
L60:
    WORD $0x3f80; BYTE $0x00     //    cmp    BYTE [rdi], 0
	  JNE  L38
    LONG $0xf7776348             //    movsxd    rsi, DWORD -9[rdi]
    LONG $0x04e6c148             //    sal    rsi, 4
    WORD $0x014c; BYTE $0xf6     //    add    rsi, r14
    LONG $0x00ff7f80             //    cmp    BYTE -1[rdi], 0
	  JNE  L39
    WORD $0x394c; BYTE $0xf6     //    cmp    rsi, r14
	  JBE  L156
    LONG $0x249c8b49; LONG $0x00000088 //    mov    rbx, QWORD 136[r12]
    LONG $0xc957f0c5             //    vxorps    xmm1, xmm1, xmm1
    WORD $0x894d; BYTE $0xfa     //    mov    r10, r15
    WORD $0x894d; BYTE $0xf1     //    mov    r9, r14
    LONG $0x24bc8948; LONG $0x00000160 //    mov    QWORD 352[rsp], rdi
L58:
    WORD $0x6349; BYTE $0x11     //    movsxd    rdx, DWORD [r9]
    LONG $0xd50c8d48; LONG $0x00000000 //    lea    rcx, 0[0+rdx*8]
    LONG $0x07e2c148             //    sal    rdx, 7
    WORD $0x2948; BYTE $0xca     //    sub    rdx, rcx
    WORD $0x0148; BYTE $0xda     //    add    rdx, rbx
    LONG $0x307a8b48             //    mov    rdi, QWORD 48[rdx]
    LONG $0x284a8b48             //    mov    rcx, QWORD 40[rdx]
    WORD $0x0c8b; BYTE $0x01     //    mov    ecx, DWORD [rcx+rax]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x387a8b48             //    mov    rdi, QWORD 56[rdx]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x407a8b48             //    mov    rdi, QWORD 64[rdx]
    WORD $0x0c03; BYTE $0x07     //    add    ecx, DWORD [rdi+rax]
    LONG $0x087a8b48             //    mov    rdi, QWORD 8[rdx]
    LONG $0x2ae2e1c4; BYTE $0xd9 //    vcvtsi2ss    xmm3, xmm3, rcx
    WORD $0x8b48; BYTE $0x0a     //    mov    rcx, QWORD [rdx]
    WORD $0x0c8b; BYTE $0x01     //    mov    ecx, DWORD [rcx+rax]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x107a8b48             //    mov    rdi, QWORD 16[rdx]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x187a8b48             //    mov    rdi, QWORD 24[rdx]
    WORD $0x0c03; BYTE $0x07     //    add    ecx, DWORD [rdi+rax]
    LONG $0x5a59e2c5; BYTE $0x48 //    vmulss    xmm3, xmm3, DWORD 72[rdx]
    LONG $0x2afae1c4; BYTE $0xc1 //    vcvtsi2ss    xmm0, xmm0, rcx
    LONG $0x9961e2c4; WORD $0x2042 //    vfmadd132ss    xmm0, xmm3, DWORD 32[rdx]
    LONG $0x596ac1c4; WORD $0x0c59 //    vmulss    xmm3, xmm2, DWORD 12[r9]
    LONG $0xc32ef8c5             //    vucomiss    xmm0, xmm3
    WORD $0x1948; BYTE $0xd2     //    sbb    rdx, rdx
    LONG $0x10c18349             //    add    r9, 16
    LONG $0x08c28349             //    add    r10, 8
    WORD $0xf748; BYTE $0xd2     //    not    rdx
    WORD $0xe283; BYTE $0x04     //    and    edx, 4
    LONG $0x5872c1c4; WORD $0x124c; BYTE $0xf8 //    vaddss    xmm1, xmm1, DWORD -8[r10+rdx]
    WORD $0x394c; BYTE $0xce     //    cmp    rsi, r9
	  JA   L58
L226:
    WORD $0x294c; BYTE $0xf6     //    sub    rsi, r14
    LONG $0x00000fbb; BYTE $0x00 //    mov    ebx, 15
    LONG $0x24bc8b48; LONG $0x00000160 //    mov    rdi, QWORD 352[rsp]
    LONG $0x1e548d48; BYTE $0xf0 //    lea    rdx, -16[rsi+rbx]
    LONG $0x04eac148             //    shr    rdx, 4
    LONG $0x4710fac5; BYTE $0xfb //    vmovss    xmm0, DWORD -5[rdi]
    LONG $0x01c28348             //    add    rdx, 1
    WORD $0x8948; BYTE $0xd1     //    mov    rcx, rdx
    LONG $0xd73c8d4d             //    lea    r15, [r15+rdx*8]
    LONG $0x04e1c148             //    sal    rcx, 4
    WORD $0x0149; BYTE $0xce     //    add    r14, rcx
    LONG $0xc12ef8c5             //    vucomiss    xmm0, xmm1
	  JA   L240
L38:
    LONG $0x01c38341             //    add    r11d, 1
    LONG $0x10c78348             //    add    rdi, 16
    WORD $0x3945; BYTE $0xd8     //    cmp    r8d, r11d
	  JG   L60
    WORD $0x894c; BYTE $0xeb     //    mov    rbx, r13
    LONG $0x24ac8b4c; LONG $0x00000140 //    mov    r13, QWORD 320[rsp]
L227:
    LONG $0x000001b8; BYTE $0x00 //    mov    eax, 1
L37:
    LONG $0x24348b48             //    mov    rsi, QWORD [rsp]
    LONG $0x80b48489; WORD $0x0001; BYTE $0x00 //    mov    DWORD 384[rsp+rsi*4], eax
    LONG $0x846ffdc5; LONG $0x00018024; BYTE $0x00 //    vmovdqa    ymm0, 384[rsp]
	  JMP  L25
L39:
    WORD $0x394c; BYTE $0xf6     //    cmp    rsi, r14
	  JBE  L156
    LONG $0x249c8b49; LONG $0x00000088 //    mov    rbx, QWORD 136[r12]
    LONG $0xc957f0c5             //    vxorps    xmm1, xmm1, xmm1
    WORD $0x894d; BYTE $0xfa     //    mov    r10, r15
    WORD $0x894d; BYTE $0xf1     //    mov    r9, r14
    LONG $0x24bc8948; LONG $0x00000160 //    mov    QWORD 352[rsp], rdi
L52:
    WORD $0x6349; BYTE $0x11     //    movsxd    rdx, DWORD [r9]
    LONG $0xd50c8d48; LONG $0x00000000 //    lea    rcx, 0[0+rdx*8]
    LONG $0x07e2c148             //    sal    rdx, 7
    WORD $0x2948; BYTE $0xca     //    sub    rdx, rcx
    WORD $0x0148; BYTE $0xda     //    add    rdx, rbx
    LONG $0x307a8b48             //    mov    rdi, QWORD 48[rdx]
    LONG $0x284a8b48             //    mov    rcx, QWORD 40[rdx]
    WORD $0x0c8b; BYTE $0x01     //    mov    ecx, DWORD [rcx+rax]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x387a8b48             //    mov    rdi, QWORD 56[rdx]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x407a8b48             //    mov    rdi, QWORD 64[rdx]
    WORD $0x0c03; BYTE $0x07     //    add    ecx, DWORD [rdi+rax]
    LONG $0x087a8b48             //    mov    rdi, QWORD 8[rdx]
    LONG $0x2ae2e1c4; BYTE $0xd9 //    vcvtsi2ss    xmm3, xmm3, rcx
    WORD $0x8b48; BYTE $0x0a     //    mov    rcx, QWORD [rdx]
    WORD $0x0c8b; BYTE $0x01     //    mov    ecx, DWORD [rcx+rax]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x107a8b48             //    mov    rdi, QWORD 16[rdx]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x187a8b48             //    mov    rdi, QWORD 24[rdx]
    WORD $0x0c03; BYTE $0x07     //    add    ecx, DWORD [rdi+rax]
    LONG $0x5a59e2c5; BYTE $0x48 //    vmulss    xmm3, xmm3, DWORD 72[rdx]
    LONG $0x2afae1c4; BYTE $0xc1 //    vcvtsi2ss    xmm0, xmm0, rcx
    LONG $0x504a8b48             //    mov    rcx, QWORD 80[rdx]
    WORD $0x8548; BYTE $0xc9     //    test    rcx, rcx
    LONG $0x9961e2c4; WORD $0x2042 //    vfmadd132ss    xmm0, xmm3, DWORD 32[rdx]
	  JE   L46
    LONG $0x587a8b48             //    mov    rdi, QWORD 88[rdx]
    WORD $0x0c8b; BYTE $0x01     //    mov    ecx, DWORD [rcx+rax]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x607a8b48             //    mov    rdi, QWORD 96[rdx]
    WORD $0x0c2b; BYTE $0x07     //    sub    ecx, DWORD [rdi+rax]
    LONG $0x687a8b48             //    mov    rdi, QWORD 104[rdx]
    WORD $0x0c03; BYTE $0x07     //    add    ecx, DWORD [rdi+rax]
    LONG $0x2ae2e1c4; BYTE $0xd9 //    vcvtsi2ss    xmm3, xmm3, rcx
    LONG $0xb961e2c4; WORD $0x7042 //    vfmadd231ss    xmm0, xmm3, DWORD 112[rdx]
L46:
    LONG $0x596ac1c4; WORD $0x0c59 //    vmulss    xmm3, xmm2, DWORD  12[r9]
    LONG $0xc32ef8c5             //    vucomiss    xmm0, xmm3
    WORD $0x1948; BYTE $0xd2     //    sbb    rdx, rdx
    LONG $0x10c18349             //    add    r9, 16
    LONG $0x08c28349             //    add    r10, 8
    WORD $0xf748; BYTE $0xd2     //    not    rdx
    WORD $0xe283; BYTE $0x04     //    and    edx, 4
    LONG $0x5872c1c4; WORD $0x124c; BYTE $0xf8 //    vaddss    xmm1, xmm1, DWORD  -8[r10+rdx]
    WORD $0x394c; BYTE $0xce     //    cmp    rsi, r9
	  JA   L52
	  JMP  L226
L238:
    LONG $0x24b48b48; LONG $0x00000138 //    mov    rsi, QWORD  312[rsp]
    LONG $0x24448b48; BYTE $0x10 //    mov    rax, QWORD  16[rsp]
    WORD $0x0348; BYTE $0x06     //    add    rax, QWORD  [rsi]
    LONG $0x006ffec5             //    vmovdqu    ymm0,  [rax]
    LONG $0x24448b48; BYTE $0x40 //    mov    rax, QWORD  64[rsp]
    LONG $0x177de2c4; WORD $0x0045 //    vptest    ymm0, [rbp] /* .LC10[rip] */
    LONG $0x847ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa     352[rsp], ymm0
    LONG $0x24848948; LONG $0x00000140 //    mov    QWORD  320[rsp], rax
	  JE   L64
    LONG $0x24748b48; BYTE $0x08 //    mov    rsi, QWORD  8[rsp]
    LONG $0x24448b48; BYTE $0x50 //    mov    rax, QWORD  80[rsp]
    WORD $0x3145; BYTE $0xdb     //    xor    r11d, r11d
    LONG $0x187dc2c4; LONG $0x00a02494; WORD $0x0000 //    vbroadcastss    ymm2, DWORD  160[r12]
    LONG $0x24748b4d; BYTE $0x58 //    mov    r14, QWORD  88[r12]
    WORD $0x0148; BYTE $0xf0     //    add    rax, rsi
    LONG $0x02e0c148             //    sal    rax, 2
    LONG $0x08568d4d             //    lea    r10, 8[r14]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000c8 //    add    rdx, QWORD  200[r12]
    LONG $0x226ffec5             //    vmovdqu    ymm4,  [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000d0 //    add    rdx, QWORD  208[r12]
    LONG $0x1a6ffec5             //    vmovdqu    ymm3,  [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000d8 //    add    rdx, QWORD  216[r12]
    LONG $0xdbfaddc5             //    vpsubd    ymm3, ymm4, ymm3
    LONG $0x2a6ffec5             //    vmovdqu    ymm5,  [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000e0 //    add    rdx, QWORD  224[r12]
    LONG $0x0a6ffec5             //    vmovdqu    ymm1,  [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000a8 //    add    rdx, QWORD  168[r12]
    LONG $0xc9fad5c5             //    vpsubd    ymm1, ymm5, ymm1
    LONG $0xc9fae5c5             //    vpsubd    ymm1, ymm3, ymm1
    LONG $0xc95bfcc5             //    vcvtdq2ps    ymm1, ymm1
    LONG $0xc959f4c5             //    vmulps    ymm1, ymm1, ymm1
    LONG $0x2a6ffec5             //    vmovdqu    ymm5,  [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24940349; LONG $0x000000b0 //    add    rdx, QWORD  176[r12]
    LONG $0x226ffec5             //    vmovdqu    ymm4,  [rdx]
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0x24840349; LONG $0x000000c0 //    add    rax, QWORD  192[r12]
    LONG $0x24940349; LONG $0x000000b8 //    add    rdx, QWORD  184[r12]
    LONG $0xe4fad5c5             //    vpsubd    ymm4, ymm5, ymm4
    LONG $0xedefd1c5             //    vpxor    xmm5, xmm5, xmm5
    LONG $0x186ffec5             //    vmovdqu    ymm3,  [rax]
    LONG $0x24848b48; LONG $0x000000f8 //    mov    rax, QWORD  248[rsp]
    LONG $0x3a6ffec5             //    vmovdqu    ymm7,  [rdx]
    LONG $0xdbfac5c5             //    vpsubd    ymm3, ymm7, ymm3
    LONG $0xdbfaddc5             //    vpsubd    ymm3, ymm4, ymm3
    LONG $0xdb5bfcc5             //    vcvtdq2ps    ymm3, ymm3
    LONG $0xd259e4c5             //    vmulps    ymm2, ymm3, ymm2
    WORD $0x0148; BYTE $0xf0     //    add    rax, rsi
    LONG $0x24748b49; BYTE $0x70 //    mov    rsi, QWORD  112[r12]
    LONG $0x24848948; LONG $0x00000100 //    mov    QWORD  256[rsp], rax
    LONG $0x02e0c148             //    sal    rax, 2
    LONG $0x24b48948; LONG $0x000000c0 //    mov    QWORD  192[rsp], rsi
    WORD $0x8949; BYTE $0xf7     //    mov    r15, rsi
    LONG $0x24748b49; BYTE $0x28 //    mov    rsi, QWORD  40[r12]
    LONG $0xc95cecc5             //    vsubps    ymm1, ymm2, ymm1
    LONG $0xd257e8c5             //    vxorps    xmm2, xmm2, xmm2
    LONG $0x24b48948; LONG $0x000000a0 //    mov    QWORD  160[rsp], rsi
    WORD $0x8948; BYTE $0xf3     //    mov    rbx, rsi
    LONG $0x24748b49; BYTE $0x60 //    mov    rsi, QWORD  96[r12]
    LONG $0xd2c2f4c5; BYTE $0x1e //    vcmpps    ymm2, ymm1, ymm2, 30
    LONG $0x24b48948; LONG $0x00000080 //    mov    QWORD  128[rsp], rsi
    WORD $0x294c; BYTE $0xf6     //    sub    rsi, r14
    WORD $0x8948; BYTE $0xf2     //    mov    rdx, rsi
    LONG $0x5d55ecc5; BYTE $0x00 //    vandnps    ymm3, ymm2, [rbp] /* .LC11[rip] */
    LONG $0x04fac148             //    sar    rdx, 4
    WORD $0xd285                 //    test    edx, edx
    WORD $0x8941; BYTE $0xd5     //    mov    r13d, edx
    LONG $0xd154ecc5             //    vandps    ymm2, ymm2, ymm1
    LONG $0xd356ecc5             //    vorps    ymm2, ymm2, ymm3
    LONG $0xd251fcc5             //    vsqrtps    ymm2, ymm2
	  JLE  L66
L209:
    LONG $0x057a8041; BYTE $0x00 //    cmp    BYTE 5[r10], 0
	  JNE  L67
    LONG $0xfc726349             //    movsxd    rsi, DWORD -4[r10]
    LONG $0x04e6c148             //    sal    rsi, 4
    WORD $0x0148; BYTE $0xde     //    add    rsi, rbx
    LONG $0x047a8041; BYTE $0x00 //    cmp    BYTE 4[r10], 0
	  JNE  L68
    WORD $0x3948; BYTE $0xde     //    cmp    rsi, rbx
	  JBE  L160
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    LONG $0x24bc8b49; LONG $0x00000088 //    mov    rdi, QWORD 136[r12]
    WORD $0x894d; BYTE $0xf8     //    mov    r8, r15
    WORD $0x8948; BYTE $0xd9     //    mov    rcx, rbx
L75:
    WORD $0x6348; BYTE $0x11     //    movsxd    rdx, DWORD [rcx]
    LONG $0x10c18348             //    add    rcx, 16
    LONG $0x08c08349             //    add    r8, 8
    LONG $0xd50c8d4c; LONG $0x00000000 //    lea    r9, 0[0+rdx*8]
    LONG $0x07e2c148             //    sal    rdx, 7
    WORD $0x294c; BYTE $0xca     //    sub    rdx, r9
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    WORD $0x0148; BYTE $0xfa     //    add    rdx, rdi
    LONG $0x284a034c             //    add    r9, QWORD 40[rdx]
    LONG $0x6f7ec1c4; BYTE $0x09 //    vmovdqu    ymm1, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x304a034c             //    add    r9, QWORD 48[rdx]
    LONG $0x6f7ec1c4; BYTE $0x21 //    vmovdqu    ymm4, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x384a034c             //    add    r9, QWORD 56[rdx]
    LONG $0xccfaf5c5             //    vpsubd    ymm1, ymm1, ymm4
    LONG $0x6f7ec1c4; BYTE $0x39 //    vmovdqu    ymm7, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x404a034c             //    add    r9, QWORD 64[rdx]
    LONG $0x6f7ec1c4; BYTE $0x19 //    vmovdqu    ymm3, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    WORD $0x034c; BYTE $0x0a     //    add    r9, QWORD [rdx]
    LONG $0xdbfac5c5             //    vpsubd    ymm3, ymm7, ymm3
    LONG $0xcbfaf5c5             //    vpsubd    ymm1, ymm1, ymm3
    LONG $0x187de2c4; WORD $0x485a //    vbroadcastss    ymm3, DWORD 72[rdx]
    LONG $0xc95bfcc5             //    vcvtdq2ps    ymm1, ymm1
    LONG $0x6f7ec1c4; BYTE $0x21 //    vmovdqu    ymm4, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x084a034c             //    add    r9, QWORD 8[rdx]
    LONG $0xcb59f4c5             //    vmulps    ymm1, ymm1, ymm3
    LONG $0x6f7ec1c4; BYTE $0x39 //    vmovdqu    ymm7, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x104a034c             //    add    r9, QWORD 16[rdx]
    LONG $0xe7faddc5             //    vpsubd    ymm4, ymm4, ymm7
    LONG $0x6f7e41c4; BYTE $0x31 //    vmovdqu    ymm14, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x184a034c             //    add    r9, QWORD 24[rdx]
    LONG $0x6f7ec1c4; BYTE $0x19 //    vmovdqu    ymm3, [r9]
    LONG $0xdbfa8dc5             //    vpsubd    ymm3, ymm14, ymm3
    LONG $0xe3faddc5             //    vpsubd    ymm4, ymm4, ymm3
    LONG $0x187de2c4; WORD $0x205a //    vbroadcastss    ymm3, DWORD 32[rdx]
    LONG $0xe45bfcc5             //    vcvtdq2ps    ymm4, ymm4
    LONG $0xe359dcc5             //    vmulps    ymm4, ymm4, ymm3
    LONG $0x187dc2c4; WORD $0xfc58 //    vbroadcastss    ymm3, DWORD -4[r8]
    LONG $0xe158dcc5             //    vaddps    ymm4, ymm4, ymm1
    LONG $0x187de2c4; WORD $0xfc49 //    vbroadcastss    ymm1, DWORD -4[rcx]
    LONG $0xca59f4c5             //    vmulps    ymm1, ymm1, ymm2
    LONG $0xe4c2f4c5; BYTE $0x1e //    vcmpps    ymm4, ymm1, ymm4, 30
    LONG $0x187dc2c4; WORD $0xf848 //    vbroadcastss    ymm1, DWORD -8[r8]
    WORD $0x3948; BYTE $0xce     //    cmp    rsi, rcx
    LONG $0x4a65e3c4; WORD $0x40c9 //    vblendvps    ymm1, ymm3, ymm1, ymm4
    LONG $0xc158fcc5             //    vaddps    ymm0, ymm0, ymm1
	  JA   L75
L228:
    WORD $0x2948; BYTE $0xde     //    sub    rsi, rbx
    LONG $0x00000fbf; BYTE $0x00 //    mov    edi, 15
    LONG $0x3e548d48; BYTE $0xf0 //    lea    rdx, -16[rsi+rdi]
    LONG $0x04eac148             //    shr    rdx, 4
    LONG $0x01c28348             //    add    rdx, 1
    WORD $0x8948; BYTE $0xd1     //    mov    rcx, rdx
    LONG $0xd73c8d4d             //    lea    r15, [r15+rdx*8]
    LONG $0x04e1c148             //    sal    rcx, 4
    WORD $0x0148; BYTE $0xcb     //    add    rbx, rcx
L70:
    LONG $0x187dc2c4; BYTE $0x0a //    vbroadcastss    ymm1, DWORD [r10]
    LONG $0xc0c2f4c5; BYTE $0x1e //    vcmpps    ymm0, ymm1, ymm0, 30
    LONG $0xbcdffdc5; LONG $0x00016024; BYTE $0x00 //    vpandn    ymm7, ymm0, 352[rsp]
    LONG $0xbc7ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    352[rsp], ymm7
    LONG $0x846ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    ymm0, 352[rsp]
    LONG $0xfdf6fdc5             //    vpsadbw    ymm7, ymm0, ymm5
    LONG $0xbc7ffdc5; LONG $0x0001a024; BYTE $0x00 //    vmovdqa    416[rsp], ymm7
    LONG $0xbc7ffdc5; LONG $0x00014024; BYTE $0x00 //    vmovdqa    320[rsp], ymm7
    LONG $0x4024948b; WORD $0x0001; BYTE $0x00 //    mov    edx, DWORD 320[rsp]
    LONG $0xa8249403; WORD $0x0001; BYTE $0x00 //    add    edx, DWORD 424[rsp]
    LONG $0xb0249403; WORD $0x0001; BYTE $0x00 //    add    edx, DWORD 432[rsp]
    LONG $0xb8249403; WORD $0x0001; BYTE $0x00 //    add    edx, DWORD 440[rsp]
	  JE   L66
    WORD $0xfa83; BYTE $0x01     //    cmp    edx, 1
	  JE    L241
L67:
    LONG $0x01c38341             //    add    r11d, 1
    LONG $0x10c28349             //    add    r10, 16
    WORD $0x3945; BYTE $0xdd     //    cmp    r13d, r11d
	  JG   L209
    LONG $0x846ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    ymm0, 352[rsp]
L66:
    LONG $0x24b48b48; LONG $0x00000138 //    mov    rsi, QWORD 312[rsp]
    LONG $0x24448b48; BYTE $0x10 //    mov    rax, QWORD 16[rsp]
    LONG $0x08460348             //    add    rax, QWORD 8[rsi]
    LONG $0x007ffec5             //    vmovdqu    [rax], ymm0
    LONG $0x24448b48; BYTE $0x40 //    mov    rax, QWORD 64[rsp]
    LONG $0x24848948; LONG $0x00000140 //    mov    QWORD 320[rsp], rax
	  JMP  L64
L68:
    WORD $0x3948; BYTE $0xde     //    cmp    rsi, rbx
	  JBE  L160
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    LONG $0x24bc8b49; LONG $0x00000088 //    mov    rdi, QWORD 136[r12]
    WORD $0x894d; BYTE $0xf8     //    mov    r8, r15
    WORD $0x8948; BYTE $0xd9     //    mov    rcx, rbx
L73:
    WORD $0x6348; BYTE $0x11     //    movsxd    rdx, DWORD [rcx]
    LONG $0xd50c8d4c; LONG $0x00000000 //    lea    r9, 0[0+rdx*8]
    LONG $0x07e2c148             //    sal    rdx, 7
    WORD $0x294c; BYTE $0xca     //    sub    rdx, r9
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    WORD $0x0148; BYTE $0xfa     //    add    rdx, rdi
    LONG $0x284a034c             //    add    r9, QWORD 40[rdx]
    LONG $0x6f7ec1c4; BYTE $0x19 //    vmovdqu    ymm3, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x304a034c             //    add    r9, QWORD 48[rdx]
    LONG $0x6f7ec1c4; BYTE $0x21 //    vmovdqu    ymm4, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x384a034c             //    add    r9, QWORD 56[rdx]
    LONG $0xdcfae5c5             //    vpsubd    ymm3, ymm3, ymm4
    LONG $0x6f7ec1c4; BYTE $0x39 //    vmovdqu    ymm7, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x404a034c             //    add    r9, QWORD 64[rdx]
    LONG $0x6f7ec1c4; BYTE $0x09 //    vmovdqu    ymm1, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    WORD $0x034c; BYTE $0x0a     //    add    r9, QWORD [rdx]
    LONG $0xc9fac5c5             //    vpsubd    ymm1, ymm7, ymm1
    LONG $0xd9fae5c5             //    vpsubd    ymm3, ymm3, ymm1
    LONG $0x187de2c4; WORD $0x484a //    vbroadcastss    ymm1, DWORD 72[rdx]
    LONG $0xdb5bfcc5             //    vcvtdq2ps    ymm3, ymm3
    LONG $0xd959e4c5             //    vmulps    ymm3, ymm3, ymm1
    LONG $0x6f7ec1c4; BYTE $0x09 //    vmovdqu    ymm1, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x084a034c             //    add    r9, QWORD 8[rdx]
    LONG $0x6f7ec1c4; BYTE $0x39 //    vmovdqu    ymm7, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x104a034c             //    add    r9, QWORD 16[rdx]
    LONG $0xcffaf5c5             //    vpsubd    ymm1, ymm1, ymm7
    LONG $0x6f7e41c4; BYTE $0x31 //    vmovdqu    ymm14, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x184a034c             //    add    r9, QWORD 24[rdx]
    LONG $0x6f7ec1c4; BYTE $0x21 //    vmovdqu    ymm4, [r9]
    LONG $0x504a8b4c             //    mov    r9, QWORD 80[rdx]
    LONG $0xe4fa8dc5             //    vpsubd    ymm4, ymm14, ymm4
    LONG $0xccfaf5c5             //    vpsubd    ymm1, ymm1, ymm4
    LONG $0x187de2c4; WORD $0x2062 //    vbroadcastss    ymm4, DWORD 32[rdx]
    LONG $0xc95bfcc5             //    vcvtdq2ps    ymm1, ymm1
    WORD $0x854d; BYTE $0xc9     //    test    r9, r9
    LONG $0xcc59f4c5             //    vmulps    ymm1, ymm1, ymm4
    LONG $0xcb58f4c5             //    vaddps    ymm1, ymm1, ymm3
	  JE   L71
    LONG $0x6f7ec1c4; WORD $0x013c //    vmovdqu    ymm7, [r9+rax]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x584a034c             //    add    r9, QWORD 88[rdx]
    LONG $0x6f7ec1c4; BYTE $0x21 //    vmovdqu    ymm4, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x604a034c             //    add    r9, QWORD 96[rdx]
    LONG $0xe4fac5c5             //    vpsubd    ymm4, ymm7, ymm4
    LONG $0x6f7e41c4; BYTE $0x31 //    vmovdqu    ymm14, [r9]
    WORD $0x8949; BYTE $0xc1     //    mov    r9, rax
    LONG $0x684a034c             //    add    r9, QWORD 104[rdx]
    LONG $0x6f7ec1c4; BYTE $0x19 //    vmovdqu    ymm3, [r9]
    LONG $0xdbfa8dc5             //    vpsubd    ymm3, ymm14, ymm3
    LONG $0xe3faddc5             //    vpsubd    ymm4, ymm4, ymm3
    LONG $0x187de2c4; WORD $0x705a //    vbroadcastss    ymm3, DWORD 112[rdx]
    LONG $0xe45bfcc5             //    vcvtdq2ps    ymm4, ymm4
    LONG $0xdb59dcc5             //    vmulps    ymm3, ymm4, ymm3
    LONG $0xcb58f4c5             //    vaddps    ymm1, ymm1, ymm3
L71:
    LONG $0x187de2c4; WORD $0x0c59 //    vbroadcastss    ymm3, DWORD 12[rcx]
    LONG $0x10c18348             //    add    rcx, 16
    LONG $0x08c08349             //    add    r8, 8
    LONG $0x187dc2c4; WORD $0xf860 //    vbroadcastss    ymm4, DWORD -8[r8]
    LONG $0xda59e4c5             //    vmulps    ymm3, ymm3, ymm2
    LONG $0xc9c2e4c5; BYTE $0x1e //    vcmpps    ymm1, ymm3, ymm1, 30
    LONG $0x187dc2c4; WORD $0xfc58 //    vbroadcastss    ymm3, DWORD -4[r8]
    WORD $0x3948; BYTE $0xce     //    cmp    rsi, rcx
    LONG $0x4a65e3c4; WORD $0x10cc //    vblendvps    ymm1, ymm3, ymm4, ymm1
    LONG $0xc158fcc5             //    vaddps    ymm0, ymm0, ymm1
	  JA   L73
	  JMP  L228
L156:
    LONG $0xc957f0c5             //    vxorps    xmm1, xmm1, xmm1
    LONG $0x4710fac5; BYTE $0xfb //    vmovss    xmm0, DWORD -5[rdi]
    LONG $0xc12ef8c5             //    vucomiss    xmm0, xmm1
	  JBE  L38
L240:
    WORD $0x8944; BYTE $0xd8     //    mov    eax, r11d
    WORD $0x894c; BYTE $0xeb     //    mov    rbx, r13
    LONG $0x24ac8b4c; LONG $0x00000140 //    mov    r13, QWORD 320[rsp]
    WORD $0xd8f7                 //    neg    eax
    WORD $0xc085                 //    test    eax, eax
    WORD $0x9f0f; BYTE $0xd0     //    setg    al
    WORD $0xb60f; BYTE $0xc0     //    movzx    eax, al
	  JMP  L37
L222:
    WORD $0xf8c5; BYTE $0x77     //    vzeroupper
L223:
//    lea    rsp, -40[rbp]
//    pop    rbx
//    pop    r12
//    pop    r13
//    pop    r14
//    pop    r15
//    pop    rbp

    RET

L234:
    LONG $0x2484c748; LONG $0x00000140; LONG $0x00000000 //    mov    QWORD 320[rsp], 0
	  JMP  L10
L160:
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
	  JMP  L70
L149:
    LONG $0x000001b8; BYTE $0x00 //    mov    eax, 1
    LONG $0x000001ba; BYTE $0x00 //    mov    edx, 1
	  JMP  L35
L148:
    WORD $0xc031                 //    xor    eax, eax
    WORD $0xd231                 //    xor    edx, edx
	  JMP  L35
L241:
    LONG $0x6024848b; WORD $0x0001; BYTE $0x00 //    mov    eax, DWORD 352[rsp]
    LONG $0xac6ffdc5; LONG $0x00016024; BYTE $0x00 //    vmovdqa    ymm5, 352[rsp]
    LONG $0x9429fcc5; LONG $0x0001a024; BYTE $0x00 //    vmovaps    416[rsp], ymm2
    LONG $0xac7ffdc5; LONG $0x00018024; BYTE $0x00 //    vmovdqa    384[rsp], ymm5
    WORD $0xc085                 //    test    eax, eax
	  JNE  L161
    LONG $0x84249c8b; WORD $0x0001; BYTE $0x00 //    mov    ebx, DWORD 388[rsp]
    WORD $0xdb85                 //    test    ebx, ebx
	  JNE  L162
    LONG $0x24948b44; LONG $0x00000188 //    mov    r10d, DWORD 392[rsp]
    WORD $0x8545; BYTE $0xd2     //    test    r10d, r10d
	  JNE  L163
    LONG $0x248c8b44; LONG $0x0000018c //    mov    r9d, DWORD 396[rsp]
    WORD $0x8545; BYTE $0xc9     //    test    r9d, r9d
	  JNE  L164
    LONG $0x24848b44; LONG $0x00000190 //    mov    r8d, DWORD 400[rsp]
    WORD $0x8545; BYTE $0xc0     //    test    r8d, r8d
	  JNE  L165
    LONG $0x9424bc8b; WORD $0x0001; BYTE $0x00 //    mov    edi, DWORD 404[rsp]
    WORD $0xff85                 //    test    edi, edi
	  JNE  L166
    LONG $0x9824b48b; WORD $0x0001; BYTE $0x00 //    mov    esi, DWORD 408[rsp]
    WORD $0xf685                 //    test    esi, esi
	  JNE  L167
    LONG $0x9c248c8b; WORD $0x0001; BYTE $0x00 //    mov    ecx, DWORD 412[rsp]
    LONG $0x000007b8; BYTE $0x00 //    mov    eax, 7
    WORD $0x07b2                 //    mov    dl, 7
    WORD $0xc985                 //    test    ecx, ecx
	  JE   L66
	  JMP  L76
L154:
    LONG $0x000006b8; BYTE $0x00 //    mov    eax, 6
    LONG $0x000006ba; BYTE $0x00 //    mov    edx, 6
	  JMP  L35
L153:
    LONG $0x000005b8; BYTE $0x00 //    mov    eax, 5
    LONG $0x000005ba; BYTE $0x00 //    mov    edx, 5
	  JMP  L35
L152:
    LONG $0x000004b8; BYTE $0x00 //    mov    eax, 4
    LONG $0x000004ba; BYTE $0x00 //    mov    edx, 4
	  JMP  L35
L151:
    LONG $0x000003b8; BYTE $0x00 //    mov    eax, 3
    LONG $0x000003ba; BYTE $0x00 //    mov    edx, 3
	  JMP  L35
L150:
    LONG $0x000002b8; BYTE $0x00 //    mov    eax, 2
    LONG $0x000002ba; BYTE $0x00 //    mov    edx, 2
	  JMP  L35
L161:
    WORD $0xc031                 //    xor    eax, eax
    WORD $0xd231                 //    xor    edx, edx
L76:
    LONG $0x24948b4c; LONG $0x00000100 //    mov    r10, QWORD 256[rsp]
    LONG $0x016b8d45             //    lea    r13d, 1[r11]
    LONG $0x24b48b48; LONG $0x000000c0 //    mov    rsi, QWORD 192[rsp]
    WORD $0x634c; BYTE $0xfa     //    movsxd    r15, edx
    LONG $0x107aa1c4; LONG $0x01a0bc94; WORD $0x0000 //    vmovss    xmm2, DWORD 416[rsp+r15*4]
    WORD $0x0149; BYTE $0xc2     //    add    r10, rax
    WORD $0x6349; BYTE $0xc5     //    movsxd    rax, r13d
    LONG $0x04e0c148             //    sal    rax, 4
    LONG $0x061c8d49             //    lea    rbx, [r14+rax]
    WORD $0x038b                 //    mov    eax, DWORD [rbx]
    WORD $0x634c; BYTE $0xd8     //    movsxd    r11, eax
    WORD $0xc001                 //    add    eax, eax
    WORD $0x9848                 //    cdqe
    LONG $0x04e3c149             //    sal    r11, 4
    LONG $0x249c034c; LONG $0x000000a0 //    add    r11, QWORD 160[rsp]
    LONG $0x860c8d4c             //    lea    r9, [rsi+rax*4]
    LONG $0x24848b48; LONG $0x00000080 //    mov    rax, QWORD 128[rsp]
    WORD $0x294c; BYTE $0xf0     //    sub    rax, r14
    LONG $0x04f8c148             //    sar    rax, 4
    WORD $0x3941; BYTE $0xc5     //    cmp    r13d, eax
    LONG $0x60248489; WORD $0x0001; BYTE $0x00 //    mov    DWORD 352[rsp], eax
	  JGE  L220
    LONG $0x02e2c149             //    sal    r10, 2
    LONG $0x0dc38348             //    add    rbx, 13
L101:
    WORD $0x3b80; BYTE $0x00     //    cmp    BYTE [rbx], 0
    JNE  L79
    LONG $0xf7536348             //    movsxd    rdx, DWORD -9[rbx]
    LONG $0x04e2c148             //    sal    rdx, 4
    WORD $0x014c; BYTE $0xda     //    add    rdx, r11
    LONG $0x00ff7b80             //    cmp    BYTE -1[rbx], 0
    JNE  L80
    WORD $0x394c; BYTE $0xda     //    cmp    rdx, r11
    JBE  L169
    LONG $0x24848b4d; LONG $0x00000088 //    mov    r8, QWORD 136[r12]
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    WORD $0x894c; BYTE $0xcf     //    mov    rdi, r9
    WORD $0x894c; BYTE $0xd9     //    mov    rcx, r11
L99:
    WORD $0x6348; BYTE $0x01     //    movsxd    rax, DWORD [rcx]
    LONG $0xc5348d48; LONG $0x00000000 //    lea    rsi, 0[0+rax*8]
    LONG $0x07e0c148             //    sal    rax, 7
    WORD $0x2948; BYTE $0xf0     //    sub    rax, rsi
    WORD $0x014c; BYTE $0xc0     //    add    rax, r8
    LONG $0x30708b4c             //    mov    r14, QWORD 48[rax]
    LONG $0x28708b48             //    mov    rsi, QWORD 40[rax]
    LONG $0x16348b42             //    mov    esi, DWORD [rsi+r10]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x38708b4c             //    mov    r14, QWORD 56[rax]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x40708b4c             //    mov    r14, QWORD 64[rax]
    LONG $0x16340343             //    add    esi, DWORD [r14+r10]
    LONG $0x08708b4c             //    mov    r14, QWORD 8[rax]
    LONG $0x2ae2e1c4; BYTE $0xde //    vcvtsi2ss    xmm3, xmm3, rsi
    WORD $0x8b48; BYTE $0x30     //    mov    rsi, QWORD [rax]
    LONG $0x16348b42             //    mov    esi, DWORD [rsi+r10]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x10708b4c             //    mov    r14, QWORD 16[rax]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x18708b4c             //    mov    r14, QWORD 24[rax]
    LONG $0x16340343             //    add    esi, DWORD [r14+r10]
    LONG $0x5859e2c5; BYTE $0x48 //    vmulss    xmm3, xmm3, DWORD 72[rax]
    LONG $0x2af2e1c4; BYTE $0xce //    vcvtsi2ss    xmm1, xmm1, rsi
    LONG $0x9961e2c4; WORD $0x2048 //    vfmadd132ss    xmm1, xmm3, DWORD 32[rax]
    LONG $0x5959eac5; BYTE $0x0c //    vmulss    xmm3, xmm2, DWORD 12[rcx]
    LONG $0xcb2ef8c5             //    vucomiss    xmm1, xmm3
    WORD $0x1948; BYTE $0xc0     //    sbb    rax, rax
    LONG $0x10c18348             //    add    rcx, 16
    LONG $0x08c78348             //    add    rdi, 8
    WORD $0xf748; BYTE $0xd0     //    not    rax
    WORD $0xe083; BYTE $0x04     //    and    eax, 4
    LONG $0x4458fac5; WORD $0xf807 //    vaddss    xmm0, xmm0, DWORD -8[rdi+rax]
    WORD $0x3948; BYTE $0xca     //    cmp    rdx, rcx
	  JA   L99
L229:
    WORD $0x294c; BYTE $0xda     //    sub    rdx, r11
    LONG $0x00000fb8; BYTE $0x00 //    mov    eax, 15
    LONG $0x02448d48; BYTE $0xf0 //    lea    rax, -16[rdx+rax]
    LONG $0x4b10fac5; BYTE $0xfb //    vmovss    xmm1, DWORD -5[rbx]
    LONG $0x04e8c148             //    shr    rax, 4
    LONG $0x01c08348             //    add    rax, 1
    WORD $0x8948; BYTE $0xc2     //    mov    rdx, rax
    LONG $0xc10c8d4d             //    lea    r9, [r9+rax*8]
    LONG $0x04e2c148             //    sal    rdx, 4
    WORD $0x0149; BYTE $0xd3     //    add    r11, rdx
    LONG $0xc82ef8c5             //    vucomiss    xmm1, xmm0
	  JA   L242
L79:
    LONG $0x01c58341             //    add    r13d, 1
    LONG $0x10c38348             //    add    rbx, 16
    LONG $0x24ac3944; LONG $0x00000160 //    cmp    DWORD 352[rsp], r13d
	  JG   L101
L220:
    LONG $0x000001b8; BYTE $0x00 //    mov    eax, 1
	  JMP  L78
L80:
    WORD $0x394c; BYTE $0xda     //    cmp    rdx, r11
	  JBE  L169
    LONG $0x24848b4d; LONG $0x00000088 //    mov    r8, QWORD 136[r12]
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    WORD $0x894c; BYTE $0xcf     //    mov    rdi, r9
    WORD $0x894c; BYTE $0xd9     //    mov    rcx, r11
L93:
    WORD $0x6348; BYTE $0x01     //    movsxd    rax, DWORD [rcx]
    LONG $0xc5348d48; LONG $0x00000000 //    lea    rsi, 0[0+rax*8]
    LONG $0x07e0c148             //    sal    rax, 7
    WORD $0x2948; BYTE $0xf0     //    sub    rax, rsi
    WORD $0x014c; BYTE $0xc0     //    add    rax, r8
    LONG $0x30708b4c             //    mov    r14, QWORD 48[rax]
    LONG $0x28708b48             //    mov    rsi, QWORD 40[rax]
    LONG $0x16348b42             //    mov    esi, DWORD [rsi+r10]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x38708b4c             //    mov    r14, QWORD 56[rax]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x40708b4c             //    mov    r14, QWORD 64[rax]
    LONG $0x16340343             //    add    esi, DWORD [r14+r10]
    LONG $0x08708b4c             //    mov    r14, QWORD 8[rax]
    LONG $0x2ae2e1c4; BYTE $0xde //    vcvtsi2ss    xmm3, xmm3, rsi
    WORD $0x8b48; BYTE $0x30     //    mov    rsi, QWORD [rax]
    LONG $0x16348b42             //    mov    esi, DWORD [rsi+r10]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x10708b4c             //    mov    r14, QWORD 16[rax]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x18708b4c             //    mov    r14, QWORD 24[rax]
    LONG $0x16340343             //    add    esi, DWORD [r14+r10]
    LONG $0x5859e2c5; BYTE $0x48 //    vmulss    xmm3, xmm3, DWORD 72[rax]
    LONG $0x2af2e1c4; BYTE $0xce //    vcvtsi2ss    xmm1, xmm1, rsi
    LONG $0x50708b48             //    mov    rsi, QWORD 80[rax]
    WORD $0x8548; BYTE $0xf6     //    test    rsi, rsi
    LONG $0x9961e2c4; WORD $0x2048 //    vfmadd132ss    xmm1, xmm3, DWORD 32[rax]
	  JE   L87
    LONG $0x58708b4c             //    mov    r14, QWORD 88[rax]
    LONG $0x16348b42             //    mov    esi, DWORD [rsi+r10]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x60708b4c             //    mov    r14, QWORD 96[rax]
    LONG $0x16342b43             //    sub    esi, DWORD [r14+r10]
    LONG $0x68708b4c             //    mov    r14, QWORD 104[rax]
    LONG $0x16340343             //    add    esi, DWORD [r14+r10]
    LONG $0x2ae2e1c4; BYTE $0xde //    vcvtsi2ss    xmm3, xmm3, rsi
    LONG $0xb961e2c4; WORD $0x7048 //    vfmadd231ss    xmm1, xmm3, DWORD 112[rax]
L87:
    LONG $0x5959eac5; BYTE $0x0c //    vmulss    xmm3, xmm2, DWORD 12[rcx]
    LONG $0xcb2ef8c5             //    vucomiss    xmm1, xmm3
    WORD $0x1948; BYTE $0xc0     //    sbb    rax, rax
    LONG $0x10c18348             //    add    rcx, 16
    LONG $0x08c78348             //    add    rdi, 8
    WORD $0xf748; BYTE $0xd0     //    not    rax
    WORD $0xe083; BYTE $0x04     //    and    eax, 4
    LONG $0x4458fac5; WORD $0xf807 //    vaddss    xmm0, xmm0, DWORD -8[rdi+rax]
    WORD $0x3948; BYTE $0xca     //    cmp    rdx, rcx
	  JA   L93
	  JMP  L229
L169:
    LONG $0xc057f8c5             //    vxorps    xmm0, xmm0, xmm0
    LONG $0x4b10fac5; BYTE $0xfb //    vmovss    xmm1, DWORD -5[rbx]
    LONG $0xc82ef8c5             //    vucomiss    xmm1, xmm0
	  JBE  L79
L242:
    WORD $0xf741; BYTE $0xdd     //    neg    r13d
    WORD $0xc031                 //    xor    eax, eax
    WORD $0x8545; BYTE $0xed     //    test    r13d, r13d
    WORD $0x9f0f; BYTE $0xd0     //    setg    al
L78:
    LONG $0xbc848942; LONG $0x00000180 //    mov    DWORD 384[rsp+r15*4], eax
    LONG $0x846ffdc5; LONG $0x00018024; BYTE $0x00 //    vmovdqa    ymm0, 384[rsp]
	  JMP  L66
L237:
    WORD $0x8948; BYTE $0xc1     //    mov    rcx, rax
	  JMP  L11
L239:
    LONG $0xc128f8c5             //    vmovaps    xmm0, xmm1
    LONG $0x5c117ac5; WORD $0x5824 //    vmovss    DWORD 88[rsp], xmm11
    LONG $0xb411fac5; LONG $0x0000e024; BYTE $0x00 //    vmovss    DWORD 224[rsp], xmm6
    LONG $0x64297cc5; WORD $0x6024 //    vmovaps     96[rsp], ymm12
    LONG $0x847f7dc5; LONG $0x00008024; BYTE $0x00 //    vmovdqa     128[rsp], ymm8
    LONG $0xac7f7dc5; LONG $0x0000a024; BYTE $0x00 //    vmovdqa     160[rsp], ymm13
    LONG $0x8c7f7dc5; LONG $0x0000c024; BYTE $0x00 //    vmovdqa     192[rsp], ymm9
    LONG $0x947f7dc5; LONG $0x00010024; BYTE $0x00 //    vmovdqa     256[rsp], ymm10
    WORD $0xf8c5; BYTE $0x77     //    vzeroupper
//    call    sqrtf@PLT
    LONG $0x5c107ac5; WORD $0x5824 //    vmovss    xmm11, DWORD 88[rsp]
    LONG $0xb410fac5; LONG $0x0000e024; BYTE $0x00 //    vmovss    xmm6, DWORD 224[rsp]
    LONG $0x64287cc5; WORD $0x6024 //    vmovaps    ymm12,  96[rsp]
    LONG $0x846f7dc5; LONG $0x00008024; BYTE $0x00 //    vmovdqa    ymm8,  128[rsp]
    LONG $0xac6f7dc5; LONG $0x0000a024; BYTE $0x00 //    vmovdqa    ymm13,  160[rsp]
    LONG $0x8c6f7dc5; LONG $0x0000c024; BYTE $0x00 //    vmovdqa    ymm9,  192[rsp]
    LONG $0x946f7dc5; LONG $0x00010024; BYTE $0x00 //    vmovdqa    ymm10,  256[rsp]
	  JMP  L113
L167:
    LONG $0x000006b8; BYTE $0x00 //    mov    eax, 6
    LONG $0x000006ba; BYTE $0x00 //    mov    edx, 6
	  JMP  L76
L166:
    LONG $0x000005b8; BYTE $0x00 //    mov    eax, 5
    LONG $0x000005ba; BYTE $0x00 //    mov    edx, 5
	  JMP  L76
L165:
    LONG $0x000004b8; BYTE $0x00 //    mov    eax, 4
    LONG $0x000004ba; BYTE $0x00 //    mov    edx, 4
	  JMP  L76
L164:
    LONG $0x000003b8; BYTE $0x00 //    mov    eax, 3
    LONG $0x000003ba; BYTE $0x00 //    mov    edx, 3
	  JMP  L76
L163:
    LONG $0x000002b8; BYTE $0x00 //    mov    eax, 2
    LONG $0x000002ba; BYTE $0x00 //    mov    edx, 2
	  JMP  L76
L162:
    LONG $0x000001b8; BYTE $0x00 //    mov    eax, 1
    LONG $0x000001ba; BYTE $0x00 //    mov    edx, 1
	  JMP  L76
                                 //


DATA LC1<>+0x000(SB)/8, $0x0405060700010203
DATA LC1<>+0x008(SB)/8, $0x0c0d0e0f08090a0b
GLOBL LC1<>(SB), 8, $16
