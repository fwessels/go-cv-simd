	LONG $0x2444894c; BYTE $0x70       // mov    qword [rsp + 112], r8
	LONG $0x244c8948; BYTE $0x78       // mov    qword [rsp + 120], rcx
	LONG $0x24b48948; LONG $0x00000090 // mov    qword [rsp + 144], rsi
	LONG $0x24bc8948; LONG $0x000000b0 // mov    qword [rsp + 176], rdi
	LONG $0x084a8b48                   // mov    rcx, qword [rdx + 8]
	LONG $0x184a3b48                   // cmp    rcx, qword [rdx + 24]
	JGE  LBB0_157
	LONG $0x10428b48                   // mov    rax, qword [rdx + 16]
	WORD $0x8b4c; BYTE $0x0a           // mov    r9, qword [rdx]
	LONG $0x24948948; LONG $0x00000098 // mov    qword [rsp + 152], rdx
	WORD $0x294c; BYTE $0xc8           // sub    rax, r9
	LONG $0x24848948; LONG $0x00000088 // mov    qword [rsp + 136], rax
	WORD $0x8949; BYTE $0xc2           // mov    r10, rax
	LONG $0xf0e28349                   // and    r10, -16
	LONG $0x2454894c; BYTE $0x68       // mov    qword [rsp + 104], r10
	WORD $0x8948; BYTE $0xc2           // mov    rdx, rax
	LONG $0xfee28348                   // and    rdx, -2
	LONG $0x24548948; BYTE $0x60       // mov    qword [rsp + 96], rdx
	WORD $0x8949; BYTE $0xc3           // mov    r11, rax
	LONG $0xe0e38349                   // and    r11, -32
	LONG $0x245c894c; BYTE $0x40       // mov    qword [rsp + 64], r11
	LONG $0xf0728d48                   // lea    rsi, [rdx - 16]
	LONG $0x24748948; BYTE $0x08       // mov    qword [rsp + 8], rsi
	WORD $0xd148; BYTE $0xee           // shr    rsi, 1
	LONG $0x24348948                   // mov    qword [rsp], rsi
	LONG $0xff738d49                   // lea    rsi, [r11 - 1]
	LONG $0x05eec148                   // shr    rsi, 5
	LONG $0x24748948; BYTE $0x50       // mov    qword [rsp + 80], rsi
	LONG $0x00048d48                   // lea    rax, [rax + rax]
	LONG $0xfce08348                   // and    rax, -4
	LONG $0xfe588d48                   // lea    rbx, [rax - 2]
	LONG $0x245c8948; BYTE $0x20       // mov    qword [rsp + 32], rbx
	WORD $0xff48; BYTE $0xc8           // dec    rax
	LONG $0x24448948; BYTE $0x38       // mov    qword [rsp + 56], rax
	WORD $0xebd1                       // shr    ebx, 1
	WORD $0xc3ff                       // inc    ebx
	WORD $0xe383; BYTE $0x06           // and    ebx, 6
	LONG $0x245c8948; BYTE $0x18       // mov    qword [rsp + 24], rbx
	WORD $0xe683; BYTE $0x01           // and    esi, 1
	LONG $0x24748948; BYTE $0x48       // mov    qword [rsp + 72], rsi
	WORD $0xe8d1                       // shr    eax, 1
	WORD $0xc0ff                       // inc    eax
	WORD $0xe083; BYTE $0x06           // and    eax, 6
	LONG $0x24448948; BYTE $0x30       // mov    qword [rsp + 48], rax
	WORD $0xf748; BYTE $0xdb           // neg    rbx
	LONG $0x245c8948; BYTE $0x10       // mov    qword [rsp + 16], rbx
	WORD $0xf748; BYTE $0xd8           // neg    rax
	LONG $0x24448948; BYTE $0x28       // mov    qword [rsp + 40], rax
	LONG $0x597de2c4; WORD $0x0845     // vpbroadcastq    ymm0, qword 0x008[rbp] /* [rip + LCPI0_1] */
	LONG $0x4d6ffdc5; BYTE $0x20       // vmovdqa    ymm1, 0x020[rbp] /* [rip + LCPI0_2] */
	LONG $0xd2efedc5                   // vpxor    ymm2, ymm2, ymm2
	LONG $0x187d62c4; WORD $0x404d     // vbroadcastss    ymm9, dword 0x040[rbp] /* [rip + LCPI0_3] */
	LONG $0x6d107ac5; BYTE $0x40       // vmovss    xmm13, dword 0x040[rbp] /* [rip + LCPI0_3] */
	LONG $0x572841c4; BYTE $0xd2       // vxorps    xmm10, xmm10, xmm10
	LONG $0x756ffac5; BYTE $0x00       // vmovdqu    xmm6, 0x000[rbp] /* [rip + LCPI0_0] */
	LONG $0x12048d48                   // lea    rax, [rdx + rdx]
	LONG $0x24448948; BYTE $0x58       // mov    qword [rsp + 88], rax
	JMP  LBB0_2

LBB0_156:
	WORD $0x8b4c; BYTE $0x08 // mov    r9, qword [rax]

LBB0_2:
	LONG $0x248c8948; LONG $0x000000b8         // mov    qword [rsp + 184], rcx
	LONG $0x88878b48; WORD $0x0001; BYTE $0x00 // mov    rax, qword [rdi + 392]
	LONG $0xc1af0f48                           // imul    rax, rcx
	LONG $0x24848948; LONG $0x00000080         // mov    qword [rsp + 128], rax
	LONG $0x28878b48; WORD $0x0001; BYTE $0x00 // mov    rax, qword [rdi + 296]
	LONG $0xc1af0f48                           // imul    rax, rcx
	LONG $0x24848948; LONG $0x000000a0         // mov    qword [rsp + 160], rax
	LONG $0x24848b48; LONG $0x00000090         // mov    rax, qword [rsp + 144]
	LONG $0x20788b48                           // mov    rdi, qword [rax + 32]
	LONG $0x10588b48                           // mov    rbx, qword [rax + 16]
	LONG $0xd9af0f48                           // imul    rbx, rcx
	LONG $0x1f348d48                           // lea    rsi, [rdi + rbx]
	WORD $0x014c; BYTE $0xce                   // add    rsi, r9
	WORD $0x8b49; BYTE $0x10                   // mov    rdx, qword [r8]
	WORD $0x854d; BYTE $0xdb                   // test    r11, r11
	JE   LBB0_8
	LONG $0x000000b9; BYTE $0x00               // mov    ecx, 0
	LONG $0x247c8348; WORD $0x0048             // cmp    qword [rsp + 72], 0
	JNE  LBB0_5
	LONG $0x597de2c4; BYTE $0xde               // vpbroadcastq    ymm3, xmm6
	LONG $0x1edbe5c5                           // vpand    ymm3, ymm3, [rsi]
	LONG $0x00fde3c4; WORD $0xd8db             // vpermq    ymm3, ymm3, 216
	LONG $0xea60e5c5                           // vpunpcklbw    ymm5, ymm3, ymm2
	LONG $0x2a7ffec5                           // vmovdqu    [rdx], ymm5
	LONG $0xda68e5c5                           // vpunpckhbw    ymm3, ymm3, ymm2
	LONG $0x5a7ffec5; BYTE $0x20               // vmovdqu    [rdx + 32], ymm3
	LONG $0x000020b9; BYTE $0x00               // mov    ecx, 32

LBB0_5:
	LONG $0x247c8348; WORD $0x0050 // cmp    qword [rsp + 80], 0
	JE   LBB0_8
	LONG $0x4a448d48; BYTE $0x60   // lea    rax, [rdx + 2*rcx + 96]
	WORD $0x014c; BYTE $0xcb       // add    rbx, r9
	LONG $0x1f7c8d48; BYTE $0x20   // lea    rdi, [rdi + rbx + 32]

LBB0_7:
	LONG $0x597de2c4; BYTE $0xde   // vpbroadcastq    ymm3, xmm6
	LONG $0x6cdbe5c5; WORD $0xe00f // vpand    ymm5, ymm3, [rdi + rcx - 32]
	LONG $0x00fde3c4; WORD $0xd8ed // vpermq    ymm5, ymm5, 216
	LONG $0xfa60d5c5               // vpunpcklbw    ymm7, ymm5, ymm2
	LONG $0x787ffec5; BYTE $0xa0   // vmovdqu    [rax - 96], ymm7
	LONG $0xea68d5c5               // vpunpckhbw    ymm5, ymm5, ymm2
	LONG $0x687ffec5; BYTE $0xc0   // vmovdqu    [rax - 64], ymm5
	LONG $0x1cdbe5c5; BYTE $0x0f   // vpand    ymm3, ymm3, [rdi + rcx]
	LONG $0x00fde3c4; WORD $0xd8db // vpermq    ymm3, ymm3, 216
	LONG $0xea60e5c5               // vpunpcklbw    ymm5, ymm3, ymm2
	LONG $0x687ffec5; BYTE $0xe0   // vmovdqu    [rax - 32], ymm5
	LONG $0xda68e5c5               // vpunpckhbw    ymm3, ymm3, ymm2
	LONG $0x187ffec5               // vmovdqu    [rax], ymm3
	LONG $0x40c18348               // add    rcx, 64
	LONG $0x80e88348               // sub    rax, -128
	WORD $0x394c; BYTE $0xd9       // cmp    rcx, r11
	JB   LBB0_7

LBB0_8:
	WORD $0x894c; BYTE $0xc9       // mov    rcx, r9
	LONG $0x3fe9c148               // shr    rcx, 63
	LONG $0x245c3b4c; BYTE $0x60   // cmp    r11, qword [rsp + 96]
	JE   LBB0_10
	LONG $0x597de2c4; BYTE $0xde   // vpbroadcastq    ymm3, xmm6
	LONG $0x24448b48; BYTE $0x60   // mov    rax, qword [rsp + 96]
	LONG $0x5cdbe5c5; WORD $0xe006 // vpand    ymm3, ymm3, [rsi + rax - 32]
	LONG $0x00fde3c4; WORD $0xd8db // vpermq    ymm3, ymm3, 216
	LONG $0xea60e5c5               // vpunpcklbw    ymm5, ymm3, ymm2
	LONG $0x6c7ffec5; WORD $0xc042 // vmovdqu    [rdx + 2*rax - 64], ymm5
	LONG $0xda68e5c5               // vpunpckhbw    ymm3, ymm3, ymm2
	LONG $0x5c7ffec5; WORD $0xe042 // vmovdqu    [rdx + 2*rax - 32], ymm3

LBB0_10:
	WORD $0x014c; BYTE $0xc9       // add    rcx, r9
	LONG $0x24448b48; BYTE $0x58   // mov    rax, qword [rsp + 88]
	LONG $0x02f88348               // cmp    rax, 2
	JB   LBB0_14
	WORD $0x8948; BYTE $0xc7       // mov    rdi, rax
	LONG $0x08508b49               // mov    rdx, qword [r8 + 8]
	LONG $0x24448b48; BYTE $0x10   // mov    rax, qword [rsp + 16]
	LONG $0x000001be; BYTE $0x00   // mov    esi, 1
	LONG $0x247c8348; WORD $0x0018 // cmp    qword [rsp + 24], 0
	JE   LBB0_13

LBB0_12:
	LONG $0x7204c766; WORD $0x0000 // mov    word [rdx + 2*rsi], 0
	LONG $0x02c68348               // add    rsi, 2
	WORD $0xff48; BYTE $0xc0       // inc    rax
	JNE  LBB0_12

LBB0_13:
	LONG $0x247c8348; WORD $0x0e20 // cmp    qword [rsp + 32], 14
	WORD $0x8948; BYTE $0xf8       // mov    rax, rdi
	JB   LBB0_14

LBB0_158:
	LONG $0x7204c766; WORD $0x0000             // mov    word [rdx + 2*rsi], 0
	LONG $0x7244c766; WORD $0x0004; BYTE $0x00 // mov    word [rdx + 2*rsi + 4], 0
	LONG $0x7244c766; WORD $0x0008; BYTE $0x00 // mov    word [rdx + 2*rsi + 8], 0
	LONG $0x7244c766; WORD $0x000c; BYTE $0x00 // mov    word [rdx + 2*rsi + 12], 0
	LONG $0x7244c766; WORD $0x0010; BYTE $0x00 // mov    word [rdx + 2*rsi + 16], 0
	LONG $0x7244c766; WORD $0x0014; BYTE $0x00 // mov    word [rdx + 2*rsi + 20], 0
	LONG $0x7244c766; WORD $0x0018; BYTE $0x00 // mov    word [rdx + 2*rsi + 24], 0
	LONG $0x7244c766; WORD $0x001c; BYTE $0x00 // mov    word [rdx + 2*rsi + 28], 0
	LONG $0x10c68348                           // add    rsi, 16
	WORD $0x3948; BYTE $0xc6                   // cmp    rsi, rax
	JB   LBB0_158

LBB0_14:
	LONG $0x24acc148; LONG $0x00000080; BYTE $0x02 // shr    qword [rsp + 128], 2
	WORD $0xd148; BYTE $0xf9                       // sar    rcx, 1
	LONG $0x24acc148; LONG $0x000000a0; BYTE $0x02 // shr    qword [rsp + 160], 2
	WORD $0x8548; BYTE $0xc0                       // test    rax, rax
	JE   LBB0_18
	WORD $0x8948; BYTE $0xc7                       // mov    rdi, rax
	LONG $0x08508b49                               // mov    rdx, qword [r8 + 8]
	LONG $0x24448b48; BYTE $0x28                   // mov    rax, qword [rsp + 40]
	LONG $0x000000be; BYTE $0x00                   // mov    esi, 0
	LONG $0x247c8348; WORD $0x0030                 // cmp    qword [rsp + 48], 0
	JE   LBB0_17

LBB0_16:
	LONG $0x7204c766; WORD $0x0000 // mov    word [rdx + 2*rsi], 0
	LONG $0x02c68348               // add    rsi, 2
	WORD $0xff48; BYTE $0xc0       // inc    rax
	JNE  LBB0_16

LBB0_17:
	LONG $0x247c8348; WORD $0x0e38 // cmp    qword [rsp + 56], 14
	WORD $0x8948; BYTE $0xf8       // mov    rax, rdi
	JB   LBB0_18

