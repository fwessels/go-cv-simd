//+build !noasm !appengine

TEXT ·_SimdAvx2Detection(SB), 7, $0

	// Load golang parameters into respective parameters for standard 64-bit function call interface

	// Parameter 1: const HidHaarCascade & hid
	MOVQ hid+0(FP), DI // rdi = hid

	// Parameter 2: const Image & mask
	MOVQ mask+8(FP), SI // rsi = mask

	// Parameter 3: const Rect & rect
	MOVQ rect+16(FP), DX // rdx = rect

	// Parameter 4: Image & dst
	MOVQ dst+24(FP), CX // rcx = dst

	// Parameter 5: Buffer<uint32_t>* pbuffer
	MOVQ buffer+32(FP), R8 // r8 = buffer

	// Parameter 6: stack pointer
	MOVQ stack+40(FP), R9 // r9 = stack pointer

	// Setup base pointer for loading constants
	LEAQ LC1<>(SB), BP

	// Save golang stack pointer into first 8 bytes of temp stack, and advance new rsp beyond this
	MOVQ SP, (R9)
	MOVQ R9, SP
	ADDQ $8, SP

	///////////////////////////////////////////////////
	//
	//  I M P O R T E D   A S S E M B L Y
	//
	///////////////////////////////////////////////////
	LONG $0x2484894c; LONG $0x00000100 // mov    qword [rsp + 256], r8
	LONG $0x244c8948; BYTE $0x70       // mov    qword [rsp + 112], rcx
	LONG $0x24548948; BYTE $0x68       // mov    qword [rsp + 104], rdx
	LONG $0x24748948; BYTE $0x60       // mov    qword [rsp + 96], rsi
	LONG $0x24bc8948; LONG $0x000000b0 // mov    qword [rsp + 176], rdi
	LONG $0x08528b4c                   // mov    r10, qword [rdx + 8]
	LONG $0x18523b4c                   // cmp    r10, qword [rdx + 24]
	JGE  LBB0_152
	LONG $0x104a8b48                   // mov    rcx, qword [rdx + 16]
	WORD $0x8b4c; BYTE $0x0a           // mov    r9, qword [rdx]
	LONG $0x8d348d48; LONG $0xfffffffe // lea    rsi, [4*rcx - 2]
	LONG $0x8d1c8d4c; LONG $0xffffffff // lea    r11, [4*rcx - 1]
	WORD $0x294c; BYTE $0xc9           // sub    rcx, r9
	LONG $0x248c8948; LONG $0x00000120 // mov    qword [rsp + 288], rcx
	WORD $0x8948; BYTE $0xcb           // mov    rbx, rcx
	LONG $0xf8e38348                   // and    rbx, -8
	LONG $0x249c8948; LONG $0x000000a8 // mov    qword [rsp + 168], rbx
	WORD $0x8948; BYTE $0xc8           // mov    rax, rcx
	LONG $0xfee08348                   // and    rax, -2
	LONG $0x24448948; BYTE $0x78       // mov    qword [rsp + 120], rax
	WORD $0x8948; BYTE $0xca           // mov    rdx, rcx
	LONG $0xe0e28348                   // and    rdx, -32
	LONG $0x24548948; BYTE $0x58       // mov    qword [rsp + 88], rdx
	LONG $0x8d0c8d48; LONG $0x00000000 // lea    rcx, [4*rcx]
	LONG $0x248c8948; LONG $0x00000088 // mov    qword [rsp + 136], rcx
	WORD $0x8948; BYTE $0xd9           // mov    rcx, rbx
	LONG $0x02c98348                   // or    rcx, 2
	LONG $0x244c8948; BYTE $0x50       // mov    qword [rsp + 80], rcx
	LONG $0xf8408d48                   // lea    rax, [rax - 8]
	LONG $0x24448948; BYTE $0x18       // mov    qword [rsp + 24], rax
	LONG $0x8d048d4a; LONG $0x00000000 // lea    rax, [4*r9]
	WORD $0x2948; BYTE $0xc6           // sub    rsi, rax
	LONG $0x24748948; BYTE $0x30       // mov    qword [rsp + 48], rsi
	WORD $0x2949; BYTE $0xc3           // sub    r11, rax
	LONG $0x245c894c; BYTE $0x48       // mov    qword [rsp + 72], r11
	WORD $0xeed1                       // shr    esi, 1
	WORD $0xc6ff                       // inc    esi
	WORD $0xe683; BYTE $0x06           // and    esi, 6
	LONG $0x24748948; BYTE $0x28       // mov    qword [rsp + 40], rsi
	WORD $0xd141; BYTE $0xeb           // shr    r11d, 1
	WORD $0xff41; BYTE $0xc3           // inc    r11d
	LONG $0x06e38341                   // and    r11d, 6
	LONG $0x245c894c; BYTE $0x40       // mov    qword [rsp + 64], r11
	WORD $0xf748; BYTE $0xde           // neg    rsi
	LONG $0x24748948; BYTE $0x20       // mov    qword [rsp + 32], rsi
	WORD $0xf749; BYTE $0xdb           // neg    r11
	LONG $0x245c894c; BYTE $0x38       // mov    qword [rsp + 56], r11
	LONG $0x597de2c4; WORD $0x0845     // vpbroadcastq    ymm0, qword 0x008[rbp] /* [rip + LCPI0_2] */
	LONG $0xc9eff5c5                   // vpxor    ymm1, ymm1, ymm1
	LONG $0x187d62c4; WORD $0x404d     // vbroadcastss    ymm9, dword 0x040[rbp] /* [rip + LCPI0_3] */
	LONG $0x5d107ac5; BYTE $0x40       // vmovss    xmm11, dword 0x040[rbp] /* [rip + LCPI0_3] */
	LONG $0x572841c4; BYTE $0xd2       // vxorps    xmm10, xmm10, xmm10
	LONG $0x6d6f7ac5; BYTE $0x00       // vmovdqu    xmm13, 0x000[rbp] /* [rip + LCPI0_0] */
	LONG $0x756ffdc5; BYTE $0x20       // vmovdqa    ymm6, 0x020[rbp] /* [rip + LCPI0_1] */

	JMP LBB0_2

LBB0_151:
	WORD $0x8b4d; BYTE $0x0b // mov    r9, qword [r11]

LBB0_2:
	LONG $0xf8878b48; WORD $0x0000; BYTE $0x00 // mov    rax, qword [rdi + 248]
	LONG $0xc2af0f49                           // imul    rax, r10
	LONG $0x24848948; LONG $0x00000108         // mov    qword [rsp + 264], rax
	LONG $0x28878b48; WORD $0x0001; BYTE $0x00 // mov    rax, qword [rdi + 296]
	LONG $0xc2af0f49                           // imul    rax, r10
	LONG $0x24848948; LONG $0x00000118         // mov    qword [rsp + 280], rax
	LONG $0x24448b48; BYTE $0x60               // mov    rax, qword [rsp + 96]
	LONG $0x20708b4c                           // mov    r14, qword [rax + 32]
	LONG $0x10708b48                           // mov    rsi, qword [rax + 16]
	LONG $0xf2af0f49                           // imul    rsi, r10
	WORD $0x8b4d; BYTE $0x18                   // mov    r11, qword [r8]
	WORD $0x8548; BYTE $0xd2                   // test    rdx, rdx
	JE   LBB0_5
	LONG $0x313c8d49                           // lea    rdi, [r9 + rsi]
	WORD $0x014c; BYTE $0xf7                   // add    rdi, r14
	WORD $0x894c; BYTE $0xd9                   // mov    rcx, r11
	WORD $0xc031                               // xor    eax, eax

LBB0_4:
	LONG $0x597dc2c4; BYTE $0xd5   // vpbroadcastq    ymm2, xmm13
	LONG $0x14dbedc5; BYTE $0x07   // vpand    ymm2, ymm2, [rdi + rax]
	LONG $0x364de2c4; BYTE $0xd2   // vpermd    ymm2, ymm6, ymm2
	LONG $0xd960edc5               // vpunpcklbw    ymm3, ymm2, ymm1
	LONG $0xe061e5c5               // vpunpcklwd    ymm4, ymm3, ymm0
	LONG $0x0e5de3c4; WORD $0xaae1 // vpblendw    ymm4, ymm4, ymm1, 170
	LONG $0x217ffec5               // vmovdqu    [rcx], ymm4
	LONG $0xd869e5c5               // vpunpckhwd    ymm3, ymm3, ymm0
	LONG $0x0e65e3c4; WORD $0xaad9 // vpblendw    ymm3, ymm3, ymm1, 170
	LONG $0x597ffec5; BYTE $0x20   // vmovdqu    [rcx + 32], ymm3
	LONG $0xd168edc5               // vpunpckhbw    ymm2, ymm2, ymm1
	LONG $0xd861edc5               // vpunpcklwd    ymm3, ymm2, ymm0
	LONG $0x0e65e3c4; WORD $0xaad9 // vpblendw    ymm3, ymm3, ymm1, 170
	LONG $0x597ffec5; BYTE $0x40   // vmovdqu    [rcx + 64], ymm3
	LONG $0xd069edc5               // vpunpckhwd    ymm2, ymm2, ymm0
	LONG $0x0e6de3c4; WORD $0xaad1 // vpblendw    ymm2, ymm2, ymm1, 170
	LONG $0x517ffec5; BYTE $0x60   // vmovdqu    [rcx + 96], ymm2
	LONG $0x20c08348               // add    rax, 32
	LONG $0x80e98348               // sub    rcx, -128
	WORD $0x3948; BYTE $0xd0       // cmp    rax, rdx
	JB   LBB0_4

LBB0_5:
	LONG $0x24943b48; LONG $0x00000120         // cmp    rdx, qword [rsp + 288]
	JE   LBB0_7
	WORD $0x0149; BYTE $0xf6                   // add    r14, rsi
	WORD $0x014d; BYTE $0xce                   // add    r14, r9
	LONG $0x597dc2c4; BYTE $0xd5               // vpbroadcastq    ymm2, xmm13
	LONG $0x24848b48; LONG $0x00000120         // mov    rax, qword [rsp + 288]
	LONG $0xdb6dc1c4; WORD $0x0654; BYTE $0xe0 // vpand    ymm2, ymm2, [r14 + rax - 32]
	LONG $0x364de2c4; BYTE $0xd2               // vpermd    ymm2, ymm6, ymm2
	LONG $0xd960edc5                           // vpunpcklbw    ymm3, ymm2, ymm1
	LONG $0xe061e5c5                           // vpunpcklwd    ymm4, ymm3, ymm0
	LONG $0x0e5de3c4; WORD $0xaae1             // vpblendw    ymm4, ymm4, ymm1, 170
	LONG $0x7f7ec1c4; WORD $0x8364; BYTE $0x80 // vmovdqu    [r11 + 4*rax - 128], ymm4
	LONG $0xd869e5c5                           // vpunpckhwd    ymm3, ymm3, ymm0
	LONG $0x0e65e3c4; WORD $0xaad9             // vpblendw    ymm3, ymm3, ymm1, 170
	LONG $0x7f7ec1c4; WORD $0x835c; BYTE $0xa0 // vmovdqu    [r11 + 4*rax - 96], ymm3
	LONG $0xd168edc5                           // vpunpckhbw    ymm2, ymm2, ymm1
	LONG $0xd861edc5                           // vpunpcklwd    ymm3, ymm2, ymm0
	LONG $0x0e65e3c4; WORD $0xaad9             // vpblendw    ymm3, ymm3, ymm1, 170
	LONG $0x7f7ec1c4; WORD $0x835c; BYTE $0xc0 // vmovdqu    [r11 + 4*rax - 64], ymm3
	LONG $0xd069edc5                           // vpunpckhwd    ymm2, ymm2, ymm0
	LONG $0x0e6de3c4; WORD $0xaad1             // vpblendw    ymm2, ymm2, ymm1, 170
	LONG $0x7f7ec1c4; WORD $0x8354; BYTE $0xe0 // vmovdqu    [r11 + 4*rax - 32], ymm2

LBB0_7:
	LONG $0x24848b48; LONG $0x00000088 // mov    rax, qword [rsp + 136]
	LONG $0x02f88348                   // cmp    rax, 2
	JB   LBB0_11
	WORD $0x8948; BYTE $0xc6           // mov    rsi, rax
	LONG $0x08488b49                   // mov    rcx, qword [r8 + 8]
	LONG $0x24448b48; BYTE $0x20       // mov    rax, qword [rsp + 32]
	LONG $0x000001ba; BYTE $0x00       // mov    edx, 1
	LONG $0x247c8348; WORD $0x0028     // cmp    qword [rsp + 40], 0
	JE   LBB0_10

LBB0_9:
	LONG $0x009104c7; WORD $0x0000; BYTE $0x00 // mov    dword [rcx + 4*rdx], 0
	LONG $0x02c28348                           // add    rdx, 2
	WORD $0xff48; BYTE $0xc0                   // inc    rax
	JNE  LBB0_9

LBB0_10:
	LONG $0x247c8348; WORD $0x0e30 // cmp    qword [rsp + 48], 14
	WORD $0x8948; BYTE $0xf0       // mov    rax, rsi
	JB   LBB0_11

LBB0_153:
	LONG $0x009104c7; WORD $0x0000; BYTE $0x00 // mov    dword [rcx + 4*rdx], 0
	LONG $0x089144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 8], 0
	LONG $0x109144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 16], 0
	LONG $0x189144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 24], 0
	LONG $0x209144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 32], 0
	LONG $0x289144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 40], 0
	LONG $0x309144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 48], 0
	LONG $0x389144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 56], 0
	LONG $0x10c28348                           // add    rdx, 16
	WORD $0x3948; BYTE $0xc2                   // cmp    rdx, rax
	JB   LBB0_153

LBB0_11:
	LONG $0x24acc148; LONG $0x00000108; BYTE $0x02 // shr    qword [rsp + 264], 2
	LONG $0x24acc148; LONG $0x00000118; BYTE $0x02 // shr    qword [rsp + 280], 2
	WORD $0x8548; BYTE $0xc0                       // test    rax, rax
	JE   LBB0_15
	WORD $0x8948; BYTE $0xc6                       // mov    rsi, rax
	LONG $0x08488b49                               // mov    rcx, qword [r8 + 8]
	LONG $0x24448b48; BYTE $0x38                   // mov    rax, qword [rsp + 56]
	LONG $0x000000ba; BYTE $0x00                   // mov    edx, 0
	LONG $0x247c8348; WORD $0x0040                 // cmp    qword [rsp + 64], 0
	JE   LBB0_14

