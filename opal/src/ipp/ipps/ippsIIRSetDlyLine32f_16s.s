        .text
        .align  4
        .globl  _ippsIIRSetDlyLine32f_16s


_ippsIIRSetDlyLine32f_16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LBRE10
        ldr     r3, [pc, #0x20C]
        ldr     r2, [r5]
        sub     r12, r3, #1
        cmp     r12, r2
        beq     LBRE0
        cmp     r3, r2
        beq     LBRE0
        mvn     r0, #0x10
        ldmia   sp!, {r1, r4 - r11, pc}
LBRE0:
        sub     r12, r3, #1
        cmp     r12, r2
        mov     r8, #0
        ldreq   r10, [r5, #0x28]
        movne   r10, r8
        cmp     r3, r2
        ldreq   r2, [r5, #0x28]
        moveq   r10, r2, lsl #1
        cmp     r4, #0
        beq     LBRE9
        cmp     r10, #0
        ble     LBRE4
        cmp     r10, #6
        movlt   r9, r8
        blt     LBRE2
        mov     r9, r8
        sub     r7, r10, #6
        mov     r6, #4
        add     lr, r4, #4
        mov     r12, #8
        mov     r3, #0xC
        mov     r2, #0x10
LBRE1:
        ldr     r11, [lr, #-4]
        ldr     r0, [r5, #8]
        str     r11, [r0, +r9, lsl #2]
        ldr     r11, [lr]
        ldr     r0, [r5, #8]
        add     r9, r9, #5
        cmp     r9, r7
        str     r11, [r6, +r0]
        ldr     r11, [lr, #4]
        ldr     r0, [r5, #8]
        add     r6, r6, #0x14
        str     r11, [r12, +r0]
        ldr     r11, [lr, #8]
        ldr     r0, [r5, #8]
        add     r12, r12, #0x14
        str     r11, [r3, +r0]
        ldr     r11, [lr, #0xC]
        ldr     r0, [r5, #8]
        add     lr, lr, #0x14
        add     r3, r3, #0x14
        str     r11, [r2, +r0]
        add     r2, r2, #0x14
        ble     LBRE1
LBRE2:
        add     r2, r4, r9, lsl #2
LBRE3:
        ldr     r12, [r2], #4
        ldr     r3, [r5, #8]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r10
        blt     LBRE3
LBRE4:
        cmp     r10, #0
        ble     LBRE8
        cmp     r10, #6
        movlt   r9, r8
        blt     LBRE6
        mov     r9, r8
        sub     r7, r10, #6
        mov     r6, r4
        str     r10, [sp]
LBRE5:
        ldr     r0, [r6], #0x14
        add     r10, r9, #1
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r2, r2, r8
        str     r1, [r2, #4]
        ldr     r0, [r4, +r10, lsl #2]
        add     r8, r8, #0x28
        add     r11, r9, #2
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r4, +r11, lsl #2]
        add     r10, r9, #3
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r0, [r4, +r10, lsl #2]
        add     r11, r9, #4
        add     r9, r9, #5
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r4, +r11, lsl #2]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        cmp     r9, r7
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ble     LBRE5
        ldr     r10, [sp]
LBRE6:
        add     r4, r4, r9, lsl #2
        mov     r6, r9, lsl #3
LBRE7:
        ldr     r0, [r4], #4
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r9, r9, #1
        add     r2, r2, r6
        cmp     r9, r10
        str     r1, [r2, #4]
        add     r6, r6, #8
        blt     LBRE7
LBRE8:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBRE9:
        ldr     r0, [r5, #8]
        mov     r1, r10
        bl      _ippsZero_32f
        ldr     r0, [r5, #0x10]
        mov     r1, r10
        bl      _ippsZero_64s
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBRE10:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   0x49493036