LBB0_159:
	LONG $0x7204c766; WORD $0x0000             // mov    word [rdx + 2*rsi], 0
	LONG $0x7244c766; WORD $0x0004; BYTE $0x00 // mov    word [rdx + 2*rsi + 4], 0
	LONG $0x7244c766; WORD $0x0008; BYTE $0x00 // mov    word [rdx + 2*rsi + 8], 0
	LONG $0x7244c766; WORD $0x000c; BYTE $0x00 // mov    word [rdx + 2*rsi + 12], 0
	LONG $0x7244c766; WORD $0x0010; BYTE $0x00 // mov    word [rdx + 2*rsi + 16], 0
	LONG $0x7244c766; WORD $0x0014; BYTE $0x00 // mov    word [rdx + 2*rsi + 20], 0
	LONG $0x7244c766; WORD $0x0018; BYTE $0x00 // mov    word [rdx + 2*rsi + 24], 0
	LONG $0x7244c766; WORD $0x001c; BYTE $0x00 // mov    word [rdx + 2*rsi + 28], 0
	LONG $0x10c68348                           // add    rsi, 16
	WORD $0x3948; BYTE $0xc6                   // cmp    rsi, rax
	JB   LBB0_159

LBB0_18:
	LONG $0x24448948; BYTE $0x58       // mov    qword [rsp + 88], rax
	LONG $0x248c0148; LONG $0x00000080 // add    qword [rsp + 128], rcx
	LONG $0x248c014c; LONG $0x000000a0 // add    qword [rsp + 160], r9
	LONG $0x0000bc41; WORD $0x0000     // mov    r12d, 0
	LONG $0x0000bf41; WORD $0x0000     // mov    r15d, 0
	WORD $0x854d; BYTE $0xd2           // test    r10, r10
	JE   LBB0_72

LBB0_19:
	WORD $0x8b49; BYTE $0x00                       // mov    rax, qword [r8]
	LONG $0x6f7ea1c4; WORD $0x603c                 // vmovdqu    ymm7, [rax + 2*r12]
	LONG $0x177de2c4; BYTE $0xf8                   // vptest    ymm7, ymm0
	JE   LBB0_70
	LONG $0x24848b48; LONG $0x000000a0             // mov    rax, qword [rsp + 160]
	LONG $0x04048d49                               // lea    rax, [r12 + rax]
	LONG $0x248c8b48; LONG $0x000000b0             // mov    rcx, qword [rsp + 176]
	LONG $0xc8818b4c; WORD $0x0000; BYTE $0x00     // mov    r8, qword [rcx + 200]
	LONG $0x6f7ec1c4; WORD $0x801c                 // vmovdqu    ymm3, [r8 + 4*rax]
	LONG $0xd0898b4c; WORD $0x0000; BYTE $0x00     // mov    r9, qword [rcx + 208]
	LONG $0xd8918b4c; WORD $0x0000; BYTE $0x00     // mov    r10, qword [rcx + 216]
	LONG $0xe0b98b4c; WORD $0x0000; BYTE $0x00     // mov    r15, qword [rcx + 224]
	LONG $0xfa65c1c4; WORD $0x811c                 // vpsubd    ymm3, ymm3, [r9 + 4*rax]
	LONG $0xfa65c1c4; WORD $0x821c                 // vpsubd    ymm3, ymm3, [r10 + 4*rax]
	LONG $0xfe65c1c4; WORD $0x871c                 // vpaddd    ymm3, ymm3, [r15 + 4*rax]
	LONG $0x3675e2c4; BYTE $0xdb                   // vpermd    ymm3, ymm1, ymm3
	LONG $0xa8998b4c; WORD $0x0000; BYTE $0x00     // mov    r11, qword [rcx + 168]
	LONG $0x6f7ec1c4; WORD $0x832c                 // vmovdqu    ymm5, [r11 + 4*rax]
	LONG $0xb0b18b4c; WORD $0x0000; BYTE $0x00     // mov    r14, qword [rcx + 176]
	LONG $0xb8b98b48; WORD $0x0000; BYTE $0x00     // mov    rdi, qword [rcx + 184]
	LONG $0xc0998b48; WORD $0x0000; BYTE $0x00     // mov    rbx, qword [rcx + 192]
	LONG $0xfa55c1c4; WORD $0x862c                 // vpsubd    ymm5, ymm5, [r14 + 4*rax]
	LONG $0x2cfad5c5; BYTE $0x87                   // vpsubd    ymm5, ymm5, [rdi + 4*rax]
	LONG $0x2cfed5c5; BYTE $0x83                   // vpaddd    ymm5, ymm5, [rbx + 4*rax]
	LONG $0x367562c4; BYTE $0xc5                   // vpermd    ymm8, ymm1, ymm5
	LONG $0x58698b4c                               // mov    r13, qword [rcx + 88]
	LONG $0x24ac894c; LONG $0x000000c8             // mov    qword [rsp + 200], r13
	LONG $0x60518b48                               // mov    rdx, qword [rcx + 96]
	WORD $0x294c; BYTE $0xea                       // sub    rdx, r13
	LONG $0x04eac148                               // shr    rdx, 4
	WORD $0xd285                                   // test    edx, edx
	JLE  LBB0_21
	LONG $0x187de2c4; LONG $0x0000a0a9; BYTE $0x00 // vbroadcastss    ymm5, dword [rcx + 160]
	LONG $0x6f7e41c4; WORD $0x805c; BYTE $0x20     // vmovdqu    ymm11, [r8 + 4*rax + 32]
	LONG $0xfa2541c4; WORD $0x815c; BYTE $0x20     // vpsubd    ymm11, ymm11, [r9 + 4*rax + 32]
	LONG $0xfa2541c4; WORD $0x825c; BYTE $0x20     // vpsubd    ymm11, ymm11, [r10 + 4*rax + 32]
	LONG $0xfe2541c4; WORD $0x875c; BYTE $0x20     // vpaddd    ymm11, ymm11, [r15 + 4*rax + 32]
	LONG $0x367542c4; BYTE $0xdb                   // vpermd    ymm11, ymm1, ymm11
	LONG $0x3865c3c4; WORD $0x01db                 // vinserti128    ymm3, ymm3, xmm11, 1
	LONG $0xdb5bfcc5                               // vcvtdq2ps    ymm3, ymm3
	LONG $0x6f7e41c4; WORD $0x835c; BYTE $0x20     // vmovdqu    ymm11, [r11 + 4*rax + 32]
	LONG $0xfa2541c4; WORD $0x865c; BYTE $0x20     // vpsubd    ymm11, ymm11, [r14 + 4*rax + 32]
	LONG $0x5cfa25c5; WORD $0x2087                 // vpsubd    ymm11, ymm11, [rdi + 4*rax + 32]
	LONG $0x5cfe25c5; WORD $0x2083                 // vpaddd    ymm11, ymm11, [rbx + 4*rax + 32]
	LONG $0x367542c4; BYTE $0xdb                   // vpermd    ymm11, ymm1, ymm11
	LONG $0x383d43c4; WORD $0x01c3                 // vinserti128    ymm8, ymm8, xmm11, 1
	LONG $0x5b7c41c4; BYTE $0xc0                   // vcvtdq2ps    ymm8, ymm8
	LONG $0x5954c1c4; BYTE $0xe8                   // vmulps    ymm5, ymm5, ymm8
	LONG $0xdb59e4c5                               // vmulps    ymm3, ymm3, ymm3
	LONG $0xdb5cd4c5                               // vsubps    ymm3, ymm5, ymm3
	LONG $0xeac2e4c5; BYTE $0x1e                   // vcmpgt_oqps    ymm5, ymm3, ymm2
	LONG $0xdd54e4c5                               // vandps    ymm3, ymm3, ymm5
	LONG $0x5554c1c4; BYTE $0xe9                   // vandnps    ymm5, ymm5, ymm9
	LONG $0xdd56e4c5                               // vorps    ymm3, ymm3, ymm5
	LONG $0xc3517cc5                               // vsqrtps    ymm8, ymm3
	WORD $0x8948; BYTE $0xc8                       // mov    rax, rcx
	LONG $0x24a4894c; LONG $0x000000c0             // mov    qword [rsp + 192], r12
	WORD $0xd149; BYTE $0xec                       // shr    r12, 1
	LONG $0x24a4034c; LONG $0x00000080             // add    r12, qword [rsp + 128]
	LONG $0x28488b48                               // mov    rcx, qword [rax + 40]
	LONG $0x70788b48                               // mov    rdi, qword [rax + 112]
	WORD $0x6348; BYTE $0xda                       // movsxd    rbx, edx
	LONG $0x249c8948; LONG $0x000000d0             // mov    qword [rsp + 208], rbx
	LONG $0x88908b4c; WORD $0x0000; BYTE $0x00     // mov    r10, qword [rax + 136]
	WORD $0x3145; BYTE $0xff                       // xor    r15d, r15d

LBB0_23:
	WORD $0x894d; BYTE $0xf9           // mov    r9, r15
	LONG $0x04e1c149                   // shl    r9, 4
	LONG $0x0d7c8043; WORD $0x000d     // cmp    byte [r13 + r9 + 13], 0
	JNE  LBB0_60
	LONG $0x0d74634b; BYTE $0x04       // movsxd    rsi, dword [r13 + r9 + 4]
	WORD $0x8949; BYTE $0xf6           // mov    r14, rsi
	LONG $0x04e6c149                   // shl    r14, 4
	WORD $0x0149; BYTE $0xce           // add    r14, rcx
	LONG $0x0d7c8043; WORD $0x000c     // cmp    byte [r13 + r9 + 12], 0
	JE   LBB0_31
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_36
	LONG $0x10418d4c                   // lea    r8, [rcx + 16]
	WORD $0x394d; BYTE $0xc6           // cmp    r14, r8
	WORD $0x894d; BYTE $0xc5           // mov    r13, r8
	LONG $0xee470f4d                   // cmova    r13, r14
	WORD $0x2949; BYTE $0xcd           // sub    r13, rcx
	WORD $0xff49; BYTE $0xcd           // dec    r13
	LONG $0x04edc149                   // shr    r13, 4
	LONG $0x24bc8948; LONG $0x000000d8 // mov    qword [rsp + 216], rdi
	LONG $0x047f8d48                   // lea    rdi, [rdi + 4]
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_27:
	WORD $0x6348; BYTE $0x31                   // movsxd    rsi, dword [rcx]
	LONG $0x78f66b48                           // imul    rsi, rsi, 120
	LONG $0x32148b49                           // mov    rdx, qword [r10 + rsi]
	LONG $0x325c8b49; BYTE $0x08               // mov    rbx, qword [r10 + rsi + 8]
	LONG $0x6f7ea1c4; WORD $0xa22c             // vmovdqu    ymm5, [rdx + 4*r12]
	LONG $0x32548b49; BYTE $0x10               // mov    rdx, qword [r10 + rsi + 16]
	LONG $0x32448b49; BYTE $0x18               // mov    rax, qword [r10 + rsi + 24]
	LONG $0xfa55a1c4; WORD $0xa32c             // vpsubd    ymm5, ymm5, [rbx + 4*r12]
	LONG $0xfa55a1c4; WORD $0xa22c             // vpsubd    ymm5, ymm5, [rdx + 4*r12]
	LONG $0xfe55a1c4; WORD $0xa02c             // vpaddd    ymm5, ymm5, [rax + 4*r12]
	LONG $0xed5bfcc5                           // vcvtdq2ps    ymm5, ymm5
	LONG $0x187d42c4; WORD $0x325c; BYTE $0x20 // vbroadcastss    ymm11, dword [r10 + rsi + 32]
	LONG $0x5954c1c4; BYTE $0xeb               // vmulps    ymm5, ymm5, ymm11
	LONG $0x32448b49; BYTE $0x28               // mov    rax, qword [r10 + rsi + 40]
	LONG $0x6f7e21c4; WORD $0xa01c             // vmovdqu    ymm11, [rax + 4*r12]
	LONG $0x32448b49; BYTE $0x30               // mov    rax, qword [r10 + rsi + 48]
	LONG $0x32548b49; BYTE $0x38               // mov    rdx, qword [r10 + rsi + 56]
	LONG $0x325c8b49; BYTE $0x40               // mov    rbx, qword [r10 + rsi + 64]
	LONG $0xfa2521c4; WORD $0xa01c             // vpsubd    ymm11, ymm11, [rax + 4*r12]
	LONG $0xfa2521c4; WORD $0xa21c             // vpsubd    ymm11, ymm11, [rdx + 4*r12]
	LONG $0xfe2521c4; WORD $0xa31c             // vpaddd    ymm11, ymm11, [rbx + 4*r12]
	LONG $0x5b7c41c4; BYTE $0xdb               // vcvtdq2ps    ymm11, ymm11
	LONG $0x187d42c4; WORD $0x3264; BYTE $0x48 // vbroadcastss    ymm12, dword [r10 + rsi + 72]
	LONG $0x592441c4; BYTE $0xdc               // vmulps    ymm11, ymm11, ymm12
	LONG $0x5854c1c4; BYTE $0xeb               // vaddps    ymm5, ymm5, ymm11
	LONG $0x325c8b4d; BYTE $0x50               // mov    r11, qword [r10 + rsi + 80]
	WORD $0x854d; BYTE $0xdb                   // test    r11, r11
	JE   LBB0_29
	LONG $0x6f7e01c4; WORD $0xa31c             // vmovdqu    ymm11, [r11 + 4*r12]
	LONG $0x32448b49; BYTE $0x58               // mov    rax, qword [r10 + rsi + 88]
	LONG $0x32548b49; BYTE $0x60               // mov    rdx, qword [r10 + rsi + 96]
	LONG $0x325c8b49; BYTE $0x68               // mov    rbx, qword [r10 + rsi + 104]
	LONG $0xfa2521c4; WORD $0xa01c             // vpsubd    ymm11, ymm11, [rax + 4*r12]
	LONG $0xfa2521c4; WORD $0xa21c             // vpsubd    ymm11, ymm11, [rdx + 4*r12]
	LONG $0xfe2521c4; WORD $0xa31c             // vpaddd    ymm11, ymm11, [rbx + 4*r12]
	LONG $0x5b7c41c4; BYTE $0xdb               // vcvtdq2ps    ymm11, ymm11
	LONG $0x187d42c4; WORD $0x3264; BYTE $0x70 // vbroadcastss    ymm12, dword [r10 + rsi + 112]
	LONG $0x592441c4; BYTE $0xdc               // vmulps    ymm11, ymm11, ymm12
	LONG $0x5854c1c4; BYTE $0xeb               // vaddps    ymm5, ymm5, ymm11

