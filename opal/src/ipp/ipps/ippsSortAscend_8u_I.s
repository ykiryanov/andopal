        .text
        .align  4
        .globl  _ippsSortAscend_8u_I


_ippsSortAscend_8u_I:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #5, 24
        cmp     r0, #0
        beq     LAXM30
        cmp     r1, #0
        ble     LAXM31
        cmp     r1, #2
        blt     LAXM6
        cmp     r1, #0x80
        mov     r6, #0
        bge     LAXM22
        add     r2, r0, r1
        sub     r2, r2, #1
        mov     r12, #1
LAXM0:
        cmp     r1, #9
        bgt     LAXM7
        cmp     r2, r0
        bls     LAXM4
        add     r3, r0, #1
LAXM1:
        cmp     r3, r2
        mov     lr, r3
        mov     r1, r0
        bhi     LAXM3
LAXM2:
        ldrb    r5, [lr]
        ldrb    r4, [r1]
        cmp     r5, r4
        movgt   r1, lr
        add     lr, lr, #1
        cmp     lr, r2
        bls     LAXM2
LAXM3:
        ldrb    lr, [r2]
        ldrb    r4, [r1]
        strb    lr, [r1]
        strb    r4, [r2], #-1
        cmp     r2, r0
        bhi     LAXM1