LBB0_13:
	LONG $0x009104c7; WORD $0x0000; BYTE $0x00 // mov    dword [rcx + 4*rdx], 0
	LONG $0x02c28348                           // add    rdx, 2
	WORD $0xff48; BYTE $0xc0                   // inc    rax
	JNE  LBB0_13

LBB0_14:
	LONG $0x247c8348; WORD $0x0e48 // cmp    qword [rsp + 72], 14
	WORD $0x8948; BYTE $0xf0       // mov    rax, rsi
	JB   LBB0_15

LBB0_154:
	LONG $0x009104c7; WORD $0x0000; BYTE $0x00 // mov    dword [rcx + 4*rdx], 0
	LONG $0x089144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 8], 0
	LONG $0x109144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 16], 0
	LONG $0x189144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 24], 0
	LONG $0x209144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 32], 0
	LONG $0x289144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 40], 0
	LONG $0x309144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 48], 0
	LONG $0x389144c7; LONG $0x00000000         // mov    dword [rcx + 4*rdx + 56], 0
	LONG $0x10c28348                           // add    rdx, 16
	WORD $0x3948; BYTE $0xc2                   // cmp    rdx, rax
	JB   LBB0_154

LBB0_15:
	LONG $0x24848948; LONG $0x00000088 // mov    qword [rsp + 136], rax
	LONG $0x2494894c; LONG $0x00000080 // mov    qword [rsp + 128], r10
	LONG $0x248c014c; LONG $0x00000108 // add    qword [rsp + 264], r9
	LONG $0x248c014c; LONG $0x00000118 // add    qword [rsp + 280], r9
	LONG $0x000000be; BYTE $0x00       // mov    esi, 0
	LONG $0x000000bf; BYTE $0x00       // mov    edi, 0
	WORD $0x8548; BYTE $0xdb           // test    rbx, rbx
	JE   LBB0_69

LBB0_16:
	WORD $0x8b49; BYTE $0x00                       // mov    rax, qword [r8]
	LONG $0x3c6ffec5; BYTE $0xb0                   // vmovdqu    ymm7, [rax + 4*rsi]
	LONG $0x177de2c4; BYTE $0xf8                   // vptest    ymm7, ymm0
	JE   LBB0_67
	LONG $0x249c8b48; LONG $0x000000b0             // mov    rbx, qword [rsp + 176]
	LONG $0x586b8b4c                               // mov    r13, qword [rbx + 88]
	LONG $0x24ac894c; LONG $0x00000128             // mov    qword [rsp + 296], r13
	LONG $0x60438b48                               // mov    rax, qword [rbx + 96]
	WORD $0x294c; BYTE $0xe8                       // sub    rax, r13
	LONG $0x04e8c148                               // shr    rax, 4
	WORD $0xc085                                   // test    eax, eax
	JLE  LBB0_18
	LONG $0x248c8b48; LONG $0x00000118             // mov    rcx, qword [rsp + 280]
	LONG $0x0e0c8d48                               // lea    rcx, [rsi + rcx]
	LONG $0x187de2c4; LONG $0x0000a093; BYTE $0x00 // vbroadcastss    ymm2, dword [rbx + 160]
	LONG $0xc8938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 200]
	LONG $0x1c6ffec5; BYTE $0x8a                   // vmovdqu    ymm3, [rdx + 4*rcx]
	LONG $0xd0938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 208]
	LONG $0xd8838b4c; WORD $0x0000; BYTE $0x00     // mov    r8, qword [rbx + 216]
	LONG $0xe0bb8b48; WORD $0x0000; BYTE $0x00     // mov    rdi, qword [rbx + 224]
	LONG $0x1cfae5c5; BYTE $0x8a                   // vpsubd    ymm3, ymm3, [rdx + 4*rcx]
	LONG $0xfa65c1c4; WORD $0x881c                 // vpsubd    ymm3, ymm3, [r8 + 4*rcx]
	LONG $0x1cfee5c5; BYTE $0x8f                   // vpaddd    ymm3, ymm3, [rdi + 4*rcx]
	LONG $0xdb5bfcc5                               // vcvtdq2ps    ymm3, ymm3
	LONG $0xa8938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 168]
	LONG $0x246ffec5; BYTE $0x8a                   // vmovdqu    ymm4, [rdx + 4*rcx]
	LONG $0xb0938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 176]
	LONG $0xb8838b4c; WORD $0x0000; BYTE $0x00     // mov    r8, qword [rbx + 184]
	LONG $0xc0bb8b48; WORD $0x0000; BYTE $0x00     // mov    rdi, qword [rbx + 192]
	LONG $0x24faddc5; BYTE $0x8a                   // vpsubd    ymm4, ymm4, [rdx + 4*rcx]
	LONG $0xfa5dc1c4; WORD $0x8824                 // vpsubd    ymm4, ymm4, [r8 + 4*rcx]
	LONG $0x24feddc5; BYTE $0x8f                   // vpaddd    ymm4, ymm4, [rdi + 4*rcx]
	LONG $0xe45bfcc5                               // vcvtdq2ps    ymm4, ymm4
	LONG $0xd459ecc5                               // vmulps    ymm2, ymm2, ymm4
	LONG $0xdb59e4c5                               // vmulps    ymm3, ymm3, ymm3
	LONG $0xd35cecc5                               // vsubps    ymm2, ymm2, ymm3
	LONG $0xd9c2ecc5; BYTE $0x1e                   // vcmpgt_oqps    ymm3, ymm2, ymm1
	LONG $0xd354ecc5                               // vandps    ymm2, ymm2, ymm3
	LONG $0x5564c1c4; BYTE $0xd9                   // vandnps    ymm3, ymm3, ymm9
	LONG $0xd356ecc5                               // vorps    ymm2, ymm2, ymm3
	LONG $0xc2517cc5                               // vsqrtps    ymm8, ymm2
	LONG $0x248c8b48; LONG $0x00000108             // mov    rcx, qword [rsp + 264]
	LONG $0x0e348d4c                               // lea    r14, [rsi + rcx]
	LONG $0x24b48948; LONG $0x00000110             // mov    qword [rsp + 272], rsi
	LONG $0x285b8b4c                               // mov    r11, qword [rbx + 40]
	LONG $0x704b8b48                               // mov    rcx, qword [rbx + 112]
	LONG $0x248c8948; LONG $0x00000138             // mov    qword [rsp + 312], rcx
	WORD $0x6348; BYTE $0xf8                       // movsxd    rdi, eax
	LONG $0x24bc8948; LONG $0x00000130             // mov    qword [rsp + 304], rdi
	LONG $0x889b8b48; WORD $0x0000; BYTE $0x00     // mov    rbx, qword [rbx + 136]
	WORD $0x3145; BYTE $0xc0                       // xor    r8d, r8d

LBB0_20:
	WORD $0x894d; BYTE $0xc4           // mov    r12, r8
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x257c8043; WORD $0x000d     // cmp    byte [r13 + r12 + 13], 0
	JNE  LBB0_57
	LONG $0x2574634b; BYTE $0x04       // movsxd    rsi, dword [r13 + r12 + 4]
	WORD $0x8949; BYTE $0xf1           // mov    r9, rsi
	LONG $0x04e1c149                   // shl    r9, 4
	WORD $0x014d; BYTE $0xd9           // add    r9, r11
	LONG $0x257c8043; WORD $0x000c     // cmp    byte [r13 + r12 + 12], 0
	JE   LBB0_28
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_33
	LONG $0x10538d4d                   // lea    r10, [r11 + 16]
	WORD $0x394d; BYTE $0xd1           // cmp    r9, r10
	WORD $0x894d; BYTE $0xd7           // mov    r15, r10
	LONG $0xf9470f4d                   // cmova    r15, r9
	WORD $0x294d; BYTE $0xdf           // sub    r15, r11
	WORD $0xff49; BYTE $0xcf           // dec    r15
	LONG $0x04efc149                   // shr    r15, 4
	LONG $0x24848b48; LONG $0x00000138 // mov    rax, qword [rsp + 312]
	LONG $0x04788d48                   // lea    rdi, [rax + 4]
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_24:
	WORD $0x6349; BYTE $0x33                   // movsxd    rsi, dword [r11]
	LONG $0x78f66b48                           // imul    rsi, rsi, 120
	LONG $0x330c8b48                           // mov    rcx, qword [rbx + rsi]
	LONG $0x33448b48; BYTE $0x08               // mov    rax, qword [rbx + rsi + 8]
	LONG $0x6f7ea1c4; WORD $0xb114             // vmovdqu    ymm2, [rcx + 4*r14]
	LONG $0x334c8b48; BYTE $0x10               // mov    rcx, qword [rbx + rsi + 16]
	LONG $0x33548b48; BYTE $0x18               // mov    rdx, qword [rbx + rsi + 24]
	LONG $0xfa6da1c4; WORD $0xb014             // vpsubd    ymm2, ymm2, [rax + 4*r14]
	LONG $0xfa6da1c4; WORD $0xb114             // vpsubd    ymm2, ymm2, [rcx + 4*r14]
	LONG $0xfe6da1c4; WORD $0xb214             // vpaddd    ymm2, ymm2, [rdx + 4*r14]
	LONG $0xd25bfcc5                           // vcvtdq2ps    ymm2, ymm2
	LONG $0x187de2c4; WORD $0x3364; BYTE $0x20 // vbroadcastss    ymm4, dword [rbx + rsi + 32]
	LONG $0xd459ecc5                           // vmulps    ymm2, ymm2, ymm4
	LONG $0x33448b48; BYTE $0x28               // mov    rax, qword [rbx + rsi + 40]
	LONG $0x6f7ea1c4; WORD $0xb024             // vmovdqu    ymm4, [rax + 4*r14]
	LONG $0x33448b48; BYTE $0x30               // mov    rax, qword [rbx + rsi + 48]
	LONG $0x334c8b48; BYTE $0x38               // mov    rcx, qword [rbx + rsi + 56]
	LONG $0x33548b48; BYTE $0x40               // mov    rdx, qword [rbx + rsi + 64]
	LONG $0xfa5da1c4; WORD $0xb024             // vpsubd    ymm4, ymm4, [rax + 4*r14]
	LONG $0xfa5da1c4; WORD $0xb124             // vpsubd    ymm4, ymm4, [rcx + 4*r14]
	LONG $0xfe5da1c4; WORD $0xb224             // vpaddd    ymm4, ymm4, [rdx + 4*r14]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x3364; BYTE $0x48 // vbroadcastss    ymm12, dword [rbx + rsi + 72]
	LONG $0x595cc1c4; BYTE $0xe4               // vmulps    ymm4, ymm4, ymm12
	LONG $0xd458ecc5                           // vaddps    ymm2, ymm2, ymm4
	LONG $0x336c8b4c; BYTE $0x50               // mov    r13, qword [rbx + rsi + 80]
	WORD $0x854d; BYTE $0xed                   // test    r13, r13
	JE   LBB0_26
	LONG $0x6f7e81c4; WORD $0xb564; BYTE $0x00 // vmovdqu    ymm4, [r13 + 4*r14]
	LONG $0x33448b48; BYTE $0x58               // mov    rax, qword [rbx + rsi + 88]
	LONG $0x334c8b48; BYTE $0x60               // mov    rcx, qword [rbx + rsi + 96]
	LONG $0x33548b48; BYTE $0x68               // mov    rdx, qword [rbx + rsi + 104]
	LONG $0xfa5da1c4; WORD $0xb024             // vpsubd    ymm4, ymm4, [rax + 4*r14]
	LONG $0xfa5da1c4; WORD $0xb124             // vpsubd    ymm4, ymm4, [rcx + 4*r14]
	LONG $0xfe5da1c4; WORD $0xb224             // vpaddd    ymm4, ymm4, [rdx + 4*r14]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x3364; BYTE $0x70 // vbroadcastss    ymm12, dword [rbx + rsi + 112]
	LONG $0x595cc1c4; BYTE $0xe4               // vmulps    ymm4, ymm4, ymm12
	LONG $0xd458ecc5                           // vaddps    ymm2, ymm2, ymm4

LBB0_26:
	LONG $0x187dc2c4; WORD $0x0c63     // vbroadcastss    ymm4, dword [r11 + 12]
	LONG $0xe459bcc5                   // vmulps    ymm4, ymm8, ymm4
	LONG $0xd2c2dcc5; BYTE $0x1e       // vcmpgt_oqps    ymm2, ymm4, ymm2
	LONG $0x187de2c4; BYTE $0x27       // vbroadcastss    ymm4, dword [rdi]
	LONG $0x187d62c4; WORD $0xfc67     // vbroadcastss    ymm12, dword [rdi - 4]
	LONG $0x4a5dc3c4; WORD $0x20d4     // vblendvps    ymm2, ymm4, ymm12, ymm2
	LONG $0xda58e4c5                   // vaddps    ymm3, ymm3, ymm2
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c38349                   // add    r11, 16
	WORD $0x394d; BYTE $0xcb           // cmp    r11, r9
	JB   LBB0_24
	LONG $0x24848b48; LONG $0x00000138 // mov    rax, qword [rsp + 312]
	LONG $0xf8448d4a; BYTE $0x08       // lea    rax, [rax + 8*r15 + 8]
	LONG $0x24848948; LONG $0x00000138 // mov    qword [rsp + 312], rax
	LONG $0x04e7c149                   // shl    r15, 4
	WORD $0x014d; BYTE $0xfa           // add    r10, r15
	WORD $0x894d; BYTE $0xd3           // mov    r11, r10
	LONG $0x24ac8b4c; LONG $0x00000128 // mov    r13, qword [rsp + 296]
	JMP  LBB0_32

