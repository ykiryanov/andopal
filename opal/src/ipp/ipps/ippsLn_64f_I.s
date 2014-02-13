        .text
        .align  4
        .globl  _ippsLn_64f_I


_ippsLn_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        beq     LBKL9
        cmp     r6, #1
        blt     LBKL5
        ldr     r4, [r7, #4]
        ldr     r5, [r7]
        mov     r8, #0xFE, 14
        mov     r12, r4, lsr #24
        and     r12, r12, #0x80
        mvn     r3, #0x7F
        tst     r12, r3
        orr     r8, r8, #0x1F, 6
        mov     r9, #0
        str     r5, [sp, #0xC]
        str     r9, [sp, #4]
        mov     r12, r8, lsl #1
        str     r4, [sp, #0x10]
        str     r12, [sp, #8]
        bne     LBKL0
        mov     r11, r9
        mov     r10, r11
        str     r3, [sp]
        b       LBKL3
LBKL0:
        mov     r11, r9
        mov     r10, r11
        str     r3, [sp]
LBKL1:
        ldr     r12, [pc, #0x128]
        cmp     r11, #0
        add     r2, r7, r9
        ldr     r3, [r12]
        ldr     r12, [r12, #4]
        str     r3, [r9, +r7]
        str     r12, [r2, #4]
        moveq   r11, #4
LBKL2:
        add     r10, r10, #1
        cmp     r10, r6
        bge     LBKL7
        ldr     r5, [r7, +r10, lsl #3]
        mov     r9, r10, lsl #3
        add     r2, r7, r9
        ldr     r4, [r2, #4]
        str     r5, [sp, #0xC]
        ldr     r12, [sp]
        mov     r3, r4, lsr #24
        and     r3, r3, #0x80
        str     r4, [sp, #0x10]
        tst     r3, r12
        beq     LBKL3
        b       LBKL1
LBKL3:
        ldr     r2, [sp, #0x10]
        and     r2, r2, r8
        cmp     r8, r2
        bne     LBKL4
        ldr     r12, [pc, #0xBC]
        add     r2, r7, r9
        ldr     r3, [r12]
        ldr     r12, [r12, #4]
        str     r3, [r9, +r7]
        eor     r12, r12, #2, 2
        str     r12, [r2, #4]
        b       LBKL2
LBKL4:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LBKL6
        mov     r1, r4
        mov     r0, r5
        bl      log
        str     r0, [r9, +r7]
        add     r9, r7, r9
        str     r1, [r9, #4]
        b       LBKL2
LBKL5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBKL6:
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #8]
        cmp     r11, #0
        str     r3, [r9, +r7]
        add     r9, r7, r9
        str     r2, [r9, #4]
        moveq   r11, #2
        b       LBKL2
LBKL7:
        cmp     r11, #0
        beq     LBKL8
        cmp     r11, #2
        beq     LBKL10
        mov     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBKL8:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBKL9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBKL10:
        mov     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfNAN_64f


