//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

TEXT ·_SimdSse2AbsDifferenceSum(SB), 7, $0

	MOVQ arg1+0(FP), DI
	MOVQ arg2+8(FP), SI
	MOVQ arg3+16(FP), DX
	MOVQ arg4+24(FP), CX
	MOVQ arg5+32(FP), R8
	MOVQ arg6+40(FP), R9
	QUAD $0xf089483824548b4c
	LONG $0xf0e08348; WORD $0x3948; BYTE $0xf0
	JNE  LBB0_34
	QUAD $0x48f0e08348f88948
	WORD $0xf839
	JNE  LBB0_34
	QUAD $0x48f0e08348c88948
	WORD $0xc839
	JNE  LBB0_34
	QUAD $0x48f0e08348d08948
	WORD $0xd039
	JNE  LBB0_34
	QUAD $0xbbf0e58349c5894d; QUAD $0x4cc3294c00000010
	QUAD $0x760f6608c3f6eb01
	BYTE $0xc0
	JE   LBB0_6
	QUAD $0x66ffffffffc0c748; QUAD $0xf8730f66c06e0f48
	BYTE $0x08

LBB0_6:
	WORD $0xc3f6; BYTE $0x04
	JE   LBB0_8
	LONG $0xf8730f66; BYTE $0x04

LBB0_8:
	WORD $0xc3f6; BYTE $0x02
	JE   LBB0_10
	LONG $0xf8730f66; BYTE $0x02

LBB0_10:
	WORD $0xc3f6; BYTE $0x01
	JE   LBB0_12
	LONG $0xf8730f66; BYTE $0x01

LBB0_12:
	LONG $0xc9ef0f66; WORD $0x854d; BYTE $0xc9
	JE   LBB0_64
	WORD $0x854d; BYTE $0xed
	JE   LBB0_27
	WORD $0x394d; BYTE $0xc5
	JNE  LBB0_15
	QUAD $0x0010bb4110f88349; QUAD $0xff49d8470f4d0000
	QUAD $0x04efc141df8945cb; QUAD $0x4d03e78341c7ff41
	QUAD $0xef0f66def749fe89
	LONG $0xe43145c9

LBB0_22:
	QUAD $0x00b8f3894cff854d
	WORD $0x0000; BYTE $0x00
	JE   LBB0_24

LBB0_23:
	QUAD $0xf60f6607046f0f66; QUAD $0x8348c8d40f660204
	LONG $0xff4810c0; BYTE $0xc3
	JNE  LBB0_23

LBB0_24:
	QUAD $0xc16f0f662ffb8349
	JBE  LBB0_25

LBB0_26:
	QUAD $0x6f0f6607146f0f66; QUAD $0x07646f0f6610075c
	QUAD $0x6630074c6f0f6620; QUAD $0xd0d40f660214f60f
	QUAD $0x0f6610025cf60f66; QUAD $0x200264f60f66dad4
	QUAD $0x4cf60f66e3d40f66; QUAD $0x8348ccd40f663002
	QUAD $0x6f0f66c0394c40c0
	BYTE $0xc1
	JB   LBB0_26

LBB0_25:
	QUAD $0xff49ca0148f70148
	LONG $0xcc394dc4
	JNE  LBB0_22
	JMP  LBB0_64

LBB0_34:
	QUAD $0xbbf0e58349c5894d; QUAD $0x4cc3294c00000010
	QUAD $0x0f456608c3f6eb01
	WORD $0xc076
	JE   LBB0_36
	QUAD $0x66ffffffffc0c748; QUAD $0x730f4166c06e0f4c
	WORD $0x08f8

LBB0_36:
	WORD $0xc3f6; BYTE $0x04
	JE   LBB0_38
	LONG $0x730f4166; WORD $0x04f8

LBB0_38:
	WORD $0xc3f6; BYTE $0x02
	JE   LBB0_40
	LONG $0x730f4166; WORD $0x02f8

LBB0_40:
	WORD $0xc3f6; BYTE $0x01
	JE   LBB0_42
	LONG $0x730f4166; WORD $0x01f8

LBB0_42:
	LONG $0xc9ef0f66; WORD $0x854d; BYTE $0xc9
	JE   LBB0_64
	WORD $0x854d; BYTE $0xed
	JE   LBB0_57
	WORD $0x394d; BYTE $0xc5
	JNE  LBB0_45
	QUAD $0x0010bb4110f88349; QUAD $0xff49d8470f4d0000
	QUAD $0x04efc141df8945cb; QUAD $0x4d03e78341c7ff41
	QUAD $0xef0f66def749fe89
	LONG $0xe43145c9

LBB0_52:
	QUAD $0x00b8f3894cff854d
	WORD $0x0000; BYTE $0x00
	JE   LBB0_54

LBB0_53:
	QUAD $0x6f0ff307046f0ff3; QUAD $0x0f66d0f60f660214
	QUAD $0xff4810c08348cad4
	BYTE $0xc3
	JNE  LBB0_53

LBB0_54:
	QUAD $0xc16f0f662ffb8349
	JBE  LBB0_55

LBB0_56:
	QUAD $0x6f0ff307146f0ff3; QUAD $0x07646f0ff310075c
	QUAD $0x3007446f0f44f320; QUAD $0x6f0ff302346f0ff3
	QUAD $0x026c6f0ff310027c; QUAD $0x6630024c6f0ff320
	QUAD $0x66f0d40f66f2f60f; QUAD $0x66fed40f66fbf60f
	QUAD $0x66efd40f66ecf60f; QUAD $0xcdd40f66c8f60f41
	QUAD $0x66c0394c40c08348
	WORD $0x6f0f; BYTE $0xc1
	JB   LBB0_56

LBB0_55:
	QUAD $0xff49ca0148f70148
	LONG $0xcc394dc4
	JNE  LBB0_52
	JMP  LBB0_64

LBB0_57:
	WORD $0x394d; BYTE $0xc5
	JE   LBB0_64
	LONG $0x41db3145; WORD $0xc1f6; BYTE $0x01
	JNE  LBB0_60
	LONG $0xc9ef0f66
	JMP  LBB0_61

