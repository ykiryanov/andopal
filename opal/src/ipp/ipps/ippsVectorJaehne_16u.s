        .text
        .align  4
        .globl  _ippsVectorJaehne_16u


_ippsVectorJaehne_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r9, r0
        cmp     r9, #0
        mov     r7, r1
        mov     r10, r2
        beq     LBMF9
        cmp     r7, #0
        ble     LBMF8
        cmp     r7, #1
        mov     r8, #0
        bne     LBMF0
        strh    r8, [r9]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBMF0:
        mov     r0, r7
        bl      __floatsidf
        ldr     r5, [pc, #0x3D0]
        ldr     r4, [pc, #0x3D0]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        mov     r11, r0
        mov     r0, r7
        mov     r5, r1
        bl      _ippsMalloc_64f
        mov     r6, r0
        cmp     r6, #0
        beq     LBMF10
        cmp     r7, #0
        ble     LBMF2
        mov     r0, r10
        bl      __floatunssidf
        str     r10, [sp, #0xC]
        mov     r2, r8
        str     r8, [sp, #8]
        str     r9, [sp, #0x10]
        mov     r10, r11
        sub     r4, r6, #4
        str     r1, [sp]
        str     r6, [sp, #4]
        mov     r8, r0
        mov     r11, r2
        mov     r9, r5
LBMF1:
        mov     r0, r11
        bl      __floatsidf
        mov     r6, r0
        mov     r5, r1
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        bl      sin
        ldr     r3, [sp]
        mov     r2, r8
        bl      __muldf3
        add     r11, r11, #1
        str     r0, [r4, #4]
        str     r1, [r4, #8]!
        cmp     r11, r7
        blt     LBMF1
        ldr     r6, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r9, [sp, #0x10]
LBMF2:
        add     r2, sp, #0x20
        mov     r1, r7
        mov     r0, r6
        bl      _ippsMax_64f
        add     r2, sp, #0x28
        mov     r1, r7
        mov     r0, r6
        bl      _ippsMin_64f
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r1, [sp]
        mov     r11, r0
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r0, r8
        movle   r1, r0
        ble     LBMF3
        mov     r0, r10
        bl      __floatunssidf
        ldr     r3, [sp]
        mov     r2, r11
        bl      __divdf3
LBMF3:
        cmp     r7, #0
        ble     LBMF7
        cmp     r7, #6
        blt     LBMF5
        mov     r12, r9
        mov     r11, r9
        sub     lr, r7, #6
        sub     r2, r6, #0x24
        str     r7, [sp, #0x14]
        mov     r9, r6
        mov     r7, r5
        mov     r6, r4
        str     r12, [sp]
        str     r2, [sp, #0x18]
        str     lr, [sp, #0xC]
        mov     r5, r0
        mov     r4, r1
        mov     r10, r8
LBMF4:
        ldr     r12, [sp, #0x18]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12, #0x24]
        ldr     r1, [r12, #0x28]!
        str     r12, [sp, #0x18]
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r8, r12, #3, 4
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp]
        mov     r2, r7
        strh    r0, [r12], #0xA
        str     r12, [sp]
        add     r12, r10, #1
        ldr     r0, [r9, +r12, lsl #3]
        add     lr, r9, r12, lsl #3
        ldr     r1, [lr, #4]
        mov     r12, r12, lsl #1
        str     r12, [sp, #0x1C]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp, #0x1C]
        mov     r2, r7
        strh    r0, [r11, +r12]
        add     r12, r10, #2
        ldr     r0, [r9, +r12, lsl #3]
        add     lr, r9, r12, lsl #3
        ldr     r1, [lr, #4]
        mov     r12, r12, lsl #1
        str     r12, [sp, #0x1C]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp, #0x1C]
        mov     r2, r7
        strh    r0, [r11, +r12]
        add     r12, r10, #3
        ldr     r0, [r9, +r12, lsl #3]
        add     lr, r9, r12, lsl #3
        ldr     r1, [lr, #4]
        mov     r12, r12, lsl #1
        str     r12, [sp, #0x1C]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp, #0x1C]
        mov     r2, r7
        strh    r0, [r11, +r12]
        add     r12, r10, #4
        ldr     r0, [r9, +r12, lsl #3]
        add     lr, r9, r12, lsl #3
        ldr     r1, [lr, #4]
        mov     r12, r12, lsl #1
        str     r12, [sp, #0x1C]
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r3, r8
        mov     r2, #0
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp, #0xC]
        add     r10, r10, #5
        cmp     r10, r12
        ldr     r12, [sp, #0x1C]
        strh    r0, [r11, +r12]
        ble     LBMF4
        mov     r1, r4
        mov     r4, r6
        mov     r6, r9
        mov     r9, r11
        mov     r0, r5
        mov     r5, r7
        mov     r8, r10
        ldr     r7, [sp, #0x14]
LBMF5:
        mov     r12, r8, lsl #3
        sub     r12, r12, #4
        add     r11, r12, r6
        str     r6, [sp, #4]
        str     r7, [sp, #0x14]
        mov     lr, #0xFE, 12
        mov     r7, r5
        mov     r6, r4
        orr     r10, lr, #3, 4
        add     r9, r9, r8, lsl #1
        mov     r5, r0
        mov     r4, r1
LBMF6:
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]!
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __fixunsdfsi
        strh    r0, [r9], #2
        ldr     r12, [sp, #0x14]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LBMF6
        ldr     r6, [sp, #4]
LBMF7:
        mov     r0, r6
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBMF8:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBMF9:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBMF10:
        mvn     r0, #8
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x3ff921fb

