        .text
        .align  4
        .globl  _ippsNormDiff_Inf_64fc64f


_ippsNormDiff_Inf_64fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        cmp     r0, #0
        mov     r8, r3
        beq     LBBO4
        cmp     r1, #0
        beq     LBBO4
        cmp     r8, #0
        beq     LBBO4
        cmp     r2, #0
        ble     LBBO5
        bic     lr, r2, #1
        cmp     lr, #0
        mov     r12, #0
        ble     LBBO3
        mov     r6, r12
        mov     r7, r6
        mov     r5, r7
        mov     r4, r5
        sub     r3, r1, #4
        str     r6, [sp, #0x1C]
        sub     r11, r0, #4
        sub     r10, r1, #0x14
        sub     r9, r0, #0x14
        str     r7, [sp, #0x20]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r8, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r6, r3
LBBO0:
        ldr     r3, [r10, #0x18]
        ldr     r2, [r10, #0x14]
        ldr     r0, [r9, #0x14]
        ldr     r1, [r9, #0x18]
        bl      __subdf3
        ldr     r3, [r10, #0x20]
        ldr     r4, [r9, #0x1C]
        ldr     r5, [r9, #0x20]!
        ldr     r2, [r10, #0x1C]
        str     r0, [sp, #0x28]
        mov     r7, r1
        mov     r1, r5
        mov     r0, r4
        bl      __subdf3
        ldr     r4, [r11, #0x14]
        ldr     r3, [r6, #0x18]
        ldr     r2, [r6, #0x14]
        ldr     r5, [r11, #0x18]
        str     r1, [sp, #0x2C]
        mov     r8, r0
        mov     r1, r5
        mov     r0, r4
        bl      __subdf3
        ldr     r3, [r11, #0x1C]
        ldr     r4, [r11, #0x20]!
        ldr     r12, [r6, #0x20]
        ldr     r2, [r6, #0x1C]
        mov     r5, r0
        str     r1, [sp, #0x30]
        mov     r0, r3
        mov     r1, r4
        mov     r3, r12
        bl      __subdf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        mov     r4, r1
        mov     r3, r7
        mov     r2, r0
        mov     r1, r7
        bl      __muldf3
        ldr     r3, [sp, #0x2C]
        str     r1, [sp, #0x28]
        mov     r1, r3
        mov     r7, r0
        mov     r0, r8
        mov     r2, r8
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        mov     r2, r7
        bl      __adddf3
        bl      sqrt
        ldr     r3, [sp, #0x30]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r3
        mov     r2, r5
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x30]
        mov     r3, r4
        mov     r2, r0
        mov     r1, r4
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        mov     r2, r5
        bl      __adddf3
        bl      sqrt
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x18]
        mov     r5, r1
        mov     r4, r0
        mov     r0, r7
        mov     r1, r8
        bl      __gtdf2
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        movgt   r12, r8
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x18]
        mov     r0, r4
        movgt   r12, r7
        str     r12, [sp, #0x18]
        mov     r1, r5
        bl      __gtdf2
        cmp     r0, #0
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x10]
        movgt   r0, r5
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        movgt   r2, r4
        str     r2, [sp, #0x1C]
        add     r0, r0, #2
        cmp     r0, r1
        str     r0, [sp, #0x14]
        add     r6, r6, #0x20
        add     r10, r10, #0x20
        blt     LBBO0
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x18]
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBO1:
        tst     r2, #1
        beq     LBBO2
        sub     r0, r0, #0x10
        sub     r12, r1, #0x10
        ldr     r10, [r12, +r2, lsl #4]
        add     r9, r0, r2, lsl #4
        ldr     r1, [r9, #4]
        ldr     r0, [r0, +r2, lsl #4]
        add     r11, r12, r2, lsl #4
        ldr     r3, [r11, #4]
        mov     r2, r10
        bl      __subdf3
        ldr     r12, [r9, #0xC]
        ldr     r2, [r9, #8]
        ldr     lr, [r11, #8]
        ldr     r3, [r11, #0xC]
        mov     r9, r0
        mov     r0, r2
        mov     r10, r1
        mov     r1, r12
        mov     r2, lr
        bl      __subdf3
        str     r0, [sp, #0x34]
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r2
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        mov     r10, r0
        mov     r9, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        movgt   r5, r10
        movgt   r4, r9
LBBO2:
        mov     r0, r5
        mov     r1, r4
        mov     r2, r6
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        movgt   r6, r5
        movgt   r7, r4
        mov     r0, #0
        str     r6, [r8]
        str     r7, [r8, #4]
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBBO3:
        mov     r6, r12
        mov     r7, r6
        mov     r5, r7
        mov     r4, r5
        b       LBBO1
LBBO4:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBBO5:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


