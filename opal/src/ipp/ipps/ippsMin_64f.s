        .text
        .align  4
        .globl  _ippsMin_64f


_ippsMin_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r10, r1
        mov     r6, r2
        beq     LBHG3
        cmp     r6, #0
        beq     LBHG3
        cmp     r10, #0
        ble     LBHG4
        ldr     r5, [r0]
        ldr     r4, [r0, #4]
        cmp     r10, #6
        mov     r9, #0
        blt     LBHG1
        sub     r8, r10, #6
        sub     r7, r0, #4
        str     r10, [sp, #4]
        str     r0, [sp]
LBHG0:
        ldr     r10, [r7, #8]
        ldr     r11, [r7, #4]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r10
        movlt   r5, r11
        ldr     r10, [r7, #0x10]
        ldr     r11, [r7, #0xC]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r10
        movlt   r5, r11
        ldr     r11, [r7, #0x18]
        ldr     r10, [r7, #0x14]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r11
        mov     r0, r10
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r11
        movlt   r5, r10
        ldr     r11, [r7, #0x20]
        ldr     r10, [r7, #0x1C]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r11
        mov     r0, r10
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r11
        movlt   r5, r10
        ldr     r10, [r7, #0x24]
        ldr     r11, [r7, #0x28]!
        mov     r2, r5
        mov     r3, r4
        mov     r0, r10
        mov     r1, r11
        bl      __ltdf2
        cmp     r0, #0
        add     r9, r9, #5
        movlt   r5, r10
        movlt   r4, r11
        cmp     r9, r8
        ble     LBHG0
        ldr     r10, [sp, #4]
        ldr     r0, [sp]
LBHG1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r11, r12, r0
LBHG2:
        ldr     r7, [r11, #4]
        ldr     r8, [r11, #8]!
        mov     r2, r5
        mov     r3, r4
        mov     r0, r7
        mov     r1, r8
        bl      __ltdf2
        cmp     r0, #0
        movlt   r5, r7
        movlt   r4, r8
        add     r9, r9, #1
        cmp     r9, r10
        blt     LBHG2
        mov     r0, #0
        str     r5, [r6]
        str     r4, [r6, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBHG3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBHG4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