LBB0_29:
	LONG $0x187d62c4; WORD $0x0c59     // vbroadcastss    ymm11, dword [rcx + 12]
	LONG $0x593c41c4; BYTE $0xdb       // vmulps    ymm11, ymm8, ymm11
	LONG $0xedc2a4c5; BYTE $0x1e       // vcmpgt_oqps    ymm5, ymm11, ymm5
	LONG $0x187d62c4; BYTE $0x1f       // vbroadcastss    ymm11, dword [rdi]
	LONG $0x187d62c4; WORD $0xfc67     // vbroadcastss    ymm12, dword [rdi - 4]
	LONG $0x4a25c3c4; WORD $0x50ec     // vblendvps    ymm5, ymm11, ymm12, ymm5
	LONG $0xdd58e4c5                   // vaddps    ymm3, ymm3, ymm5
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c18348                   // add    rcx, 16
	WORD $0x394c; BYTE $0xf1           // cmp    rcx, r14
	JB   LBB0_27
	LONG $0x24bc8b48; LONG $0x000000d8 // mov    rdi, qword [rsp + 216]
	LONG $0xef7c8d4a; BYTE $0x08       // lea    rdi, [rdi + 8*r13 + 8]
	LONG $0x04e5c149                   // shl    r13, 4
	WORD $0x014d; BYTE $0xe8           // add    r8, r13
	WORD $0x894c; BYTE $0xc1           // mov    rcx, r8
	LONG $0x24ac8b4c; LONG $0x000000c8 // mov    r13, qword [rsp + 200]
	JMP  LBB0_35

LBB0_31:
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_36
	LONG $0x10418d4c                   // lea    r8, [rcx + 16]
	WORD $0x394d; BYTE $0xc6           // cmp    r14, r8
	WORD $0x894d; BYTE $0xc3           // mov    r11, r8
	LONG $0xde470f4d                   // cmova    r11, r14
	WORD $0x2949; BYTE $0xcb           // sub    r11, rcx
	WORD $0xff49; BYTE $0xcb           // dec    r11
	LONG $0x04ebc149                   // shr    r11, 4
	LONG $0x04778d48                   // lea    rsi, [rdi + 4]
	LONG $0x24bc8948; LONG $0x000000d8 // mov    qword [rsp + 216], rdi
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_33:
	WORD $0x6348; BYTE $0x01                   // movsxd    rax, dword [rcx]
	LONG $0x78c06b48                           // imul    rax, rax, 120
	LONG $0x02148b49                           // mov    rdx, qword [r10 + rax]
	LONG $0x025c8b49; BYTE $0x08               // mov    rbx, qword [r10 + rax + 8]
	LONG $0x6f7ea1c4; WORD $0xa22c             // vmovdqu    ymm5, [rdx + 4*r12]
	LONG $0x02548b49; BYTE $0x10               // mov    rdx, qword [r10 + rax + 16]
	LONG $0x027c8b49; BYTE $0x18               // mov    rdi, qword [r10 + rax + 24]
	LONG $0xfa55a1c4; WORD $0xa32c             // vpsubd    ymm5, ymm5, [rbx + 4*r12]
	LONG $0xfa55a1c4; WORD $0xa22c             // vpsubd    ymm5, ymm5, [rdx + 4*r12]
	LONG $0xfe55a1c4; WORD $0xa72c             // vpaddd    ymm5, ymm5, [rdi + 4*r12]
	LONG $0xed5bfcc5                           // vcvtdq2ps    ymm5, ymm5
	LONG $0x187d42c4; WORD $0x025c; BYTE $0x20 // vbroadcastss    ymm11, dword [r10 + rax + 32]
	LONG $0x5954c1c4; BYTE $0xeb               // vmulps    ymm5, ymm5, ymm11
	LONG $0x02548b49; BYTE $0x28               // mov    rdx, qword [r10 + rax + 40]
	LONG $0x6f7e21c4; WORD $0xa21c             // vmovdqu    ymm11, [rdx + 4*r12]
	LONG $0x02548b49; BYTE $0x30               // mov    rdx, qword [r10 + rax + 48]
	LONG $0x027c8b49; BYTE $0x38               // mov    rdi, qword [r10 + rax + 56]
	LONG $0x025c8b49; BYTE $0x40               // mov    rbx, qword [r10 + rax + 64]
	LONG $0xfa2521c4; WORD $0xa21c             // vpsubd    ymm11, ymm11, [rdx + 4*r12]
	LONG $0xfa2521c4; WORD $0xa71c             // vpsubd    ymm11, ymm11, [rdi + 4*r12]
	LONG $0xfe2521c4; WORD $0xa31c             // vpaddd    ymm11, ymm11, [rbx + 4*r12]
	LONG $0x5b7c41c4; BYTE $0xdb               // vcvtdq2ps    ymm11, ymm11
	LONG $0x187d42c4; WORD $0x0264; BYTE $0x48 // vbroadcastss    ymm12, dword [r10 + rax + 72]
	LONG $0x592441c4; BYTE $0xdc               // vmulps    ymm11, ymm11, ymm12
	LONG $0x5854c1c4; BYTE $0xeb               // vaddps    ymm5, ymm5, ymm11
	LONG $0x187d62c4; WORD $0x0c59             // vbroadcastss    ymm11, dword [rcx + 12]
	LONG $0x593c41c4; BYTE $0xdb               // vmulps    ymm11, ymm8, ymm11
	LONG $0xedc2a4c5; BYTE $0x1e               // vcmpgt_oqps    ymm5, ymm11, ymm5
	LONG $0x187d62c4; BYTE $0x1e               // vbroadcastss    ymm11, dword [rsi]
	LONG $0x187d62c4; WORD $0xfc66             // vbroadcastss    ymm12, dword [rsi - 4]
	LONG $0x4a25c3c4; WORD $0x50ec             // vblendvps    ymm5, ymm11, ymm12, ymm5
	LONG $0xdd58e4c5                           // vaddps    ymm3, ymm3, ymm5
	LONG $0x08c68348                           // add    rsi, 8
	LONG $0x10c18348                           // add    rcx, 16
	WORD $0x394c; BYTE $0xf1                   // cmp    rcx, r14
	JB   LBB0_33
	LONG $0x24bc8b48; LONG $0x000000d8         // mov    rdi, qword [rsp + 216]
	LONG $0xdf7c8d4a; BYTE $0x08               // lea    rdi, [rdi + 8*r11 + 8]
	LONG $0x04e3c149                           // shl    r11, 4
	WORD $0x014d; BYTE $0xd8                   // add    r8, r11
	WORD $0x894c; BYTE $0xc1                   // mov    rcx, r8

LBB0_35:
	LONG $0x249c8b48; LONG $0x000000d0 // mov    rbx, qword [rsp + 208]

LBB0_36:
	LONG $0x187d82c4; WORD $0x0d6c; BYTE $0x08 // vbroadcastss    ymm5, dword [r13 + r9 + 8]
	LONG $0xdbc2d4c5; BYTE $0x1e               // vcmpgt_oqps    ymm3, ymm5, ymm3
	LONG $0xff55e4c5                           // vandnps    ymm7, ymm3, ymm7
	LONG $0xdaf6c5c5                           // vpsadbw    ymm3, ymm7, ymm2
	LONG $0xd87ef9c5                           // vmovd    eax, xmm3
	LONG $0x1679e3c4; WORD $0x02da             // vpextrd    edx, xmm3, 2
	WORD $0xc201                               // add    edx, eax
	LONG $0x397de3c4; WORD $0x01db             // vextracti128    xmm3, ymm3, 1
	LONG $0xde7ef9c5                           // vmovd    esi, xmm3
	WORD $0xd601                               // add    esi, edx
	LONG $0x1679e3c4; WORD $0x02d8             // vpextrd    eax, xmm3, 2
	WORD $0xf001                               // add    eax, esi
	JE   LBB0_69
	WORD $0xf883; BYTE $0x01                   // cmp    eax, 1
	JE   LBB0_38

LBB0_60:
	WORD $0xff49; BYTE $0xc7 // inc    r15
	WORD $0x3949; BYTE $0xdf // cmp    r15, rbx
	JL   LBB0_23
	JMP  LBB0_69

LBB0_21:
	LONG $0x24a4894c; LONG $0x000000c0 // mov    qword [rsp + 192], r12
	JMP  LBB0_69

LBB0_38:
	LONG $0xbc29fcc5; LONG $0x00010024; BYTE $0x00   // vmovaps    [rsp + 256], ymm7
	LONG $0x84297cc5; LONG $0x0000e024; BYTE $0x00   // vmovaps    [rsp + 224], ymm8
	LONG $0x7ef9e1c4; BYTE $0xf9                     // vmovq    rcx, xmm7
	LONG $0x24848d48; LONG $0x00000100               // lea    rax, [rsp + 256]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000000b8; BYTE $0x00                     // mov    eax, 0
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_40
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x00000104               // lea    rax, [rsp + 260]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000001b8; BYTE $0x00                     // mov    eax, 1
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_40
	LONG $0x16f9e3c4; WORD $0x01f9                   // vpextrq    rcx, xmm7, 1
	LONG $0x24848d48; LONG $0x00000108               // lea    rax, [rsp + 264]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000002b8; BYTE $0x00                     // mov    eax, 2
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_40
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x0000010c               // lea    rax, [rsp + 268]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000003b8; BYTE $0x00                     // mov    eax, 3
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_40
	LONG $0x397de3c4; WORD $0x01fb                   // vextracti128    xmm3, ymm7, 1
	LONG $0x7ef9e1c4; BYTE $0xd9                     // vmovq    rcx, xmm3
	LONG $0x24848d48; LONG $0x00000110               // lea    rax, [rsp + 272]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000004b8; BYTE $0x00                     // mov    eax, 4
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_40
	WORD $0x8948; BYTE $0xca                         // mov    rdx, rcx
	LONG $0x20eac148                                 // shr    rdx, 32
	LONG $0x24848d48; LONG $0x00000114               // lea    rax, [rsp + 276]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000005b8; BYTE $0x00                     // mov    eax, 5
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_40
	LONG $0x16f9e3c4; WORD $0x01de                   // vpextrq    rsi, xmm3, 1
	LONG $0x24848d48; LONG $0x00000118               // lea    rax, [rsp + 280]
	WORD $0x8948; BYTE $0xc7                         // mov    rdi, rax
	LONG $0x000006b8; BYTE $0x00                     // mov    eax, 6
	WORD $0xf685                                     // test    esi, esi
	JNE  LBB0_40
	WORD $0x8948; BYTE $0xf0                         // mov    rax, rsi
	LONG $0x0000ba48; LONG $0x00010000; WORD $0x0000 // mov    rdx, 4294967296
	WORD $0x3148; BYTE $0xd0                         // xor    rax, rdx
	LONG $0x20eec148                                 // shr    rsi, 32
	LONG $0xd6940f40                                 // sete    sil
	WORD $0x0948; BYTE $0xc1                         // or    rcx, rax
	JNE  LBB0_68
	WORD $0xf631                                     // xor    esi, esi

LBB0_68:
	LONG $0x24848d48; LONG $0x0000011c // lea    rax, [rsp + 284]
	WORD $0x8948; BYTE $0xc7           // mov    rdi, rax
	LONG $0x000007b8; BYTE $0x00       // mov    eax, 7
	WORD $0x8440; BYTE $0xf6           // test    sil, sil
	JNE  LBB0_69

LBB0_40:
	LONG $0x014f8d41                               // lea    ecx, [r15 + 1]
	LONG $0x24948b48; LONG $0x000000b0             // mov    rdx, qword [rsp + 176]
	LONG $0x584a8b4c                               // mov    r9, qword [rdx + 88]
	LONG $0x60728b48                               // mov    rsi, qword [rdx + 96]
	WORD $0x294c; BYTE $0xce                       // sub    rsi, r9
	LONG $0x04eec148                               // shr    rsi, 4
	LONG $0x000001bb; BYTE $0x00                   // mov    ebx, 1
	WORD $0xce39                                   // cmp    esi, ecx
	JLE  LBB0_59
	LONG $0x24bc8948; LONG $0x000000c8             // mov    qword [rsp + 200], rdi
	WORD $0x0149; BYTE $0xc4                       // add    r12, rax
	WORD $0x634d; BYTE $0xdf                       // movsxd    r11, r15d
	WORD $0xff49; BYTE $0xc3                       // inc    r11
	LONG $0xbc10fac5; LONG $0x0000e084; BYTE $0x00 // vmovss    xmm7, dword [rsp + 4*rax + 224]
	WORD $0x894c; BYTE $0xd8                       // mov    rax, r11
	LONG $0x04e0c148                               // shl    rax, 4
	LONG $0x010c6349                               // movsxd    rcx, dword [r9 + rax]
	LONG $0xcd3c8d48; LONG $0x00000000             // lea    rdi, [8*rcx]
	LONG $0x707a0348                               // add    rdi, qword [rdx + 112]
	LONG $0x04e1c148                               // shl    rcx, 4
	LONG $0x284a0348                               // add    rcx, qword [rdx + 40]
	LONG $0x88828b48; WORD $0x0000; BYTE $0x00     // mov    rax, qword [rdx + 136]
	WORD $0x6348; BYTE $0xd6                       // movsxd    rdx, esi
	LONG $0x24948948; LONG $0x000000d0             // mov    qword [rsp + 208], rdx

LBB0_42:
	WORD $0x894d; BYTE $0xda           // mov    r10, r11
	LONG $0x04e2c149                   // shl    r10, 4
	LONG $0x117c8043; WORD $0x000d     // cmp    byte [r9 + r10 + 13], 0
	JNE  LBB0_57
	LONG $0x1174634b; BYTE $0x04       // movsxd    rsi, dword [r9 + r10 + 4]
	WORD $0x8949; BYTE $0xf6           // mov    r14, rsi
	LONG $0x04e6c149                   // shl    r14, 4
	WORD $0x0149; BYTE $0xce           // add    r14, rcx
	LONG $0x117c8043; WORD $0x000c     // cmp    byte [r9 + r10 + 12], 0
	JE   LBB0_50
	LONG $0xdbefe1c5                   // vpxor    xmm3, xmm3, xmm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_55
	LONG $0x10698d4c                   // lea    r13, [rcx + 16]
	WORD $0x394d; BYTE $0xee           // cmp    r14, r13
	WORD $0x894d; BYTE $0xe8           // mov    r8, r13
	LONG $0xc6470f4d                   // cmova    r8, r14
	WORD $0x2949; BYTE $0xc8           // sub    r8, rcx
	WORD $0xff49; BYTE $0xc8           // dec    r8
	LONG $0xdbefe1c5                   // vpxor    xmm3, xmm3, xmm3
	WORD $0x8948; BYTE $0xfe           // mov    rsi, rdi
	LONG $0x24bc8948; LONG $0x000000d8 // mov    qword [rsp + 216], rdi