LBB0_28:
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_33
	LONG $0x10538d4d                   // lea    r10, [r11 + 16]
	WORD $0x394d; BYTE $0xd1           // cmp    r9, r10
	WORD $0x894d; BYTE $0xd7           // mov    r15, r10
	LONG $0xf9470f4d                   // cmova    r15, r9
	WORD $0x294d; BYTE $0xdf           // sub    r15, r11
	WORD $0xff49; BYTE $0xcf           // dec    r15
	LONG $0x04efc149                   // shr    r15, 4
	LONG $0x24848b48; LONG $0x00000138 // mov    rax, qword [rsp + 312]
	LONG $0x04788d48                   // lea    rdi, [rax + 4]
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_30:
	WORD $0x6349; BYTE $0x0b                   // movsxd    rcx, dword [r11]
	LONG $0x78c96b48                           // imul    rcx, rcx, 120
	LONG $0x0b148b48                           // mov    rdx, qword [rbx + rcx]
	LONG $0x0b748b48; BYTE $0x08               // mov    rsi, qword [rbx + rcx + 8]
	LONG $0x6f7ea1c4; WORD $0xb214             // vmovdqu    ymm2, [rdx + 4*r14]
	LONG $0x0b548b48; BYTE $0x10               // mov    rdx, qword [rbx + rcx + 16]
	LONG $0x0b448b48; BYTE $0x18               // mov    rax, qword [rbx + rcx + 24]
	LONG $0xfa6da1c4; WORD $0xb614             // vpsubd    ymm2, ymm2, [rsi + 4*r14]
	LONG $0xfa6da1c4; WORD $0xb214             // vpsubd    ymm2, ymm2, [rdx + 4*r14]
	LONG $0xfe6da1c4; WORD $0xb014             // vpaddd    ymm2, ymm2, [rax + 4*r14]
	LONG $0xd25bfcc5                           // vcvtdq2ps    ymm2, ymm2
	LONG $0x187de2c4; WORD $0x0b64; BYTE $0x20 // vbroadcastss    ymm4, dword [rbx + rcx + 32]
	LONG $0xd459ecc5                           // vmulps    ymm2, ymm2, ymm4
	LONG $0x0b448b48; BYTE $0x28               // mov    rax, qword [rbx + rcx + 40]
	LONG $0x6f7ea1c4; WORD $0xb024             // vmovdqu    ymm4, [rax + 4*r14]
	LONG $0x0b448b48; BYTE $0x30               // mov    rax, qword [rbx + rcx + 48]
	LONG $0x0b548b48; BYTE $0x38               // mov    rdx, qword [rbx + rcx + 56]
	LONG $0x0b748b48; BYTE $0x40               // mov    rsi, qword [rbx + rcx + 64]
	LONG $0xfa5da1c4; WORD $0xb024             // vpsubd    ymm4, ymm4, [rax + 4*r14]
	LONG $0xfa5da1c4; WORD $0xb224             // vpsubd    ymm4, ymm4, [rdx + 4*r14]
	LONG $0xfe5da1c4; WORD $0xb624             // vpaddd    ymm4, ymm4, [rsi + 4*r14]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x0b64; BYTE $0x48 // vbroadcastss    ymm12, dword [rbx + rcx + 72]
	LONG $0x595cc1c4; BYTE $0xe4               // vmulps    ymm4, ymm4, ymm12
	LONG $0xd458ecc5                           // vaddps    ymm2, ymm2, ymm4
	LONG $0x187dc2c4; WORD $0x0c63             // vbroadcastss    ymm4, dword [r11 + 12]
	LONG $0xe459bcc5                           // vmulps    ymm4, ymm8, ymm4
	LONG $0xd2c2dcc5; BYTE $0x1e               // vcmpgt_oqps    ymm2, ymm4, ymm2
	LONG $0x187de2c4; BYTE $0x27               // vbroadcastss    ymm4, dword [rdi]
	LONG $0x187d62c4; WORD $0xfc67             // vbroadcastss    ymm12, dword [rdi - 4]
	LONG $0x4a5dc3c4; WORD $0x20d4             // vblendvps    ymm2, ymm4, ymm12, ymm2
	LONG $0xda58e4c5                           // vaddps    ymm3, ymm3, ymm2
	LONG $0x08c78348                           // add    rdi, 8
	LONG $0x10c38349                           // add    r11, 16
	WORD $0x394d; BYTE $0xcb                   // cmp    r11, r9
	JB   LBB0_30
	LONG $0x24848b48; LONG $0x00000138         // mov    rax, qword [rsp + 312]
	LONG $0xf8448d4a; BYTE $0x08               // lea    rax, [rax + 8*r15 + 8]
	LONG $0x24848948; LONG $0x00000138         // mov    qword [rsp + 312], rax
	LONG $0x04e7c149                           // shl    r15, 4
	WORD $0x014d; BYTE $0xfa                   // add    r10, r15
	WORD $0x894d; BYTE $0xd3                   // mov    r11, r10

LBB0_32:
	LONG $0x24bc8b48; LONG $0x00000130 // mov    rdi, qword [rsp + 304]

LBB0_33:
	LONG $0x187d82c4; WORD $0x2554; BYTE $0x08 // vbroadcastss    ymm2, dword [r13 + r12 + 8]
	LONG $0xd3c2ecc5; BYTE $0x1e               // vcmpgt_oqps    ymm2, ymm2, ymm3
	LONG $0xff55ecc5                           // vandnps    ymm7, ymm2, ymm7
	LONG $0xd1f6c5c5                           // vpsadbw    ymm2, ymm7, ymm1
	LONG $0xd07ef9c5                           // vmovd    eax, xmm2
	LONG $0x1679e3c4; WORD $0x02d1             // vpextrd    ecx, xmm2, 2
	WORD $0xc101                               // add    ecx, eax
	LONG $0x397de3c4; WORD $0x01d2             // vextracti128    xmm2, ymm2, 1
	LONG $0xd27ef9c5                           // vmovd    edx, xmm2
	WORD $0xca01                               // add    edx, ecx
	LONG $0x1679e3c4; WORD $0x02d0             // vpextrd    eax, xmm2, 2
	WORD $0xd001                               // add    eax, edx
	JE   LBB0_66
	WORD $0xf883; BYTE $0x01                   // cmp    eax, 1
	JE   LBB0_35

LBB0_57:
	WORD $0xff49; BYTE $0xc0 // inc    r8
	WORD $0x3949; BYTE $0xf8 // cmp    r8, rdi
	JL   LBB0_20
	JMP  LBB0_66

LBB0_18:
	LONG $0x24b48948; LONG $0x00000110 // mov    qword [rsp + 272], rsi
	JMP  LBB0_66

LBB0_35:
	LONG $0xbc29fcc5; LONG $0x00016024; BYTE $0x00   // vmovaps    [rsp + 352], ymm7
	LONG $0x84297cc5; LONG $0x00014024; BYTE $0x00   // vmovaps    [rsp + 320], ymm8
	LONG $0x7ef9e1c4; BYTE $0xf9                     // vmovq    rcx, xmm7
	LONG $0x24848d48; LONG $0x00000160               // lea    rax, [rsp + 352]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000000b8; BYTE $0x00                     // mov    eax, 0
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_37
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x00000164               // lea    rax, [rsp + 356]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000001b8; BYTE $0x00                     // mov    eax, 1
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_37
	LONG $0x16f9e3c4; WORD $0x01f9                   // vpextrq    rcx, xmm7, 1
	LONG $0x24848d48; LONG $0x00000168               // lea    rax, [rsp + 360]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000002b8; BYTE $0x00                     // mov    eax, 2
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_37
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x0000016c               // lea    rax, [rsp + 364]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000003b8; BYTE $0x00                     // mov    eax, 3
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_37
	LONG $0x397de3c4; WORD $0x01fa                   // vextracti128    xmm2, ymm7, 1
	LONG $0x7ef9e1c4; BYTE $0xd1                     // vmovq    rcx, xmm2
	LONG $0x24848d48; LONG $0x00000170               // lea    rax, [rsp + 368]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000004b8; BYTE $0x00                     // mov    eax, 4
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_37
	WORD $0x8948; BYTE $0xca                         // mov    rdx, rcx
	LONG $0x20eac148                                 // shr    rdx, 32
	LONG $0x24848d48; LONG $0x00000174               // lea    rax, [rsp + 372]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000005b8; BYTE $0x00                     // mov    eax, 5
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_37
	LONG $0x16f9e3c4; WORD $0x01d2                   // vpextrq    rdx, xmm2, 1
	LONG $0x24848d48; LONG $0x00000178               // lea    rax, [rsp + 376]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000006b8; BYTE $0x00                     // mov    eax, 6
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_37
	WORD $0x8948; BYTE $0xd0                         // mov    rax, rdx
	LONG $0x0000be48; LONG $0x00010000; WORD $0x0000 // mov    rsi, 4294967296
	WORD $0x3148; BYTE $0xf0                         // xor    rax, rsi
	LONG $0x20eac148                                 // shr    rdx, 32
	WORD $0x940f; BYTE $0xd2                         // sete    dl
	WORD $0x0948; BYTE $0xc1                         // or    rcx, rax
	JNE  LBB0_65
	WORD $0xd231                                     // xor    edx, edx

LBB0_65:
	LONG $0x24848d48; LONG $0x0000017c // lea    rax, [rsp + 380]
	WORD $0x8948; BYTE $0xc7           // mov    rdi, rax
	LONG $0x000007b8; BYTE $0x00       // mov    eax, 7
	WORD $0xd284                       // test    dl, dl
	JNE  LBB0_66

LBB0_37:
	LONG $0x01488d41                               // lea    ecx, [r8 + 1]
	LONG $0x24948b48; LONG $0x000000b0             // mov    rdx, qword [rsp + 176]
	LONG $0x587a8b4c                               // mov    r15, qword [rdx + 88]
	LONG $0x60728b48                               // mov    rsi, qword [rdx + 96]
	WORD $0x294c; BYTE $0xfe                       // sub    rsi, r15
	LONG $0x04eec148                               // shr    rsi, 4
	LONG $0x000001bb; BYTE $0x00                   // mov    ebx, 1
	WORD $0xce39                                   // cmp    esi, ecx
	JLE  LBB0_56
	LONG $0x24bc8948; LONG $0x000000f8             // mov    qword [rsp + 248], rdi
	WORD $0x0149; BYTE $0xc6                       // add    r14, rax
	WORD $0x634d; BYTE $0xe8                       // movsxd    r13, r8d
	WORD $0xff49; BYTE $0xc5                       // inc    r13
	LONG $0x9c10fac5; LONG $0x00014084; BYTE $0x00 // vmovss    xmm3, dword [rsp + 4*rax + 320]
	WORD $0x894c; BYTE $0xe8                       // mov    rax, r13
	LONG $0x04e0c148                               // shl    rax, 4
	LONG $0x071c6349                               // movsxd    rbx, dword [r15 + rax]
	LONG $0xdd148d4c; LONG $0x00000000             // lea    r10, [8*rbx]
	LONG $0x7052034c                               // add    r10, qword [rdx + 112]
	LONG $0x04e3c148                               // shl    rbx, 4
	LONG $0x285a0348                               // add    rbx, qword [rdx + 40]
	LONG $0x88928b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rdx + 136]
	WORD $0x6348; BYTE $0xc6                       // movsxd    rax, esi
	LONG $0x24848948; LONG $0x00000128             // mov    qword [rsp + 296], rax

LBB0_39:
	WORD $0x894d; BYTE $0xeb           // mov    r11, r13
	LONG $0x04e3c149                   // shl    r11, 4
	LONG $0x1f7c8043; WORD $0x000d     // cmp    byte [r15 + r11 + 13], 0
	JNE  LBB0_54
	LONG $0x1f7c634b; BYTE $0x04       // movsxd    rdi, dword [r15 + r11 + 4]
	WORD $0x8949; BYTE $0xf8           // mov    r8, rdi
	LONG $0x04e0c149                   // shl    r8, 4
	WORD $0x0149; BYTE $0xd8           // add    r8, rbx
	LONG $0x1f7c8043; WORD $0x000c     // cmp    byte [r15 + r11 + 12], 0
	JE   LBB0_47
	LONG $0xff57c0c5                   // vxorps    xmm7, xmm7, xmm7
	WORD $0xff85                       // test    edi, edi
	JLE  LBB0_52
	LONG $0x10638d4c                   // lea    r12, [rbx + 16]
	LONG $0x24a4894c; LONG $0x00000130 // mov    qword [rsp + 304], r12
	WORD $0x394d; BYTE $0xe0           // cmp    r8, r12
	LONG $0xe0470f4d                   // cmova    r12, r8
	WORD $0x2949; BYTE $0xdc           // sub    r12, rbx
	WORD $0xff49; BYTE $0xcc           // dec    r12
	LONG $0xff57c0c5                   // vxorps    xmm7, xmm7, xmm7
	WORD $0x894c; BYTE $0xd7           // mov    rdi, r10
	LONG $0x2494894c; LONG $0x00000138 // mov    qword [rsp + 312], r10

