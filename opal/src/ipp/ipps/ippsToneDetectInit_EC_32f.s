        .text
        .align  4
        .globl  _ippsToneDetectInit_EC_32f


_ippsToneDetectInit_EC_32f:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0x7D, 26
        beq     LDKX0
        cmp     r1, #0xFA, 26
        mvnne   r0, #6
        ldmneia sp!, {r4 - r7, pc}
LDKX0:
        ldr     r12, [pc, #0xB8]
        ldr     r2, [pc, #0xB8]
        and     r3, r0, #0xF
        ldr     r6, [r12]
        rsb     r3, r3, #0
        and     r3, r3, #0xF
        add     r7, r0, r3
        cmp     r1, #0x7D, 26
        str     r6, [r7, #0xC]
        str     r6, [r7, #0x10]
        str     r6, [r7, #0x14]
        str     r6, [r7, #0x18]
        ldreq   r12, [pc, #0x90]
        ldrne   r12, [pc, #0x90]
        subne   r2, r2, #0x10
        ldr     r12, [r12]
        mov     lr, #0
        str     lr, [r7, #0x20]
        str     r12, [r7, #0x1C]
        str     r2, [r3, +r0]
        str     lr, [r7, #0x34]
        mov     r0, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x6C]
        ldr     r3, [pc, #0x6C]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        bl      __fixdfsi
        ldr     r2, [pc, #0x5C]
        ldr     r3, [pc, #0x5C]
        str     r0, [r7, #0x24]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        bl      __fixdfsi
        ldr     r2, [pc, #0x48]
        ldr     r3, [pc, #0x48]
        str     r0, [r7, #0x28]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [r7, #0x30]
        mov     r0, #0
        str     r6, [r7, #4]
        str     r6, [r7, #8]
        ldmia   sp!, {r4 - r7, pc}
        .long   LDKX__2il0floatpacket.1
        .long   LDKX_td_iir_coeffs_8
        .long   LDKX__2il0floatpacket.3
        .long   LDKX__2il0floatpacket.2
        .long   0x8d4fdf3b
        .long   0x3fda6e97
        .long   0xa9fbe76d
        .long   0x3fddd2f1
        .long   0x47ae147b
        .long   0x3f947ae1


        .data
        .align  4


LDKX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDKX__2il0floatpacket.2:
        .byte   0x1F,0x85,0x6B,0x3F
LDKX__2il0floatpacket.3:
        .byte   0x8F,0xC2,0x75,0x3F


        .data
        .align  4


LDKX_td_iir_coeffs_16:
        .byte   0xA0,0xC5,0x9D,0x3C,0xA0,0xC5,0x9D,0xBC,0x88,0x75,0xAA,0xBF,0xA6,0x23,0x76,0x3F
LDKX_td_iir_coeffs_8:
        .byte   0x28,0xD9,0x1A,0x3D,0x28,0xD9,0x1A,0xBD,0x99,0xBA,0x1A,0x3E,0xDB,0xA4,0x6C,0x3F


