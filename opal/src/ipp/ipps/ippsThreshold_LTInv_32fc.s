        .text
        .align  4
        .globl  _ippsThreshold_LTInv_32fc


_ippsThreshold_LTInv_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mov     r10, r2
        mov     r6, r3
        beq     LBMM11
        cmp     r5, #0
        beq     LBMM11
        cmp     r10, #0
        ble     LBMM12
        ldr     r12, [pc, #0x33C]
        mov     r0, r6
        ldr     r9, [r12]
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        blt     LBMM3
        mov     r0, r6
        bl      __extendsfdf2
        mov     r3, r1
        mov     r7, r0
        str     r3, [sp]
        mov     r2, r7
        bl      __muldf3
        str     r1, [sp, #4]
        mov     r8, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mov     r11, #0
        beq     LBMM6
        ldr     r12, [pc, #0x2E8]
        mov     r1, r6
        ldr     r0, [r12]
        bl      __divsf3
        cmp     r10, #0
        ble     LBMM5
        str     r0, [sp, #0xC]
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r11, [sp, #0x1C]
        str     r9, [sp, #8]
        str     r10, [sp, #0x18]
LBMM0:
        ldr     r0, [r4]
        bl      __extendsfdf2
        mov     r8, r0
        ldr     r0, [r4, #4]
        mov     r6, r1
        bl      __extendsfdf2
        mov     r7, r0
        mov     r9, r1
        mov     r0, r8
        mov     r1, r6
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        mov     r1, r9
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #4]
        mov     r11, r0
        mov     r10, r1
        bl      __ltdf2
        cmp     r0, #0
        bge     LBMM1
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMM4
        mov     r0, r11
        mov     r1, r10
        bl      sqrt
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp]
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
LBMM1:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r11
        mov     r3, r10
        mov     r0, #0
        bl      __divdf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r5]
        eor     r1, r9, #2, 2
        mov     r0, r7
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r5, #4]
LBMM2:
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        add     r5, r5, #8
        add     r2, r2, #1
        str     r2, [sp, #0x1C]
        cmp     r2, r3
        add     r4, r4, #8
        blt     LBMM0
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBMM3:
        mvn     r0, #0x12
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBMM4:
        ldr     r2, [sp, #0xC]
        str     r2, [r5]
        ldr     r2, [sp, #8]
        str     r2, [r5, #4]
        b       LBMM2
LBMM5:
        mov     r0, r11
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBMM6:
        cmp     r10, #0
        ble     LBMM10
        ldr     r3, [pc, #0x158]
        mov     r0, r11
        str     r0, [sp, #0x14]
        str     r11, [sp, #0x1C]
        str     r9, [sp, #8]
        str     r10, [sp, #0x18]
LBMM7:
        ldr     r0, [r4]
        bl      __extendsfdf2
        ldr     r2, [r4, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r8, r0
        mov     r9, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMM9
        mov     r2, r11
        mov     r3, r10
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        eor     r11, r9, #2, 2
        mov     r10, r0
        mov     r9, r1
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r5]
        mov     r0, r8
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r5, #4]
LBMM8:
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        add     r5, r5, #8
        add     r2, r2, #1
        str     r2, [sp, #0x1C]
        cmp     r2, r3
        add     r4, r4, #8
        blt     LBMM7
        ldr     r0, [sp, #0x14]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBMM9:
        ldr     r2, [pc, #0x44]
        ldr     r3, [sp, #8]
        ldr     r2, [r2]
        str     r3, [r5, #4]
        mov     r3, #4
        str     r3, [sp, #0x14]
        str     r2, [r5]
        b       LBMM8
LBMM10:
        mov     r0, r11
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBMM11:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBMM12:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LBMM__2il0floatpacket.1
        .long   LBMM__2il0floatpacket.2
        .long   ippConstantOfINF_32f


        .data
        .align  4


LBMM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBMM__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


