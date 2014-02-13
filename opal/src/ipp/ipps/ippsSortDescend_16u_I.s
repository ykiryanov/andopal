        .text
        .align  4
        .globl  _ippsSortDescend_16u_I


_ippsSortDescend_16u_I:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #1, 24
        cmp     r0, #0
        beq     LAXK22
        cmp     r1, #0
        ble     LAXK21
        cmp     r1, #2
        blt     LAXK23
        add     r2, r0, r1, lsl #1
        sub     r2, r2, #2
        mov     r3, #1
LAXK0:
        cmp     r1, #9
        bgt     LAXK6
        cmp     r2, r0
        bls     LAXK4
        add     r12, r0, #2
LAXK1:
        cmp     r12, r2
        mov     lr, r12
        mov     r1, r0
        bhi     LAXK3
LAXK2:
        ldrh    r5, [lr]
        ldrh    r4, [r1]
        cmp     r5, r4
        movlt   r1, lr
        add     lr, lr, #2
        cmp     lr, r2
        bls     LAXK2
LAXK3:
        ldrsh   lr, [r2]
        ldrsh   r4, [r1]
        strh    lr, [r1]
        strh    r4, [r2], #-2
        cmp     r2, r0
        bhi     LAXK1
LAXK4:
        add     r0, sp, #0x80
        sub     r3, r3, #1
        mov     r1, sp
        ldr     r2, [r1, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
LAXK5:
        sub     r1, r2, r0
        cmp     r3, #0
        mov     r1, r1, asr #1
        add     r1, r1, #1
        bne     LAXK0
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXK6:
        ldrh    r4, [r2]
        ldrh    r5, [r2, #-2]
        bic     r12, r1, #1
        mov     r1, r4
        add     lr, r0, #2
        cmp     r5, r4
        movgt   r4, r5
        movlt   r1, r5
        strh    r4, [r2]
        strh    r1, [r2, #-2]
        ldrh    r6, [r0]
        ldrh    r7, [r0, +r12]
        mov     r1, r2
        mov     r5, r6
        cmp     r7, r6
        movgt   r5, r7
        movlt   r6, r7
        cmp     r4, r5
        mov     r7, r5
        movgt   r7, r4
        strh    r7, [r0]
        ldrh    r4, [r2]
        cmp     r4, r5
        movlt   r5, r4
        cmp     r6, r5
        mov     r4, r5
        movgt   r4, r6
        strh    r4, [r0, +r12]
        movlt   r5, r6
        strh    r5, [r2]
        ldrh    r12, [r0, +r12]
LAXK7:
        cmp     r1, lr
        bls     LAXK13
        sub     r4, r1, lr
        cmp     r4, #0xC
        bcc     LAXK20
        ldrh    r5, [lr]
        cmp     r5, r12
        blt     LAXK10
LAXK8:
        add     lr, lr, #2
        ldrh    r4, [lr]
        cmp     r4, r12
        blt     LAXK9
        add     lr, lr, #2
        ldrh    r4, [lr]
        cmp     r4, r12
        blt     LAXK9
        add     lr, lr, #2
        ldrh    r4, [lr]
        cmp     r4, r12
        blt     LAXK9
        add     lr, lr, #2
        ldrh    r4, [lr]
        cmp     r4, r12
        blt     LAXK9
        add     lr, lr, #2
        ldrh    r4, [lr]
        sub     r5, r1, #0xC
        cmp     lr, r5
        bcs     LAXK18
        cmp     r4, r12
        bge     LAXK8
LAXK9:
        cmp     r1, lr
        subhi   r4, r1, lr
        bls     LAXK13
LAXK10:
        cmp     r4, #0xC
        bcc     LAXK12
        add     r4, lr, #0xC
LAXK11:
        ldrh    r5, [r1]
        cmp     r5, r12
        bge     LAXK13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, r12
        bge     LAXK13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, r12
        bge     LAXK13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, r12
        bge     LAXK13
        sub     r1, r1, #2
        ldrh    r5, [r1]
        cmp     r5, r12
        bge     LAXK13
        sub     r1, r1, #2
        cmp     r1, r4
        bhi     LAXK11
LAXK12:
        ldrh    r4, [r1]
        cmp     r4, r12
        bge     LAXK13
        sub     r1, r1, #2
        cmp     r1, lr
        bhi     LAXK12
LAXK13:
        cmp     lr, r1
        beq     LAXK14
        ldrsh   r4, [r1]
        ldrsh   r5, [lr]
        strh    r4, [lr]
        strh    r5, [r1]
        b       LAXK7
LAXK14:
        ldrh    r4, [lr, #-2]!
        cmp     r4, r12
        bne     LAXK16
LAXK15:
        cmp     lr, r0
        bls     LAXK16
        ldrh    r4, [lr, #-2]!
        cmp     r4, r12
        beq     LAXK15
LAXK16:
        sub     r4, r2, r1
        sub     r12, lr, r0
        mov     r4, r4, asr #1
        cmp     r4, r12, asr #1
        ble     LAXK17
        cmp     lr, r0
        moveq   r0, r1
        beq     LAXK5
        mov     r12, sp
        add     r4, sp, #0x80
        str     r2, [r12, +r3, lsl #2]
        str     r1, [r4, +r3, lsl #2]
        add     r3, r3, #1
        mov     r2, lr
        b       LAXK5
LAXK17:
        cmp     r1, r2
        moveq   r2, lr
        beq     LAXK5
        add     r5, sp, #0x80
        mov     r12, r3
        str     r0, [r5, +r3, lsl #2]
        mov     r4, sp
        add     r3, r3, #1
        str     lr, [r4, +r12, lsl #2]
        mov     r0, r1
        b       LAXK5
LAXK18:
        cmp     r4, r12
        blt     LAXK9
LAXK19:
        add     lr, lr, #2
        cmp     r1, lr
        bls     LAXK13
        ldrh    r4, [lr]
        cmp     r4, r12
        bge     LAXK19
        sub     r4, r1, lr
        b       LAXK10
LAXK20:
        ldrh    r5, [lr]
        cmp     r5, r12
        bge     LAXK19
        b       LAXK10
LAXK21:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXK22:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXK23:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}


