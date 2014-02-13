        .text
        .align  4
        .globl  _ippsSortDescend_64f_I


_ippsSortDescend_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x45, 30
        mov     r4, r0
        cmp     r4, #0
        beq     LAXH22
        cmp     r1, #0
        ble     LAXH21
        cmp     r1, #2
        blt     LAXH23
        add     r2, r4, r1, lsl #3
        sub     r5, r2, #8
        mov     r6, #1
LAXH0:
        cmp     r1, #9
        bgt     LAXH6
        cmp     r5, r4
        bls     LAXH4
        add     r7, r4, #8
LAXH1:
        cmp     r7, r5
        mov     r9, r7
        mov     r8, r4
        bhi     LAXH3
LAXH2:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        bl      __ltdf2
        cmp     r0, #0
        movlt   r8, r9
        add     r9, r9, #8
        cmp     r9, r5
        bls     LAXH2
LAXH3:
        ldr     r12, [r5]
        ldr     r3, [r5, #4]
        ldr     r2, [r8]
        ldr     r1, [r8, #4]
        str     r12, [r8]
        str     r3, [r8, #4]
        str     r2, [r5]
        str     r1, [r5, #4]
        sub     r5, r5, #8
        cmp     r5, r4
        bhi     LAXH1
LAXH4:
        sub     r6, r6, #1
        add     r1, sp, #0x14
        add     r0, sp, #0x94
        ldr     r5, [r1, +r6, lsl #2]
        ldr     r4, [r0, +r6, lsl #2]
LAXH5:
        sub     r1, r5, r4
        cmp     r6, #0
        mov     r1, r1, asr #3
        add     r1, r1, #1
        bne     LAXH0
        mov     r0, #0
        add     sp, sp, #0x45, 30
        ldmia   sp!, {r4 - r11, pc}
LAXH6:
        ldr     r9, [r5, #-4]
        ldr     r10, [r5, #4]
        ldr     r8, [r5, #-8]
        ldr     r11, [r5]
        mov     r7, r1, asr #1
        mov     r1, r9
        mov     r3, r10
        mov     r2, r11
        mov     r0, r8
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, r10
        movgt   r12, r9
        str     r12, [sp]
        mov     r12, r11
        movgt   r12, r8
        str     r12, [sp, #4]
        str     r12, [r5]
        ldr     r12, [sp]
        mov     r1, r9
        mov     r3, r10
        str     r12, [r5, #4]
        mov     r2, r11
        mov     r0, r8
        bl      __ltdf2
        cmp     r0, #0
        movlt   r10, r9
        str     r10, [r5, #-4]
        movlt   r11, r8
        str     r11, [r5, #-8]
        ldr     r10, [r4, #4]
        ldr     r2, [r4, +r7, lsl #3]
        add     r12, r4, r7, lsl #3
        mov     r11, r10
        mov     r3, r10
        str     r2, [sp, #8]
        ldr     r8, [r4]
        str     r12, [sp, #0xC]
        ldr     r1, [r12, #4]
        ldr     r0, [sp, #8]
        mov     r9, r8
        str     r1, [sp, #0x10]
        mov     r2, r8
        bl      __gtdf2
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #8]
        cmp     r0, #0
        ldr     r0, [sp, #8]
        movgt   r11, r1
        mov     r2, r8
        mov     r3, r10
        movgt   r9, r12
        bl      __ltdf2
        ldr     r12, [sp, #8]
        ldr     r1, [sp]
        cmp     r0, #0
        movlt   r8, r12
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x10]
        mov     r2, r9
        movlt   r10, r12
        mov     r3, r11
        bl      __gtdf2
        ldr     r12, [sp]
        mov     lr, r11
        cmp     r0, #0
        movgt   lr, r12
        str     lr, [r4, #4]
        ldr     r12, [sp, #4]
        mov     lr, r9
        mov     r2, r9
        movgt   lr, r12
        str     lr, [r4]
        ldr     r0, [r5]
        mov     r3, r11
        str     r0, [sp, #0x10]
        ldr     r12, [r5, #4]
        str     r12, [sp, #8]
        ldr     r1, [sp, #8]
        bl      __ltdf2
        ldr     r12, [sp, #8]
        cmp     r0, #0
        movlt   r11, r12
        ldr     r12, [sp, #0x10]
        mov     r0, r8
        mov     r1, r10
        mov     r3, r11
        movlt   r9, r12
        mov     r2, r9
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, r9
        movgt   r12, r8
        str     r12, [r4, +r7, lsl #3]
        ldr     lr, [sp, #0xC]
        mov     r12, r11
        movgt   r12, r10
        str     r12, [lr, #4]
        mov     r2, r9
        mov     r3, r11
        mov     r0, r8
        mov     r1, r10
        bl      __ltdf2
        cmp     r0, #0
        movlt   r9, r8
        movlt   r11, r10
        str     r9, [r5]
        str     r11, [r5, #4]
        ldr     r8, [r4, +r7, lsl #3]
        ldr     r1, [sp, #0xC]
        add     r10, r4, #8
        mov     r9, r5
        ldr     r7, [r1, #4]
LAXH7:
        cmp     r9, r10
        bls     LAXH13
        sub     r11, r9, r10
        cmp     r11, #0x30
        bcc     LAXH20
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        blt     LAXH10
LAXH8:
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        blt     LAXH9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        blt     LAXH9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        blt     LAXH9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        blt     LAXH9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        sub     r12, r9, #0x30
        cmp     r10, r12
        bcs     LAXH18
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        bge     LAXH8
LAXH9:
        cmp     r9, r10
        subhi   r11, r9, r10
        bls     LAXH13
LAXH10:
        cmp     r11, #0x30
        bcc     LAXH12
        add     r11, r10, #0x30
LAXH11:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXH13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXH13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXH13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXH13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXH13
        sub     r9, r9, #8
        cmp     r9, r11
        bhi     LAXH11
LAXH12:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LAXH13
        sub     r9, r9, #8
        cmp     r9, r10
        bhi     LAXH12
LAXH13:
        cmp     r10, r9
        beq     LAXH14
        ldr     lr, [r9]
        ldr     r12, [r9, #4]
        ldr     r1, [r10]
        str     lr, [r10]
        ldr     lr, [r10, #4]
        str     r12, [r10, #4]
        str     r1, [r9]
        str     lr, [r9, #4]
        b       LAXH7
LAXH14:
        ldr     r0, [r10, #-8]
        ldr     r1, [r10, #-4]
        mov     r2, r8
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        sub     r10, r10, #8
        bne     LAXH16
LAXH15:
        cmp     r10, r4
        bls     LAXH16
        ldr     r0, [r10, #-8]!
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        beq     LAXH15
LAXH16:
        sub     r2, r5, r9
        sub     r1, r10, r4
        mov     r2, r2, asr #3
        cmp     r2, r1, asr #3
        ble     LAXH17
        cmp     r10, r4
        moveq   r4, r9
        beq     LAXH5
        add     r2, sp, #0x14
        add     r1, sp, #0x94
        str     r5, [r2, +r6, lsl #2]
        str     r9, [r1, +r6, lsl #2]
        add     r6, r6, #1
        mov     r5, r10
        b       LAXH5
LAXH17:
        cmp     r9, r5
        moveq   r5, r10
        beq     LAXH5
        add     r1, sp, #0x94
        mov     r3, r6
        str     r4, [r1, +r6, lsl #2]
        add     r2, sp, #0x14
        add     r6, r6, #1
        str     r10, [r2, +r3, lsl #2]
        mov     r4, r9
        b       LAXH5
LAXH18:
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        blt     LAXH9
LAXH19:
        add     r10, r10, #8
        cmp     r9, r10
        bls     LAXH13
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        bge     LAXH19
        sub     r11, r9, r10
        b       LAXH10
LAXH20:
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        bge     LAXH19
        b       LAXH10
LAXH21:
        mvn     r0, #5
        add     sp, sp, #0x45, 30
        ldmia   sp!, {r4 - r11, pc}
LAXH22:
        mvn     r0, #7
        add     sp, sp, #0x45, 30
        ldmia   sp!, {r4 - r11, pc}
LAXH23:
        mov     r0, #0
        add     sp, sp, #0x45, 30
        ldmia   sp!, {r4 - r11, pc}