LBB0_43:
	WORD $0x6348; BYTE $0x03                   // movsxd    rax, dword [rbx]
	LONG $0x78c86b4c                           // imul    r9, rax, 120
	LONG $0x0a048b4a                           // mov    rax, qword [rdx + r9]
	LONG $0x0a548b4e; BYTE $0x08               // mov    r10, qword [rdx + r9 + 8]
	LONG $0xb0048b42                           // mov    eax, dword [rax + 4*r14]
	LONG $0xb2042b43                           // sub    eax, dword [r10 + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x10               // mov    rcx, qword [rdx + r9 + 16]
	LONG $0xb1042b42                           // sub    eax, dword [rcx + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x18               // mov    rcx, qword [rdx + r9 + 24]
	LONG $0xb1040342                           // add    eax, dword [rcx + 4*r14]
	LONG $0x2afae1c4; BYTE $0xd0               // vcvtsi2ss    xmm2, xmm0, rax
	LONG $0x596aa1c4; WORD $0x0a54; BYTE $0x20 // vmulss    xmm2, xmm2, dword [rdx + r9 + 32]
	LONG $0x0a448b4a; BYTE $0x28               // mov    rax, qword [rdx + r9 + 40]
	LONG $0xb0048b42                           // mov    eax, dword [rax + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x30               // mov    rcx, qword [rdx + r9 + 48]
	LONG $0xb1042b42                           // sub    eax, dword [rcx + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x38               // mov    rcx, qword [rdx + r9 + 56]
	LONG $0xb1042b42                           // sub    eax, dword [rcx + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x40               // mov    rcx, qword [rdx + r9 + 64]
	LONG $0xb1040342                           // add    eax, dword [rcx + 4*r14]
	LONG $0x2afae1c4; BYTE $0xe0               // vcvtsi2ss    xmm4, xmm0, rax
	LONG $0x595aa1c4; WORD $0x0a64; BYTE $0x48 // vmulss    xmm4, xmm4, dword [rdx + r9 + 72]
	LONG $0xe458eac5                           // vaddss    xmm4, xmm2, xmm4
	LONG $0x0a448b4a; BYTE $0x50               // mov    rax, qword [rdx + r9 + 80]
	WORD $0x8548; BYTE $0xc0                   // test    rax, rax
	JE   LBB0_45
	LONG $0xb0048b42                           // mov    eax, dword [rax + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x58               // mov    rcx, qword [rdx + r9 + 88]
	LONG $0x0a748b4a; BYTE $0x60               // mov    rsi, qword [rdx + r9 + 96]
	LONG $0xb1042b42                           // sub    eax, dword [rcx + 4*r14]
	LONG $0xb6042b42                           // sub    eax, dword [rsi + 4*r14]
	LONG $0x0a4c8b4a; BYTE $0x68               // mov    rcx, qword [rdx + r9 + 104]
	LONG $0xb1040342                           // add    eax, dword [rcx + 4*r14]
	LONG $0x2afae1c4; BYTE $0xd0               // vcvtsi2ss    xmm2, xmm0, rax
	LONG $0x596aa1c4; WORD $0x0a54; BYTE $0x70 // vmulss    xmm2, xmm2, dword [rdx + r9 + 112]
	LONG $0xe258dac5                           // vaddss    xmm4, xmm4, xmm2

LBB0_45:
	LONG $0x5359e2c5; BYTE $0x0c       // vmulss    xmm2, xmm3, dword [rbx + 12]
	LONG $0xe22ef8c5                   // vucomiss    xmm4, xmm2
	WORD $0x930f; BYTE $0xd0           // setae    al
	WORD $0xb60f; BYTE $0xc0           // movzx    eax, al
	LONG $0x3c58c2c5; BYTE $0x87       // vaddss    xmm7, xmm7, dword [rdi + 4*rax]
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c38348                   // add    rbx, 16
	WORD $0x394c; BYTE $0xc3           // cmp    rbx, r8
	JB   LBB0_43
	LONG $0x04ecc149                   // shr    r12, 4
	LONG $0x24948b4c; LONG $0x00000138 // mov    r10, qword [rsp + 312]
	LONG $0xe2548d4f; BYTE $0x08       // lea    r10, [r10 + 8*r12 + 8]
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x24848b48; LONG $0x00000130 // mov    rax, qword [rsp + 304]
	WORD $0x014c; BYTE $0xe0           // add    rax, r12
	WORD $0x8948; BYTE $0xc3           // mov    rbx, rax
	JMP  LBB0_51

LBB0_47:
	LONG $0xff57c0c5         // vxorps    xmm7, xmm7, xmm7
	WORD $0xff85             // test    edi, edi
	JLE  LBB0_52
	LONG $0x104b8d4c         // lea    r9, [rbx + 16]
	WORD $0x394d; BYTE $0xc8 // cmp    r8, r9
	WORD $0x894d; BYTE $0xcc // mov    r12, r9
	LONG $0xe0470f4d         // cmova    r12, r8
	WORD $0x2949; BYTE $0xdc // sub    r12, rbx
	WORD $0xff49; BYTE $0xcc // dec    r12
	LONG $0xff57c0c5         // vxorps    xmm7, xmm7, xmm7
	WORD $0x894c; BYTE $0xd7 // mov    rdi, r10

LBB0_49:
	WORD $0x6348; BYTE $0x0b       // movsxd    rcx, dword [rbx]
	LONG $0x78c96b48               // imul    rcx, rcx, 120
	LONG $0x0a348b48               // mov    rsi, qword [rdx + rcx]
	LONG $0x0a448b48; BYTE $0x08   // mov    rax, qword [rdx + rcx + 8]
	LONG $0xb6348b42               // mov    esi, dword [rsi + 4*r14]
	LONG $0xb0342b42               // sub    esi, dword [rax + 4*r14]
	LONG $0x0a448b48; BYTE $0x10   // mov    rax, qword [rdx + rcx + 16]
	LONG $0xb0342b42               // sub    esi, dword [rax + 4*r14]
	LONG $0x0a448b48; BYTE $0x18   // mov    rax, qword [rdx + rcx + 24]
	LONG $0xb0340342               // add    esi, dword [rax + 4*r14]
	LONG $0x2afae1c4; BYTE $0xd6   // vcvtsi2ss    xmm2, xmm0, rsi
	LONG $0x5459eac5; WORD $0x200a // vmulss    xmm2, xmm2, dword [rdx + rcx + 32]
	LONG $0x0a448b48; BYTE $0x28   // mov    rax, qword [rdx + rcx + 40]
	LONG $0xb0048b42               // mov    eax, dword [rax + 4*r14]
	LONG $0x0a748b48; BYTE $0x30   // mov    rsi, qword [rdx + rcx + 48]
	LONG $0xb6042b42               // sub    eax, dword [rsi + 4*r14]
	LONG $0x0a748b48; BYTE $0x38   // mov    rsi, qword [rdx + rcx + 56]
	LONG $0xb6042b42               // sub    eax, dword [rsi + 4*r14]
	LONG $0x0a748b48; BYTE $0x40   // mov    rsi, qword [rdx + rcx + 64]
	LONG $0xb6040342               // add    eax, dword [rsi + 4*r14]
	LONG $0x2afae1c4; BYTE $0xe0   // vcvtsi2ss    xmm4, xmm0, rax
	LONG $0x6459dac5; WORD $0x480a // vmulss    xmm4, xmm4, dword [rdx + rcx + 72]
	LONG $0xd458eac5               // vaddss    xmm2, xmm2, xmm4
	LONG $0x6359e2c5; BYTE $0x0c   // vmulss    xmm4, xmm3, dword [rbx + 12]
	LONG $0xd42ef8c5               // vucomiss    xmm2, xmm4
	WORD $0x930f; BYTE $0xd0       // setae    al
	WORD $0xb60f; BYTE $0xc0       // movzx    eax, al
	LONG $0x3c58c2c5; BYTE $0x87   // vaddss    xmm7, xmm7, dword [rdi + 4*rax]
	LONG $0x08c78348               // add    rdi, 8
	LONG $0x10c38348               // add    rbx, 16
	WORD $0x394c; BYTE $0xc3       // cmp    rbx, r8
	JB   LBB0_49
	LONG $0x04ecc149               // shr    r12, 4
	LONG $0xe2548d4f; BYTE $0x08   // lea    r10, [r10 + 8*r12 + 8]
	LONG $0x04e4c149               // shl    r12, 4
	WORD $0x014d; BYTE $0xe1       // add    r9, r12
	WORD $0x894c; BYTE $0xcb       // mov    rbx, r9

LBB0_51:
	LONG $0x24848b48; LONG $0x00000128 // mov    rax, qword [rsp + 296]

LBB0_52:
	LONG $0x107a81c4; WORD $0x1f54; BYTE $0x08 // vmovss    xmm2, dword [r15 + r11 + 8]
	LONG $0xd72ef8c5                           // vucomiss    xmm2, xmm7
	JA   LBB0_53

LBB0_54:
	WORD $0xff49; BYTE $0xc5           // inc    r13
	WORD $0x3949; BYTE $0xc5           // cmp    r13, rax
	JL   LBB0_39
	LONG $0x24bc8b48; LONG $0x000000f8 // mov    rdi, qword [rsp + 248]
	LONG $0x000001bb; BYTE $0x00       // mov    ebx, 1
	JMP  LBB0_56

LBB0_53:
	WORD $0xf741; BYTE $0xdd           // neg    r13d
	WORD $0x8944; BYTE $0xeb           // mov    ebx, r13d
	LONG $0x24bc8b48; LONG $0x000000f8 // mov    rdi, qword [rsp + 248]

LBB0_56:
	WORD $0xdb85                                   // test    ebx, ebx
	WORD $0x9f0f; BYTE $0xd0                       // setg    al
	WORD $0xb60f; BYTE $0xc0                       // movzx    eax, al
	WORD $0x0789                                   // mov    dword [rdi], eax
	LONG $0xbc28fcc5; LONG $0x00016024; BYTE $0x00 // vmovaps    ymm7, [rsp + 352]

LBB0_66:
	LONG $0x24848b4c; LONG $0x00000100 // mov    r8, qword [rsp + 256]
	LONG $0x08408b49                   // mov    rax, qword [r8 + 8]
	LONG $0x24b48b48; LONG $0x00000110 // mov    rsi, qword [rsp + 272]
	LONG $0x3c7ffec5; BYTE $0xb0       // vmovdqu    [rax + 4*rsi], ymm7
	LONG $0x249c8b48; LONG $0x000000a8 // mov    rbx, qword [rsp + 168]

LBB0_67:
	LONG $0x08c68348         // add    rsi, 8
	WORD $0x3948; BYTE $0xde // cmp    rsi, rbx
	JB   LBB0_16
	WORD $0x8948; BYTE $0xdf // mov    rdi, rbx

LBB0_69:
	LONG $0x24448b48; BYTE $0x50                   // mov    rax, qword [rsp + 80]
	LONG $0x24443948; BYTE $0x78                   // cmp    qword [rsp + 120], rax
	JBE  LBB0_120
	WORD $0x8b49; BYTE $0x00                       // mov    rax, qword [r8]
	LONG $0x244c8b48; BYTE $0x78                   // mov    rcx, qword [rsp + 120]
	LONG $0x7c6ffec5; WORD $0xe088                 // vmovdqu    ymm7, [rax + 4*rcx - 32]
	LONG $0x177de2c4; BYTE $0xf8                   // vptest    ymm7, ymm0
	WORD $0x8948; BYTE $0xcf                       // mov    rdi, rcx
	JE   LBB0_120
	LONG $0x249c8b48; LONG $0x000000b0             // mov    rbx, qword [rsp + 176]
	LONG $0x584b8b4c                               // mov    r9, qword [rbx + 88]
	LONG $0x248c894c; LONG $0x00000110             // mov    qword [rsp + 272], r9
	LONG $0x60438b48                               // mov    rax, qword [rbx + 96]
	WORD $0x294c; BYTE $0xc8                       // sub    rax, r9
	LONG $0x04e8c148                               // shr    rax, 4
	WORD $0xc085                                   // test    eax, eax
	JLE  LBB0_119
	LONG $0x24748b48; BYTE $0x18                   // mov    rsi, qword [rsp + 24]
	LONG $0x248c8b48; LONG $0x00000118             // mov    rcx, qword [rsp + 280]
	LONG $0x310c8d48                               // lea    rcx, [rcx + rsi]
	LONG $0x187de2c4; LONG $0x0000a093; BYTE $0x00 // vbroadcastss    ymm2, dword [rbx + 160]
	LONG $0xc8938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 200]
	LONG $0x1c6ffec5; BYTE $0x8a                   // vmovdqu    ymm3, [rdx + 4*rcx]
	LONG $0xd0938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 208]
	LONG $0xd8838b4c; WORD $0x0000; BYTE $0x00     // mov    r8, qword [rbx + 216]
	LONG $0xe0bb8b48; WORD $0x0000; BYTE $0x00     // mov    rdi, qword [rbx + 224]
	LONG $0x1cfae5c5; BYTE $0x8a                   // vpsubd    ymm3, ymm3, [rdx + 4*rcx]
	LONG $0xfa65c1c4; WORD $0x881c                 // vpsubd    ymm3, ymm3, [r8 + 4*rcx]
	LONG $0x1cfee5c5; BYTE $0x8f                   // vpaddd    ymm3, ymm3, [rdi + 4*rcx]
	LONG $0xdb5bfcc5                               // vcvtdq2ps    ymm3, ymm3
	LONG $0xa8938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 168]
	LONG $0x246ffec5; BYTE $0x8a                   // vmovdqu    ymm4, [rdx + 4*rcx]
	LONG $0xb0938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 176]
	LONG $0xb8838b4c; WORD $0x0000; BYTE $0x00     // mov    r8, qword [rbx + 184]
	LONG $0xc0bb8b48; WORD $0x0000; BYTE $0x00     // mov    rdi, qword [rbx + 192]
	LONG $0x24faddc5; BYTE $0x8a                   // vpsubd    ymm4, ymm4, [rdx + 4*rcx]
	LONG $0xfa5dc1c4; WORD $0x8824                 // vpsubd    ymm4, ymm4, [r8 + 4*rcx]
	LONG $0x24feddc5; BYTE $0x8f                   // vpaddd    ymm4, ymm4, [rdi + 4*rcx]
	LONG $0xe45bfcc5                               // vcvtdq2ps    ymm4, ymm4
	LONG $0xd459ecc5                               // vmulps    ymm2, ymm2, ymm4
	LONG $0xdb59e4c5                               // vmulps    ymm3, ymm3, ymm3
	LONG $0xd35cecc5                               // vsubps    ymm2, ymm2, ymm3
	LONG $0xd9c2ecc5; BYTE $0x1e                   // vcmpgt_oqps    ymm3, ymm2, ymm1
	LONG $0xd354ecc5                               // vandps    ymm2, ymm2, ymm3
	LONG $0x5564c1c4; BYTE $0xd9                   // vandnps    ymm3, ymm3, ymm9
	LONG $0xd356ecc5                               // vorps    ymm2, ymm2, ymm3
	LONG $0xc2517cc5                               // vsqrtps    ymm8, ymm2
	LONG $0x248c8b48; LONG $0x00000108             // mov    rcx, qword [rsp + 264]
	LONG $0x31148d4c                               // lea    r10, [rcx + rsi]
	LONG $0x28738b4c                               // mov    r14, qword [rbx + 40]
	LONG $0x70438b4c                               // mov    r8, qword [rbx + 112]
	WORD $0x6348; BYTE $0xf8                       // movsxd    rdi, eax
	LONG $0x24bc8948; LONG $0x00000128             // mov    qword [rsp + 296], rdi
	LONG $0x88938b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rbx + 136]
	WORD $0x3145; BYTE $0xdb                       // xor    r11d, r11d