LBB0_46:
	WORD $0x6348; BYTE $0x39       // movsxd    rdi, dword [rcx]
	LONG $0x78ff6b48               // imul    rdi, rdi, 120
	LONG $0x381c8b48               // mov    rbx, qword [rax + rdi]
	LONG $0x387c8b4c; BYTE $0x08   // mov    r15, qword [rax + rdi + 8]
	LONG $0xa31c8b42               // mov    ebx, dword [rbx + 4*r12]
	LONG $0xa71c2b43               // sub    ebx, dword [r15 + 4*r12]
	LONG $0x38548b48; BYTE $0x10   // mov    rdx, qword [rax + rdi + 16]
	LONG $0xa21c2b42               // sub    ebx, dword [rdx + 4*r12]
	LONG $0x38548b48; BYTE $0x18   // mov    rdx, qword [rax + rdi + 24]
	LONG $0xa21c0342               // add    ebx, dword [rdx + 4*r12]
	LONG $0x2afae1c4; BYTE $0xeb   // vcvtsi2ss    xmm5, xmm0, rbx
	LONG $0x6c59d2c5; WORD $0x2038 // vmulss    xmm5, xmm5, dword [rax + rdi + 32]
	LONG $0x38548b48; BYTE $0x28   // mov    rdx, qword [rax + rdi + 40]
	LONG $0xa2148b42               // mov    edx, dword [rdx + 4*r12]
	LONG $0x385c8b48; BYTE $0x30   // mov    rbx, qword [rax + rdi + 48]
	LONG $0xa3142b42               // sub    edx, dword [rbx + 4*r12]
	LONG $0x385c8b48; BYTE $0x38   // mov    rbx, qword [rax + rdi + 56]
	LONG $0xa3142b42               // sub    edx, dword [rbx + 4*r12]
	LONG $0x385c8b48; BYTE $0x40   // mov    rbx, qword [rax + rdi + 64]
	LONG $0xa3140342               // add    edx, dword [rbx + 4*r12]
	LONG $0x2afae1c4; BYTE $0xe2   // vcvtsi2ss    xmm4, xmm0, rdx
	LONG $0x6459dac5; WORD $0x4838 // vmulss    xmm4, xmm4, dword [rax + rdi + 72]
	LONG $0xec58d2c5               // vaddss    xmm5, xmm5, xmm4
	LONG $0x385c8b48; BYTE $0x50   // mov    rbx, qword [rax + rdi + 80]
	WORD $0x8548; BYTE $0xdb       // test    rbx, rbx
	JE   LBB0_48
	LONG $0xa3148b42               // mov    edx, dword [rbx + 4*r12]
	LONG $0x385c8b48; BYTE $0x58   // mov    rbx, qword [rax + rdi + 88]
	LONG $0x387c8b4c; BYTE $0x60   // mov    r15, qword [rax + rdi + 96]
	LONG $0xa3142b42               // sub    edx, dword [rbx + 4*r12]
	LONG $0xa7142b43               // sub    edx, dword [r15 + 4*r12]
	LONG $0x385c8b48; BYTE $0x68   // mov    rbx, qword [rax + rdi + 104]
	LONG $0xa3140342               // add    edx, dword [rbx + 4*r12]
	LONG $0x2afae1c4; BYTE $0xe2   // vcvtsi2ss    xmm4, xmm0, rdx
	LONG $0x6459dac5; WORD $0x7038 // vmulss    xmm4, xmm4, dword [rax + rdi + 112]
	LONG $0xec58d2c5               // vaddss    xmm5, xmm5, xmm4

LBB0_48:
	LONG $0x6159c2c5; BYTE $0x0c       // vmulss    xmm4, xmm7, dword [rcx + 12]
	LONG $0xec2ef8c5                   // vucomiss    xmm5, xmm4
	WORD $0x930f; BYTE $0xd2           // setae    dl
	WORD $0xb60f; BYTE $0xd2           // movzx    edx, dl
	LONG $0x1c58e2c5; BYTE $0x96       // vaddss    xmm3, xmm3, dword [rsi + 4*rdx]
	LONG $0x08c68348                   // add    rsi, 8
	LONG $0x10c18348                   // add    rcx, 16
	WORD $0x394c; BYTE $0xf1           // cmp    rcx, r14
	JB   LBB0_46
	LONG $0x04e8c149                   // shr    r8, 4
	LONG $0x24bc8b48; LONG $0x000000d8 // mov    rdi, qword [rsp + 216]
	LONG $0xc77c8d4a; BYTE $0x08       // lea    rdi, [rdi + 8*r8 + 8]
	LONG $0x04e0c149                   // shl    r8, 4
	WORD $0x014d; BYTE $0xc5           // add    r13, r8
	WORD $0x894c; BYTE $0xe9           // mov    rcx, r13
	JMP  LBB0_54

LBB0_50:
	LONG $0xdbefe1c5         // vpxor    xmm3, xmm3, xmm3
	WORD $0xf685             // test    esi, esi
	JLE  LBB0_55
	LONG $0x10418d4c         // lea    r8, [rcx + 16]
	WORD $0x394d; BYTE $0xc6 // cmp    r14, r8
	WORD $0x894d; BYTE $0xc7 // mov    r15, r8
	LONG $0xfe470f4d         // cmova    r15, r14
	WORD $0x2949; BYTE $0xcf // sub    r15, rcx
	WORD $0xff49; BYTE $0xcf // dec    r15
	LONG $0xdbefe1c5         // vpxor    xmm3, xmm3, xmm3
	WORD $0x8948; BYTE $0xfe // mov    rsi, rdi
	WORD $0x8949; BYTE $0xfd // mov    r13, rdi

LBB0_52:
	WORD $0x6348; BYTE $0x11       // movsxd    rdx, dword [rcx]
	LONG $0x78d26b48               // imul    rdx, rdx, 120
	LONG $0x101c8b48               // mov    rbx, qword [rax + rdx]
	LONG $0x107c8b48; BYTE $0x08   // mov    rdi, qword [rax + rdx + 8]
	LONG $0xa31c8b42               // mov    ebx, dword [rbx + 4*r12]
	LONG $0xa71c2b42               // sub    ebx, dword [rdi + 4*r12]
	LONG $0x107c8b48; BYTE $0x10   // mov    rdi, qword [rax + rdx + 16]
	LONG $0xa71c2b42               // sub    ebx, dword [rdi + 4*r12]
	LONG $0x107c8b48; BYTE $0x18   // mov    rdi, qword [rax + rdx + 24]
	LONG $0xa71c0342               // add    ebx, dword [rdi + 4*r12]
	LONG $0x2afae1c4; BYTE $0xe3   // vcvtsi2ss    xmm4, xmm0, rbx
	LONG $0x6459dac5; WORD $0x2010 // vmulss    xmm4, xmm4, dword [rax + rdx + 32]
	LONG $0x107c8b48; BYTE $0x28   // mov    rdi, qword [rax + rdx + 40]
	LONG $0xa73c8b42               // mov    edi, dword [rdi + 4*r12]
	LONG $0x105c8b48; BYTE $0x30   // mov    rbx, qword [rax + rdx + 48]
	LONG $0xa33c2b42               // sub    edi, dword [rbx + 4*r12]
	LONG $0x105c8b48; BYTE $0x38   // mov    rbx, qword [rax + rdx + 56]
	LONG $0xa33c2b42               // sub    edi, dword [rbx + 4*r12]
	LONG $0x105c8b48; BYTE $0x40   // mov    rbx, qword [rax + rdx + 64]
	LONG $0xa33c0342               // add    edi, dword [rbx + 4*r12]
	LONG $0x2afae1c4; BYTE $0xef   // vcvtsi2ss    xmm5, xmm0, rdi
	LONG $0x6c59d2c5; WORD $0x4810 // vmulss    xmm5, xmm5, dword [rax + rdx + 72]
	LONG $0xe558dac5               // vaddss    xmm4, xmm4, xmm5
	LONG $0x6959c2c5; BYTE $0x0c   // vmulss    xmm5, xmm7, dword [rcx + 12]
	LONG $0xe52ef8c5               // vucomiss    xmm4, xmm5
	WORD $0x930f; BYTE $0xd2       // setae    dl
	WORD $0xb60f; BYTE $0xd2       // movzx    edx, dl
	LONG $0x1c58e2c5; BYTE $0x96   // vaddss    xmm3, xmm3, dword [rsi + 4*rdx]
	LONG $0x08c68348               // add    rsi, 8
	LONG $0x10c18348               // add    rcx, 16
	WORD $0x394c; BYTE $0xf1       // cmp    rcx, r14
	JB   LBB0_52
	LONG $0x04efc149               // shr    r15, 4
	WORD $0x894c; BYTE $0xef       // mov    rdi, r13
	LONG $0xff7c8d4a; BYTE $0x08   // lea    rdi, [rdi + 8*r15 + 8]
	LONG $0x04e7c149               // shl    r15, 4
	WORD $0x014d; BYTE $0xf8       // add    r8, r15
	WORD $0x894c; BYTE $0xc1       // mov    rcx, r8

LBB0_54:
	LONG $0x24948b48; LONG $0x000000d0 // mov    rdx, qword [rsp + 208]

LBB0_55:
	LONG $0x107a81c4; WORD $0x1164; BYTE $0x08 // vmovss    xmm4, dword [r9 + r10 + 8]
	LONG $0xe32ef8c5                           // vucomiss    xmm4, xmm3
	JA   LBB0_56

LBB0_57:
	WORD $0xff49; BYTE $0xc3           // inc    r11
	WORD $0x3949; BYTE $0xd3           // cmp    r11, rdx
	JL   LBB0_42
	LONG $0x24bc8b48; LONG $0x000000c8 // mov    rdi, qword [rsp + 200]
	LONG $0x000001bb; BYTE $0x00       // mov    ebx, 1
	JMP  LBB0_59

LBB0_56:
	WORD $0xf741; BYTE $0xdb           // neg    r11d
	WORD $0x8944; BYTE $0xdb           // mov    ebx, r11d
	LONG $0x24bc8b48; LONG $0x000000c8 // mov    rdi, qword [rsp + 200]

LBB0_59:
	WORD $0xdb85                                   // test    ebx, ebx
	WORD $0x9f0f; BYTE $0xd0                       // setg    al
	WORD $0xb60f; BYTE $0xc0                       // movzx    eax, al
	WORD $0x0789                                   // mov    dword [rdi], eax
	LONG $0xbc28fcc5; LONG $0x00010024; BYTE $0x00 // vmovaps    ymm7, [rsp + 256]

LBB0_69:
	LONG $0x24448b4c; BYTE $0x70       // mov    r8, qword [rsp + 112]
	LONG $0x08408b49                   // mov    rax, qword [r8 + 8]
	LONG $0x24a48b4c; LONG $0x000000c0 // mov    r12, qword [rsp + 192]
	LONG $0x7f7ea1c4; WORD $0x603c     // vmovdqu    [rax + 2*r12], ymm7
	LONG $0x24548b4c; BYTE $0x68       // mov    r10, qword [rsp + 104]

LBB0_70:
	LONG $0x10c48349         // add    r12, 16
	WORD $0x394d; BYTE $0xd4 // cmp    r12, r10
	JB   LBB0_19
	WORD $0x894d; BYTE $0xd7 // mov    r15, r10

