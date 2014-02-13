        .text
        .align  4
        .globl  _ippsLn_64f


_ippsLn_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r0, #0
        mov     r7, r1
        mov     r6, r2
        beq     LBKN9
        cmp     r7, #0
        beq     LBKN9
        cmp     r6, #1
        blt     LBKN5
        ldr     r4, [r0, #4]
        ldr     r5, [r0]
        mov     r9, #0xFE, 14
        mov     lr, r4, lsr #24
        and     lr, lr, #0x80
        orr     r8, r9, #0x1F, 6
        mvn     r12, #0x7F
        tst     lr, r12
        mov     r9, #0
        str     r5, [sp, #0x10]
        str     r9, [sp, #8]
        mov     lr, r8, lsl #1
        str     r4, [sp, #0x14]
        str     lr, [sp, #0xC]
        bne     LBKN0
        mov     r11, r9
        mov     r10, r11
        str     r12, [sp, #4]
        str     r0, [sp]
        b       LBKN3
LBKN0:
        mov     r11, r9
        mov     r10, r11
        str     r12, [sp, #4]
        str     r0, [sp]
LBKN1:
        ldr     r12, [pc, #0x12C]
        cmp     r11, #0
        add     r0, r7, r9
        ldr     r3, [r12]
        ldr     r12, [r12, #4]
        str     r3, [r9, +r7]
        str     r12, [r0, #4]
        moveq   r11, #4
LBKN2:
        add     r10, r10, #1
        cmp     r10, r6
        bge     LBKN7
        ldr     r0, [sp]
        mov     r9, r10, lsl #3
        add     r3, r9, r0
        ldr     r4, [r3, #4]
        ldr     r5, [r0, +r10, lsl #3]
        str     r5, [sp, #0x10]
        ldr     lr, [sp, #4]
        mov     r12, r4, lsr #24
        and     r12, r12, #0x80
        str     r4, [sp, #0x14]
        tst     r12, lr
        beq     LBKN3
        b       LBKN1
LBKN3:
        ldr     r3, [sp, #0x14]
        and     r3, r3, r8
        cmp     r8, r3
        bne     LBKN4
        ldr     r12, [pc, #0xBC]
        add     r0, r7, r9
        ldr     r3, [r12]
        ldr     r12, [r12, #4]
        str     r3, [r9, +r7]
        eor     r12, r12, #2, 2
        str     r12, [r0, #4]
        b       LBKN2
LBKN4:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LBKN6
        mov     r1, r4
        mov     r0, r5
        bl      log
        str     r0, [r9, +r7]
        add     r9, r7, r9
        str     r1, [r9, #4]
        b       LBKN2
LBKN5:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBKN6:
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #0xC]
        cmp     r11, #0
        str     r3, [r9, +r7]
        add     r9, r7, r9
        str     r0, [r9, #4]
        moveq   r11, #2
        b       LBKN2
LBKN7:
        cmp     r11, #0
        beq     LBKN8
        cmp     r11, #2
        beq     LBKN10
        mov     r0, #8
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBKN8:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBKN9:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBKN10:
        mov     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfNAN_64f