LBB0_45:
	QUAD $0x41de8945ff5d8d4d; QUAD $0x8341c6ff4104eec1
	QUAD $0xc141ff7d8d4503e6; QUAD $0xe78341c7ff4104ef
	QUAD $0xc9ef0f66dff74903
	WORD $0x3145; BYTE $0xe4

LBB0_46:
	QUAD $0x00bbf8894cf6854d
	WORD $0x0000; BYTE $0x00
	JE   LBB0_48

LBB0_47:
	QUAD $0x6f0ff31f046f0ff3; QUAD $0x0f66d0f60f661a14
	QUAD $0xff4810c38348cad4
	BYTE $0xc0
	JNE  LBB0_47

LBB0_48:
	QUAD $0xd16f0f662ffb8349
	JBE  LBB0_50

LBB0_49:
	QUAD $0x6f0ff31f1c6f0ff3; QUAD $0x1f6c6f0ff3101f64
	QUAD $0x301f4c6f0f44f320; QUAD $0x6f0ff31a3c6f0ff3
	QUAD $0x1a746f0ff3101a44; QUAD $0x66301a546f0ff320
	QUAD $0x66f9d40f66fbf60f; QUAD $0x66c7d40f66c4f60f
	QUAD $0x66f0d40f66f5f60f; QUAD $0xd6d40f66d1f60f41
	QUAD $0x66eb394c40c38348
	WORD $0x6f0f; BYTE $0xca
	JB   LBB0_49

LBB0_50:
	QUAD $0x66f007446f0f42f3; QUAD $0x6f0f42f3c0db0f41
	QUAD $0xc8db0f4166f0024c; QUAD $0xcad40f66c8f60f66
	QUAD $0xff49ca0148f70148
	LONG $0xcc394dc4
	JNE  LBB0_46
	JMP  LBB0_64

LBB0_27:
	WORD $0x394d; BYTE $0xc5
	JE   LBB0_64
	LONG $0x41db3145; WORD $0xc1f6; BYTE $0x01
	JNE  LBB0_30
	LONG $0xc9ef0f66
	JMP  LBB0_31

LBB0_15:
	QUAD $0x41de8945ff5d8d4d; QUAD $0x8341c6ff4104eec1
	QUAD $0xc141ff7d8d4503e6; QUAD $0xe78341c7ff4104ef
	QUAD $0xc9ef0f66dff74903
	WORD $0x3145; BYTE $0xe4

LBB0_16:
	QUAD $0x00bbf8894cf6854d
	WORD $0x0000; BYTE $0x00
	JE   LBB0_18

LBB0_17:
	QUAD $0xf60f661f146f0f66; QUAD $0x8348cad40f661a14
	LONG $0xff4810c3; BYTE $0xc0
	JNE  LBB0_17

LBB0_18:
	QUAD $0xd16f0f662ffb8349
	JBE  LBB0_20

LBB0_19:
	QUAD $0x6f0f661f1c6f0f66; QUAD $0x1f6c6f0f66101f64
	QUAD $0x66301f546f0f6620; QUAD $0xd9d40f661a1cf60f
	QUAD $0x0f66101a64f60f66; QUAD $0x201a6cf60f66e3d4
	QUAD $0x54f60f66ecd40f66; QUAD $0x8348d5d40f66301a
	QUAD $0x6f0f66eb394c40c3
	BYTE $0xca
	JB   LBB0_19

LBB0_20:
	QUAD $0x66f0075c6f0f42f3; QUAD $0x4c6f0f42f3d8db0f
	QUAD $0x0f66c8db0f66f002; QUAD $0x0148cad40f66cbf6
	QUAD $0x4dc4ff49ca0148f7
	WORD $0xcc39
	JNE  LBB0_16
	JMP  LBB0_64

LBB0_60:
	QUAD $0x66f007446f0f42f3; QUAD $0x6f0f42f3c0db0f41
	QUAD $0xc8db0f4166f0024c; QUAD $0x48f70148c8f60f66
	QUAD $0x00000001bb41ca01

LBB0_61:
	LONG $0x01f98349
	JE   LBB0_64
	QUAD $0xf0c7834830048d49; QUAD $0x48081c8d49f60148
	QUAD $0x294dc90148f0c283
	BYTE $0xd9

LBB0_63:
	QUAD $0x416638046f0f41f3; QUAD $0x146f0f41f3c0db0f
	QUAD $0x0f66d0db0f416610; QUAD $0x0ff3d1d40f66d0f6
	QUAD $0xc0db0f416638046f; QUAD $0x0f4166130c6f0ff3
	QUAD $0x0f66c8f60f66c8db; QUAD $0xca0148f70148cad4
	LONG $0xfec18349
	JNE  LBB0_63
	JMP  LBB0_64

LBB0_30:
	QUAD $0x66f007546f0f42f3; QUAD $0x4c6f0f42f3d0db0f
	QUAD $0x0f66c8db0f66f002; QUAD $0xca0148f70148caf6
	LONG $0x0001bb41; WORD $0x0000

LBB0_31:
	LONG $0x01f98349
	JE   LBB0_64
	QUAD $0xf0c7834830048d49; QUAD $0x48081c8d49f60148
	QUAD $0x294dc90148f0c283
	BYTE $0xd9

LBB0_33:
	QUAD $0x0f6638146f0f41f3; QUAD $0x101c6f0f41f3d0db
	QUAD $0xdaf60f66d8db0f66; QUAD $0x146f0ff3d9d40f66
	QUAD $0x6f0ff3d0db0f6638; QUAD $0x0f66c8db0f66130c
	QUAD $0x0148cbd40f66caf6; QUAD $0xfec18349ca0148f7
	JNE  LBB0_33

LBB0_64:
	QUAD $0x700f66c97e0f4866; QUAD $0x48c07e0f48664ec1
	LONG $0x8949c801; BYTE $0x02
	RET