LAXM4:
        add     r0, sp, #0x80
        sub     r12, r12, #1
        mov     r1, sp
        ldr     r2, [r1, +r12, lsl #2]
        ldr     r0, [r0, +r12, lsl #2]
LAXM5:
        sub     r1, r2, r0
        cmp     r12, #0
        add     r1, r1, #1
        bne     LAXM0
LAXM6:
        mov     r0, #0
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}
LAXM7:
        ldrb    r5, [r0]
        ldrb    r6, [r0, #1]
        add     lr, r0, #1
        mov     r4, r5
        mov     r3, r2
        cmp     r6, r5
        movlt   r5, r6
        movgt   r4, r6
        strb    r5, [r0, #1]
        strb    r4, [r0]
        ldrb    r7, [r0, +r1, asr #1]
        ldrb    r6, [r2]
        mov     r5, r4
        cmp     r7, r4
        movlt   r5, r7
        movgt   r4, r7
        cmp     r6, r5
        mov     r7, r5
        movlt   r7, r6
        strb    r7, [r0]
        ldrb    r6, [r2]
        cmp     r6, r5
        movgt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movlt   r6, r5
        strb    r6, [r0, +r1, asr #1]
        movgt   r4, r5
        strb    r4, [r2]
        ldrb    r1, [r0, +r1, asr #1]
LAXM8:
        cmp     r3, lr
        bls     LAXM14
        sub     r4, r3, lr
        cmp     r4, #6
        bcc     LAXM21
        ldrb    r5, [lr]
        cmp     r5, r1
        bgt     LAXM11
LAXM9:
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        bgt     LAXM10
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        bgt     LAXM10
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        bgt     LAXM10
        add     lr, lr, #1
        ldrb    r4, [lr]
        cmp     r4, r1
        bgt     LAXM10
        add     lr, lr, #1
        ldrb    r4, [lr]
        sub     r5, r3, #6
        cmp     lr, r5
        bcs     LAXM19
        cmp     r4, r1
        ble     LAXM9
LAXM10:
        cmp     r3, lr
        subhi   r4, r3, lr
        bls     LAXM14
LAXM11:
        cmp     r4, #6
        bcc     LAXM13
        add     r4, lr, #6
LAXM12:
        ldrb    r5, [r3]
        cmp     r5, r1
        ble     LAXM14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        ble     LAXM14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        ble     LAXM14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        ble     LAXM14
        sub     r3, r3, #1
        ldrb    r5, [r3]
        cmp     r5, r1
        ble     LAXM14
        sub     r3, r3, #1
        cmp     r3, r4
        bhi     LAXM12
LAXM13:
        ldrb    r4, [r3]
        cmp     r4, r1
        ble     LAXM14
        sub     r3, r3, #1
        cmp     r3, lr
        bhi     LAXM13
LAXM14:
        cmp     lr, r3
        beq     LAXM15
        ldrb    r4, [r3]
        ldrb    r5, [lr]
        strb    r4, [lr]
        strb    r5, [r3]
        b       LAXM8
LAXM15:
        ldrb    r4, [lr, #-1]!
        cmp     r4, r1
        bne     LAXM17
LAXM16:
        cmp     lr, r0
        bls     LAXM17
        ldrb    r4, [lr, #-1]!
        cmp     r4, r1
        beq     LAXM16
LAXM17:
        sub     r4, lr, r0
        sub     r1, r2, r3
        cmp     r4, r1
        bge     LAXM18
        cmp     lr, r0
        moveq   r0, r3
        beq     LAXM5
        mov     r1, sp
        add     r4, sp, #0x80
        str     r2, [r1, +r12, lsl #2]
        str     r3, [r4, +r12, lsl #2]
        add     r12, r12, #1
        mov     r2, lr
        b       LAXM5
LAXM18:
        cmp     r3, r2
        moveq   r2, lr
        beq     LAXM5
        add     r5, sp, #0x80
        mov     r1, r12
        str     r0, [r5, +r12, lsl #2]
        mov     r4, sp
        add     r12, r12, #1
        str     lr, [r4, +r1, lsl #2]
        mov     r0, r3
        b       LAXM5
LAXM19:
        cmp     r4, r1
        bgt     LAXM10
LAXM20:
        add     lr, lr, #1
        cmp     r3, lr
        bls     LAXM14
        ldrb    r4, [lr]
        cmp     r4, r1
        ble     LAXM20
        sub     r4, r3, lr
        b       LAXM11
LAXM21:
        ldrb    r5, [lr]
        cmp     r5, r1
        ble     LAXM20
        b       LAXM11
LAXM22:
        mov     r2, r6
        mov     r3, r2
LAXM23:
        add     r12, sp, #1, 24
        str     r6, [r12, +r2, lsl #2]
        add     r12, r12, r3
        add     r2, r2, #4
        cmp     r2, #1, 24
        add     r3, r3, #0x10
        str     r6, [r12, #4]
        str     r6, [r12, #8]
        str     r6, [r12, #0xC]
        blt     LAXM23
        cmp     r1, #0
        ble     LAXM27
        cmp     r1, #6
        movlt   r5, r6
        blt     LAXM25
        mov     r5, r6
        sub     r4, r1, #6
        sub     lr, r0, #1
LAXM24:
        ldrb    r3, [lr, #1]
        add     r2, sp, #1, 24
        ldrb    r8, [lr, #2]
        ldr     r9, [r2, +r3, lsl #2]
        ldrb    r12, [lr, #3]
        add     r7, sp, #1, 24
        add     r9, r9, #1
        str     r9, [r2, +r3, lsl #2]
        ldr     r9, [r7, +r8, lsl #2]
        ldrb    r3, [lr, #4]
        add     r5, r5, #5
        add     r9, r9, #1
        str     r9, [r7, +r8, lsl #2]
        add     r2, sp, #1, 24
        ldr     r9, [r2, +r12, lsl #2]
        ldrb    r8, [lr, #5]!
        cmp     r5, r4
        add     r9, r9, #1
        str     r9, [r2, +r12, lsl #2]
        add     r7, sp, #1, 24
        ldr     r12, [r7, +r3, lsl #2]
        add     r2, sp, #1, 24
        add     r12, r12, #1
        str     r12, [r7, +r3, lsl #2]
        ldr     r3, [r2, +r8, lsl #2]
        add     r3, r3, #1
        str     r3, [r2, +r8, lsl #2]
        ble     LAXM24
LAXM25:
        add     r2, r5, r0
LAXM26:
        ldrb    r12, [r2], #1
        add     r3, sp, #1, 24
        ldr     lr, [r3, +r12, lsl #2]
        add     r5, r5, #1
        cmp     r5, r1
        add     lr, lr, #1
        str     lr, [r3, +r12, lsl #2]
        blt     LAXM26
LAXM27:
        add     r1, sp, #1, 24
        ldr     r1, [r1, +r6, lsl #2]
        cmp     r1, #0
        ble     LAXM29
LAXM28:
        add     r0, r0, #1
        subs    r1, r1, #1
        strb    r6, [r0, #-1]
        bne     LAXM28
LAXM29:
        add     r6, r6, #1
        cmp     r6, #1, 24
        blt     LAXM27
        mov     r0, #0
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}
LAXM30:
        mvn     r0, #7
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}
LAXM31:
        mvn     r0, #5
        add     sp, sp, #5, 24
        ldmia   sp!, {r4 - r9, pc}


