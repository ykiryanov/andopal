        .text
        .align  4
        .globl  _ippsClosedLoopPitchSearch_G729_16s


_ippsClosedLoopPitchSearch_G729_16s:
        stmdb   sp!, {r0, r4 - r11, lr}
        ldr     r10, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldrsh   r12, [r0, #8]
        mov     r4, r2
        sub     r3, r3, r4
        cmp     r3, #1
        mov     r7, #0
        movlt   r8, r7
        blt     LDQZ1
        mov     r8, r7
        mov     r5, #1
        add     r6, r0, #0xA
LDQZ0:
        ldrsh   lr, [r6], #2
        cmp     lr, r12
        movge   r12, lr
        movge   r8, r5
        add     r5, r5, #1
        cmp     r5, r3
        ble     LDQZ0
LDQZ1:
        cmp     r1, #0
        bne     LDQZ2
        add     r1, r8, r4
        cmp     r1, #0x54
        bgt     LDQZ5
LDQZ2:
        add     r11, r0, r8, lsl #1
        mov     r0, r11
        mvn     r1, #1
        bl      ownInterpol_3
        mvn     r6, #0
        str     r4, [sp]
        mvn     r7, #1
        mov     r5, r6
        mov     r4, r0
LDQZ3:
        mov     r0, r11
        mov     r1, r5
        bl      ownInterpol_3
        cmp     r0, r4
        movgt   r4, r0
        movgt   r7, r5
        add     r5, r5, #1
        cmp     r5, #2
        ble     LDQZ3
        ldr     r4, [sp]
        cmn     r7, #2
        beq     LDQZ4
        cmp     r7, #2
        addne   r1, r8, r4
        bne     LDQZ5
        add     r8, r8, #1
        add     r1, r8, r4
        mov     r7, r6
        b       LDQZ5
LDQZ4:
        sub     r8, r8, #1
        add     r1, r8, r4
        mov     r7, #1
LDQZ5:
        str     r7, [r10]
        str     r1, [r9]
        ldmia   sp!, {r0, r4 - r11, pc}