TEXT ·_SimdSse2AbsDifferenceSumMasked(SB), 7, $0

	MOVQ arg1+0(FP), DI
	MOVQ arg2+8(FP), SI
	MOVQ arg3+16(FP), DX
	MOVQ arg4+24(FP), CX
	MOVQ arg5+32(FP), R8
	MOVQ arg6+40(FP), R9
	QUAD $0x5c8b4c5024548b4c; QUAD $0x444024648b4c4824
	QUAD $0x48f089483824748a
	LONG $0x48f0e083; WORD $0xf039
	JNE  LBB1_39
	QUAD $0x48f0e08348f88948
	WORD $0xf839
	JNE  LBB1_39
	QUAD $0x48f0e08348c88948
	WORD $0xc839
	JNE  LBB1_39
	QUAD $0x48f0e08348d08948
	WORD $0xd039
	JNE  LBB1_39
	QUAD $0x4cf0e08348c8894c
	WORD $0xc839
	JNE  LBB1_39
	QUAD $0x4cf0e08348c0894c
	WORD $0xc039
	JNE  LBB1_39
	QUAD $0x41f0e38348e3894c; QUAD $0xe7294d00000010bf
	QUAD $0x6608c7f641df0149
	WORD $0x760f; BYTE $0xd2
	JE   LBB1_8
	QUAD $0x66ffffffffc0c748; QUAD $0xfa730f66d06e0f48
	BYTE $0x08

LBB1_8:
	LONG $0x04c7f641
	JE   LBB1_10
	LONG $0xfa730f66; BYTE $0x04

LBB1_10:
	LONG $0x02c7f641
	JE   LBB1_12
	LONG $0xfa730f66; BYTE $0x02

LBB1_12:
	LONG $0x01c7f641
	JE   LBB1_14
	LONG $0xfa730f66; BYTE $0x01

LBB1_14:
	LONG $0xc9ef0f66; WORD $0x854d; BYTE $0xdb
	JE   LBB1_38
	QUAD $0xc06e0f66c6b60f41; QUAD $0xdb8548c100380f66
	JE   LBB1_31
	WORD $0x394c; BYTE $0xe3
	JNE  LBB1_17
	QUAD $0x0010bf4110fc8349; QUAD $0xff49fc470f4d0000
	QUAD $0xfe894504efc149cf; QUAD $0xc9ef0f6601e68341
	WORD $0xdb31

LBB1_21:
	WORD $0x854d; BYTE $0xf6
	JNE  LBB1_22
	QUAD $0x740f66106f0f4166; QUAD $0xdb0f661f6f0f66d0
	QUAD $0xf60f6612db0f66da; QUAD $0x0010b8cad40f66d3
	WORD $0x0000
	JMP  LBB1_24

LBB1_22:
	WORD $0xc031

LBB1_24:
	WORD $0x854d; BYTE $0xff
	JE   LBB1_26

LBB1_25:
	QUAD $0x0f6600146f0f4166; QUAD $0x66071c6f0f66d074
	QUAD $0x0214db0f66dadb0f; QUAD $0xd1d40f66d3f60f66
	QUAD $0x6610004c6f0f4166; QUAD $0x075c6f0f66c8740f
	QUAD $0xdb0f66d9db0f6610; QUAD $0x66cbf60f6610024c
	QUAD $0x4c20c08348cad40f
	WORD $0xe039
	JB   LBB1_25

LBB1_26:
	QUAD $0x014dca0148f70148
	LONG $0xc3ff48c8; WORD $0x394c; BYTE $0xdb
	JNE  LBB1_21
	JMP  LBB1_38

LBB1_39:
	QUAD $0x41f0e38348e3894c; QUAD $0xe7294d00000010bf
	QUAD $0x6608c7f641df0149
	LONG $0xc0760f45
	JE   LBB1_41
	QUAD $0x66ffffffffc0c748; QUAD $0x730f4166c06e0f4c
	WORD $0x08f8

LBB1_41:
	LONG $0x04c7f641
	JE   LBB1_43
	LONG $0x730f4166; WORD $0x04f8

LBB1_43:
	LONG $0x02c7f641
	JE   LBB1_45
	LONG $0x730f4166; WORD $0x02f8

LBB1_45:
	LONG $0x01c7f641
	JE   LBB1_47
	LONG $0x730f4166; WORD $0x01f8

LBB1_47:
	LONG $0xd2ef0f66; WORD $0x854d; BYTE $0xdb
	JE   LBB1_71
	QUAD $0xc06e0f66c6b60f41; QUAD $0xdb8548c200380f66
	JE   LBB1_64
	WORD $0x394c; BYTE $0xe3
	JNE  LBB1_50
	QUAD $0x0010bf4110fc8349; QUAD $0xff49fc470f4d0000
	QUAD $0xfe894504efc149cf; QUAD $0xc9ef0f6601e68341
	WORD $0xdb31

LBB1_54:
	WORD $0x854d; BYTE $0xf6
	JNE  LBB1_55
	QUAD $0x740f66106f0f41f3; QUAD $0xdb0f661f6f0ff3d0
	QUAD $0xdb0f66226f0ff3da; QUAD $0xd40f66e3f60f66e2
	QUAD $0x0f6600000010b8cc
	WORD $0xd16f
	JMP  LBB1_57

LBB1_55:
	WORD $0xc031

LBB1_57:
	WORD $0x854d; BYTE $0xff
	JE   LBB1_59

LBB1_58:
	QUAD $0x41f3001c6f0f41f3; QUAD $0x740f661000546f0f
	QUAD $0x0ff307246f0ff3d8; QUAD $0xe3db0f6610076c6f
	QUAD $0x6f0ff302346f0ff3; QUAD $0x66f3db0f6610027c
	QUAD $0x66f1d40f66f4f60f; QUAD $0x66eadb0f66d0740f
	QUAD $0x66d5f60f66d7db0f; QUAD $0x4c20c08348d6d40f
	LONG $0x0f66e039; WORD $0xca6f
	JB   LBB1_58

LBB1_59:
	QUAD $0x014dca0148f70148; QUAD $0x66db394cc3ff48c8
	WORD $0x6f0f; BYTE $0xca
	JNE  LBB1_54
	JMP  LBB1_71

LBB1_64:
	WORD $0x394c; BYTE $0xe3
	JE   LBB1_71
	LONG $0x41ff3145; WORD $0xc3f6; BYTE $0x01
	JNE  LBB1_67
	LONG $0xd2ef0f66
	JMP  LBB1_68