LBB0_73:
	WORD $0x894d; BYTE $0xdc           // mov    r12, r11
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x217c8043; WORD $0x000d     // cmp    byte [r9 + r12 + 13], 0
	JNE  LBB0_110
	LONG $0x2174634b; BYTE $0x04       // movsxd    rsi, dword [r9 + r12 + 4]
	WORD $0x8949; BYTE $0xf5           // mov    r13, rsi
	LONG $0x04e5c149                   // shl    r13, 4
	WORD $0x014d; BYTE $0xf5           // add    r13, r14
	LONG $0x217c8043; WORD $0x000c     // cmp    byte [r9 + r12 + 12], 0
	JE   LBB0_81
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_86
	LONG $0x107e8d4d                   // lea    r15, [r14 + 16]
	LONG $0x24bc894c; LONG $0x00000130 // mov    qword [rsp + 304], r15
	WORD $0x394d; BYTE $0xfd           // cmp    r13, r15
	LONG $0xfd470f4d                   // cmova    r15, r13
	WORD $0x294d; BYTE $0xf7           // sub    r15, r14
	WORD $0xff49; BYTE $0xcf           // dec    r15
	LONG $0x04efc149                   // shr    r15, 4
	LONG $0x2484894c; LONG $0x00000138 // mov    qword [rsp + 312], r8
	LONG $0x04788d49                   // lea    rdi, [r8 + 4]
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_77:
	WORD $0x6349; BYTE $0x06                   // movsxd    rax, dword [r14]
	LONG $0x78f06b48                           // imul    rsi, rax, 120
	LONG $0x32048b48                           // mov    rax, qword [rdx + rsi]
	LONG $0x32448b4c; BYTE $0x08               // mov    r8, qword [rdx + rsi + 8]
	LONG $0x6f7ea1c4; WORD $0x9014             // vmovdqu    ymm2, [rax + 4*r10]
	LONG $0x32448b48; BYTE $0x10               // mov    rax, qword [rdx + rsi + 16]
	LONG $0x324c8b4c; BYTE $0x18               // mov    r9, qword [rdx + rsi + 24]
	LONG $0xfa6d81c4; WORD $0x9014             // vpsubd    ymm2, ymm2, [r8 + 4*r10]
	LONG $0xfa6da1c4; WORD $0x9014             // vpsubd    ymm2, ymm2, [rax + 4*r10]
	LONG $0xfe6d81c4; WORD $0x9114             // vpaddd    ymm2, ymm2, [r9 + 4*r10]
	LONG $0xd25bfcc5                           // vcvtdq2ps    ymm2, ymm2
	LONG $0x187de2c4; WORD $0x3264; BYTE $0x20 // vbroadcastss    ymm4, dword [rdx + rsi + 32]
	LONG $0xd459ecc5                           // vmulps    ymm2, ymm2, ymm4
	LONG $0x32448b48; BYTE $0x28               // mov    rax, qword [rdx + rsi + 40]
	LONG $0x6f7ea1c4; WORD $0x9024             // vmovdqu    ymm4, [rax + 4*r10]
	LONG $0x32448b48; BYTE $0x30               // mov    rax, qword [rdx + rsi + 48]
	LONG $0x324c8b48; BYTE $0x38               // mov    rcx, qword [rdx + rsi + 56]
	LONG $0x325c8b48; BYTE $0x40               // mov    rbx, qword [rdx + rsi + 64]
	LONG $0xfa5da1c4; WORD $0x9024             // vpsubd    ymm4, ymm4, [rax + 4*r10]
	LONG $0xfa5da1c4; WORD $0x9124             // vpsubd    ymm4, ymm4, [rcx + 4*r10]
	LONG $0xfe5da1c4; WORD $0x9324             // vpaddd    ymm4, ymm4, [rbx + 4*r10]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x3264; BYTE $0x48 // vbroadcastss    ymm12, dword [rdx + rsi + 72]
	LONG $0x595cc1c4; BYTE $0xe4               // vmulps    ymm4, ymm4, ymm12
	LONG $0xd458ecc5                           // vaddps    ymm2, ymm2, ymm4
	LONG $0x32448b48; BYTE $0x50               // mov    rax, qword [rdx + rsi + 80]
	WORD $0x8548; BYTE $0xc0                   // test    rax, rax
	JE   LBB0_79
	LONG $0x6f7ea1c4; WORD $0x9024             // vmovdqu    ymm4, [rax + 4*r10]
	LONG $0x32448b48; BYTE $0x58               // mov    rax, qword [rdx + rsi + 88]
	LONG $0x324c8b48; BYTE $0x60               // mov    rcx, qword [rdx + rsi + 96]
	LONG $0x325c8b48; BYTE $0x68               // mov    rbx, qword [rdx + rsi + 104]
	LONG $0xfa5da1c4; WORD $0x9024             // vpsubd    ymm4, ymm4, [rax + 4*r10]
	LONG $0xfa5da1c4; WORD $0x9124             // vpsubd    ymm4, ymm4, [rcx + 4*r10]
	LONG $0xfe5da1c4; WORD $0x9324             // vpaddd    ymm4, ymm4, [rbx + 4*r10]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x3264; BYTE $0x70 // vbroadcastss    ymm12, dword [rdx + rsi + 112]
	LONG $0x595cc1c4; BYTE $0xe4               // vmulps    ymm4, ymm4, ymm12
	LONG $0xd458ecc5                           // vaddps    ymm2, ymm2, ymm4

LBB0_79:
	LONG $0x187dc2c4; WORD $0x0c66     // vbroadcastss    ymm4, dword [r14 + 12]
	LONG $0xe459bcc5                   // vmulps    ymm4, ymm8, ymm4
	LONG $0xd2c2dcc5; BYTE $0x1e       // vcmpgt_oqps    ymm2, ymm4, ymm2
	LONG $0x187de2c4; BYTE $0x27       // vbroadcastss    ymm4, dword [rdi]
	LONG $0x187d62c4; WORD $0xfc67     // vbroadcastss    ymm12, dword [rdi - 4]
	LONG $0x4a5dc3c4; WORD $0x20d4     // vblendvps    ymm2, ymm4, ymm12, ymm2
	LONG $0xda58e4c5                   // vaddps    ymm3, ymm3, ymm2
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c68349                   // add    r14, 16
	WORD $0x394d; BYTE $0xee           // cmp    r14, r13
	JB   LBB0_77
	LONG $0x24848b4c; LONG $0x00000138 // mov    r8, qword [rsp + 312]
	LONG $0xf8448d4f; BYTE $0x08       // lea    r8, [r8 + 8*r15 + 8]
	LONG $0x04e7c149                   // shl    r15, 4
	LONG $0x24b48b4c; LONG $0x00000130 // mov    r14, qword [rsp + 304]
	WORD $0x014d; BYTE $0xfe           // add    r14, r15
	LONG $0x248c8b4c; LONG $0x00000110 // mov    r9, qword [rsp + 272]
	JMP  LBB0_85

LBB0_81:
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_86
	LONG $0x107e8d4d                   // lea    r15, [r14 + 16]
	LONG $0x24bc894c; LONG $0x00000130 // mov    qword [rsp + 304], r15
	WORD $0x394d; BYTE $0xfd           // cmp    r13, r15
	LONG $0xfd470f4d                   // cmova    r15, r13
	WORD $0x294d; BYTE $0xf7           // sub    r15, r14
	WORD $0xff49; BYTE $0xcf           // dec    r15
	LONG $0x04efc149                   // shr    r15, 4
	LONG $0x2484894c; LONG $0x00000138 // mov    qword [rsp + 312], r8
	LONG $0x04788d49                   // lea    rdi, [r8 + 4]
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_83:
	WORD $0x6349; BYTE $0x0e                   // movsxd    rcx, dword [r14]
	LONG $0x78c96b48                           // imul    rcx, rcx, 120
	LONG $0x0a348b48                           // mov    rsi, qword [rdx + rcx]
	LONG $0x0a5c8b48; BYTE $0x08               // mov    rbx, qword [rdx + rcx + 8]
	LONG $0x6f7ea1c4; WORD $0x9614             // vmovdqu    ymm2, [rsi + 4*r10]
	LONG $0x0a748b48; BYTE $0x10               // mov    rsi, qword [rdx + rcx + 16]
	LONG $0x0a448b48; BYTE $0x18               // mov    rax, qword [rdx + rcx + 24]
	LONG $0xfa6da1c4; WORD $0x9314             // vpsubd    ymm2, ymm2, [rbx + 4*r10]
	LONG $0xfa6da1c4; WORD $0x9614             // vpsubd    ymm2, ymm2, [rsi + 4*r10]
	LONG $0xfe6da1c4; WORD $0x9014             // vpaddd    ymm2, ymm2, [rax + 4*r10]
	LONG $0xd25bfcc5                           // vcvtdq2ps    ymm2, ymm2
	LONG $0x187de2c4; WORD $0x0a64; BYTE $0x20 // vbroadcastss    ymm4, dword [rdx + rcx + 32]
	LONG $0xd459ecc5                           // vmulps    ymm2, ymm2, ymm4
	LONG $0x0a448b48; BYTE $0x28               // mov    rax, qword [rdx + rcx + 40]
	LONG $0x6f7ea1c4; WORD $0x9024             // vmovdqu    ymm4, [rax + 4*r10]
	LONG $0x0a448b48; BYTE $0x30               // mov    rax, qword [rdx + rcx + 48]
	LONG $0x0a748b48; BYTE $0x38               // mov    rsi, qword [rdx + rcx + 56]
	LONG $0x0a5c8b48; BYTE $0x40               // mov    rbx, qword [rdx + rcx + 64]
	LONG $0xfa5da1c4; WORD $0x9024             // vpsubd    ymm4, ymm4, [rax + 4*r10]
	LONG $0xfa5da1c4; WORD $0x9624             // vpsubd    ymm4, ymm4, [rsi + 4*r10]
	LONG $0xfe5da1c4; WORD $0x9324             // vpaddd    ymm4, ymm4, [rbx + 4*r10]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x0a64; BYTE $0x48 // vbroadcastss    ymm12, dword [rdx + rcx + 72]
	LONG $0x595cc1c4; BYTE $0xe4               // vmulps    ymm4, ymm4, ymm12
	LONG $0xd458ecc5                           // vaddps    ymm2, ymm2, ymm4
	LONG $0x187dc2c4; WORD $0x0c66             // vbroadcastss    ymm4, dword [r14 + 12]
	LONG $0xe459bcc5                           // vmulps    ymm4, ymm8, ymm4
	LONG $0xd2c2dcc5; BYTE $0x1e               // vcmpgt_oqps    ymm2, ymm4, ymm2
	LONG $0x187de2c4; BYTE $0x27               // vbroadcastss    ymm4, dword [rdi]
	LONG $0x187d62c4; WORD $0xfc67             // vbroadcastss    ymm12, dword [rdi - 4]
	LONG $0x4a5dc3c4; WORD $0x20d4             // vblendvps    ymm2, ymm4, ymm12, ymm2
	LONG $0xda58e4c5                           // vaddps    ymm3, ymm3, ymm2
	LONG $0x08c78348                           // add    rdi, 8
	LONG $0x10c68349                           // add    r14, 16
	WORD $0x394d; BYTE $0xee                   // cmp    r14, r13
	JB   LBB0_83
	LONG $0x24848b4c; LONG $0x00000138         // mov    r8, qword [rsp + 312]
	LONG $0xf8448d4f; BYTE $0x08               // lea    r8, [r8 + 8*r15 + 8]
	LONG $0x04e7c149                           // shl    r15, 4
	LONG $0x24b48b4c; LONG $0x00000130         // mov    r14, qword [rsp + 304]
	WORD $0x014d; BYTE $0xfe                   // add    r14, r15

LBB0_85:
	LONG $0x24bc8b48; LONG $0x00000128 // mov    rdi, qword [rsp + 296]

LBB0_86:
	LONG $0x187d82c4; WORD $0x2154; BYTE $0x08 // vbroadcastss    ymm2, dword [r9 + r12 + 8]
	LONG $0xd3c2ecc5; BYTE $0x1e               // vcmpgt_oqps    ymm2, ymm2, ymm3
	LONG $0xff55ecc5                           // vandnps    ymm7, ymm2, ymm7
	LONG $0xd1f6c5c5                           // vpsadbw    ymm2, ymm7, ymm1
	LONG $0xd07ef9c5                           // vmovd    eax, xmm2
	LONG $0x1679e3c4; WORD $0x02d1             // vpextrd    ecx, xmm2, 2
	WORD $0xc101                               // add    ecx, eax
	LONG $0x397de3c4; WORD $0x01d2             // vextracti128    xmm2, ymm2, 1
	LONG $0xd67ef9c5                           // vmovd    esi, xmm2
	WORD $0xce01                               // add    esi, ecx
	LONG $0x1679e3c4; WORD $0x02d0             // vpextrd    eax, xmm2, 2
	WORD $0xf001                               // add    eax, esi
	JE   LBB0_119
	WORD $0xf883; BYTE $0x01                   // cmp    eax, 1
	JE   LBB0_88

LBB0_110:
	WORD $0xff49; BYTE $0xc3 // inc    r11
	WORD $0x3949; BYTE $0xfb // cmp    r11, rdi
	JL   LBB0_73
	JMP  LBB0_119

