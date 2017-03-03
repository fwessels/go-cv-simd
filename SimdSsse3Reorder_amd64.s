//+build !noasm !appengine

// https://www.cs.uaf.edu/2011/fall/cs301/lecture/09_28_push_pop.html
// The standard 64-bit "function call interface" is:
//   Return value goes in eax (32-bit "int" return value) or rax (64-bit "long" return value).
//   The first function parameter goes into rdi (second parameter goes in rsi, then rdx, rcx, r8d, r9d, and then stranger places).
//   You can freely overwrite the values in rax, rcx, rdx, rsi, rdi, and r8-r11 (the "scratch" registers).
//   You can't change the values in rbx, rbp, rsp, and r12-r15 (the "saved" or "preserved" registers).

// void Reorder32bit(const uint8_t * src, size_t size, uint8_t * dst)

TEXT ·_SimdSsse3Reorder32bit(SB), 7, $0

    // Move golang parameters to 
    MOVQ   src+0(FP), DI           //     rdi = uint8_t * src
    MOVQ   size+8(FP), SI          // {e,r}si = size_t size
    MOVQ   dst+16(FP), DX          //     rdx = uint8_t * dst
    
    WORD $0x8949; BYTE $0xf1       //    mov    r9, rsi
    LONG $0xf0e18349               //    and    r9, -16
    JE    LBB0_8
                                   //    ## %.lr.ph5.i.preheader
    WORD $0x8949; BYTE $0xf0       //    mov    r8, rsi
    LONG $0xf0e08349               //    and    r8, -16
    WORD $0xff49; BYTE $0xc8       //    dec    r8
    WORD $0x8944; BYTE $0xc0       //    mov    eax, r8d
    WORD $0xe8c1; BYTE $0x04       //    shr    eax, 4
    WORD $0xc0ff                   //    inc    eax
    WORD $0xc931                   //    xor    ecx, ecx
    WORD $0x03a8                   //    test    al, 3
    JE    LBB0_4
                                   //    ## %.lr.ph5.i.prol.preheader
    WORD $0xf089                   //    mov    eax, esi
    WORD $0xe083; BYTE $0x30       //    and    eax, 48
    WORD $0xc8ff                   //    dec    eax
    WORD $0xe8c1; BYTE $0x04       //    shr    eax, 4
    WORD $0xc0ff                   //    inc    eax
    WORD $0xe083; BYTE $0x03       //    and    eax, 3
    WORD $0xf748; BYTE $0xd8       //    neg    rax
    WORD $0xc931                   //    xor    ecx, ecx
    LEAQ K256<>(SB), BP
    LONG $0x456ff9c5; BYTE $0x00   //    vmovdqa    xmm0, [rbp] /* [rip + LCPI0_0] ## xmm0 = [3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12] */
LBB0_3:                            //    ## =>This Inner Loop Header: Depth=1
    LONG $0x0c6ff9c5; BYTE $0x0f   //    vmovdqa    xmm1, [rdi + rcx]
    LONG $0x0071e2c4; BYTE $0xc8   //    vpshufb    xmm1, xmm1, xmm0
    LONG $0x0c7ff9c5; BYTE $0x0a   //    vmovdqa    [rdx + rcx], xmm1
    LONG $0x10c18348               //    add    rcx, 16
    WORD $0xff48; BYTE $0xc0       //    inc    rax
    JNE  LBB0_3
LBB0_4:                            //    ## %.lr.ph5.i.preheader.split
    LONG $0x30f88349               //    cmp    r8, 48
    JB   LBB0_8
    LEAQ K256<>(SB), BP
    LONG $0x456ff9c5; BYTE $0x00   //    vmovdqa    xmm0, [rbp] /* [rip + LCPI0_0] ## xmm0 = [3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12] */
LBB0_6:                            //    ## =>This Inner Loop Header: Depth=1
    LONG $0x0c6ff9c5; BYTE $0x0f   //    vmovdqa    xmm1, [rdi + rcx]
    LONG $0x0071e2c4; BYTE $0xc8   //    vpshufb    xmm1, xmm1, xmm0
    LONG $0x0c7ff9c5; BYTE $0x0a   //    vmovdqa    [rdx + rcx], xmm1
    LONG $0x4c6ff9c5; WORD $0x100f //    vmovdqa    xmm1, [rdi + rcx + 16]
    LONG $0x0071e2c4; BYTE $0xc8   //    vpshufb    xmm1, xmm1, xmm0
    LONG $0x4c7ff9c5; WORD $0x100a //    vmovdqa    [rdx + rcx + 16], xmm1
    LONG $0x4c6ff9c5; WORD $0x200f //    vmovdqa    xmm1, [rdi + rcx + 32]
    LONG $0x0071e2c4; BYTE $0xc8   //    vpshufb    xmm1, xmm1, xmm0
    LONG $0x4c7ff9c5; WORD $0x200a //    vmovdqa    [rdx + rcx + 32], xmm1
    LONG $0x4c6ff9c5; WORD $0x300f //    vmovdqa    xmm1, [rdi + rcx + 48]
    LONG $0x0071e2c4; BYTE $0xc8   //    vpshufb    xmm1, xmm1, xmm0
    LONG $0x4c7ff9c5; WORD $0x300a //    vmovdqa    [rdx + rcx + 48], xmm1
    LONG $0x40c18348               //    add        rcx, 64
    WORD $0x394c; BYTE $0xc9       //    cmp        rcx, r9
    JB   LBB0_6
    JMP  LBB0_8
LBB0_7:                            //    ##   in Loop: Header=BB0_8 Depth=1
    LONG $0x0f048b42               //    mov    eax, [rdi + r9]
    WORD $0xc80f                   //    bswap  eax
    LONG $0x0a048942               //    mov    [rdx + r9], eax
    LONG $0x04c18349               //    add    r9, 4
LBB0_8:                            //    ## =>This Inner Loop Header: Depth=1
    WORD $0x3949; BYTE $0xf1       //    cmp    r9, rsi
    JB   LBB0_7
    RET

DATA K256<>+0x000(SB)/8, $0x0405060700010203
DATA K256<>+0x008(SB)/8, $0x0c0d0e0f08090a0b
GLOBL K256<>(SB), 8, $16
