        .text
        .align  4
        .globl  _ippsSortDescend_8u_I


_ippsSortDescend_8u_I:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #5, 24
        cmp     r0, #0
        beq     LAXG31
        cmp     r1, #0
        ble     LAXG32
        cmp     r1, #2
        blt     LAXG6
        cmp     r1, #0x80
        mov     r6, #0
        bge     LAXG22
        add     r2, r0, r1
        sub     r2, r2, #1
        mov     r12, #1
LAXG0:
        cmp     r1, #9
        bgt     LAXG7
        cmp     r2, r0
        bls     LAXG4
        add     r3, r0, #1
LAXG1:
        cmp     r3, r2
        mov     lr, r3
        mov     r1, r0
        bhi     LAXG3
LAXG2:
        ldrb    r5, [lr]
        ldrb    r4, [r1]
        cmp     r5, r4
        movlt   r1, lr
        add     lr, lr, #1
        cmp     lr, r2
        bls     LAXG2
LAXG3:
        ldrb    lr, [r2]
        ldrb    r4, [r1]
        strb    lr, [r1]
        strb    r4, [r2], #-1
        cmp     r2, r0
        bhi     LAXG1
LAXG4:
        add     r0, sp, #0x80
        sub     r12, r12, #1
        mov     r1, sp
        ldr     r2, [r1, +r12, lsl #2]
        ldr     r0, [r0, +r12, lsl #2]
LAXG5:
        sub     r1, r2, r0
        cmp     r12, #0
        add     r1, r1, #1
        bne     LAXG0
LAXG6:
        mov     r0, #0
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}
LAXG7:
        ldrb    r6, [r2]
        ldrb    r5, [r2, #-1]
        add     lr, r0, #1
        mov     r4, r6
        mov     r3, r2
        cmp     r5, r6
        movgt   r6, r5
        movlt   r4, r5
        strb    r4, [r2, #-1]
        strb    r6, [r2]
        ldrb    r5, [r0]
        ldrb    r7, [r0, +r1, asr #1]
        mov     r4, r5
        cmp     r7, r5
        movgt   r4, r7
        movlt   r5, r7
        cmp     r6, r4
        mov     r7, r4
        movgt   r7, r6
        strb    r7, [r0]
        ldrb    r6, [r2]
        cmp     r6, r4
        movlt   r4, r6
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        strb    r6, [r0, +r1, asr #1]
        movlt   r4, r5
        strb    r4, [r2]
        ldrb    r1, [r0, +r1, asr #1]
LAXG8:
        cmp     r3, lr
        bls     LAXG14
        sub     r4, r3, lr
        cmp     r4, #6
        bcc     LAXG21
        ldrb    r5, [lr]
        cmp     r5, r1
        blt     LAXG11
LAXG9:
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        blt     LAXG10
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        blt     LAXG10
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        blt     LAXG10
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        blt     LAXG10
        add     lr, lr, #1
        ldrb    r4, [lr]
        sub     r5, r3, #6
        cmp     lr, r5
        bcs     LAXG19
        cmp     r4, r1
        bge     LAXG9
LAXG10:
        cmp     r3, lr
        subhi   r4, r3, lr
        bls     LAXG14
LAXG11:
        cmp     r4, #6
        bcc     LAXG13
        add     r4, lr, #6
LAXG12:
        ldrb    r5, [r3]
        cmp     r5, r1
        bge     LAXG14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        bge     LAXG14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        bge     LAXG14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        bge     LAXG14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        bge     LAXG14
        sub     r3, r3, #1
        cmp     r3, r4
        bhi     LAXG12
LAXG13:
        ldrb    r4, [r3]
        cmp     r4, r1
        bge     LAXG14
        sub     r3, r3, #1
        cmp     r3, lr
        bhi     LAXG13
LAXG14:
        cmp     lr, r3
        beq     LAXG15
        ldrb    r4, [r3]
        ldrb    r5, [lr]
        strb    r4, [lr]
        strb    r5, [r3]
        b       LAXG8
LAXG15:
        ldrb    r4, [lr, #-1]!
        cmp     r4, r1
        bne     LAXG17
LAXG16:
        cmp     lr, r0
        bls     LAXG17
        ldrb    r4, [lr, #-1]!
        cmp     r4, r1
        beq     LAXG16
LAXG17:
        sub     r4, lr, r0
        sub     r1, r2, r3
        cmp     r4, r1
        bge     LAXG18
        cmp     lr, r0
        moveq   r0, r3
        beq     LAXG5
        mov     r1, sp
        add     r4, sp, #0x80
        str     r2, [r1, +r12, lsl #2]
        str     r3, [r4, +r12, lsl #2]
        add     r12, r12, #1
        mov     r2, lr
        b       LAXG5
LAXG18:
        cmp     r3, r2
        moveq   r2, lr
        beq     LAXG5
        add     r5, sp, #0x80
        mov     r1, r12
        str     r0, [r5, +r12, lsl #2]
        mov     r4, sp
        add     r12, r12, #1
        str     lr, [r4, +r1, lsl #2]
        mov     r0, r3
        b       LAXG5
LAXG19:
        cmp     r4, r1
        blt     LAXG10
LAXG20:
        add     lr, lr, #1
        cmp     r3, lr
        bls     LAXG14
        ldrb    r4, [lr]
        cmp     r4, r1
        bge     LAXG20
        sub     r4, r3, lr
        b       LAXG11
LAXG21:
        ldrb    r5, [lr]
        cmp     r5, r1
        bge     LAXG20
        b       LAXG11
LAXG22:
        mov     r2, r6
        mov     r3, r2
LAXG23:
        add     r12, sp, #1, 24
        str     r6, [r12, +r2, lsl #2]
        add     r12, r12, r3
        add     r2, r2, #4
        cmp     r2, #1, 24
        add     r3, r3, #0x10
        str     r6, [r12, #4]
        str     r6, [r12, #8]
        str     r6, [r12, #0xC]
        blt     LAXG23
        cmp     r1, #0
        ble     LAXG27
        cmp     r1, #6
        blt     LAXG25
        sub     r5, r1, #6
        sub     r4, r0, #1
LAXG24:
        ldrb    r3, [r4, #1]
        add     r2, sp, #1, 24
        ldrb    r8, [r4, #2]
        ldr     r9, [r2, +r3, lsl #2]
        ldrb    r12, [r4, #3]
        add     r7, sp, #1, 24
        add     r9, r9, #1
        str     r9, [r2, +r3, lsl #2]
        ldr     r9, [r7, +r8, lsl #2]
        ldrb    r2, [r4, #4]
        add     r6, r6, #5
        add     r9, r9, #1
        str     r9, [r7, +r8, lsl #2]
        add     lr, sp, #1, 24
        ldr     r8, [lr, +r12, lsl #2]
        ldrb    r7, [r4, #5]!
        cmp     r6, r5
        add     r8, r8, #1
        str     r8, [lr, +r12, lsl #2]
        add     r3, sp, #1, 24
        ldr     lr, [r3, +r2, lsl #2]
        add     r12, sp, #1, 24
        add     lr, lr, #1
        str     lr, [r3, +r2, lsl #2]
        ldr     r2, [r12, +r7, lsl #2]
        add     r2, r2, #1
        str     r2, [r12, +r7, lsl #2]
        ble     LAXG24
LAXG25:
        add     r2, r6, r0
LAXG26:
        ldrb    r12, [r2], #1
        add     r3, sp, #1, 24
        ldr     lr, [r3, +r12, lsl #2]
        add     r6, r6, #1
        cmp     r6, r1
        add     lr, lr, #1
        str     lr, [r3, +r12, lsl #2]
        blt     LAXG26
LAXG27:
        mov     r1, #0xFF
LAXG28:
        add     r2, sp, #1, 24
        ldr     r2, [r2, +r1, lsl #2]
        cmp     r2, #0
        ble     LAXG30
LAXG29:
        add     r0, r0, #1
        subs    r2, r2, #1
        strb    r1, [r0, #-1]
        bne     LAXG29
LAXG30:
        subs    r1, r1, #1
        bpl     LAXG28
        mov     r0, #0
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}
LAXG31:
        mvn     r0, #7
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}
LAXG32:
        mvn     r0, #5
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}