LBB0_88:
	LONG $0xbc29fcc5; LONG $0x00016024; BYTE $0x00   // vmovaps    [rsp + 352], ymm7
	LONG $0x84297cc5; LONG $0x00014024; BYTE $0x00   // vmovaps    [rsp + 320], ymm8
	LONG $0x7ef9e1c4; BYTE $0xfa                     // vmovq    rdx, xmm7
	LONG $0x24848d48; LONG $0x00000160               // lea    rax, [rsp + 352]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000000b8; BYTE $0x00                     // mov    eax, 0
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_90
	LONG $0x20eac148                                 // shr    rdx, 32
	LONG $0x24848d48; LONG $0x00000164               // lea    rax, [rsp + 356]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000001b8; BYTE $0x00                     // mov    eax, 1
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_90
	LONG $0x16f9e3c4; WORD $0x01fa                   // vpextrq    rdx, xmm7, 1
	LONG $0x24848d48; LONG $0x00000168               // lea    rax, [rsp + 360]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000002b8; BYTE $0x00                     // mov    eax, 2
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_90
	LONG $0x20eac148                                 // shr    rdx, 32
	LONG $0x24848d48; LONG $0x0000016c               // lea    rax, [rsp + 364]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000003b8; BYTE $0x00                     // mov    eax, 3
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_90
	LONG $0x397de3c4; WORD $0x01fa                   // vextracti128    xmm2, ymm7, 1
	LONG $0x7ef9e1c4; BYTE $0xd2                     // vmovq    rdx, xmm2
	LONG $0x24848d48; LONG $0x00000170               // lea    rax, [rsp + 368]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000004b8; BYTE $0x00                     // mov    eax, 4
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_90
	WORD $0x8948; BYTE $0xd1                         // mov    rcx, rdx
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x00000174               // lea    rax, [rsp + 372]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000005b8; BYTE $0x00                     // mov    eax, 5
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_90
	LONG $0x16f9e3c4; WORD $0x01d6                   // vpextrq    rsi, xmm2, 1
	LONG $0x24848d48; LONG $0x00000178               // lea    rax, [rsp + 376]
	WORD $0x8948; BYTE $0xc3                         // mov    rbx, rax
	LONG $0x000006b8; BYTE $0x00                     // mov    eax, 6
	WORD $0xf685                                     // test    esi, esi
	JNE  LBB0_90
	WORD $0x8948; BYTE $0xf0                         // mov    rax, rsi
	LONG $0x0000b948; LONG $0x00010000; WORD $0x0000 // mov    rcx, 4294967296
	WORD $0x3148; BYTE $0xc8                         // xor    rax, rcx
	LONG $0x20eec148                                 // shr    rsi, 32
	LONG $0xd6940f40                                 // sete    sil
	WORD $0x0948; BYTE $0xc2                         // or    rdx, rax
	JNE  LBB0_118
	WORD $0xf631                                     // xor    esi, esi

LBB0_118:
	LONG $0x24848d48; LONG $0x0000017c // lea    rax, [rsp + 380]
	WORD $0x8948; BYTE $0xc3           // mov    rbx, rax
	LONG $0x000007b8; BYTE $0x00       // mov    eax, 7
	WORD $0x8440; BYTE $0xf6           // test    sil, sil
	JNE  LBB0_119

LBB0_90:
	LONG $0x014b8d41                               // lea    ecx, [r11 + 1]
	LONG $0x24b48b48; LONG $0x000000b0             // mov    rsi, qword [rsp + 176]
	LONG $0x58768b4c                               // mov    r14, qword [rsi + 88]
	LONG $0x607e8b48                               // mov    rdi, qword [rsi + 96]
	WORD $0x294c; BYTE $0xf7                       // sub    rdi, r14
	LONG $0x04efc148                               // shr    rdi, 4
	LONG $0x000001ba; BYTE $0x00                   // mov    edx, 1
	WORD $0xcf39                                   // cmp    edi, ecx
	JLE  LBB0_109
	LONG $0x249c8948; LONG $0x00000110             // mov    qword [rsp + 272], rbx
	WORD $0x0149; BYTE $0xc2                       // add    r10, rax
	WORD $0x634d; BYTE $0xfb                       // movsxd    r15, r11d
	WORD $0xff49; BYTE $0xc7                       // inc    r15
	LONG $0x9c10fac5; LONG $0x00014084; BYTE $0x00 // vmovss    xmm3, dword [rsp + 4*rax + 320]
	WORD $0x894c; BYTE $0xf8                       // mov    rax, r15
	LONG $0x04e0c148                               // shl    rax, 4
	LONG $0x06146349                               // movsxd    rdx, dword [r14 + rax]
	LONG $0xd50c8d4c; LONG $0x00000000             // lea    r9, [8*rdx]
	LONG $0x704e034c                               // add    r9, qword [rsi + 112]
	LONG $0x04e2c148                               // shl    rdx, 4
	LONG $0x28560348                               // add    rdx, qword [rsi + 40]
	LONG $0x88868b48; WORD $0x0000; BYTE $0x00     // mov    rax, qword [rsi + 136]
	WORD $0x6348; BYTE $0xcf                       // movsxd    rcx, edi
	LONG $0x248c8948; LONG $0x00000128             // mov    qword [rsp + 296], rcx

LBB0_92:
	WORD $0x894d; BYTE $0xfb           // mov    r11, r15
	LONG $0x04e3c149                   // shl    r11, 4
	LONG $0x1e7c8043; WORD $0x000d     // cmp    byte [r14 + r11 + 13], 0
	JNE  LBB0_107
	LONG $0x1e7c634b; BYTE $0x04       // movsxd    rdi, dword [r14 + r11 + 4]
	WORD $0x8949; BYTE $0xfc           // mov    r12, rdi
	LONG $0x04e4c149                   // shl    r12, 4
	WORD $0x0149; BYTE $0xd4           // add    r12, rdx
	LONG $0x1e7c8043; WORD $0x000c     // cmp    byte [r14 + r11 + 12], 0
	JE   LBB0_100
	LONG $0xff57c0c5                   // vxorps    xmm7, xmm7, xmm7
	WORD $0xff85                       // test    edi, edi
	JLE  LBB0_105
	LONG $0x106a8d4c                   // lea    r13, [rdx + 16]
	LONG $0x24ac894c; LONG $0x00000130 // mov    qword [rsp + 304], r13
	WORD $0x394d; BYTE $0xec           // cmp    r12, r13
	LONG $0xec470f4d                   // cmova    r13, r12
	WORD $0x2949; BYTE $0xd5           // sub    r13, rdx
	WORD $0xff49; BYTE $0xcd           // dec    r13
	LONG $0xff57c0c5                   // vxorps    xmm7, xmm7, xmm7
	WORD $0x894c; BYTE $0xcf           // mov    rdi, r9
	LONG $0x248c894c; LONG $0x00000138 // mov    qword [rsp + 312], r9

LBB0_96:
	WORD $0x6348; BYTE $0x0a                   // movsxd    rcx, dword [rdx]
	LONG $0x78c16b4c                           // imul    r8, rcx, 120
	LONG $0x000c8b4a                           // mov    rcx, qword [rax + r8]
	LONG $0x00748b4a; BYTE $0x08               // mov    rsi, qword [rax + r8 + 8]
	LONG $0x910c8b42                           // mov    ecx, dword [rcx + 4*r10]
	LONG $0x960c2b42                           // sub    ecx, dword [rsi + 4*r10]
	LONG $0x00748b4a; BYTE $0x10               // mov    rsi, qword [rax + r8 + 16]
	LONG $0x960c2b42                           // sub    ecx, dword [rsi + 4*r10]
	LONG $0x00748b4a; BYTE $0x18               // mov    rsi, qword [rax + r8 + 24]
	LONG $0x960c0342                           // add    ecx, dword [rsi + 4*r10]
	LONG $0x2afae1c4; BYTE $0xd1               // vcvtsi2ss    xmm2, xmm0, rcx
	LONG $0x596aa1c4; WORD $0x0054; BYTE $0x20 // vmulss    xmm2, xmm2, dword [rax + r8 + 32]
	LONG $0x004c8b4a; BYTE $0x28               // mov    rcx, qword [rax + r8 + 40]
	LONG $0x910c8b42                           // mov    ecx, dword [rcx + 4*r10]
	LONG $0x00748b4a; BYTE $0x30               // mov    rsi, qword [rax + r8 + 48]
	LONG $0x960c2b42                           // sub    ecx, dword [rsi + 4*r10]
	LONG $0x00748b4a; BYTE $0x38               // mov    rsi, qword [rax + r8 + 56]
	LONG $0x960c2b42                           // sub    ecx, dword [rsi + 4*r10]
	LONG $0x00748b4a; BYTE $0x40               // mov    rsi, qword [rax + r8 + 64]
	LONG $0x960c0342                           // add    ecx, dword [rsi + 4*r10]
	LONG $0x2afae1c4; BYTE $0xe1               // vcvtsi2ss    xmm4, xmm0, rcx
	LONG $0x595aa1c4; WORD $0x0064; BYTE $0x48 // vmulss    xmm4, xmm4, dword [rax + r8 + 72]
	LONG $0xe458eac5                           // vaddss    xmm4, xmm2, xmm4
	LONG $0x004c8b4e; BYTE $0x50               // mov    r9, qword [rax + r8 + 80]
	WORD $0x854d; BYTE $0xc9                   // test    r9, r9
	JE   LBB0_98
	LONG $0x910c8b43                           // mov    ecx, dword [r9 + 4*r10]
	LONG $0x00748b4a; BYTE $0x58               // mov    rsi, qword [rax + r8 + 88]
	LONG $0x005c8b4a; BYTE $0x60               // mov    rbx, qword [rax + r8 + 96]
	LONG $0x960c2b42                           // sub    ecx, dword [rsi + 4*r10]
	LONG $0x930c2b42                           // sub    ecx, dword [rbx + 4*r10]
	LONG $0x00748b4a; BYTE $0x68               // mov    rsi, qword [rax + r8 + 104]
	LONG $0x960c0342                           // add    ecx, dword [rsi + 4*r10]
	LONG $0x2afae1c4; BYTE $0xd1               // vcvtsi2ss    xmm2, xmm0, rcx
	LONG $0x596aa1c4; WORD $0x0054; BYTE $0x70 // vmulss    xmm2, xmm2, dword [rax + r8 + 112]
	LONG $0xe258dac5                           // vaddss    xmm4, xmm4, xmm2

LBB0_98:
	LONG $0x5259e2c5; BYTE $0x0c       // vmulss    xmm2, xmm3, dword [rdx + 12]
	LONG $0xe22ef8c5                   // vucomiss    xmm4, xmm2
	WORD $0x930f; BYTE $0xd1           // setae    cl
	WORD $0xb60f; BYTE $0xc9           // movzx    ecx, cl
	LONG $0x3c58c2c5; BYTE $0x8f       // vaddss    xmm7, xmm7, dword [rdi + 4*rcx]
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c28348                   // add    rdx, 16
	WORD $0x394c; BYTE $0xe2           // cmp    rdx, r12
	JB   LBB0_96
	LONG $0x04edc149                   // shr    r13, 4
	LONG $0x248c8b4c; LONG $0x00000138 // mov    r9, qword [rsp + 312]
	LONG $0xe94c8d4f; BYTE $0x08       // lea    r9, [r9 + 8*r13 + 8]
	LONG $0x04e5c149                   // shl    r13, 4
	LONG $0x248c8b48; LONG $0x00000130 // mov    rcx, qword [rsp + 304]
	WORD $0x014c; BYTE $0xe9           // add    rcx, r13
	WORD $0x8948; BYTE $0xca           // mov    rdx, rcx
	JMP  LBB0_104

LBB0_100:
	LONG $0xff57c0c5         // vxorps    xmm7, xmm7, xmm7
	WORD $0xff85             // test    edi, edi
	JLE  LBB0_105
	LONG $0x10428d4c         // lea    r8, [rdx + 16]
	WORD $0x394d; BYTE $0xc4 // cmp    r12, r8
	WORD $0x894d; BYTE $0xc5 // mov    r13, r8
	LONG $0xec470f4d         // cmova    r13, r12
	WORD $0x2949; BYTE $0xd5 // sub    r13, rdx
	WORD $0xff49; BYTE $0xcd // dec    r13
	LONG $0xff57c0c5         // vxorps    xmm7, xmm7, xmm7
	WORD $0x894c; BYTE $0xcf // mov    rdi, r9

LBB0_102:
	WORD $0x6348; BYTE $0x32       // movsxd    rsi, dword [rdx]
	LONG $0x78f66b48               // imul    rsi, rsi, 120
	LONG $0x301c8b48               // mov    rbx, qword [rax + rsi]
	LONG $0x304c8b48; BYTE $0x08   // mov    rcx, qword [rax + rsi + 8]
	LONG $0x931c8b42               // mov    ebx, dword [rbx + 4*r10]
	LONG $0x911c2b42               // sub    ebx, dword [rcx + 4*r10]
	LONG $0x304c8b48; BYTE $0x10   // mov    rcx, qword [rax + rsi + 16]
	LONG $0x911c2b42               // sub    ebx, dword [rcx + 4*r10]
	LONG $0x304c8b48; BYTE $0x18   // mov    rcx, qword [rax + rsi + 24]
	LONG $0x911c0342               // add    ebx, dword [rcx + 4*r10]
	LONG $0x2afae1c4; BYTE $0xd3   // vcvtsi2ss    xmm2, xmm0, rbx
	LONG $0x5459eac5; WORD $0x2030 // vmulss    xmm2, xmm2, dword [rax + rsi + 32]
	LONG $0x304c8b48; BYTE $0x28   // mov    rcx, qword [rax + rsi + 40]
	LONG $0x910c8b42               // mov    ecx, dword [rcx + 4*r10]
	LONG $0x305c8b48; BYTE $0x30   // mov    rbx, qword [rax + rsi + 48]
	LONG $0x930c2b42               // sub    ecx, dword [rbx + 4*r10]
	LONG $0x305c8b48; BYTE $0x38   // mov    rbx, qword [rax + rsi + 56]
	LONG $0x930c2b42               // sub    ecx, dword [rbx + 4*r10]
	LONG $0x305c8b48; BYTE $0x40   // mov    rbx, qword [rax + rsi + 64]
	LONG $0x930c0342               // add    ecx, dword [rbx + 4*r10]
	LONG $0x2afae1c4; BYTE $0xe1   // vcvtsi2ss    xmm4, xmm0, rcx
	LONG $0x6459dac5; WORD $0x4830 // vmulss    xmm4, xmm4, dword [rax + rsi + 72]
	LONG $0xd458eac5               // vaddss    xmm2, xmm2, xmm4
	LONG $0x6259e2c5; BYTE $0x0c   // vmulss    xmm4, xmm3, dword [rdx + 12]
	LONG $0xd42ef8c5               // vucomiss    xmm2, xmm4
	WORD $0x930f; BYTE $0xd1       // setae    cl
	WORD $0xb60f; BYTE $0xc9       // movzx    ecx, cl
	LONG $0x3c58c2c5; BYTE $0x8f   // vaddss    xmm7, xmm7, dword [rdi + 4*rcx]
	LONG $0x08c78348               // add    rdi, 8
	LONG $0x10c28348               // add    rdx, 16
	WORD $0x394c; BYTE $0xe2       // cmp    rdx, r12
	JB   LBB0_102
	LONG $0x04edc149               // shr    r13, 4
	LONG $0xe94c8d4f; BYTE $0x08   // lea    r9, [r9 + 8*r13 + 8]
	LONG $0x04e5c149               // shl    r13, 4
	WORD $0x014d; BYTE $0xe8       // add    r8, r13
	WORD $0x894c; BYTE $0xc2       // mov    rdx, r8