LBB1_50:
	QUAD $0x04eec149ff738d4c; QUAD $0x6601e78341f78945
	LONG $0x45d2ef0f; WORD $0xed31

LBB1_51:
	WORD $0x854d; BYTE $0xff
	JNE  LBB1_52
	QUAD $0x740f66086f0f41f3; QUAD $0xdb0f661f6f0ff3c8
	QUAD $0xdb0f66226f0ff3d9; QUAD $0xd40f66e3f60f66e1
	QUAD $0x0f6600000010b8d4
	WORD $0xda6f
	JMP  LBB1_62

LBB1_52:
	WORD $0xc031

LBB1_62:
	WORD $0x854d; BYTE $0xf6
	JE   LBB1_63

LBB1_60:
	QUAD $0x41f300246f0f41f3; QUAD $0x740f6610005c6f0f
	QUAD $0x0ff3072c6f0ff3e0; QUAD $0xecdb0f661007746f
	QUAD $0x6f0ff3023c6f0ff3; QUAD $0x66fcdb0f6610024c
	QUAD $0x66fad40f66fdf60f; QUAD $0x66f3db0f66d8740f
	QUAD $0x66def60f66d9db0f; QUAD $0x4820c08348dfd40f
	LONG $0x0f66d839; WORD $0xd36f
	JB   LBB1_60

LBB1_63:
	QUAD $0x66f0204c6f0f43f3; QUAD $0xc8db0f4166c8740f
	QUAD $0x66f027646f0f42f3; QUAD $0x546f0f42f3e1db0f
	QUAD $0x0f66d1db0f66f022; QUAD $0x0148d3d40f66d4f6
	QUAD $0x49c8014dca0148f7
	LONG $0x394dc5ff; BYTE $0xdd
	JNE  LBB1_51
	JMP  LBB1_71

LBB1_67:
	QUAD $0x66f0204c6f0f43f3; QUAD $0xc8db0f4166c8740f
	QUAD $0x66f0275c6f0f42f3; QUAD $0x546f0f42f3d9db0f
	QUAD $0x0f66d1db0f66f022; QUAD $0xca0148f70148d3f6
	QUAD $0x000001bf41c8014d
	BYTE $0x00

LBB1_68:
	LONG $0x01fb8349
	JE   LBB1_71
	QUAD $0x1c8d49f026748d4e; QUAD $0xc90148f0c283480c
	QUAD $0xf0c083490c048d4b
	LONG $0x4dc9014d; WORD $0xfb29

LBB1_70:
	QUAD $0x0f66040c6f0f43f3; QUAD $0xf3c8db0f4166c874
	QUAD $0x0f66f03c5c6f0f41; QUAD $0x14246f0f41f3d9db
	QUAD $0xe3f60f66e1db0f66; QUAD $0x6f0f42f3e2d40f66
	QUAD $0x4166c8740f66000c; QUAD $0x1c6f0f41f3c8db0f
	QUAD $0xd9db0f66f701483e; QUAD $0xdb0f6613146f0ff3
	QUAD $0xd40f66d3f60f66d1; QUAD $0x4dca0148f70148d4
	LONG $0x8349c801; WORD $0xfec3
	JNE  LBB1_70

LBB1_71:
	QUAD $0x700f66d17e0f4866
	WORD $0x4ec2

LBB1_72:
	QUAD $0xc80148c07e0f4866
	WORD $0x8949; BYTE $0x02
	RET

TEXT ·_SimdSse2AbsDifferenceSums3x3(SB), 7, $0

	MOVQ arg1+0(FP), DI
	MOVQ arg2+8(FP), SI
	MOVQ arg3+16(FP), DX
	MOVQ arg4+24(FP), CX
	MOVQ arg5+32(FP), R8
	MOVQ arg6+40(FP), R9
	QUAD $0x4df0e08348c88948; QUAD $0x8349dd894dfe588d
	QUAD $0x00000012ba41f0e5; QUAD $0xf641ea014dc2294d
	LONG $0x456608c2; WORD $0x760f; BYTE $0xe4
	JE   LBB2_2
	QUAD $0x66ffffffffc3c748; QUAD $0x730f4166e36e0f4c
	WORD $0x08fc

LBB2_2:
	QUAD $0x3e5c8d48fe718d4d; QUAD $0x894501117c8d4c01
	QUAD $0xc8394804e48341d4
	JNE  LBB2_23
	QUAD $0x48f0e08348d08948
	WORD $0xd039
	JNE  LBB2_23
	WORD $0x854d; BYTE $0xe4
	JE   LBB2_6
	LONG $0x730f4166; WORD $0x04fc

LBB2_6:
	LONG $0x02c2f641
	JE   LBB2_8
	LONG $0x730f4166; WORD $0x02fc

LBB2_8:
	LONG $0x01c2f641
	JE   LBB2_10
	LONG $0x730f4166; WORD $0x01fc

LBB2_10:
	QUAD $0xf6854dc9ef0f4566; QUAD $0x0f4566dbef0f4566
	QUAD $0x66ffef0f4566f6ef; QUAD $0x66f6ef0f66edef0f
	QUAD $0x66c0ef0f66ffef0f
	WORD $0xef0f; BYTE $0xc9
	JE   LBB2_22
	WORD $0x854d; BYTE $0xed
	JE   LBB2_18
	QUAD $0x8348d8f749c88949; QUAD $0x45c9ef0f456602c2
	QUAD $0x66dbef0f4566c931; QUAD $0xef0f4566f6ef0f45
	QUAD $0xef0f66edef0f66ff; QUAD $0xef0f66ffef0f66f6
	LONG $0xef0f66c0; BYTE $0xc9

LBB2_13:
	LONG $0x31d78948; BYTE $0xc0