LBB0_72:
	LONG $0x2454394c; BYTE $0x60                   // cmp    qword [rsp + 96], r10
	JBE  LBB0_123
	WORD $0x8b49; BYTE $0x00                       // mov    rax, qword [r8]
	LONG $0x244c8b48; BYTE $0x60                   // mov    rcx, qword [rsp + 96]
	LONG $0x7c6ffec5; WORD $0xe048                 // vmovdqu    ymm7, [rax + 2*rcx - 32]
	LONG $0x177de2c4; BYTE $0xf8                   // vptest    ymm7, ymm0
	WORD $0x8949; BYTE $0xcf                       // mov    r15, rcx
	JE   LBB0_123
	LONG $0x24448b48; BYTE $0x08                   // mov    rax, qword [rsp + 8]
	LONG $0x248c8b48; LONG $0x000000a0             // mov    rcx, qword [rsp + 160]
	LONG $0x01048d48                               // lea    rax, [rcx + rax]
	LONG $0x24bc8b4c; LONG $0x000000b0             // mov    r15, qword [rsp + 176]
	LONG $0xc8878b4d; WORD $0x0000; BYTE $0x00     // mov    r8, qword [r15 + 200]
	LONG $0x6f7ec1c4; WORD $0x801c                 // vmovdqu    ymm3, [r8 + 4*rax]
	LONG $0xd08f8b4d; WORD $0x0000; BYTE $0x00     // mov    r9, qword [r15 + 208]
	LONG $0xd89f8b4d; WORD $0x0000; BYTE $0x00     // mov    r11, qword [r15 + 216]
	LONG $0xe0b78b4d; WORD $0x0000; BYTE $0x00     // mov    r14, qword [r15 + 224]
	LONG $0xfa65c1c4; WORD $0x811c                 // vpsubd    ymm3, ymm3, [r9 + 4*rax]
	LONG $0xfa65c1c4; WORD $0x831c                 // vpsubd    ymm3, ymm3, [r11 + 4*rax]
	LONG $0xfe65c1c4; WORD $0x861c                 // vpaddd    ymm3, ymm3, [r14 + 4*rax]
	LONG $0x3675e2c4; BYTE $0xdb                   // vpermd    ymm3, ymm1, ymm3
	LONG $0xa8978b4d; WORD $0x0000; BYTE $0x00     // mov    r10, qword [r15 + 168]
	LONG $0x6f7ec1c4; WORD $0x8224                 // vmovdqu    ymm4, [r10 + 4*rax]
	LONG $0xb0b78b49; WORD $0x0000; BYTE $0x00     // mov    rsi, qword [r15 + 176]
	LONG $0xb8978b49; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [r15 + 184]
	LONG $0xc09f8b49; WORD $0x0000; BYTE $0x00     // mov    rbx, qword [r15 + 192]
	LONG $0x24faddc5; BYTE $0x86                   // vpsubd    ymm4, ymm4, [rsi + 4*rax]
	LONG $0x24faddc5; BYTE $0x82                   // vpsubd    ymm4, ymm4, [rdx + 4*rax]
	LONG $0x24feddc5; BYTE $0x83                   // vpaddd    ymm4, ymm4, [rbx + 4*rax]
	LONG $0x367562c4; BYTE $0xc4                   // vpermd    ymm8, ymm1, ymm4
	LONG $0x587f8b49                               // mov    rdi, qword [r15 + 88]
	LONG $0x24bc8948; LONG $0x000000d0             // mov    qword [rsp + 208], rdi
	LONG $0x604f8b49                               // mov    rcx, qword [r15 + 96]
	WORD $0x2948; BYTE $0xf9                       // sub    rcx, rdi
	LONG $0x04e9c148                               // shr    rcx, 4
	WORD $0xc985                                   // test    ecx, ecx
	JLE  LBB0_122
	LONG $0x187dc2c4; LONG $0x0000a0a7; BYTE $0x00 // vbroadcastss    ymm4, dword [r15 + 160]
	LONG $0x6f7ec1c4; WORD $0x806c; BYTE $0x20     // vmovdqu    ymm5, [r8 + 4*rax + 32]
	LONG $0xfa55c1c4; WORD $0x816c; BYTE $0x20     // vpsubd    ymm5, ymm5, [r9 + 4*rax + 32]
	LONG $0xfa55c1c4; WORD $0x836c; BYTE $0x20     // vpsubd    ymm5, ymm5, [r11 + 4*rax + 32]
	LONG $0xfe55c1c4; WORD $0x866c; BYTE $0x20     // vpaddd    ymm5, ymm5, [r14 + 4*rax + 32]
	LONG $0x3675e2c4; BYTE $0xed                   // vpermd    ymm5, ymm1, ymm5
	LONG $0x3865e3c4; WORD $0x01dd                 // vinserti128    ymm3, ymm3, xmm5, 1
	LONG $0xdb5bfcc5                               // vcvtdq2ps    ymm3, ymm3
	LONG $0x6f7ec1c4; WORD $0x826c; BYTE $0x20     // vmovdqu    ymm5, [r10 + 4*rax + 32]
	LONG $0x6cfad5c5; WORD $0x2086                 // vpsubd    ymm5, ymm5, [rsi + 4*rax + 32]
	LONG $0x6cfad5c5; WORD $0x2082                 // vpsubd    ymm5, ymm5, [rdx + 4*rax + 32]
	LONG $0x6cfed5c5; WORD $0x2083                 // vpaddd    ymm5, ymm5, [rbx + 4*rax + 32]
	LONG $0x3675e2c4; BYTE $0xed                   // vpermd    ymm5, ymm1, ymm5
	LONG $0x383de3c4; WORD $0x01ed                 // vinserti128    ymm5, ymm8, xmm5, 1
	LONG $0xed5bfcc5                               // vcvtdq2ps    ymm5, ymm5
	LONG $0xe559dcc5                               // vmulps    ymm4, ymm4, ymm5
	LONG $0xdb59e4c5                               // vmulps    ymm3, ymm3, ymm3
	LONG $0xdb5cdcc5                               // vsubps    ymm3, ymm4, ymm3
	LONG $0xe2c2e4c5; BYTE $0x1e                   // vcmpgt_oqps    ymm4, ymm3, ymm2
	LONG $0xdc54e4c5                               // vandps    ymm3, ymm3, ymm4
	LONG $0x555cc1c4; BYTE $0xe1                   // vandnps    ymm4, ymm4, ymm9
	LONG $0xdc56e4c5                               // vorps    ymm3, ymm3, ymm4
	LONG $0xc3517cc5                               // vsqrtps    ymm8, ymm3
	LONG $0x24048b48                               // mov    rax, qword [rsp]
	LONG $0x24948b48; LONG $0x00000080             // mov    rdx, qword [rsp + 128]
	LONG $0x02148d4c                               // lea    r10, [rdx + rax]
	LONG $0x28478b4d                               // mov    r8, qword [r15 + 40]
	LONG $0x705f8b4d                               // mov    r11, qword [r15 + 112]
	WORD $0x6348; BYTE $0xd9                       // movsxd    rbx, ecx
	LONG $0x249c8948; LONG $0x000000c0             // mov    qword [rsp + 192], rbx
	LONG $0x888f8b49; WORD $0x0000; BYTE $0x00     // mov    rcx, qword [r15 + 136]
	WORD $0x3145; BYTE $0xc9                       // xor    r9d, r9d

LBB0_76:
	WORD $0x894d; BYTE $0xce           // mov    r14, r9
	LONG $0x04e6c149                   // shl    r14, 4
	LONG $0x377c8042; WORD $0x000d     // cmp    byte [rdi + r14 + 13], 0
	JNE  LBB0_113
	LONG $0x3774634a; BYTE $0x04       // movsxd    rsi, dword [rdi + r14 + 4]
	WORD $0x8949; BYTE $0xf5           // mov    r13, rsi
	LONG $0x04e5c149                   // shl    r13, 4
	WORD $0x014d; BYTE $0xc5           // add    r13, r8
	LONG $0x377c8042; WORD $0x000c     // cmp    byte [rdi + r14 + 12], 0
	JE   LBB0_84
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_88
	LONG $0x10608d4d                   // lea    r12, [r8 + 16]
	LONG $0x24a4894c; LONG $0x000000c8 // mov    qword [rsp + 200], r12
	WORD $0x394d; BYTE $0xe5           // cmp    r13, r12
	LONG $0xe5470f4d                   // cmova    r12, r13
	WORD $0x294d; BYTE $0xc4           // sub    r12, r8
	WORD $0xff49; BYTE $0xcc           // dec    r12
	LONG $0x04ecc149                   // shr    r12, 4
	LONG $0x047b8d49                   // lea    rdi, [r11 + 4]
	LONG $0x249c894c; LONG $0x000000d8 // mov    qword [rsp + 216], r11
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_80:
	WORD $0x6349; BYTE $0x00                   // movsxd    rax, dword [r8]
	LONG $0x78f06b48                           // imul    rsi, rax, 120
	LONG $0x31048b48                           // mov    rax, qword [rcx + rsi]
	LONG $0x315c8b4c; BYTE $0x08               // mov    r11, qword [rcx + rsi + 8]
	LONG $0x6f7ea1c4; WORD $0x9024             // vmovdqu    ymm4, [rax + 4*r10]
	LONG $0x31448b48; BYTE $0x10               // mov    rax, qword [rcx + rsi + 16]
	LONG $0x317c8b4c; BYTE $0x18               // mov    r15, qword [rcx + rsi + 24]
	LONG $0xfa5d81c4; WORD $0x9324             // vpsubd    ymm4, ymm4, [r11 + 4*r10]
	LONG $0xfa5da1c4; WORD $0x9024             // vpsubd    ymm4, ymm4, [rax + 4*r10]
	LONG $0xfe5d81c4; WORD $0x9724             // vpaddd    ymm4, ymm4, [r15 + 4*r10]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187de2c4; WORD $0x316c; BYTE $0x20 // vbroadcastss    ymm5, dword [rcx + rsi + 32]
	LONG $0xe559dcc5                           // vmulps    ymm4, ymm4, ymm5
	LONG $0x31448b48; BYTE $0x28               // mov    rax, qword [rcx + rsi + 40]
	LONG $0x6f7ea1c4; WORD $0x902c             // vmovdqu    ymm5, [rax + 4*r10]
	LONG $0x31448b48; BYTE $0x30               // mov    rax, qword [rcx + rsi + 48]
	LONG $0x315c8b48; BYTE $0x38               // mov    rbx, qword [rcx + rsi + 56]
	LONG $0x31548b48; BYTE $0x40               // mov    rdx, qword [rcx + rsi + 64]
	LONG $0xfa55a1c4; WORD $0x902c             // vpsubd    ymm5, ymm5, [rax + 4*r10]
	LONG $0xfa55a1c4; WORD $0x932c             // vpsubd    ymm5, ymm5, [rbx + 4*r10]
	LONG $0xfe55a1c4; WORD $0x922c             // vpaddd    ymm5, ymm5, [rdx + 4*r10]
	LONG $0xed5bfcc5                           // vcvtdq2ps    ymm5, ymm5
	LONG $0x187d62c4; WORD $0x315c; BYTE $0x48 // vbroadcastss    ymm11, dword [rcx + rsi + 72]
	LONG $0x5954c1c4; BYTE $0xeb               // vmulps    ymm5, ymm5, ymm11
	LONG $0xed58dcc5                           // vaddps    ymm5, ymm4, ymm5
	LONG $0x31448b48; BYTE $0x50               // mov    rax, qword [rcx + rsi + 80]
	WORD $0x8548; BYTE $0xc0                   // test    rax, rax
	JE   LBB0_82
	LONG $0x6f7ea1c4; WORD $0x9024             // vmovdqu    ymm4, [rax + 4*r10]
	LONG $0x31448b48; BYTE $0x58               // mov    rax, qword [rcx + rsi + 88]
	LONG $0x31548b48; BYTE $0x60               // mov    rdx, qword [rcx + rsi + 96]
	LONG $0x315c8b48; BYTE $0x68               // mov    rbx, qword [rcx + rsi + 104]
	LONG $0xfa5da1c4; WORD $0x9024             // vpsubd    ymm4, ymm4, [rax + 4*r10]
	LONG $0xfa5da1c4; WORD $0x9224             // vpsubd    ymm4, ymm4, [rdx + 4*r10]
	LONG $0xfe5da1c4; WORD $0x9324             // vpaddd    ymm4, ymm4, [rbx + 4*r10]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187d62c4; WORD $0x315c; BYTE $0x70 // vbroadcastss    ymm11, dword [rcx + rsi + 112]
	LONG $0x595cc1c4; BYTE $0xe3               // vmulps    ymm4, ymm4, ymm11
	LONG $0xec58d4c5                           // vaddps    ymm5, ymm5, ymm4

LBB0_82:
	LONG $0x187dc2c4; WORD $0x0c60     // vbroadcastss    ymm4, dword [r8 + 12]
	LONG $0xe459bcc5                   // vmulps    ymm4, ymm8, ymm4
	LONG $0xe5c2dcc5; BYTE $0x1e       // vcmpgt_oqps    ymm4, ymm4, ymm5
	LONG $0x187de2c4; BYTE $0x2f       // vbroadcastss    ymm5, dword [rdi]
	LONG $0x187d62c4; WORD $0xfc5f     // vbroadcastss    ymm11, dword [rdi - 4]
	LONG $0x4a55c3c4; WORD $0x40e3     // vblendvps    ymm4, ymm5, ymm11, ymm4
	LONG $0xdc58e4c5                   // vaddps    ymm3, ymm3, ymm4
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c08349                   // add    r8, 16
	WORD $0x394d; BYTE $0xe8           // cmp    r8, r13
	JB   LBB0_80
	LONG $0x249c8b4c; LONG $0x000000d8 // mov    r11, qword [rsp + 216]
	LONG $0xe35c8d4f; BYTE $0x08       // lea    r11, [r11 + 8*r12 + 8]
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x24848b4c; LONG $0x000000c8 // mov    r8, qword [rsp + 200]
	WORD $0x014d; BYTE $0xe0           // add    r8, r12
	LONG $0x24bc8b4c; LONG $0x000000b0 // mov    r15, qword [rsp + 176]
	LONG $0x24bc8b48; LONG $0x000000d0 // mov    rdi, qword [rsp + 208]
	LONG $0x249c8b48; LONG $0x000000c0 // mov    rbx, qword [rsp + 192]
	JMP  LBB0_88

LBB0_84:
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_88
	LONG $0x10608d4d                   // lea    r12, [r8 + 16]
	WORD $0x394d; BYTE $0xe5           // cmp    r13, r12
	WORD $0x894d; BYTE $0xe7           // mov    r15, r12
	LONG $0xfd470f4d                   // cmova    r15, r13
	WORD $0x294d; BYTE $0xc7           // sub    r15, r8
	WORD $0xff49; BYTE $0xcf           // dec    r15
	LONG $0x04efc149                   // shr    r15, 4
	LONG $0x04738d49                   // lea    rsi, [r11 + 4]
	LONG $0x249c894c; LONG $0x000000d8 // mov    qword [rsp + 216], r11
	LONG $0xdb57e4c5                   // vxorps    ymm3, ymm3, ymm3

LBB0_86:
	WORD $0x6349; BYTE $0x10                   // movsxd    rdx, dword [r8]
	LONG $0x78d26b48                           // imul    rdx, rdx, 120
	LONG $0x111c8b48                           // mov    rbx, qword [rcx + rdx]
	LONG $0x11448b48; BYTE $0x08               // mov    rax, qword [rcx + rdx + 8]
	LONG $0x6f7ea1c4; WORD $0x9324             // vmovdqu    ymm4, [rbx + 4*r10]
	LONG $0x115c8b48; BYTE $0x10               // mov    rbx, qword [rcx + rdx + 16]
	LONG $0x117c8b48; BYTE $0x18               // mov    rdi, qword [rcx + rdx + 24]
	LONG $0xfa5da1c4; WORD $0x9024             // vpsubd    ymm4, ymm4, [rax + 4*r10]
	LONG $0xfa5da1c4; WORD $0x9324             // vpsubd    ymm4, ymm4, [rbx + 4*r10]
	LONG $0xfe5da1c4; WORD $0x9724             // vpaddd    ymm4, ymm4, [rdi + 4*r10]
	LONG $0xe45bfcc5                           // vcvtdq2ps    ymm4, ymm4
	LONG $0x187de2c4; WORD $0x116c; BYTE $0x20 // vbroadcastss    ymm5, dword [rcx + rdx + 32]
	LONG $0xe559dcc5                           // vmulps    ymm4, ymm4, ymm5
	LONG $0x11448b48; BYTE $0x28               // mov    rax, qword [rcx + rdx + 40]
	LONG $0x6f7ea1c4; WORD $0x902c             // vmovdqu    ymm5, [rax + 4*r10]
	LONG $0x11448b48; BYTE $0x30               // mov    rax, qword [rcx + rdx + 48]
	LONG $0x117c8b48; BYTE $0x38               // mov    rdi, qword [rcx + rdx + 56]
	LONG $0x115c8b48; BYTE $0x40               // mov    rbx, qword [rcx + rdx + 64]
	LONG $0xfa55a1c4; WORD $0x902c             // vpsubd    ymm5, ymm5, [rax + 4*r10]
	LONG $0xfa55a1c4; WORD $0x972c             // vpsubd    ymm5, ymm5, [rdi + 4*r10]
	LONG $0xfe55a1c4; WORD $0x932c             // vpaddd    ymm5, ymm5, [rbx + 4*r10]
	LONG $0xed5bfcc5                           // vcvtdq2ps    ymm5, ymm5
	LONG $0x187d62c4; WORD $0x115c; BYTE $0x48 // vbroadcastss    ymm11, dword [rcx + rdx + 72]
	LONG $0x5954c1c4; BYTE $0xeb               // vmulps    ymm5, ymm5, ymm11
	LONG $0xe558dcc5                           // vaddps    ymm4, ymm4, ymm5
	LONG $0x187dc2c4; WORD $0x0c68             // vbroadcastss    ymm5, dword [r8 + 12]
	LONG $0xed59bcc5                           // vmulps    ymm5, ymm8, ymm5
	LONG $0xe4c2d4c5; BYTE $0x1e               // vcmpgt_oqps    ymm4, ymm5, ymm4
	LONG $0x187de2c4; BYTE $0x2e               // vbroadcastss    ymm5, dword [rsi]
	LONG $0x187d62c4; WORD $0xfc5e             // vbroadcastss    ymm11, dword [rsi - 4]
	LONG $0x4a55c3c4; WORD $0x40e3             // vblendvps    ymm4, ymm5, ymm11, ymm4
	LONG $0xdc58e4c5                           // vaddps    ymm3, ymm3, ymm4
	LONG $0x08c68348                           // add    rsi, 8
	LONG $0x10c08349                           // add    r8, 16
	WORD $0x394d; BYTE $0xe8                   // cmp    r8, r13
	JB   LBB0_86
	LONG $0x249c8b4c; LONG $0x000000d8         // mov    r11, qword [rsp + 216]
	LONG $0xfb5c8d4f; BYTE $0x08               // lea    r11, [r11 + 8*r15 + 8]
	LONG $0x04e7c149                           // shl    r15, 4
	WORD $0x014d; BYTE $0xfc                   // add    r12, r15
	WORD $0x894d; BYTE $0xe0                   // mov    r8, r12
	LONG $0x24bc8b48; LONG $0x000000d0         // mov    rdi, qword [rsp + 208]
	LONG $0x249c8b48; LONG $0x000000c0         // mov    rbx, qword [rsp + 192]
	LONG $0x24bc8b4c; LONG $0x000000b0         // mov    r15, qword [rsp + 176]