LBB0_104:
	LONG $0x248c8b48; LONG $0x00000128 // mov    rcx, qword [rsp + 296]

LBB0_105:
	LONG $0x107a81c4; WORD $0x1e54; BYTE $0x08 // vmovss    xmm2, dword [r14 + r11 + 8]
	LONG $0xd72ef8c5                           // vucomiss    xmm2, xmm7
	JA   LBB0_106

LBB0_107:
	WORD $0xff49; BYTE $0xc7           // inc    r15
	WORD $0x3949; BYTE $0xcf           // cmp    r15, rcx
	JL   LBB0_92
	LONG $0x249c8b48; LONG $0x00000110 // mov    rbx, qword [rsp + 272]
	LONG $0x000001ba; BYTE $0x00       // mov    edx, 1
	JMP  LBB0_109

LBB0_106:
	WORD $0xf741; BYTE $0xdf           // neg    r15d
	WORD $0x8944; BYTE $0xfa           // mov    edx, r15d
	LONG $0x249c8b48; LONG $0x00000110 // mov    rbx, qword [rsp + 272]

LBB0_109:
	WORD $0xd285                                   // test    edx, edx
	WORD $0x9f0f; BYTE $0xd0                       // setg    al
	WORD $0xb60f; BYTE $0xc0                       // movzx    eax, al
	WORD $0x0389                                   // mov    dword [rbx], eax
	LONG $0xbc28fcc5; LONG $0x00016024; BYTE $0x00 // vmovaps    ymm7, [rsp + 352]

LBB0_119:
	LONG $0x24848b4c; LONG $0x00000100 // mov    r8, qword [rsp + 256]
	LONG $0x08408b49                   // mov    rax, qword [r8 + 8]
	LONG $0x244c8b48; BYTE $0x18       // mov    rcx, qword [rsp + 24]
	LONG $0x3c7ffec5; BYTE $0x88       // vmovdqu    [rax + 4*rcx], ymm7
	LONG $0x247c8b48; BYTE $0x78       // mov    rdi, qword [rsp + 120]

LBB0_120:
	LONG $0x24bc3b48; LONG $0x00000120         // cmp    rdi, qword [rsp + 288]
	JAE  LBB0_145
	WORD $0x8b49; BYTE $0x30                   // mov    rsi, qword [r8]
	LONG $0x24b48948; LONG $0x00000090         // mov    qword [rsp + 144], rsi
	LONG $0x24848b48; LONG $0x000000b0         // mov    rax, qword [rsp + 176]
	LONG $0xc8888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 200]
	LONG $0x248c8948; LONG $0x000000f8         // mov    qword [rsp + 248], rcx
	LONG $0xd0888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 208]
	LONG $0x248c8948; LONG $0x000000f0         // mov    qword [rsp + 240], rcx
	LONG $0xd8888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 216]
	LONG $0x248c8948; LONG $0x000000e8         // mov    qword [rsp + 232], rcx
	LONG $0xe0888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 224]
	LONG $0x248c8948; LONG $0x000000e0         // mov    qword [rsp + 224], rcx
	LONG $0xa8888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 168]
	LONG $0x248c8948; LONG $0x000000d8         // mov    qword [rsp + 216], rcx
	LONG $0xb0888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 176]
	LONG $0x248c8948; LONG $0x000000d0         // mov    qword [rsp + 208], rcx
	LONG $0xb8888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 184]
	LONG $0x248c8948; LONG $0x000000c8         // mov    qword [rsp + 200], rcx
	LONG $0xc0888b48; WORD $0x0000; BYTE $0x00 // mov    rcx, qword [rax + 192]
	LONG $0x248c8948; LONG $0x000000c0         // mov    qword [rsp + 192], rcx
	LONG $0xb810fac5; LONG $0x000000a0         // vmovss    xmm7, dword [rax + 160]
	LONG $0x28488b48                           // mov    rcx, qword [rax + 40]
	LONG $0x248c8948; LONG $0x000000a0         // mov    qword [rsp + 160], rcx
	LONG $0x58688b4c                           // mov    r13, qword [rax + 88]
	LONG $0x24ac894c; LONG $0x00000130         // mov    qword [rsp + 304], r13
	LONG $0x60488b48                           // mov    rcx, qword [rax + 96]
	WORD $0x294c; BYTE $0xe9                   // sub    rcx, r13
	LONG $0x04e9c148                           // shr    rcx, 4
	LONG $0x248c8948; LONG $0x000000b8         // mov    qword [rsp + 184], rcx
	LONG $0x70508b48                           // mov    rdx, qword [rax + 112]
	LONG $0x24948948; LONG $0x00000098         // mov    qword [rsp + 152], rdx
	LONG $0x88b08b4c; WORD $0x0000; BYTE $0x00 // mov    r14, qword [rax + 136]
	WORD $0x6348; BYTE $0xd9                   // movsxd    rbx, ecx
	LONG $0x249c8948; LONG $0x00000128         // mov    qword [rsp + 296], rbx

LBB0_122:
	LONG $0x00be3c83                   // cmp    dword [rsi + 4*rdi], 0
	JE   LBB0_144
	LONG $0x24848b48; LONG $0x00000118 // mov    rax, qword [rsp + 280]
	LONG $0x07048d48                   // lea    rax, [rdi + rax]
	LONG $0x248c8b48; LONG $0x000000f8 // mov    rcx, qword [rsp + 248]
	WORD $0x148b; BYTE $0x81           // mov    edx, dword [rcx + 4*rax]
	LONG $0x248c8b48; LONG $0x000000f0 // mov    rcx, qword [rsp + 240]
	WORD $0x142b; BYTE $0x81           // sub    edx, dword [rcx + 4*rax]
	LONG $0x248c8b48; LONG $0x000000e8 // mov    rcx, qword [rsp + 232]
	WORD $0x142b; BYTE $0x81           // sub    edx, dword [rcx + 4*rax]
	LONG $0x248c8b48; LONG $0x000000e0 // mov    rcx, qword [rsp + 224]
	WORD $0x1403; BYTE $0x81           // add    edx, dword [rcx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xd2       // vcvtsi2ss    xmm2, xmm0, rdx
	LONG $0x248c8b48; LONG $0x000000d8 // mov    rcx, qword [rsp + 216]
	WORD $0x148b; BYTE $0x81           // mov    edx, dword [rcx + 4*rax]
	LONG $0x248c8b48; LONG $0x000000d0 // mov    rcx, qword [rsp + 208]
	WORD $0x142b; BYTE $0x81           // sub    edx, dword [rcx + 4*rax]
	LONG $0x248c8b48; LONG $0x000000c8 // mov    rcx, qword [rsp + 200]
	WORD $0x142b; BYTE $0x81           // sub    edx, dword [rcx + 4*rax]
	LONG $0x248c8b48; LONG $0x000000c0 // mov    rcx, qword [rsp + 192]
	WORD $0x1403; BYTE $0x81           // add    edx, dword [rcx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xda       // vcvtsi2ss    xmm3, xmm0, rdx
	LONG $0xdb59c2c5                   // vmulss    xmm3, xmm7, xmm3
	LONG $0xd259eac5                   // vmulss    xmm2, xmm2, xmm2
	LONG $0xd25ce2c5                   // vsubss    xmm2, xmm3, xmm2
	LONG $0xd22e78c5                   // vucomiss    xmm10, xmm2
	LONG $0x2878c1c4; BYTE $0xdb       // vmovaps    xmm3, xmm11
	JA   LBB0_125
	LONG $0xda51fac5                   // vsqrtss    xmm3, xmm0, xmm2

LBB0_125:
	LONG $0x000001b9; BYTE $0x00       // mov    ecx, 1
	LONG $0x24848b48; LONG $0x000000b8 // mov    rax, qword [rsp + 184]
	WORD $0xc085                       // test    eax, eax
	JLE  LBB0_143
	LONG $0x24848b48; LONG $0x00000108 // mov    rax, qword [rsp + 264]
	LONG $0x07048d48                   // lea    rax, [rdi + rax]
	LONG $0x24bc8948; LONG $0x00000110 // mov    qword [rsp + 272], rdi
	LONG $0x0065634d                   // movsxd    r12, dword [r13]
	LONG $0x248c8b48; LONG $0x00000098 // mov    rcx, qword [rsp + 152]
	LONG $0xe10c8d4a                   // lea    rcx, [rcx + 8*r12]
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x24a4034c; LONG $0x000000a0 // add    r12, qword [rsp + 160]
	WORD $0x3145; BYTE $0xff           // xor    r15d, r15d
	WORD $0x8949; BYTE $0xd8           // mov    r8, rbx

LBB0_127:
	WORD $0x894d; BYTE $0xf9           // mov    r9, r15
	LONG $0x04e1c149                   // shl    r9, 4
	LONG $0x0d7c8043; WORD $0x000d     // cmp    byte [r13 + r9 + 13], 0
	JNE  LBB0_141
	LONG $0x0d74634b; BYTE $0x04       // movsxd    rsi, dword [r13 + r9 + 4]
	WORD $0x8949; BYTE $0xf2           // mov    r10, rsi
	LONG $0x04e2c149                   // shl    r10, 4
	WORD $0x014d; BYTE $0xe2           // add    r10, r12
	LONG $0x0d7c8043; WORD $0x000c     // cmp    byte [r13 + r9 + 12], 0
	JE   LBB0_135
	LONG $0xe4efd9c5                   // vpxor    xmm4, xmm4, xmm4
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_139
	LONG $0x24448d4d; BYTE $0x10       // lea    r8, [r12 + 16]
	WORD $0x394d; BYTE $0xc2           // cmp    r10, r8
	WORD $0x894d; BYTE $0xc3           // mov    r11, r8
	LONG $0xda470f4d                   // cmova    r11, r10
	WORD $0x294d; BYTE $0xe3           // sub    r11, r12
	WORD $0xff49; BYTE $0xcb           // dec    r11
	LONG $0x04ebc149                   // shr    r11, 4
	LONG $0xe4efd9c5                   // vpxor    xmm4, xmm4, xmm4
	WORD $0x8948; BYTE $0xcb           // mov    rbx, rcx
	LONG $0x248c8948; LONG $0x00000138 // mov    qword [rsp + 312], rcx

LBB0_131:
	LONG $0x243c6349                           // movsxd    rdi, dword [r12]
	LONG $0x78ff6b48                           // imul    rdi, rdi, 120
	LONG $0x3e0c8b49                           // mov    rcx, qword [r14 + rdi]
	LONG $0x3e748b49; BYTE $0x08               // mov    rsi, qword [r14 + rdi + 8]
	WORD $0x0c8b; BYTE $0x81                   // mov    ecx, dword [rcx + 4*rax]
	WORD $0x0c2b; BYTE $0x86                   // sub    ecx, dword [rsi + 4*rax]
	LONG $0x3e748b49; BYTE $0x10               // mov    rsi, qword [r14 + rdi + 16]
	WORD $0x0c2b; BYTE $0x86                   // sub    ecx, dword [rsi + 4*rax]
	LONG $0x3e748b49; BYTE $0x18               // mov    rsi, qword [r14 + rdi + 24]
	WORD $0x0c03; BYTE $0x86                   // add    ecx, dword [rsi + 4*rax]
	LONG $0x2afae1c4; BYTE $0xd1               // vcvtsi2ss    xmm2, xmm0, rcx
	LONG $0x596ac1c4; WORD $0x3e54; BYTE $0x20 // vmulss    xmm2, xmm2, dword [r14 + rdi + 32]
	LONG $0x3e4c8b49; BYTE $0x28               // mov    rcx, qword [r14 + rdi + 40]
	WORD $0x0c8b; BYTE $0x81                   // mov    ecx, dword [rcx + 4*rax]
	LONG $0x3e748b49; BYTE $0x30               // mov    rsi, qword [r14 + rdi + 48]
	WORD $0x0c2b; BYTE $0x86                   // sub    ecx, dword [rsi + 4*rax]
	LONG $0x3e748b49; BYTE $0x38               // mov    rsi, qword [r14 + rdi + 56]
	WORD $0x0c2b; BYTE $0x86                   // sub    ecx, dword [rsi + 4*rax]
	LONG $0x3e748b49; BYTE $0x40               // mov    rsi, qword [r14 + rdi + 64]
	WORD $0x0c03; BYTE $0x86                   // add    ecx, dword [rsi + 4*rax]
	LONG $0x2afae1c4; BYTE $0xe9               // vcvtsi2ss    xmm5, xmm0, rcx
	LONG $0x5952c1c4; WORD $0x3e6c; BYTE $0x48 // vmulss    xmm5, xmm5, dword [r14 + rdi + 72]
	LONG $0xd558eac5                           // vaddss    xmm2, xmm2, xmm5
	LONG $0x3e6c8b4d; BYTE $0x50               // mov    r13, qword [r14 + rdi + 80]
	WORD $0x854d; BYTE $0xed                   // test    r13, r13
	JE   LBB0_133
	LONG $0x854c8b41; BYTE $0x00               // mov    ecx, dword [r13 + 4*rax]
	LONG $0x3e748b49; BYTE $0x58               // mov    rsi, qword [r14 + rdi + 88]
	LONG $0x3e548b49; BYTE $0x60               // mov    rdx, qword [r14 + rdi + 96]
	WORD $0x0c2b; BYTE $0x86                   // sub    ecx, dword [rsi + 4*rax]
	WORD $0x0c2b; BYTE $0x82                   // sub    ecx, dword [rdx + 4*rax]
	LONG $0x3e548b49; BYTE $0x68               // mov    rdx, qword [r14 + rdi + 104]
	WORD $0x0c03; BYTE $0x82                   // add    ecx, dword [rdx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xe9               // vcvtsi2ss    xmm5, xmm0, rcx
	LONG $0x5952c1c4; WORD $0x3e6c; BYTE $0x70 // vmulss    xmm5, xmm5, dword [r14 + rdi + 112]
	LONG $0xd558eac5                           // vaddss    xmm2, xmm2, xmm5