LBB2_14:
	QUAD $0x6f0f6603146f0ff3; QUAD $0x0f66daf60f66fe5f
	QUAD $0xf3ff5f6f0ff3cbd4; QUAD $0x66daf60f66276f0f
	QUAD $0x66e2f60f66c3d40f; QUAD $0x395c6f0f66fcd40f
	QUAD $0xd40f66daf60f66fe; QUAD $0xf3ff395c6f0ff3f3
	QUAD $0xdaf60f6639246f0f; QUAD $0xe2f60f66ebd40f66
	QUAD $0x6f0f66fcd40f4466; QUAD $0x66daf60f66fe4f5c
	QUAD $0x5c6f0ff3f3d40f44; QUAD $0x4466daf60f66ff4f
	QUAD $0x4f1c6f0ff3dbd40f; QUAD $0xd40f4466daf60f66
	QUAD $0xc7834810c08348cb
	LONG $0xe8394c10
	JB   LBB2_14
	WORD $0x394d; BYTE $0xeb
	JE   LBB2_17
	QUAD $0x66f01b546f0f46f3; QUAD $0x1f048d4bd4db0f45
	QUAD $0xf3ef00546f0f41f3; QUAD $0x41f3f0005c6f0f41
	QUAD $0x0f4166f100646f0f; QUAD $0x66d2f60f4166d4db
	QUAD $0xdcdb0f4166cad40f; QUAD $0xd40f66daf60f4166
	QUAD $0x4166e4db0f4166c3; QUAD $0xf3fcd40f66e2f60f
	QUAD $0x43f3ef1f546f0f43; QUAD $0x0f43f3f01f5c6f0f
	QUAD $0xdb0f4166f11f646f; QUAD $0x0f66d2f60f4166d4
	QUAD $0x66dcdb0f4166f2d4; QUAD $0xebd40f66daf60f41
	QUAD $0x0f4166e4db0f4166; QUAD $0xf3fcd40f4466e2f6
	QUAD $0x6f0ff3ef01546f0f; QUAD $0x01646f0ff3f0015c
	QUAD $0x4166d4db0f4166f1; QUAD $0xf2d40f4466d2f60f
	QUAD $0x0f4166dcdb0f4166; QUAD $0x66dbd40f4466daf6
	QUAD $0xf60f4166e4db0f41
	LONG $0x0f4466e2; WORD $0xccd4

LBB2_17:
	QUAD $0xff49cf0149f30148
	LONG $0xca0148c1; WORD $0x394d; BYTE $0xf1
	JNE  LBB2_13
	JMP  LBB2_22

LBB2_23:
	WORD $0x854d; BYTE $0xe4
	JE   LBB2_25
	LONG $0x730f4166; WORD $0x04fc

LBB2_25:
	LONG $0x02c2f641
	JE   LBB2_27
	LONG $0x730f4166; WORD $0x02fc

LBB2_27:
	LONG $0x01c2f641
	JE   LBB2_29
	LONG $0x730f4166; WORD $0x01fc

LBB2_29:
	QUAD $0xf6854dc9ef0f4566; QUAD $0x0f4566dbef0f4566
	QUAD $0x66ffef0f4566f6ef; QUAD $0xf6ef0f66c0ef0f45
	QUAD $0xc0ef0f66ffef0f66
	LONG $0xc9ef0f66
	JE   LBB2_41
	WORD $0x854d; BYTE $0xed
	JE   LBB2_37
	QUAD $0x8348d8f749c88949; QUAD $0x45c9ef0f456602c2
	QUAD $0x66dbef0f4566c931; QUAD $0xef0f4566f6ef0f45
	QUAD $0x0f66c0ef0f4566ff; QUAD $0x0f66ffef0f66f6ef
	LONG $0x0f66c0ef; WORD $0xc9ef

LBB2_32:
	LONG $0x31d78948; BYTE $0xc0

LBB2_33:
	QUAD $0x6f0ff303146f0ff3; QUAD $0xf3ff676f0ff3fe5f
	QUAD $0x66daf60f662f6f0f; QUAD $0x66e2f60f66cbd40f
	QUAD $0x66eaf60f66c4d40f; QUAD $0x395c6f0ff3fdd40f
	QUAD $0xf3ff39646f0ff3fe; QUAD $0xdaf60f66392c6f0f
	QUAD $0xe2f60f66f3d40f66; QUAD $0xf60f66c4d40f4466
	QUAD $0x0ff3fdd40f4466ea; QUAD $0xdaf60f66fe4f5c6f
	QUAD $0x6f0ff3f3d40f4466; QUAD $0x66daf60f66ff4f5c
	QUAD $0x1c6f0ff3dbd40f44; QUAD $0x0f4466daf60f664f
	QUAD $0x834810c08348cbd4
	LONG $0x394c10c7; BYTE $0xe8
	JB   LBB2_33
	WORD $0x394d; BYTE $0xeb
	JE   LBB2_36
	QUAD $0x66f01b546f0f46f3; QUAD $0x1f048d4bd4db0f45
	QUAD $0xf3ef00546f0f41f3; QUAD $0x41f3f0005c6f0f41
	QUAD $0x0f4166f100646f0f; QUAD $0x66d2f60f4166d4db
	QUAD $0xdcdb0f4166cad40f; QUAD $0xd40f66daf60f4166
	QUAD $0x4166e4db0f4166c3; QUAD $0xf3fcd40f66e2f60f
	QUAD $0x43f3ef1f546f0f43; QUAD $0x0f43f3f01f5c6f0f
	QUAD $0xdb0f4166f11f646f; QUAD $0x0f66d2f60f4166d4
	QUAD $0x66dcdb0f4166f2d4; QUAD $0xd40f4466daf60f41
	QUAD $0x4166e4db0f4166c3; QUAD $0xfcd40f4466e2f60f
	QUAD $0x0ff3ef01546f0ff3; QUAD $0x646f0ff3f0015c6f
	QUAD $0x66d4db0f4166f101; QUAD $0xd40f4466d2f60f41
	QUAD $0x4166dcdb0f4166f2; QUAD $0xdbd40f4466daf60f
	QUAD $0x0f4166e4db0f4166
	LONG $0x4466e2f6; WORD $0xd40f; BYTE $0xcc

LBB2_36:
	QUAD $0xff49cf0149f30148
	LONG $0xca0148c1; WORD $0x394d; BYTE $0xf1
	JNE  LBB2_32
	JMP  LBB2_41

