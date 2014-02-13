        .text
        .align  4
        .globl  _ippsSortAscend_16s_I


_ippsSortAscend_16s_I:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #1, 24
        cmp     r0, #0
        beq     LAXR22
        cmp     r1, #0
        ble     LAXR21
        cmp     r1, #2
        blt     LAXR23
        add     r2, r0, r1, lsl #1
        sub     r2, r2, #2
        mov     r3, #1
LAXR0:
        cmp     r1, #9
        bgt     LAXR6
        cmp     r2, r0
        bls     LAXR4
        add     r12, r0, #2
LAXR1:
        cmp     r12, r2
        mov     lr, r12
        mov     r1, r0
        bhi     LAXR3
LAXR2:
        ldrsh   r5, [lr]
        ldrsh   r4, [r1]
        cmp     r5, r4
        movgt   r1, lr
        add     lr, lr, #2
        cmp     lr, r2
        bls     LAXR2
LAXR3:
        ldrsh   lr, [r2]
        ldrsh   r4, [r1]
        strh    lr, [r1]
        strh    r4, [r2], #-2
        cmp     r2, r0
        bhi     LAXR1
LAXR4:
        add     r0, sp, #0x80
        sub     r3, r3, #1
        mov     r1, sp
        ldr     r2, [r1, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
LAXR5:
        sub     r1, r2, r0
        cmp     r3, #0
        mov     r1, r1, asr #1
        add     r1, r1, #1
        bne     LAXR0
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXR6:
        ldrsh   r5, [r0]
        ldrsh   r6, [r0, #2]
        bic     lr, r1, #1
        mov     r4, r5
        add     r12, r0, #2
        cmp     r6, r5
        movlt   r5, r6
        movgt   r4, r6
        strh    r5, [r0, #2]
        strh    r4, [r0]
        ldrsh   r6, [r0, +lr]
        ldrsh   r1, [r2]
        mov     r5, r4
        cmp     r6, r4
        movlt   r5, r6
        movgt   r4, r6
        cmp     r1, r5
        mov     r6, r5
        movlt   r6, r1
        strh    r6, [r0]
        ldrsh   r6, [r2]
        mov     r1, r2
        cmp     r6, r5
        movgt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movlt   r6, r5
        strh    r6, [r0, +lr]
        movgt   r4, r5
        strh    r4, [r2]
        ldrsh   lr, [r0, +lr]
LAXR7:
        cmp     r1, r12
        bls     LAXR13
        sub     r4, r1, r12
        cmp     r4, #0xC
        bcc     LAXR20
        ldrsh   r5, [r12]
        cmp     r5, lr
        bgt     LAXR10
LAXR8:
        add     r12, r12, #2
        ldrsh   r4, [r12]
        cmp     r4, lr
        bgt     LAXR9
        add     r12, r12, #2
        ldrsh   r4, [r12]
        cmp     r4, lr
        bgt     LAXR9
        add     r12, r12, #2
        ldrsh   r4, [r12]
        cmp     r4, lr
        bgt     LAXR9
        add     r12, r12, #2
        ldrsh   r4, [r12]
        cmp     r4, lr
        bgt     LAXR9
        add     r12, r12, #2
        ldrsh   r4, [r12]
        sub     r5, r1, #0xC
        cmp     r12, r5
        bcs     LAXR18
        cmp     r4, lr
        ble     LAXR8
LAXR9:
        cmp     r1, r12
        subhi   r4, r1, r12
        bls     LAXR13
LAXR10:
        cmp     r4, #0xC
        bcc     LAXR12
        add     r4, r12, #0xC
LAXR11:
        ldrsh   r5, [r1]
        cmp     r5, lr
        ble     LAXR13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, lr
        ble     LAXR13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, lr
        ble     LAXR13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, lr
        ble     LAXR13
        sub     r1, r1, #2
        ldrsh   r5, [r1]
        cmp     r5, lr
        ble     LAXR13
        sub     r1, r1, #2
        cmp     r1, r4
        bhi     LAXR11
LAXR12:
        ldrsh   r4, [r1]
        cmp     r4, lr
        ble     LAXR13
        sub     r1, r1, #2
        cmp     r1, r12
        bhi     LAXR12
LAXR13:
        cmp     r12, r1
        beq     LAXR14
        ldrsh   r4, [r1]
        ldrsh   r5, [r12]
        strh    r4, [r12]
        strh    r5, [r1]
        b       LAXR7
LAXR14:
        ldrsh   r4, [r12, #-2]!
        cmp     r4, lr
        bne     LAXR16
LAXR15:
        cmp     r12, r0
        bls     LAXR16
        ldrsh   r4, [r12, #-2]!
        cmp     r4, lr
        beq     LAXR15
LAXR16:
        sub     r4, r2, r1
        sub     lr, r12, r0
        mov     r4, r4, asr #1
        cmp     r4, lr, asr #1
        ble     LAXR17
        cmp     r12, r0
        moveq   r0, r1
        beq     LAXR5
        mov     lr, sp
        add     r4, sp, #0x80
        str     r2, [lr, +r3, lsl #2]
        str     r1, [r4, +r3, lsl #2]
        add     r3, r3, #1
        mov     r2, r12
        b       LAXR5
LAXR17:
        cmp     r1, r2
        moveq   r2, r12
        beq     LAXR5
        add     r5, sp, #0x80
        mov     lr, r3
        str     r0, [r5, +r3, lsl #2]
        mov     r4, sp
        add     r3, r3, #1
        str     r12, [r4, +lr, lsl #2]
        mov     r0, r1
        b       LAXR5
LAXR18:
        cmp     r4, lr
        bgt     LAXR9
LAXR19:
        add     r12, r12, #2
        cmp     r1, r12
        bls     LAXR13
        ldrsh   r4, [r12]
        cmp     r4, lr
        ble     LAXR19
        sub     r4, r1, r12
        b       LAXR10
LAXR20:
        ldrsh   r5, [r12]
        cmp     r5, lr
        ble     LAXR19
        b       LAXR10
LAXR21:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXR22:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXR23:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}