LBB0_133:
	LONG $0x5962c1c4; WORD $0x246c; BYTE $0x0c // vmulss    xmm5, xmm3, dword [r12 + 12]
	LONG $0xd52ef8c5                           // vucomiss    xmm2, xmm5
	WORD $0x930f; BYTE $0xd1                   // setae    cl
	WORD $0xb60f; BYTE $0xc9                   // movzx    ecx, cl
	LONG $0x2458dac5; BYTE $0x8b               // vaddss    xmm4, xmm4, dword [rbx + 4*rcx]
	LONG $0x08c38348                           // add    rbx, 8
	LONG $0x10c48349                           // add    r12, 16
	WORD $0x394d; BYTE $0xd4                   // cmp    r12, r10
	JB   LBB0_131
	LONG $0x248c8b48; LONG $0x00000138         // mov    rcx, qword [rsp + 312]
	LONG $0xd94c8d4a; BYTE $0x08               // lea    rcx, [rcx + 8*r11 + 8]
	LONG $0x04e3c149                           // shl    r11, 4
	WORD $0x014d; BYTE $0xd8                   // add    r8, r11
	WORD $0x894d; BYTE $0xc4                   // mov    r12, r8
	LONG $0x24ac8b4c; LONG $0x00000130         // mov    r13, qword [rsp + 304]
	LONG $0x24848b4c; LONG $0x00000128         // mov    r8, qword [rsp + 296]
	JMP  LBB0_139

LBB0_135:
	LONG $0xe4efd9c5                   // vpxor    xmm4, xmm4, xmm4
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_139
	LONG $0x245c8d4d; BYTE $0x10       // lea    r11, [r12 + 16]
	WORD $0x394d; BYTE $0xda           // cmp    r10, r11
	WORD $0x894c; BYTE $0xde           // mov    rsi, r11
	LONG $0xf2470f49                   // cmova    rsi, r10
	WORD $0x294c; BYTE $0xe6           // sub    rsi, r12
	WORD $0xff48; BYTE $0xce           // dec    rsi
	LONG $0x04eec148                   // shr    rsi, 4
	LONG $0xe4efd9c5                   // vpxor    xmm4, xmm4, xmm4
	WORD $0x8948; BYTE $0xcf           // mov    rdi, rcx
	LONG $0x248c8948; LONG $0x00000138 // mov    qword [rsp + 312], rcx

LBB0_137:
	LONG $0x240c6349                           // movsxd    rcx, dword [r12]
	LONG $0x78c96b48                           // imul    rcx, rcx, 120
	LONG $0x0e148b49                           // mov    rdx, qword [r14 + rcx]
	LONG $0x0e5c8b49; BYTE $0x08               // mov    rbx, qword [r14 + rcx + 8]
	WORD $0x148b; BYTE $0x82                   // mov    edx, dword [rdx + 4*rax]
	WORD $0x142b; BYTE $0x83                   // sub    edx, dword [rbx + 4*rax]
	LONG $0x0e5c8b49; BYTE $0x10               // mov    rbx, qword [r14 + rcx + 16]
	WORD $0x142b; BYTE $0x83                   // sub    edx, dword [rbx + 4*rax]
	LONG $0x0e5c8b49; BYTE $0x18               // mov    rbx, qword [r14 + rcx + 24]
	WORD $0x1403; BYTE $0x83                   // add    edx, dword [rbx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xd2               // vcvtsi2ss    xmm2, xmm0, rdx
	LONG $0x596ac1c4; WORD $0x0e54; BYTE $0x20 // vmulss    xmm2, xmm2, dword [r14 + rcx + 32]
	LONG $0x0e548b49; BYTE $0x28               // mov    rdx, qword [r14 + rcx + 40]
	WORD $0x148b; BYTE $0x82                   // mov    edx, dword [rdx + 4*rax]
	LONG $0x0e5c8b49; BYTE $0x30               // mov    rbx, qword [r14 + rcx + 48]
	WORD $0x142b; BYTE $0x83                   // sub    edx, dword [rbx + 4*rax]
	LONG $0x0e5c8b49; BYTE $0x38               // mov    rbx, qword [r14 + rcx + 56]
	WORD $0x142b; BYTE $0x83                   // sub    edx, dword [rbx + 4*rax]
	LONG $0x0e5c8b49; BYTE $0x40               // mov    rbx, qword [r14 + rcx + 64]
	WORD $0x1403; BYTE $0x83                   // add    edx, dword [rbx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xea               // vcvtsi2ss    xmm5, xmm0, rdx
	LONG $0x5952c1c4; WORD $0x0e6c; BYTE $0x48 // vmulss    xmm5, xmm5, dword [r14 + rcx + 72]
	LONG $0xd558eac5                           // vaddss    xmm2, xmm2, xmm5
	LONG $0x5962c1c4; WORD $0x246c; BYTE $0x0c // vmulss    xmm5, xmm3, dword [r12 + 12]
	LONG $0xd52ef8c5                           // vucomiss    xmm2, xmm5
	WORD $0x930f; BYTE $0xd1                   // setae    cl
	WORD $0xb60f; BYTE $0xc9                   // movzx    ecx, cl
	LONG $0x2458dac5; BYTE $0x8f               // vaddss    xmm4, xmm4, dword [rdi + 4*rcx]
	LONG $0x08c78348                           // add    rdi, 8
	LONG $0x10c48349                           // add    r12, 16
	WORD $0x394d; BYTE $0xd4                   // cmp    r12, r10
	JB   LBB0_137
	LONG $0x248c8b48; LONG $0x00000138         // mov    rcx, qword [rsp + 312]
	LONG $0xf14c8d48; BYTE $0x08               // lea    rcx, [rcx + 8*rsi + 8]
	LONG $0x04e6c148                           // shl    rsi, 4
	WORD $0x0149; BYTE $0xf3                   // add    r11, rsi
	WORD $0x894d; BYTE $0xdc                   // mov    r12, r11

LBB0_139:
	LONG $0x107a81c4; WORD $0x0d54; BYTE $0x08 // vmovss    xmm2, dword [r13 + r9 + 8]
	LONG $0xd42ef8c5                           // vucomiss    xmm2, xmm4
	JA   LBB0_140

LBB0_141:
	WORD $0xff49; BYTE $0xc7           // inc    r15
	WORD $0x394d; BYTE $0xc7           // cmp    r15, r8
	JL   LBB0_127
	WORD $0x894c; BYTE $0xc3           // mov    rbx, r8
	LONG $0x24848b4c; LONG $0x00000100 // mov    r8, qword [rsp + 256]
	LONG $0x24bc8b48; LONG $0x00000110 // mov    rdi, qword [rsp + 272]
	LONG $0x24b48b48; LONG $0x00000090 // mov    rsi, qword [rsp + 144]
	LONG $0x000001b9; BYTE $0x00       // mov    ecx, 1
	JMP  LBB0_143

LBB0_140:
	WORD $0x894c; BYTE $0xc3           // mov    rbx, r8
	WORD $0xf741; BYTE $0xdf           // neg    r15d
	WORD $0x8944; BYTE $0xf9           // mov    ecx, r15d
	LONG $0x24848b4c; LONG $0x00000100 // mov    r8, qword [rsp + 256]
	LONG $0x24bc8b48; LONG $0x00000110 // mov    rdi, qword [rsp + 272]
	LONG $0x24b48b48; LONG $0x00000090 // mov    rsi, qword [rsp + 144]

LBB0_143:
	WORD $0xc985             // test    ecx, ecx
	WORD $0x9f0f; BYTE $0xd0 // setg    al
	WORD $0xb60f; BYTE $0xc0 // movzx    eax, al
	LONG $0x08488b49         // mov    rcx, qword [r8 + 8]
	WORD $0x0489; BYTE $0xb9 // mov    dword [rcx + 4*rdi], eax

LBB0_144:
	WORD $0xff48; BYTE $0xc7           // inc    rdi
	LONG $0x24bc3b48; LONG $0x00000120 // cmp    rdi, qword [rsp + 288]
	JNE  LBB0_122

LBB0_145:
	LONG $0x244c8b48; BYTE $0x70       // mov    rcx, qword [rsp + 112]
	LONG $0x20418b48                   // mov    rax, qword [rcx + 32]
	LONG $0x10718b48                   // mov    rsi, qword [rcx + 16]
	LONG $0x24948b4c; LONG $0x00000080 // mov    r10, qword [rsp + 128]
	LONG $0xf2af0f49                   // imul    rsi, r10
	LONG $0x245c8b4c; BYTE $0x68       // mov    r11, qword [rsp + 104]
	WORD $0x8b4d; BYTE $0x0b           // mov    r9, qword [r11]
	LONG $0x08488b49                   // mov    rcx, qword [r8 + 8]
	LONG $0x24548b48; BYTE $0x58       // mov    rdx, qword [rsp + 88]
	WORD $0x8548; BYTE $0xd2           // test    rdx, rdx
	JE   LBB0_148
	LONG $0x313c8d49                   // lea    rdi, [r9 + rsi]
	WORD $0x0148; BYTE $0xc7           // add    rdi, rax
	WORD $0xdb31                       // xor    ebx, ebx

LBB0_147:
	LONG $0x146ffec5; BYTE $0x99   // vmovdqu    ymm2, [rcx + 4*rbx]
	LONG $0x546bedc5; WORD $0x2099 // vpackssdw    ymm2, ymm2, [rcx + 4*rbx + 32]
	LONG $0x00fde3c4; WORD $0xd8d2 // vpermq    ymm2, ymm2, 216
	LONG $0x5c6ffec5; WORD $0x4099 // vmovdqu    ymm3, [rcx + 4*rbx + 64]
	LONG $0x5c6be5c5; WORD $0x6099 // vpackssdw    ymm3, ymm3, [rcx + 4*rbx + 96]
	LONG $0x00fde3c4; WORD $0xd8db // vpermq    ymm3, ymm3, 216
	LONG $0xd367edc5               // vpackuswb    ymm2, ymm2, ymm3
	LONG $0x00fde3c4; WORD $0xd8d2 // vpermq    ymm2, ymm2, 216
	LONG $0x147ffec5; BYTE $0x1f   // vmovdqu    [rdi + rbx], ymm2
	LONG $0x20c38348               // add    rbx, 32
	WORD $0x3948; BYTE $0xd3       // cmp    rbx, rdx
	JB   LBB0_147

LBB0_148:
	LONG $0x24943b48; LONG $0x00000120 // cmp    rdx, qword [rsp + 288]
	LONG $0x24bc8b48; LONG $0x000000b0 // mov    rdi, qword [rsp + 176]
	LONG $0x249c8b48; LONG $0x000000a8 // mov    rbx, qword [rsp + 168]
	JE   LBB0_150
	WORD $0x0148; BYTE $0xf0           // add    rax, rsi
	WORD $0x014c; BYTE $0xc8           // add    rax, r9
	LONG $0x24b48b48; LONG $0x00000120 // mov    rsi, qword [rsp + 288]
	LONG $0x546ffec5; WORD $0x80b1     // vmovdqu    ymm2, [rcx + 4*rsi - 128]
	LONG $0x546bedc5; WORD $0xa0b1     // vpackssdw    ymm2, ymm2, [rcx + 4*rsi - 96]
	LONG $0x00fde3c4; WORD $0xd8d2     // vpermq    ymm2, ymm2, 216
	LONG $0x5c6ffec5; WORD $0xc0b1     // vmovdqu    ymm3, [rcx + 4*rsi - 64]
	LONG $0x5c6be5c5; WORD $0xe0b1     // vpackssdw    ymm3, ymm3, [rcx + 4*rsi - 32]
	LONG $0x00fde3c4; WORD $0xd8db     // vpermq    ymm3, ymm3, 216
	LONG $0xd367edc5                   // vpackuswb    ymm2, ymm2, ymm3
	LONG $0x00fde3c4; WORD $0xd8d2     // vpermq    ymm2, ymm2, 216
	LONG $0x547ffec5; WORD $0xe030     // vmovdqu    [rax + rsi - 32], ymm2

LBB0_150:
	WORD $0xff49; BYTE $0xc2 // inc    r10
	LONG $0x18533b4d         // cmp    r10, qword [r11 + 24]
	JL   LBB0_151

LBB0_152:
	///////////////////////////////////////////////////
	//
	//  E N D   O F   I M P O R T E D   A S S E M B L Y
	//
	///////////////////////////////////////////////////

	// Restore saved golang stack pointer
	MOVQ -8(SP), SP
	VZEROUPPER
	RET

// LCPI0_0:
//        .quad   72340172838076673       ## 0x101010101010101
DATA LC1<>+0x000(SB)/8, $0x0101010101010101
// LCPI0_2:
//        .quad   4294967297              ## 0x100000001
DATA LC1<>+0x008(SB)/8, $0x0000000100000001
//        .section        __TEXT,__const
//        .align  5
DATA LC1<>+0x010(SB)/8, $0xffffffffffffffff
DATA LC1<>+0x018(SB)/8, $0xffffffffffffffff
// LCPI0_1:
//        .long   0                       ## 0x0
//        .long   2                       ## 0x2
//        .long   4                       ## 0x4
//        .long   6                       ## 0x6
//        .long   1                       ## 0x1
//        .long   3                       ## 0x3
//        .long   5                       ## 0x5
//        .long   7                       ## 0x7
DATA LC1<>+0x020(SB)/8, $0x0000000200000000
DATA LC1<>+0x028(SB)/8, $0x0000000600000004
DATA LC1<>+0x030(SB)/8, $0x0000000300000001
DATA LC1<>+0x038(SB)/8, $0x0000000700000005
//        .section        __TEXT,__literal4,4byte_literals
//        .align  2
// LCPI0_3:
//        .long   1065353216              ## 0x3f800000
DATA LC1<>+0x040(SB)/8, $0x000000003f800000
GLOBL LC1<>(SB), 8, $72

