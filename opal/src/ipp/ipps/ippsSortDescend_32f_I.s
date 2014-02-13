        .text
        .align  4
        .globl  _ippsSortDescend_32f_I


_ippsSortDescend_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x42, 30
        mov     r4, r0
        cmp     r4, #0
        beq     LAXJ22
        cmp     r1, #0
        ble     LAXJ21
        cmp     r1, #2
        blt     LAXJ23
        add     r2, r4, r1, lsl #2
        sub     r5, r2, #4
        mov     r6, #1
LAXJ0:
        cmp     r1, #9
        bgt     LAXJ6
        cmp     r5, r4
        bls     LAXJ4
        add     r7, r4, #4
LAXJ1:
        cmp     r7, r5
        mov     r9, r7
        mov     r8, r4
        bhi     LAXJ3
LAXJ2:
        ldr     r0, [r9]
        ldr     r1, [r8]
        bl      __ltsf2
        cmp     r0, #0
        movlt   r8, r9
        add     r9, r9, #4
        cmp     r9, r5
        bls     LAXJ2
LAXJ3:
        ldr     r2, [r5]
        ldr     r1, [r8]
        str     r2, [r8]
        str     r1, [r5], #-4
        cmp     r5, r4
        bhi     LAXJ1
LAXJ4:
        sub     r6, r6, #1
        add     r1, sp, #8
        add     r0, sp, #0x88
        ldr     r5, [r1, +r6, lsl #2]
        ldr     r4, [r0, +r6, lsl #2]
LAXJ5:
        sub     r1, r5, r4
        cmp     r6, #0
        mov     r1, r1, asr #2
        add     r1, r1, #1
        bne     LAXJ0
        mov     r0, #0
        add     sp, sp, #0x42, 30
        ldmia   sp!, {r4 - r11, pc}
LAXJ6:
        ldr     r9, [r5]
        ldr     r10, [r5, #-4]
        mov     r8, r1, asr #1
        add     r2, r4, #4
        str     r2, [sp]
        mov     r1, r9
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        mov     r7, r9
        movgt   r7, r10
        str     r7, [r5]
        mov     r1, r9
        mov     r0, r10
        bl      __ltsf2
        cmp     r0, #0
        movlt   r9, r10
        str     r9, [r5, #-4]
        ldr     r10, [r4]
        ldr     r11, [r4, +r8, lsl #2]
        str     r5, [sp, #4]
        mov     r1, r10
        mov     r0, r11
        bl      __gtsf2
        mov     r9, r10
        cmp     r0, #0
        movgt   r9, r11
        mov     r1, r10
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        mov     r0, r7
        mov     r1, r9
        movlt   r10, r11
        bl      __gtsf2
        cmp     r0, #0
        mov     r2, r9
        movgt   r2, r7
        str     r2, [r4]
        ldr     r7, [r5]
        mov     r1, r9
        mov     r0, r7
        bl      __ltsf2
        cmp     r0, #0
        movlt   r9, r7
        mov     r1, r9
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        mov     r2, r9
        movgt   r2, r10
        str     r2, [r4, +r8, lsl #2]
        mov     r1, r9
        mov     r0, r10
        bl      __ltsf2
        cmp     r0, #0
        movlt   r9, r10
        str     r9, [r5]
        ldr     r8, [r4, +r8, lsl #2]
        ldr     r7, [sp, #4]
        ldr     r9, [sp]
LAXJ7:
        cmp     r7, r9
        bls     LAXJ13
        sub     r10, r7, r9
        cmp     r10, #0x18
        bcc     LAXJ20
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        blt     LAXJ10
LAXJ8:
        add     r9, r9, #4
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        blt     LAXJ9
        add     r9, r9, #4
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        blt     LAXJ9
        add     r9, r9, #4
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        blt     LAXJ9
        add     r9, r9, #4
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        blt     LAXJ9
        add     r9, r9, #4
        ldr     r0, [r9]
        sub     r2, r7, #0x18
        cmp     r9, r2
        bcs     LAXJ18
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        bge     LAXJ8
LAXJ9:
        cmp     r7, r9
        subhi   r10, r7, r9
        bls     LAXJ13
LAXJ10:
        cmp     r10, #0x18
        bcc     LAXJ12
        add     r10, r9, #0x18
LAXJ11:
        ldr     r0, [r7]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXJ13
        sub     r7, r7, #4
        ldr     r0, [r7]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXJ13
        sub     r7, r7, #4
        ldr     r0, [r7]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXJ13
        sub     r7, r7, #4
        ldr     r0, [r7]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXJ13
        sub     r7, r7, #4
        ldr     r0, [r7]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXJ13
        sub     r7, r7, #4
        cmp     r7, r10
        bhi     LAXJ11
LAXJ12:
        ldr     r0, [r7]
        mov     r1, r8
        bl      __ltsf2
        cmp     r0, #0
        bge     LAXJ13
        sub     r7, r7, #4
        cmp     r7, r9
        bhi     LAXJ12
LAXJ13:
        cmp     r9, r7
        beq     LAXJ14
        ldr     r3, [r7]
        ldr     r2, [r9]
        str     r3, [r9]
        str     r2, [r7]
        b       LAXJ7
LAXJ14:
        str     r9, [sp]
        ldr     r2, [sp]
        str     r7, [sp, #4]
        mov     r1, r8
        ldr     r0, [r2, #-4]
        sub     r7, r2, #4
        bl      __eqsf2
        cmp     r0, #0
        bne     LAXJ16
LAXJ15:
        cmp     r7, r4
        bls     LAXJ16
        ldr     r0, [r7, #-4]!
        mov     r1, r8
        bl      __eqsf2
        cmp     r0, #0
        beq     LAXJ15
LAXJ16:
        ldr     r1, [sp, #4]
        sub     r2, r5, r1
        sub     r1, r7, r4
        mov     r2, r2, asr #2
        cmp     r2, r1, asr #2
        ble     LAXJ17
        cmp     r7, r4
        ldreq   r4, [sp, #4]
        beq     LAXJ5
        ldr     r1, [sp, #4]
        add     r3, sp, #8
        add     r2, sp, #0x88
        str     r5, [r3, +r6, lsl #2]
        str     r1, [r2, +r6, lsl #2]
        add     r6, r6, #1
        mov     r5, r7
        b       LAXJ5
LAXJ17:
        ldr     r1, [sp, #4]
        cmp     r1, r5
        moveq   r5, r7
        beq     LAXJ5
        add     r1, sp, #0x88
        str     r4, [r1, +r6, lsl #2]
        mov     r3, r6
        add     r2, sp, #8
        str     r7, [r2, +r3, lsl #2]
        ldr     r4, [sp, #4]
        add     r6, r6, #1
        b       LAXJ5
LAXJ18:
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        blt     LAXJ9
LAXJ19:
        add     r9, r9, #4
        cmp     r7, r9
        bls     LAXJ13
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        bge     LAXJ19
        sub     r10, r7, r9
        b       LAXJ10
LAXJ20:
        ldr     r0, [r9]
        mov     r1, r8
        bl      __gesf2
        cmp     r0, #0
        bge     LAXJ19
        b       LAXJ10
LAXJ21:
        mvn     r0, #5
        add     sp, sp, #0x42, 30
        ldmia   sp!, {r4 - r11, pc}
LAXJ22:
        mvn     r0, #7
        add     sp, sp, #0x42, 30
        ldmia   sp!, {r4 - r11, pc}
LAXJ23:
        mov     r0, #0
        add     sp, sp, #0x42, 30
        ldmia   sp!, {r4 - r11, pc}


