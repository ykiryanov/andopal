        .text
        .align  4
        .globl  _ippsSortDescend_16s_I


_ippsSortDescend_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #1, 24
        cmp     r0, #0
        beq     LAXL22
        cmp     r1, #0
        ble     LAXL21
        cmp     r1, #2
        blt     LAXL23
        add     r2, r0, r1, lsl #1
        sub     r2, r2, #2
        mov     r3, #1
LAXL0:
        cmp     r1, #9
        bgt     LAXL6
        cmp     r2, r0
        bls     LAXL4
        add     r12, r0, #2
LAXL1:
        cmp     r12, r2
        mov     lr, r12
        mov     r1, r0
        bhi     LAXL3
LAXL2:
        ldrsh   r5, [lr]
        ldrsh   r4, [r1]
        cmp     r5, r4
        movlt   r1, lr
        add     lr, lr, #2
        cmp     lr, r2
        bls     LAXL2
LAXL3:
        ldrsh   lr, [r2]
        ldrsh   r4, [r1]
        strh    lr, [r1]
        strh    r4, [r2], #-2
        cmp     r2, r0
        bhi     LAXL1
LAXL4:
        add     r0, sp, #0x80
        sub     r3, r3, #1
        mov     r1, sp
        ldr     r2, [r1, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
LAXL5:
        sub     r1, r2, r0
        cmp     r3, #0
        mov     r1, r1, asr #1
        add     r1, r1, #1
        bne     LAXL0
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXL6:
        ldrsh   r4, [r2]
        ldrsh   r5, [r2, #-2]
        bic     r12, r1, #1
        mov     r1, r4
        add     lr, r0, #2
        cmp     r5, r4
        movgt   r4, r5
        movlt   r1, r5
        strh    r4, [r2]
        strh    r1, [r2, #-2]
        ldrsh   r6, [r0]
        ldrsh   r7, [r0, +r12]
        mov     r1, r2
        mov     r5, r6
        cmp     r7, r6
        movgt   r5, r7
        movlt   r6, r7
        cmp     r4, r5
        mov     r7, r5
        movgt   r7, r4
        strh    r7, [r0]
        ldrsh   r4, [r2]
        cmp     r4, r5
        movlt   r5, r4
        cmp     r6, r5
        mov     r4, r5
        movgt   r4, r6
        strh    r4, [r0, +r12]
        movlt   r5, r6
        strh    r5, [r2]
        ldrsh   r12, [r0, +r12]
LAXL7:
        cmp     r1, lr
        bls     LAXL13
        sub     r4, r1, lr
        cmp     r4, #0xC
        bcc     LAXL20
        ldrsh   r5, [lr]
        cmp     r5, r12
        blt     LAXL10
LAXL8:
        add     lr, lr, #2
        ldrsh   r4, [lr]
        cmp     r4, r12
        blt     LAXL9
        add     lr, lr, #2
        ldrsh   r4, [lr]
        cmp     r4, r12
        blt     LAXL9
        add     lr, lr, #2
        ldrsh   r4, [lr]
        cmp     r4, r12
        blt     LAXL9
        add     lr, lr, #2
        ldrsh   r4, [lr]
        cmp     r4, r12
        blt     LAXL9
        add     lr, lr, #2
        ldrsh   r4, [lr]
        sub     r5, r1, #0xC
        cmp     lr, r5
        bcs     LAXL18
        cmp     r4, r12
        bge     LAXL8
LAXL9:
        cmp     r1, lr
        subhi   r4, r1, lr
        bls     LAXL13
LAXL10:
        cmp     r4, #0xC
        bcc     LAXL12
        add     r4, lr, #0xC
LAXL11:
        ldrsh   r5, [r1]
        cmp     r5, r12
        bge     LAXL13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, r12
        bge     LAXL13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, r12
        bge     LAXL13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, r12
        bge     LAXL13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, r12
        bge     LAXL13
        sub     r1, r1, #2
        cmp     r1, r4
        bhi     LAXL11
LAXL12:
        ldrsh   r4, [r1]
        cmp     r4, r12
        bge     LAXL13
        sub     r1, r1, #2
        cmp     r1, lr
        bhi     LAXL12
LAXL13:
        cmp     lr, r1
        beq     LAXL14
        ldrsh   r4, [r1]
        ldrsh   r5, [lr]
        strh    r4, [lr]
        strh    r5, [r1]
        b       LAXL7
LAXL14:
        ldrsh   r4, [lr, #-2]!
        cmp     r4, r12
        bne     LAXL16
LAXL15:
        cmp     lr, r0
        bls     LAXL16
        ldrsh   r4, [lr, #-2]!
        cmp     r4, r12
        beq     LAXL15
LAXL16:
        sub     r4, r2, r1
        sub     r12, lr, r0
        mov     r4, r4, asr #1
        cmp     r4, r12, asr #1
        ble     LAXL17
        cmp     lr, r0
        moveq   r0, r1
        beq     LAXL5
        mov     r12, sp
        add     r4, sp, #0x80
        str     r2, [r12, +r3, lsl #2]
        str     r1, [r4, +r3, lsl #2]
        add     r3, r3, #1
        mov     r2, lr
        b       LAXL5
LAXL17:
        cmp     r1, r2
        moveq   r2, lr
        beq     LAXL5
        add     r5, sp, #0x80
        mov     r12, r3
        str     r0, [r5, +r3, lsl #2]
        mov     r4, sp
        add     r3, r3, #1
        str     lr, [r4, +r12, lsl #2]
        mov     r0, r1
        b       LAXL5
LAXL18:
        cmp     r4, r12
        blt     LAXL9
LAXL19:
        add     lr, lr, #2
        cmp     r1, lr
        bls     LAXL13
        ldrsh   r4, [lr]
        cmp     r4, r12
        bge     LAXL19
        sub     r4, r1, lr
        b       LAXL10
LAXL20:
        ldrsh   r5, [lr]
        cmp     r5, r12
        bge     LAXL19
        b       LAXL10
LAXL21:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXL22:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXL23:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}