LBB0_88:
	LONG $0x187da2c4; WORD $0x3764; BYTE $0x08 // vbroadcastss    ymm4, dword [rdi + r14 + 8]
	LONG $0xdbc2dcc5; BYTE $0x1e               // vcmpgt_oqps    ymm3, ymm4, ymm3
	LONG $0xff55e4c5                           // vandnps    ymm7, ymm3, ymm7
	LONG $0xdaf6c5c5                           // vpsadbw    ymm3, ymm7, ymm2
	LONG $0xd87ef9c5                           // vmovd    eax, xmm3
	LONG $0x1679e3c4; WORD $0x02da             // vpextrd    edx, xmm3, 2
	WORD $0xc201                               // add    edx, eax
	LONG $0x397de3c4; WORD $0x01db             // vextracti128    xmm3, ymm3, 1
	LONG $0xde7ef9c5                           // vmovd    esi, xmm3
	WORD $0xd601                               // add    esi, edx
	LONG $0x1679e3c4; WORD $0x02d8             // vpextrd    eax, xmm3, 2
	WORD $0xf001                               // add    eax, esi
	JE   LBB0_122
	WORD $0xf883; BYTE $0x01                   // cmp    eax, 1
	JE   LBB0_90

LBB0_113:
	WORD $0xff49; BYTE $0xc1 // inc    r9
	WORD $0x3949; BYTE $0xd9 // cmp    r9, rbx
	JL   LBB0_76
	JMP  LBB0_122

LBB0_90:
	LONG $0xbc29fcc5; LONG $0x00010024; BYTE $0x00   // vmovaps    [rsp + 256], ymm7
	LONG $0x84297cc5; LONG $0x0000e024; BYTE $0x00   // vmovaps    [rsp + 224], ymm8
	LONG $0x7ef9e1c4; BYTE $0xf9                     // vmovq    rcx, xmm7
	LONG $0x24848d48; LONG $0x00000100               // lea    rax, [rsp + 256]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000000b8; BYTE $0x00                     // mov    eax, 0
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_92
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x00000104               // lea    rax, [rsp + 260]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000001b8; BYTE $0x00                     // mov    eax, 1
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_92
	LONG $0x16f9e3c4; WORD $0x01f9                   // vpextrq    rcx, xmm7, 1
	LONG $0x24848d48; LONG $0x00000108               // lea    rax, [rsp + 264]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000002b8; BYTE $0x00                     // mov    eax, 2
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_92
	LONG $0x20e9c148                                 // shr    rcx, 32
	LONG $0x24848d48; LONG $0x0000010c               // lea    rax, [rsp + 268]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000003b8; BYTE $0x00                     // mov    eax, 3
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_92
	LONG $0x397de3c4; WORD $0x01fb                   // vextracti128    xmm3, ymm7, 1
	LONG $0x7ef9e1c4; BYTE $0xd9                     // vmovq    rcx, xmm3
	LONG $0x24848d48; LONG $0x00000110               // lea    rax, [rsp + 272]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000004b8; BYTE $0x00                     // mov    eax, 4
	WORD $0xc985                                     // test    ecx, ecx
	JNE  LBB0_92
	WORD $0x8948; BYTE $0xca                         // mov    rdx, rcx
	LONG $0x20eac148                                 // shr    rdx, 32
	LONG $0x24848d48; LONG $0x00000114               // lea    rax, [rsp + 276]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000005b8; BYTE $0x00                     // mov    eax, 5
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_92
	LONG $0x16f9e3c4; WORD $0x01da                   // vpextrq    rdx, xmm3, 1
	LONG $0x24848d48; LONG $0x00000118               // lea    rax, [rsp + 280]
	WORD $0x8948; BYTE $0xc6                         // mov    rsi, rax
	LONG $0x000006b8; BYTE $0x00                     // mov    eax, 6
	WORD $0xd285                                     // test    edx, edx
	JNE  LBB0_92
	WORD $0x8948; BYTE $0xd0                         // mov    rax, rdx
	LONG $0x0000be48; LONG $0x00010000; WORD $0x0000 // mov    rsi, 4294967296
	WORD $0x3148; BYTE $0xf0                         // xor    rax, rsi
	LONG $0x20eac148                                 // shr    rdx, 32
	WORD $0x940f; BYTE $0xd2                         // sete    dl
	WORD $0x0948; BYTE $0xc1                         // or    rcx, rax
	JNE  LBB0_121
	WORD $0xd231                                     // xor    edx, edx

LBB0_121:
	LONG $0x24848d48; LONG $0x0000011c // lea    rax, [rsp + 284]
	WORD $0x8948; BYTE $0xc6           // mov    rsi, rax
	LONG $0x000007b8; BYTE $0x00       // mov    eax, 7
	WORD $0xd284                       // test    dl, dl
	JNE  LBB0_122

LBB0_92:
	LONG $0x24b48948; LONG $0x000000c8             // mov    qword [rsp + 200], rsi
	LONG $0x01498d41                               // lea    ecx, [r9 + 1]
	LONG $0x58778b4d                               // mov    r14, qword [r15 + 88]
	LONG $0x60778b49                               // mov    rsi, qword [r15 + 96]
	WORD $0x294c; BYTE $0xf6                       // sub    rsi, r14
	LONG $0x04eec148                               // shr    rsi, 4
	LONG $0x000001ba; BYTE $0x00                   // mov    edx, 1
	WORD $0xce39                                   // cmp    esi, ecx
	JLE  LBB0_93
	WORD $0x0149; BYTE $0xc2                       // add    r10, rax
	WORD $0x634d; BYTE $0xc9                       // movsxd    r9, r9d
	WORD $0xff49; BYTE $0xc1                       // inc    r9
	LONG $0xbc10fac5; LONG $0x0000e084; BYTE $0x00 // vmovss    xmm7, dword [rsp + 4*rax + 224]
	WORD $0x894c; BYTE $0xc8                       // mov    rax, r9
	LONG $0x04e0c148                               // shl    rax, 4
	LONG $0x06146349                               // movsxd    rdx, dword [r14 + rax]
	LONG $0xd5048d48; LONG $0x00000000             // lea    rax, [8*rdx]
	LONG $0x70470349                               // add    rax, qword [r15 + 112]
	LONG $0x04e2c148                               // shl    rdx, 4
	LONG $0x28570349                               // add    rdx, qword [r15 + 40]
	LONG $0x888f8b49; WORD $0x0000; BYTE $0x00     // mov    rcx, qword [r15 + 136]
	WORD $0x6348; BYTE $0xfe                       // movsxd    rdi, esi
	LONG $0x24bc8948; LONG $0x000000d0             // mov    qword [rsp + 208], rdi

LBB0_95:
	WORD $0x894d; BYTE $0xcc           // mov    r12, r9
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x267c8043; WORD $0x000d     // cmp    byte [r14 + r12 + 13], 0
	JNE  LBB0_110
	LONG $0x2674634b; BYTE $0x04       // movsxd    rsi, dword [r14 + r12 + 4]
	WORD $0x8949; BYTE $0xf7           // mov    r15, rsi
	LONG $0x04e7c149                   // shl    r15, 4
	WORD $0x0149; BYTE $0xd7           // add    r15, rdx
	LONG $0x267c8043; WORD $0x000c     // cmp    byte [r14 + r12 + 12], 0
	JE   LBB0_103
	LONG $0xdbefe1c5                   // vpxor    xmm3, xmm3, xmm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_108
	LONG $0x106a8d4c                   // lea    r13, [rdx + 16]
	WORD $0x394d; BYTE $0xef           // cmp    r15, r13
	WORD $0x894d; BYTE $0xe8           // mov    r8, r13
	LONG $0xc7470f4d                   // cmova    r8, r15
	WORD $0x2949; BYTE $0xd0           // sub    r8, rdx
	WORD $0xff49; BYTE $0xc8           // dec    r8
	LONG $0xdbefe1c5                   // vpxor    xmm3, xmm3, xmm3
	WORD $0x8948; BYTE $0xc6           // mov    rsi, rax
	LONG $0x24848948; LONG $0x000000d8 // mov    qword [rsp + 216], rax

LBB0_99:
	WORD $0x6348; BYTE $0x3a       // movsxd    rdi, dword [rdx]
	LONG $0x78ff6b48               // imul    rdi, rdi, 120
	LONG $0x391c8b48               // mov    rbx, qword [rcx + rdi]
	LONG $0x39448b48; BYTE $0x08   // mov    rax, qword [rcx + rdi + 8]
	LONG $0x931c8b42               // mov    ebx, dword [rbx + 4*r10]
	LONG $0x901c2b42               // sub    ebx, dword [rax + 4*r10]
	LONG $0x39448b48; BYTE $0x10   // mov    rax, qword [rcx + rdi + 16]
	LONG $0x901c2b42               // sub    ebx, dword [rax + 4*r10]
	LONG $0x39448b48; BYTE $0x18   // mov    rax, qword [rcx + rdi + 24]
	LONG $0x901c0342               // add    ebx, dword [rax + 4*r10]
	LONG $0x2afae1c4; BYTE $0xe3   // vcvtsi2ss    xmm4, xmm0, rbx
	LONG $0x6459dac5; WORD $0x2039 // vmulss    xmm4, xmm4, dword [rcx + rdi + 32]
	LONG $0x39448b48; BYTE $0x28   // mov    rax, qword [rcx + rdi + 40]
	LONG $0x90048b42               // mov    eax, dword [rax + 4*r10]
	LONG $0x395c8b48; BYTE $0x30   // mov    rbx, qword [rcx + rdi + 48]
	LONG $0x93042b42               // sub    eax, dword [rbx + 4*r10]
	LONG $0x395c8b48; BYTE $0x38   // mov    rbx, qword [rcx + rdi + 56]
	LONG $0x93042b42               // sub    eax, dword [rbx + 4*r10]
	LONG $0x395c8b48; BYTE $0x40   // mov    rbx, qword [rcx + rdi + 64]
	LONG $0x93040342               // add    eax, dword [rbx + 4*r10]
	LONG $0x2afae1c4; BYTE $0xe8   // vcvtsi2ss    xmm5, xmm0, rax
	LONG $0x6c59d2c5; WORD $0x4839 // vmulss    xmm5, xmm5, dword [rcx + rdi + 72]
	LONG $0xed58dac5               // vaddss    xmm5, xmm4, xmm5
	LONG $0x395c8b4c; BYTE $0x50   // mov    r11, qword [rcx + rdi + 80]
	WORD $0x854d; BYTE $0xdb       // test    r11, r11
	JE   LBB0_101
	LONG $0x93048b43               // mov    eax, dword [r11 + 4*r10]
	LONG $0x395c8b48; BYTE $0x58   // mov    rbx, qword [rcx + rdi + 88]
	LONG $0x395c8b4c; BYTE $0x60   // mov    r11, qword [rcx + rdi + 96]
	LONG $0x93042b42               // sub    eax, dword [rbx + 4*r10]
	LONG $0x93042b43               // sub    eax, dword [r11 + 4*r10]
	LONG $0x395c8b48; BYTE $0x68   // mov    rbx, qword [rcx + rdi + 104]
	LONG $0x93040342               // add    eax, dword [rbx + 4*r10]
	LONG $0x2afae1c4; BYTE $0xe0   // vcvtsi2ss    xmm4, xmm0, rax
	LONG $0x6459dac5; WORD $0x7039 // vmulss    xmm4, xmm4, dword [rcx + rdi + 112]
	LONG $0xec58d2c5               // vaddss    xmm5, xmm5, xmm4

LBB0_101:
	LONG $0x6259c2c5; BYTE $0x0c       // vmulss    xmm4, xmm7, dword [rdx + 12]
	LONG $0xec2ef8c5                   // vucomiss    xmm5, xmm4
	WORD $0x930f; BYTE $0xd0           // setae    al
	WORD $0xb60f; BYTE $0xc0           // movzx    eax, al
	LONG $0x1c58e2c5; BYTE $0x86       // vaddss    xmm3, xmm3, dword [rsi + 4*rax]
	LONG $0x08c68348                   // add    rsi, 8
	LONG $0x10c28348                   // add    rdx, 16
	WORD $0x394c; BYTE $0xfa           // cmp    rdx, r15
	JB   LBB0_99
	LONG $0x04e8c149                   // shr    r8, 4
	LONG $0x24848b48; LONG $0x000000d8 // mov    rax, qword [rsp + 216]
	LONG $0xc0448d4a; BYTE $0x08       // lea    rax, [rax + 8*r8 + 8]
	LONG $0x04e0c149                   // shl    r8, 4
	WORD $0x014d; BYTE $0xc5           // add    r13, r8
	WORD $0x894c; BYTE $0xea           // mov    rdx, r13
	JMP  LBB0_107