LBB2_18:
	QUAD $0x348d4def3e7c8d48; QUAD $0x1c8d49f0c2834848
	QUAD $0x0f4566fec1834908; QUAD $0x66dbef0f4566c9ef
	QUAD $0xef0f4566f6ef0f45; QUAD $0xef0f66edef0f66ff
	QUAD $0xef0f66ffef0f66f6
	LONG $0xef0f66c0; BYTE $0xc9

LBB2_19:
	WORD $0x394d; BYTE $0xeb
	JE   LBB2_21
	QUAD $0x456638146f0f45f3; QUAD $0x546f0f41f3d4db0f
	QUAD $0xf3dc6f0f4166fe10; QUAD $0x45f3ff10646f0f45
	QUAD $0xd3db0f66102c6f0f; QUAD $0xd40f66d2f60f4166
	QUAD $0x4566e3db0f4466ca; QUAD $0xc4d40f4166e2f60f
	QUAD $0x0f4566ebdb0f4466; QUAD $0xf3fdd40f4166eaf6
	QUAD $0x0f44f3fe13546f0f; QUAD $0x6f0f44f3ff13646f
	QUAD $0x4166d3db0f66132c; QUAD $0x66f2d40f66d2f60f
	QUAD $0xf60f4566e3db0f44; QUAD $0x4466ecd40f4166e2
	QUAD $0xeaf60f4566ebdb0f; QUAD $0x0f41f3fdd40f4566
	QUAD $0x6f0f45f3fe16546f; QUAD $0x2c6f0f45f3ff1664
	QUAD $0x0f4166d3db0f6616; QUAD $0x66f2d40f4466d2f6
	QUAD $0xf60f4566e3db0f44; QUAD $0x4466dcd40f4566e2
	QUAD $0xecdb0f4566e36f0f; QUAD $0x0f4566eaf60f4566
	WORD $0xcdd4

LBB2_21:
	QUAD $0xff49ca0148f70148
	BYTE $0xc9
	JNE  LBB2_19

LBB2_22:
	QUAD $0x700f66c87e0f4866; QUAD $0x48c97e0f48664ec9
	QUAD $0x483824548b48c101; QUAD $0x66c07e0f48660a89
	QUAD $0x7e0f48664ec0700f; QUAD $0x084a8948c10148c1
	QUAD $0x700f66f87e0f4866; QUAD $0x48c17e0f48664ec7
	QUAD $0x4866104a8948c101; QUAD $0x4ec6700f66f07e0f
	QUAD $0xc10148c17e0f4866; QUAD $0x7e0f4866184a8948
	LONG $0x700f66e8; WORD $0x4ec5
	JMP  LBB2_42

LBB2_37:
	QUAD $0x0c8d4def3e7c8d48; QUAD $0x1c8d49f0c2834848
	QUAD $0x4566c9ef0f456608; QUAD $0xf6ef0f4566dbef0f
	QUAD $0x0f4566ffef0f4566; QUAD $0x0f66f6ef0f66c0ef
	QUAD $0x0f66c0ef0f66ffef
	WORD $0xc9ef

LBB2_38:
	WORD $0x394d; BYTE $0xeb
	JE   LBB2_40
	QUAD $0x456638146f0f45f3; QUAD $0x546f0f41f3d4db0f
	QUAD $0xf3dc6f0f4166fe10; QUAD $0x45f3ff10646f0f45
	QUAD $0xd3db0f66102c6f0f; QUAD $0xd40f66d2f60f4166
	QUAD $0x4566e3db0f4466ca; QUAD $0xc4d40f4166e2f60f
	QUAD $0x0f4566ebdb0f4466; QUAD $0xf3fdd40f4166eaf6
	QUAD $0x0f44f3fe13546f0f; QUAD $0x6f0f44f3ff13646f
	QUAD $0x4166d3db0f66132c; QUAD $0x66f2d40f66d2f60f
	QUAD $0xf60f4566e3db0f44; QUAD $0x4466c4d40f4566e2
	QUAD $0xeaf60f4566ebdb0f; QUAD $0x0f41f3fdd40f4566
	QUAD $0x6f0f45f3fe11546f; QUAD $0x2c6f0f45f3ff1164
	QUAD $0x0f4166d3db0f6611; QUAD $0x66f2d40f4466d2f6
	QUAD $0xf60f4566e3db0f44; QUAD $0x4466dcd40f4566e2
	QUAD $0xecdb0f4566e36f0f; QUAD $0x0f4566eaf60f4566
	WORD $0xcdd4

LBB2_40:
	QUAD $0xff49ca0148f70148
	BYTE $0xce
	JNE  LBB2_38

LBB2_41:
	QUAD $0x700f66c87e0f4866; QUAD $0x48c97e0f48664ec9
	QUAD $0x483824548b48c101; QUAD $0x66c07e0f48660a89
	QUAD $0x7e0f48664ec0700f; QUAD $0x084a8948c10148c1
	QUAD $0x700f66f87e0f4866; QUAD $0x48c17e0f48664ec7
	QUAD $0x4866104a8948c101; QUAD $0x4ec6700f66f07e0f
	QUAD $0xc10148c17e0f4866; QUAD $0x7e0f4c66184a8948
	LONG $0x0f4166c0; WORD $0xc070; BYTE $0x4e

LBB2_42:
	QUAD $0xc10148c17e0f4866; QUAD $0x7e0f4c66204a8948
	QUAD $0x664ec7700f4166f8; QUAD $0x48c10148c17e0f48
	QUAD $0xf07e0f4c66284a89; QUAD $0x48664ec6700f4166
	QUAD $0x8948c10148c17e0f; QUAD $0x66d87e0f4c66304a
	QUAD $0x0f48664ec3700f41; QUAD $0x4a8948c10148c17e
	QUAD $0x4166c87e0f4c6638; QUAD $0x7e0f48664ec1700f
	QUAD $0x404a8948c10148c1
	RET

