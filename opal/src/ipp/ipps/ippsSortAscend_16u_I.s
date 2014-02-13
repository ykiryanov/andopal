        .text
        .align  4
        .globl  _ippsSortAscend_16u_I


_ippsSortAscend_16u_I:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #1, 24
        cmp     r0, #0
        beq     LAXQ22
        cmp     r1, #0
        ble     LAXQ21
        cmp     r1, #2
        blt     LAXQ23
        add     r2, r0, r1, lsl #1
        sub     r2, r2, #2
        mov     r3, #1
LAXQ0:
        cmp     r1, #9
        bgt     LAXQ6
        cmp     r2, r0
        bls     LAXQ4
        add     r12, r0, #2
LAXQ1:
        cmp     r12, r2
        mov     lr, r12
        mov     r1, r0
        bhi     LAXQ3
LAXQ2:
        ldrh    r5, [lr]
        ldrh    r4, [r1]
        cmp     r5, r4
        movgt   r1, lr
        add     lr, lr, #2
        cmp     lr, r2
        bls     LAXQ2
LAXQ3:
        ldrsh   lr, [r2]
        ldrsh   r4, [r1]
        strh    lr, [r1]
        strh    r4, [r2], #-2
        cmp     r2, r0
        bhi     LAXQ1
LAXQ4:
        add     r0, sp, #0x80
        sub     r3, r3, #1
        mov     r1, sp
        ldr     r2, [r1, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
LAXQ5:
        sub     r1, r2, r0
        cmp     r3, #0
        mov     r1, r1, asr #1
        add     r1, r1, #1
        bne     LAXQ0
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXQ6:
        ldrh    r5, [r0]
        ldrh    r6, [r0, #2]
        bic     lr, r1, #1
        mov     r4, r5
        add     r12, r0, #2
        cmp     r6, r5
        movlt   r5, r6
        movgt   r4, r6
        strh    r5, [r0, #2]
        strh    r4, [r0]
        ldrh    r6, [r0, +lr]
        ldrh    r1, [r2]
        mov     r5, r4
        cmp     r6, r4
        movlt   r5, r6
        movgt   r4, r6
        cmp     r1, r5
        mov     r6, r5
        movlt   r6, r1
        strh    r6, [r0]
        ldrh    r6, [r2]
        mov     r1, r2
        cmp     r6, r5
        movgt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movlt   r6, r5
        strh    r6, [r0, +lr]
        movgt   r4, r5
        strh    r4, [r2]
        ldrh    lr, [r0, +lr]
LAXQ7:
        cmp     r1, r12
        bls     LAXQ13
        sub     r4, r1, r12
        cmp     r4, #0xC
        bcc     LAXQ20
        ldrh    r5, [r12]
        cmp     r5, lr
        bgt     LAXQ10
LAXQ8:
        add     r12, r12, #2
        ldrh    r4, [r12]
        cmp     r4, lr
        bgt     LAXQ9
        add     r12, r12, #2
        ldrh    r4, [r12]
        cmp     r4, lr
        bgt     LAXQ9
        add     r12, r12, #2
        ldrh    r4, [r12]
        cmp     r4, lr
        bgt     LAXQ9
        add     r12, r12, #2
        ldrh    r4, [r12]
        cmp     r4, lr
        bgt     LAXQ9
        add     r12, r12, #2
        ldrh    r4, [r12]
        sub     r5, r1, #0xC
        cmp     r12, r5
        bcs     LAXQ18
        cmp     r4, lr
        ble     LAXQ8
LAXQ9:
        cmp     r1, r12
        subhi   r4, r1, r12
        bls     LAXQ13
LAXQ10:
        cmp     r4, #0xC
        bcc     LAXQ12
        add     r4, r12, #0xC
LAXQ11:
        ldrh    r5, [r1]
        cmp     r5, lr
        ble     LAXQ13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, lr
        ble     LAXQ13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, lr
        ble     LAXQ13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, lr
        ble     LAXQ13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, lr
        ble     LAXQ13
        sub     r1, r1, #2
        cmp     r1, r4
        bhi     LAXQ11
LAXQ12:
        ldrh    r4, [r1]
        cmp     r4, lr
        ble     LAXQ13
        sub     r1, r1, #2
        cmp     r1, r12
        bhi     LAXQ12
LAXQ13:
        cmp     r12, r1
        beq     LAXQ14
        ldrsh   r4, [r1]
        ldrsh   r5, [r12]
        strh    r4, [r12]
        strh    r5, [r1]
        b       LAXQ7
LAXQ14:
        ldrh    r4, [r12, #-2]!
        cmp     r4, lr
        bne     LAXQ16
LAXQ15:
        cmp     r12, r0
        bls     LAXQ16
        ldrh    r4, [r12, #-2]!
        cmp     r4, lr
        beq     LAXQ15
LAXQ16:
        sub     r4, r2, r1
        sub     lr, r12, r0
        mov     r4, r4, asr #1
        cmp     r4, lr, asr #1
        ble     LAXQ17
        cmp     r12, r0
        moveq   r0, r1
        beq     LAXQ5
        mov     lr, sp
        add     r4, sp, #0x80
        str     r2, [lr, +r3, lsl #2]
        str     r1, [r4, +r3, lsl #2]
        add     r3, r3, #1
        mov     r2, r12
        b       LAXQ5
LAXQ17:
        cmp     r1, r2
        moveq   r2, r12
        beq     LAXQ5
        add     r5, sp, #0x80
        mov     lr, r3
        str     r0, [r5, +r3, lsl #2]
        mov     r4, sp
        add     r3, r3, #1
        str     r12, [r4, +lr, lsl #2]
        mov     r0, r1
        b       LAXQ5
LAXQ18:
        cmp     r4, lr
        bgt     LAXQ9
LAXQ19:
        add     r12, r12, #2
        cmp     r1, r12
        bls     LAXQ13
        ldrh    r4, [r12]
        cmp     r4, lr
        ble     LAXQ19
        sub     r4, r1, r12
        b       LAXQ10
LAXQ20:
        ldrh    r5, [r12]
        cmp     r5, lr
        ble     LAXQ19
        b       LAXQ10
LAXQ21:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXQ22:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXQ23:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}