LBB0_103:
	LONG $0xdbefe1c5         // vpxor    xmm3, xmm3, xmm3
	WORD $0xf685             // test    esi, esi
	JLE  LBB0_108
	LONG $0x10428d4c         // lea    r8, [rdx + 16]
	WORD $0x394d; BYTE $0xc7 // cmp    r15, r8
	WORD $0x894d; BYTE $0xc3 // mov    r11, r8
	LONG $0xdf470f4d         // cmova    r11, r15
	WORD $0x2949; BYTE $0xd3 // sub    r11, rdx
	WORD $0xff49; BYTE $0xcb // dec    r11
	LONG $0xdbefe1c5         // vpxor    xmm3, xmm3, xmm3
	WORD $0x8948; BYTE $0xc6 // mov    rsi, rax
	WORD $0x8949; BYTE $0xc5 // mov    r13, rax

LBB0_105:
	WORD $0x6348; BYTE $0x02       // movsxd    rax, dword [rdx]
	LONG $0x78c06b48               // imul    rax, rax, 120
	LONG $0x011c8b48               // mov    rbx, qword [rcx + rax]
	LONG $0x017c8b48; BYTE $0x08   // mov    rdi, qword [rcx + rax + 8]
	LONG $0x931c8b42               // mov    ebx, dword [rbx + 4*r10]
	LONG $0x971c2b42               // sub    ebx, dword [rdi + 4*r10]
	LONG $0x017c8b48; BYTE $0x10   // mov    rdi, qword [rcx + rax + 16]
	LONG $0x971c2b42               // sub    ebx, dword [rdi + 4*r10]
	LONG $0x017c8b48; BYTE $0x18   // mov    rdi, qword [rcx + rax + 24]
	LONG $0x971c0342               // add    ebx, dword [rdi + 4*r10]
	LONG $0x2afae1c4; BYTE $0xe3   // vcvtsi2ss    xmm4, xmm0, rbx
	LONG $0x6459dac5; WORD $0x2001 // vmulss    xmm4, xmm4, dword [rcx + rax + 32]
	LONG $0x017c8b48; BYTE $0x28   // mov    rdi, qword [rcx + rax + 40]
	LONG $0x973c8b42               // mov    edi, dword [rdi + 4*r10]
	LONG $0x015c8b48; BYTE $0x30   // mov    rbx, qword [rcx + rax + 48]
	LONG $0x933c2b42               // sub    edi, dword [rbx + 4*r10]
	LONG $0x015c8b48; BYTE $0x38   // mov    rbx, qword [rcx + rax + 56]
	LONG $0x933c2b42               // sub    edi, dword [rbx + 4*r10]
	LONG $0x015c8b48; BYTE $0x40   // mov    rbx, qword [rcx + rax + 64]
	LONG $0x933c0342               // add    edi, dword [rbx + 4*r10]
	LONG $0x2afae1c4; BYTE $0xef   // vcvtsi2ss    xmm5, xmm0, rdi
	LONG $0x6c59d2c5; WORD $0x4801 // vmulss    xmm5, xmm5, dword [rcx + rax + 72]
	LONG $0xe558dac5               // vaddss    xmm4, xmm4, xmm5
	LONG $0x6a59c2c5; BYTE $0x0c   // vmulss    xmm5, xmm7, dword [rdx + 12]
	LONG $0xe52ef8c5               // vucomiss    xmm4, xmm5
	WORD $0x930f; BYTE $0xd0       // setae    al
	WORD $0xb60f; BYTE $0xc0       // movzx    eax, al
	LONG $0x1c58e2c5; BYTE $0x86   // vaddss    xmm3, xmm3, dword [rsi + 4*rax]
	LONG $0x08c68348               // add    rsi, 8
	LONG $0x10c28348               // add    rdx, 16
	WORD $0x394c; BYTE $0xfa       // cmp    rdx, r15
	JB   LBB0_105
	LONG $0x04ebc149               // shr    r11, 4
	WORD $0x894c; BYTE $0xe8       // mov    rax, r13
	LONG $0xd8448d4a; BYTE $0x08   // lea    rax, [rax + 8*r11 + 8]
	LONG $0x04e3c149               // shl    r11, 4
	WORD $0x014d; BYTE $0xd8       // add    r8, r11
	WORD $0x894c; BYTE $0xc2       // mov    rdx, r8

LBB0_107:
	LONG $0x24bc8b48; LONG $0x000000d0 // mov    rdi, qword [rsp + 208]

LBB0_108:
	LONG $0x107a81c4; WORD $0x2664; BYTE $0x08 // vmovss    xmm4, dword [r14 + r12 + 8]
	LONG $0xe32ef8c5                           // vucomiss    xmm4, xmm3
	JA   LBB0_109

LBB0_110:
	WORD $0xff49; BYTE $0xc1           // inc    r9
	WORD $0x3949; BYTE $0xf9           // cmp    r9, rdi
	JL   LBB0_95
	LONG $0x248c8b48; LONG $0x000000c8 // mov    rcx, qword [rsp + 200]
	LONG $0x000001ba; BYTE $0x00       // mov    edx, 1
	JMP  LBB0_112

LBB0_93:
	LONG $0x248c8b48; LONG $0x000000c8 // mov    rcx, qword [rsp + 200]
	JMP  LBB0_112

LBB0_109:
	WORD $0xf741; BYTE $0xd9           // neg    r9d
	WORD $0x8944; BYTE $0xca           // mov    edx, r9d
	LONG $0x248c8b48; LONG $0x000000c8 // mov    rcx, qword [rsp + 200]

LBB0_112:
	WORD $0xd285                                   // test    edx, edx
	WORD $0x9f0f; BYTE $0xd0                       // setg    al
	WORD $0xb60f; BYTE $0xc0                       // movzx    eax, al
	WORD $0x0189                                   // mov    dword [rcx], eax
	LONG $0xbc28fcc5; LONG $0x00010024; BYTE $0x00 // vmovaps    ymm7, [rsp + 256]

LBB0_122:
	LONG $0x24448b48; BYTE $0x70 // mov    rax, qword [rsp + 112]
	LONG $0x08408b48             // mov    rax, qword [rax + 8]
	LONG $0x244c8b48; BYTE $0x08 // mov    rcx, qword [rsp + 8]
	LONG $0x3c7ffec5; BYTE $0x48 // vmovdqu    [rax + 2*rcx], ymm7
	LONG $0x247c8b4c; BYTE $0x60 // mov    r15, qword [rsp + 96]
	JMP  LBB0_123

LBB0_146:
	LONG $0x02c78349 // add    r15, 2

LBB0_123:
	LONG $0x24bc3b4c; LONG $0x00000088             // cmp    r15, qword [rsp + 136]
	JAE  LBB0_147
	LONG $0x24bc894c; LONG $0x000000c0             // mov    qword [rsp + 192], r15
	LONG $0x24848b48; LONG $0x00000098             // mov    rax, qword [rsp + 152]
	WORD $0x8b48; BYTE $0x10                       // mov    rdx, qword [rax]
	WORD $0x014c; BYTE $0xfa                       // add    rdx, r15
	LONG $0x24948948; LONG $0x000000a8             // mov    qword [rsp + 168], rdx
	LONG $0x248c8b48; LONG $0x00000090             // mov    rcx, qword [rsp + 144]
	LONG $0x10418b48                               // mov    rax, qword [rcx + 16]
	LONG $0x84af0f48; LONG $0x0000b824; BYTE $0x00 // imul    rax, qword [rsp + 184]
	LONG $0x20410348                               // add    rax, qword [rcx + 32]
	LONG $0x00103c80                               // cmp    byte [rax + rdx], 0
	JE   LBB0_146
	LONG $0x24848b48; LONG $0x000000a0             // mov    rax, qword [rsp + 160]
	LONG $0x07048d49                               // lea    rax, [r15 + rax]
	LONG $0x24b48b48; LONG $0x000000b0             // mov    rsi, qword [rsp + 176]
	LONG $0xc88e8b48; WORD $0x0000; BYTE $0x00     // mov    rcx, qword [rsi + 200]
	WORD $0x0c8b; BYTE $0x81                       // mov    ecx, dword [rcx + 4*rax]
	LONG $0xd0968b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rsi + 208]
	WORD $0x0c2b; BYTE $0x82                       // sub    ecx, dword [rdx + 4*rax]
	LONG $0xd8968b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rsi + 216]
	WORD $0x0c2b; BYTE $0x82                       // sub    ecx, dword [rdx + 4*rax]
	LONG $0xe0968b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rsi + 224]
	WORD $0x0c03; BYTE $0x82                       // add    ecx, dword [rdx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xd9                   // vcvtsi2ss    xmm3, xmm0, rcx
	LONG $0xa88e8b48; WORD $0x0000; BYTE $0x00     // mov    rcx, qword [rsi + 168]
	LONG $0xb0968b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rsi + 176]
	WORD $0x0c8b; BYTE $0x81                       // mov    ecx, dword [rcx + 4*rax]
	WORD $0x0c2b; BYTE $0x82                       // sub    ecx, dword [rdx + 4*rax]
	LONG $0xb8968b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rsi + 184]
	WORD $0x0c2b; BYTE $0x82                       // sub    ecx, dword [rdx + 4*rax]
	LONG $0xc0968b48; WORD $0x0000; BYTE $0x00     // mov    rdx, qword [rsi + 192]
	WORD $0x0c03; BYTE $0x82                       // add    ecx, dword [rdx + 4*rax]
	LONG $0x2afae1c4; BYTE $0xe1                   // vcvtsi2ss    xmm4, xmm0, rcx
	LONG $0xa659dac5; LONG $0x000000a0             // vmulss    xmm4, xmm4, dword [rsi + 160]
	LONG $0xdb59e2c5                               // vmulss    xmm3, xmm3, xmm3
	LONG $0xdb5cdac5                               // vsubss    xmm3, xmm4, xmm3
	LONG $0xd32e78c5                               // vucomiss    xmm10, xmm3
	LONG $0x2878c1c4; BYTE $0xfd                   // vmovaps    xmm7, xmm13
	JA   LBB0_127
	LONG $0xfb51fac5                               // vsqrtss    xmm7, xmm0, xmm3

LBB0_127:
	LONG $0x58568b4c                           // mov    r10, qword [rsi + 88]
	LONG $0x60468b48                           // mov    rax, qword [rsi + 96]
	WORD $0x294c; BYTE $0xd0                   // sub    rax, r10
	LONG $0x04e8c148                           // shr    rax, 4
	WORD $0xc085                               // test    eax, eax
	JLE  LBB0_145
	WORD $0x894c; BYTE $0xf9                   // mov    rcx, r15
	WORD $0xd148; BYTE $0xe9                   // shr    rcx, 1
	LONG $0x248c0348; LONG $0x00000080         // add    rcx, qword [rsp + 128]
	WORD $0x634d; BYTE $0x32                   // movsxd    r14, dword [r10]
	LONG $0xf53c8d4a; LONG $0x00000000         // lea    rdi, [8*r14]
	LONG $0x24948b48; LONG $0x000000b0         // mov    rdx, qword [rsp + 176]
	LONG $0x707a0348                           // add    rdi, qword [rdx + 112]
	LONG $0x04e6c149                           // shl    r14, 4
	LONG $0x2872034c                           // add    r14, qword [rdx + 40]
	LONG $0x889a8b48; WORD $0x0000; BYTE $0x00 // mov    rbx, qword [rdx + 136]
	WORD $0x9848                               // cdqe
	LONG $0x24848948; LONG $0x000000c8         // mov    qword [rsp + 200], rax
	WORD $0x3145; BYTE $0xc9                   // xor    r9d, r9d

LBB0_129:
	WORD $0x894d; BYTE $0xcc           // mov    r12, r9
	LONG $0x04e4c149                   // shl    r12, 4
	LONG $0x227c8043; WORD $0x000d     // cmp    byte [r10 + r12 + 13], 0
	JNE  LBB0_143
	LONG $0x2274634b; BYTE $0x04       // movsxd    rsi, dword [r10 + r12 + 4]
	WORD $0x8949; BYTE $0xf5           // mov    r13, rsi
	LONG $0x04e5c149                   // shl    r13, 4
	WORD $0x014d; BYTE $0xf5           // add    r13, r14
	LONG $0x227c8043; WORD $0x000c     // cmp    byte [r10 + r12 + 12], 0
	JE   LBB0_137
	LONG $0xdb57e0c5                   // vxorps    xmm3, xmm3, xmm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_142
	LONG $0x10468d4d                   // lea    r8, [r14 + 16]
	LONG $0x2484894c; LONG $0x000000d0 // mov    qword [rsp + 208], r8
	WORD $0x394d; BYTE $0xc5           // cmp    r13, r8
	LONG $0xc5470f4d                   // cmova    r8, r13
	WORD $0x294d; BYTE $0xf0           // sub    r8, r14
	WORD $0xff49; BYTE $0xc8           // dec    r8
	LONG $0x04e8c149                   // shr    r8, 4
	LONG $0xdb57e0c5                   // vxorps    xmm3, xmm3, xmm3
	WORD $0x8949; BYTE $0xfb           // mov    r11, rdi
	LONG $0x24bc8948; LONG $0x000000d8 // mov    qword [rsp + 216], rdi