TEXT ·_SimdSse2AbsDifferenceSums3x3Masked(SB), 7, $0

	MOVQ arg1+0(FP), DI
	MOVQ arg2+8(FP), SI
	MOVQ arg3+16(FP), DX
	MOVQ arg4+24(FP), CX
	MOVQ arg5+32(FP), R8
	MOVQ arg6+40(FP), R9
	QUAD $0x00000138248c894c; QUAD $0x448b4848244c8b4c
	QUAD $0xe48349cc89494024; QUAD $0xf5894dfe708d4cf0
	QUAD $0x0012ba41f0e58349; QUAD $0xea014dc229490000
	QUAD $0x760f456608c2f641
	BYTE $0xc0
	JE   LBB3_2
	QUAD $0x66ffffffffc0c748; QUAD $0x730f4166c06e0f4c
	WORD $0x08f8

LBB3_2:
	QUAD $0x3e5c8d4cfec18349; QUAD $0x8b4801117c8d4c01
	QUAD $0x8d4a000001382484; QUAD $0xe783d78944010044
	LONG $0xcc394904
	JNE  LBB3_18
	QUAD $0x48f0e38348d38948
	WORD $0xd339
	JNE  LBB3_18
	WORD $0x8548; BYTE $0xff
	JE   LBB3_6
	LONG $0x730f4166; WORD $0x04f8

LBB3_6:
	LONG $0x02c2f641
	JE   LBB3_8
	LONG $0x730f4166; WORD $0x02f8

LBB3_8:
	LONG $0x01c2f641
	JE   LBB3_10
	LONG $0x730f4166; WORD $0x01f8

LBB3_10:
	QUAD $0xc9854dd2ef0f4566
	JE   LBB3_11
	QUAD $0x0f446638247cb60f; QUAD $0xca00380f4566cf6e
	QUAD $0x8348d8f749c88949; QUAD $0x45d2ef0f456602c2
	QUAD $0x66e4ef0f4566e431; QUAD $0xef0f4566edef0f45
	QUAD $0x0f66ffef0f4566f6; QUAD $0x0f66ffef0f66f6ef
	LONG $0x0f66c0ef; WORD $0xc9ef

LBB3_13:
	QUAD $0xba41d38948ed854d
	LONG $0x00000000
	JE   LBB3_14

LBB3_33:
	QUAD $0x416610146f0f42f3; QUAD $0x1c6f0f43f3d1740f
	QUAD $0x6f0f66dadb0f6613; QUAD $0x0f66e2db0f66fe63
	QUAD $0x0ff3ccd40f66e3f6; QUAD $0x662b6f0ff3ff636f
	QUAD $0x66e3f60f66e2db0f; QUAD $0x66eadb0f66c4d40f
	QUAD $0x66fdd40f66ebf60f; QUAD $0xdb0f66fe19646f0f
	QUAD $0xd40f66e3f60f66e2; QUAD $0xf3ff19646f0ff3f4
	QUAD $0xe2db0f66192c6f0f; QUAD $0xd40f4466e3f60f66
	QUAD $0xf60f66eadb0f66fc; QUAD $0x0f66f5d40f4466eb
	QUAD $0xe2db0f66fe4b646f; QUAD $0xd40f4466e3f60f66
	QUAD $0x66ff4b646f0ff3ec; QUAD $0x66e3f60f66e2db0f
	QUAD $0x246f0ff3e4d40f44; QUAD $0xf60f66e2db0f664b
	QUAD $0x8349d4d40f4466e3; QUAD $0x394d10c3834810c2
	BYTE $0xea
	JB   LBB3_33

LBB3_14:
	WORD $0x394d; BYTE $0xee
	JE   LBB3_16
	QUAD $0x66f0305c6f0f46f3; QUAD $0xdb0f4566d9740f45
	QUAD $0xf033546f0f43f3d8; QUAD $0x3c8d4bd3db0f4166
	QUAD $0xef385c6f0f41f337; QUAD $0xf3f038646f0f41f3
	QUAD $0x4166f1386c6f0f41; QUAD $0x66daf60f66dbdb0f
	QUAD $0xe3db0f4166cbd40f; QUAD $0xc4d40f66e2f60f66
	QUAD $0xf60f66ebdb0f4166; QUAD $0x0f43f3fdd40f66ea
	QUAD $0x6f0f43f3ef375c6f; QUAD $0x6c6f0f43f3f03764
	QUAD $0x66dbdb0f4166f137; QUAD $0x66f3d40f66daf60f
	QUAD $0xe2f60f66e3db0f41; QUAD $0x0f4166fcd40f4466
	QUAD $0x4466eaf60f66ebdb; QUAD $0x395c6f0ff3f5d40f
	QUAD $0xf3f039646f0ff3ef; QUAD $0x0f4166f1396c6f0f
	QUAD $0x4466daf60f66dbdb; QUAD $0xe3db0f4166ebd40f
	QUAD $0xd40f4466e2f60f66; QUAD $0x0f66ebdb0f4166e4
	LONG $0x4466eaf6; WORD $0xd40f; BYTE $0xd5

LBB3_16:
	QUAD $0x0348cf0149f30149; QUAD $0xff49000001382484
	LONG $0xca0148c4; WORD $0x394d; BYTE $0xcc
	JNE  LBB3_13
	JMP  LBB3_17

LBB3_18:
	WORD $0x8548; BYTE $0xff
	JE   LBB3_20
	LONG $0x730f4166; WORD $0x04f8

LBB3_20:
	LONG $0x02c2f641
	JE   LBB3_22
	LONG $0x730f4166; WORD $0x02f8

LBB3_22:
	LONG $0x01c2f641
	JE   LBB3_24
	LONG $0x730f4166; WORD $0x01f8

LBB3_24:
	QUAD $0x0f45665024548b4c
	LONG $0x854dd2ef; BYTE $0xc9
	JE   LBB3_25
	QUAD $0x012824847f0f4466; QUAD $0x6638247cb60f0000
	QUAD $0x380f4566cf6e0f44; QUAD $0xd8f749c88949ca00
	QUAD $0xef0f456602c28348; QUAD $0xef0f4566e43145d2
	QUAD $0x4566edef0f4566e4; QUAD $0xffef0f4566f6ef0f
	QUAD $0xef0f66c0ef0f4566; QUAD $0xef0f66c0ef0f66ff
	BYTE $0xc9

LBB3_27:
	QUAD $0x00bfd38948ed854d
	WORD $0x0000; BYTE $0x00
	JE   LBB3_28