LBB0_133:
	WORD $0x6349; BYTE $0x3e       // movsxd    rdi, dword [r14]
	LONG $0x78ff6b48               // imul    rdi, rdi, 120
	LONG $0x3b148b48               // mov    rdx, qword [rbx + rdi]
	LONG $0x3b748b48; BYTE $0x08   // mov    rsi, qword [rbx + rdi + 8]
	WORD $0x148b; BYTE $0x8a       // mov    edx, dword [rdx + 4*rcx]
	WORD $0x142b; BYTE $0x8e       // sub    edx, dword [rsi + 4*rcx]
	LONG $0x3b748b48; BYTE $0x10   // mov    rsi, qword [rbx + rdi + 16]
	WORD $0x142b; BYTE $0x8e       // sub    edx, dword [rsi + 4*rcx]
	LONG $0x3b748b48; BYTE $0x18   // mov    rsi, qword [rbx + rdi + 24]
	WORD $0x1403; BYTE $0x8e       // add    edx, dword [rsi + 4*rcx]
	LONG $0x2afae1c4; BYTE $0xe2   // vcvtsi2ss    xmm4, xmm0, rdx
	LONG $0x6459dac5; WORD $0x203b // vmulss    xmm4, xmm4, dword [rbx + rdi + 32]
	LONG $0x3b548b48; BYTE $0x28   // mov    rdx, qword [rbx + rdi + 40]
	WORD $0x148b; BYTE $0x8a       // mov    edx, dword [rdx + 4*rcx]
	LONG $0x3b748b48; BYTE $0x30   // mov    rsi, qword [rbx + rdi + 48]
	WORD $0x142b; BYTE $0x8e       // sub    edx, dword [rsi + 4*rcx]
	LONG $0x3b748b48; BYTE $0x38   // mov    rsi, qword [rbx + rdi + 56]
	WORD $0x142b; BYTE $0x8e       // sub    edx, dword [rsi + 4*rcx]
	LONG $0x3b748b48; BYTE $0x40   // mov    rsi, qword [rbx + rdi + 64]
	WORD $0x1403; BYTE $0x8e       // add    edx, dword [rsi + 4*rcx]
	LONG $0x2afae1c4; BYTE $0xea   // vcvtsi2ss    xmm5, xmm0, rdx
	LONG $0x6c59d2c5; WORD $0x483b // vmulss    xmm5, xmm5, dword [rbx + rdi + 72]
	LONG $0xed58dac5               // vaddss    xmm5, xmm4, xmm5
	LONG $0x3b7c8b4c; BYTE $0x50   // mov    r15, qword [rbx + rdi + 80]
	WORD $0x854d; BYTE $0xff       // test    r15, r15
	JE   LBB0_135
	LONG $0x8f148b41               // mov    edx, dword [r15 + 4*rcx]
	LONG $0x3b748b48; BYTE $0x58   // mov    rsi, qword [rbx + rdi + 88]
	LONG $0x3b448b48; BYTE $0x60   // mov    rax, qword [rbx + rdi + 96]
	WORD $0x142b; BYTE $0x8e       // sub    edx, dword [rsi + 4*rcx]
	WORD $0x142b; BYTE $0x88       // sub    edx, dword [rax + 4*rcx]
	LONG $0x3b448b48; BYTE $0x68   // mov    rax, qword [rbx + rdi + 104]
	WORD $0x1403; BYTE $0x88       // add    edx, dword [rax + 4*rcx]
	LONG $0x2afae1c4; BYTE $0xe2   // vcvtsi2ss    xmm4, xmm0, rdx
	LONG $0x6459dac5; WORD $0x703b // vmulss    xmm4, xmm4, dword [rbx + rdi + 112]
	LONG $0xec58d2c5               // vaddss    xmm5, xmm5, xmm4

LBB0_135:
	LONG $0x5942c1c4; WORD $0x0c66     // vmulss    xmm4, xmm7, dword [r14 + 12]
	LONG $0xec2ef8c5                   // vucomiss    xmm5, xmm4
	WORD $0x930f; BYTE $0xd0           // setae    al
	WORD $0xb60f; BYTE $0xc0           // movzx    eax, al
	LONG $0x5862c1c4; WORD $0x831c     // vaddss    xmm3, xmm3, dword [r11 + 4*rax]
	LONG $0x08c38349                   // add    r11, 8
	LONG $0x10c68349                   // add    r14, 16
	WORD $0x394d; BYTE $0xee           // cmp    r14, r13
	JB   LBB0_133
	LONG $0x24bc8b48; LONG $0x000000d8 // mov    rdi, qword [rsp + 216]
	LONG $0xc77c8d4a; BYTE $0x08       // lea    rdi, [rdi + 8*r8 + 8]
	LONG $0x04e0c149                   // shl    r8, 4
	LONG $0x24b48b4c; LONG $0x000000d0 // mov    r14, qword [rsp + 208]
	WORD $0x014d; BYTE $0xc6           // add    r14, r8
	LONG $0x24bc8b4c; LONG $0x000000c0 // mov    r15, qword [rsp + 192]
	JMP  LBB0_141

LBB0_137:
	LONG $0xdb57e0c5                   // vxorps    xmm3, xmm3, xmm3
	WORD $0xf685                       // test    esi, esi
	JLE  LBB0_142
	LONG $0x10468d4d                   // lea    r8, [r14 + 16]
	WORD $0x394d; BYTE $0xc5           // cmp    r13, r8
	WORD $0x894d; BYTE $0xc3           // mov    r11, r8
	LONG $0xdd470f4d                   // cmova    r11, r13
	WORD $0x294d; BYTE $0xf3           // sub    r11, r14
	WORD $0xff49; BYTE $0xcb           // dec    r11
	LONG $0x04ebc149                   // shr    r11, 4
	LONG $0xdb57e0c5                   // vxorps    xmm3, xmm3, xmm3
	LONG $0x24bc8948; LONG $0x000000d8 // mov    qword [rsp + 216], rdi

LBB0_139:
	WORD $0x6349; BYTE $0x06           // movsxd    rax, dword [r14]
	LONG $0x78c06b48                   // imul    rax, rax, 120
	LONG $0x03148b48                   // mov    rdx, qword [rbx + rax]
	LONG $0x03748b48; BYTE $0x08       // mov    rsi, qword [rbx + rax + 8]
	WORD $0x148b; BYTE $0x8a           // mov    edx, dword [rdx + 4*rcx]
	WORD $0x142b; BYTE $0x8e           // sub    edx, dword [rsi + 4*rcx]
	LONG $0x03748b48; BYTE $0x10       // mov    rsi, qword [rbx + rax + 16]
	WORD $0x142b; BYTE $0x8e           // sub    edx, dword [rsi + 4*rcx]
	LONG $0x03748b48; BYTE $0x18       // mov    rsi, qword [rbx + rax + 24]
	WORD $0x1403; BYTE $0x8e           // add    edx, dword [rsi + 4*rcx]
	LONG $0x2afae1c4; BYTE $0xe2       // vcvtsi2ss    xmm4, xmm0, rdx
	LONG $0x6459dac5; WORD $0x2003     // vmulss    xmm4, xmm4, dword [rbx + rax + 32]
	LONG $0x03548b48; BYTE $0x28       // mov    rdx, qword [rbx + rax + 40]
	WORD $0x148b; BYTE $0x8a           // mov    edx, dword [rdx + 4*rcx]
	LONG $0x03748b48; BYTE $0x30       // mov    rsi, qword [rbx + rax + 48]
	WORD $0x142b; BYTE $0x8e           // sub    edx, dword [rsi + 4*rcx]
	LONG $0x03748b48; BYTE $0x38       // mov    rsi, qword [rbx + rax + 56]
	WORD $0x142b; BYTE $0x8e           // sub    edx, dword [rsi + 4*rcx]
	LONG $0x03748b48; BYTE $0x40       // mov    rsi, qword [rbx + rax + 64]
	WORD $0x1403; BYTE $0x8e           // add    edx, dword [rsi + 4*rcx]
	LONG $0x2afae1c4; BYTE $0xea       // vcvtsi2ss    xmm5, xmm0, rdx
	LONG $0x6c59d2c5; WORD $0x4803     // vmulss    xmm5, xmm5, dword [rbx + rax + 72]
	LONG $0xe558dac5                   // vaddss    xmm4, xmm4, xmm5
	LONG $0x5942c1c4; WORD $0x0c6e     // vmulss    xmm5, xmm7, dword [r14 + 12]
	LONG $0xe52ef8c5                   // vucomiss    xmm4, xmm5
	WORD $0x930f; BYTE $0xd0           // setae    al
	WORD $0xb60f; BYTE $0xc0           // movzx    eax, al
	LONG $0x1c58e2c5; BYTE $0x87       // vaddss    xmm3, xmm3, dword [rdi + 4*rax]
	LONG $0x08c78348                   // add    rdi, 8
	LONG $0x10c68349                   // add    r14, 16
	WORD $0x394d; BYTE $0xee           // cmp    r14, r13
	JB   LBB0_139
	LONG $0x24bc8b48; LONG $0x000000d8 // mov    rdi, qword [rsp + 216]
	LONG $0xdf7c8d4a; BYTE $0x08       // lea    rdi, [rdi + 8*r11 + 8]
	LONG $0x04e3c149                   // shl    r11, 4
	WORD $0x014d; BYTE $0xd8           // add    r8, r11
	WORD $0x894d; BYTE $0xc6           // mov    r14, r8

LBB0_141:
	LONG $0x24848b48; LONG $0x000000c8 // mov    rax, qword [rsp + 200]

LBB0_142:
	LONG $0x107a81c4; WORD $0x2264; BYTE $0x08 // vmovss    xmm4, dword [r10 + r12 + 8]
	LONG $0xe32ef8c5                           // vucomiss    xmm4, xmm3
	JA   LBB0_144

LBB0_143:
	WORD $0xff49; BYTE $0xc1 // inc    r9
	WORD $0x3949; BYTE $0xc1 // cmp    r9, rax
	JL   LBB0_129
	JMP  LBB0_145

LBB0_144:
	WORD $0xf741; BYTE $0xd9 // neg    r9d
	WORD $0x8545; BYTE $0xc9 // test    r9d, r9d
	JLE  LBB0_146

LBB0_145:
	LONG $0x244c8b48; BYTE $0x78                   // mov    rcx, qword [rsp + 120]
	LONG $0x10418b48                               // mov    rax, qword [rcx + 16]
	LONG $0x84af0f48; LONG $0x0000b824; BYTE $0x00 // imul    rax, qword [rsp + 184]
	LONG $0x20410348                               // add    rax, qword [rcx + 32]
	LONG $0x248c8b48; LONG $0x000000a8             // mov    rcx, qword [rsp + 168]
	LONG $0x010104c6                               // mov    byte [rcx + rax], 1
	JMP  LBB0_146

LBB0_147:
	LONG $0x24448b48; BYTE $0x78                   // mov    rax, qword [rsp + 120]
	LONG $0x20488b48                               // mov    rcx, qword [rax + 32]
	LONG $0x10788b48                               // mov    rdi, qword [rax + 16]
	LONG $0xbcaf0f48; LONG $0x0000b824; BYTE $0x00 // imul    rdi, qword [rsp + 184]
	LONG $0x39048d48                               // lea    rax, [rcx + rdi]
	LONG $0x24948b48; LONG $0x00000098             // mov    rdx, qword [rsp + 152]
	WORD $0x8b48; BYTE $0x1a                       // mov    rbx, qword [rdx]
	WORD $0x0148; BYTE $0xd8                       // add    rax, rbx
	LONG $0x24448b4c; BYTE $0x70                   // mov    r8, qword [rsp + 112]
	LONG $0x08488b4d                               // mov    r9, qword [r8 + 8]
	LONG $0x245c8b4c; BYTE $0x40                   // mov    r11, qword [rsp + 64]
	WORD $0x854d; BYTE $0xdb                       // test    r11, r11
	LONG $0x24548b4c; BYTE $0x68                   // mov    r10, qword [rsp + 104]
	JE   LBB0_153
	LONG $0x000000be; BYTE $0x00                   // mov    esi, 0
	LONG $0x247c8348; WORD $0x0048                 // cmp    qword [rsp + 72], 0
	JNE  LBB0_150
	LONG $0x6f7ec1c4; BYTE $0x19                   // vmovdqu    ymm3, [r9]
	LONG $0x6765c1c4; WORD $0x2059                 // vpackuswb    ymm3, ymm3, [r9 + 32]
	LONG $0x00fde3c4; WORD $0xd8db                 // vpermq    ymm3, ymm3, 216
	LONG $0x187ffec5                               // vmovdqu    [rax], ymm3
	LONG $0x000020be; BYTE $0x00                   // mov    esi, 32

LBB0_150:
	LONG $0x247c8348; WORD $0x0050 // cmp    qword [rsp + 80], 0
	JE   LBB0_153
	WORD $0x0148; BYTE $0xfb       // add    rbx, rdi
	WORD $0x0148; BYTE $0xd9       // add    rcx, rbx
	WORD $0x0148; BYTE $0xf1       // add    rcx, rsi
	LONG $0x717c8d49; BYTE $0x60   // lea    rdi, [r9 + 2*rsi + 96]
	WORD $0xdb31                   // xor    ebx, ebx

LBB0_152:
	LONG $0x5c6ffec5; WORD $0xa05f // vmovdqu    ymm3, [rdi + 2*rbx - 96]
	LONG $0x5c67e5c5; WORD $0xc05f // vpackuswb    ymm3, ymm3, [rdi + 2*rbx - 64]
	LONG $0x00fde3c4; WORD $0xd8db // vpermq    ymm3, ymm3, 216
	LONG $0x1c7ffec5; BYTE $0x19   // vmovdqu    [rcx + rbx], ymm3
	LONG $0x5c6ffec5; WORD $0xe05f // vmovdqu    ymm3, [rdi + 2*rbx - 32]
	LONG $0x1c67e5c5; BYTE $0x5f   // vpackuswb    ymm3, ymm3, [rdi + 2*rbx]
	LONG $0x00fde3c4; WORD $0xd8db // vpermq    ymm3, ymm3, 216
	LONG $0x5c7ffec5; WORD $0x2019 // vmovdqu    [rcx + rbx + 32], ymm3
	LONG $0x1e548d48; BYTE $0x40   // lea    rdx, [rsi + rbx + 64]
	LONG $0x40c38348               // add    rbx, 64
	WORD $0x394c; BYTE $0xda       // cmp    rdx, r11
	JB   LBB0_152

LBB0_153:
	LONG $0x245c3b4c; BYTE $0x60               // cmp    r11, qword [rsp + 96]
	LONG $0x24bc8b48; LONG $0x000000b0         // mov    rdi, qword [rsp + 176]
	JE   LBB0_155
	LONG $0x244c8b48; BYTE $0x60               // mov    rcx, qword [rsp + 96]
	LONG $0x6f7ec1c4; WORD $0x495c; BYTE $0xc0 // vmovdqu    ymm3, [r9 + 2*rcx - 64]
	LONG $0x6765c1c4; WORD $0x495c; BYTE $0xe0 // vpackuswb    ymm3, ymm3, [r9 + 2*rcx - 32]
	LONG $0x00fde3c4; WORD $0xd8db             // vpermq    ymm3, ymm3, 216
	LONG $0x5c7ffec5; WORD $0xe008             // vmovdqu    [rax + rcx - 32], ymm3

LBB0_155:
	LONG $0x248c8b48; LONG $0x000000b8 // mov    rcx, qword [rsp + 184]
	LONG $0x02c18348                   // add    rcx, 2
	LONG $0x24848b48; LONG $0x00000098 // mov    rax, qword [rsp + 152]
	LONG $0x18483b48                   // cmp    rcx, qword [rax + 24]
	JL   LBB0_156

LBB0_157:

	// LCPI0_0:
	//        .quad   281479271743489         ## 0x1000100010001
DATA LC1<>+0x000(SB)/8, $0x1000100010001
// LCPI0_1:
//        .quad   4294967297              ## 0x100000001
DATA LC1<>+0x008(SB)/8, $0x100000001
//        .section        __TEXT,__const
//        .align  5
DATA LC1<>+0x010(SB)/8, $0xffffffffffffffff
DATA LC1<>+0x018(SB)/8, $0xffffffffffffffff
// LCPI0_2:
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