LBB3_34:
	QUAD $0x0f416638146f0ff3; QUAD $0x3b1c6f0f41f3d174
	QUAD $0x636f0ff3dadb0f66; QUAD $0x0ff3ff6b6f0ff3fe
	QUAD $0x0f66e2db0f66336f; QUAD $0x0f66ccd40f66e3f6
	QUAD $0x0f66ebf60f66eadb; QUAD $0x0f66f2db0f66c5d4
	QUAD $0x0ff3fed40f66f3f6; QUAD $0x6c6f0ff3fe19646f
	QUAD $0x6619346f0ff3ff19; QUAD $0x66e3f60f66e2db0f
	QUAD $0xeadb0f66c4d40f44; QUAD $0xd40f4466ebf60f66
	QUAD $0xf60f66f2db0f66fd; QUAD $0x0ff3f6d40f4466f3
	QUAD $0xe2db0f66fe4b646f; QUAD $0xd40f4466e3f60f66
	QUAD $0x66ff4b646f0ff3ec; QUAD $0x66e3f60f66e2db0f
	QUAD $0x246f0ff3e4d40f44; QUAD $0xf60f66e2db0f664b
	QUAD $0x8348d4d40f4466e3; QUAD $0x394c10c3834810c7
	BYTE $0xef
	JB   LBB3_34

LBB3_28:
	WORD $0x394d; BYTE $0xee
	JE   LBB3_30
	QUAD $0x66f0305c6f0f46f3; QUAD $0xdb0f4466d9740f45
	QUAD $0x43f300000128249c; QUAD $0x0f4166f033546f0f
	QUAD $0x41f3373c8d4bd3db; QUAD $0x0f41f3ef385c6f0f
	QUAD $0x6f0f41f3f038646f; QUAD $0xdbdb0f4166f1386c
	QUAD $0xcbd40f66daf60f66; QUAD $0xf60f66e3db0f4166
	QUAD $0x0f4166c4d40f66e2; QUAD $0x0f66eaf60f66ebdb
	QUAD $0x375c6f0f43f3fdd4; QUAD $0xf037646f0f43f3ef
	QUAD $0x66f1376c6f0f43f3; QUAD $0xdaf60f66dbdb0f41
	QUAD $0x0f4166c3d40f4466; QUAD $0x4466e2f60f66e3db
	QUAD $0xebdb0f4166fcd40f; QUAD $0xd40f4466eaf60f66
	QUAD $0xf3ef395c6f0ff3f5; QUAD $0x6f0ff3f039646f0f
	QUAD $0xdbdb0f4166f1396c; QUAD $0xd40f4466daf60f66
	QUAD $0x0f66e3db0f4166eb; QUAD $0x66e4d40f4466e2f6
	QUAD $0xeaf60f66ebdb0f41
	LONG $0xd40f4466; BYTE $0xd5

LBB3_30:
	QUAD $0x0348cf0149f30149; QUAD $0xff49000001382484
	LONG $0xca0148c4; WORD $0x394d; BYTE $0xcc
	JNE  LBB3_27
	JMP  LBB3_31

LBB3_25:
	QUAD $0x0f4566e4ef0f4566; QUAD $0x66f6ef0f4566edef
	QUAD $0xef0f4566ffef0f45; QUAD $0xef0f66ffef0f66c0
	LONG $0xef0f66c0; BYTE $0xc9

LBB3_31:
	QUAD $0x700f66c87e0f4866; QUAD $0x48c97e0f48664ec9
	QUAD $0x0f48660a8949c101; QUAD $0x664ec0700f66c07e
	QUAD $0x49c10148c17e0f48; QUAD $0xf87e0f4866084a89
	QUAD $0x0f48664ec7700f66; QUAD $0x4a8949c10148c17e
	QUAD $0x4166c07e0f4c6610; QUAD $0x7e0f48664ec0700f
	QUAD $0x184a8949c10148c1; QUAD $0x0f4166f87e0f4c66
	QUAD $0xc17e0f48664ec770; QUAD $0x66204a8949c10148
	QUAD $0x700f4166f07e0f4c; QUAD $0x48c17e0f48664ec6
	QUAD $0x4c66284a8949c101; QUAD $0xc5700f4166e87e0f
	QUAD $0x0148c17e0f48664e; QUAD $0x0f4c66304a8949c1
	QUAD $0x4ec4700f4166e07e; QUAD $0xc10148c17e0f4866
	QUAD $0x7e0f4c66384a8949; QUAD $0x664ec2700f4166d0
	QUAD $0x49c10148c17e0f48
	WORD $0x4a89; BYTE $0x40
	JMP  LBB3_32

LBB3_11:
	QUAD $0x0f4566e4ef0f4566; QUAD $0x66f6ef0f4566edef
	QUAD $0xf6ef0f66ffef0f45; QUAD $0xc0ef0f66ffef0f66
	LONG $0xc9ef0f66

LBB3_17:
	QUAD $0x700f66c87e0f4866; QUAD $0x48c97e0f48664ec9
	QUAD $0x485024548b48c101; QUAD $0x66c07e0f48660a89
	QUAD $0x7e0f48664ec0700f; QUAD $0x084a8948c10148c1
	QUAD $0x700f66f87e0f4866; QUAD $0x48c17e0f48664ec7
	QUAD $0x4866104a8948c101; QUAD $0x4ec6700f66f07e0f
	QUAD $0xc10148c17e0f4866; QUAD $0x7e0f4c66184a8948
	QUAD $0x664ec7700f4166f8; QUAD $0x48c10148c17e0f48
	QUAD $0xf07e0f4c66204a89; QUAD $0x48664ec6700f4166
	QUAD $0x8948c10148c17e0f; QUAD $0x66e87e0f4c66284a
	QUAD $0x0f48664ec5700f41; QUAD $0x4a8948c10148c17e
	QUAD $0x4166e07e0f4c6630; QUAD $0x7e0f48664ec4700f
	QUAD $0x384a8948c10148c1; QUAD $0x0f4166d07e0f4c66
	QUAD $0xc17e0f48664ec270
	LONG $0x48c10148; WORD $0x4a89; BYTE $0x40

LBB3_32:
	RET
