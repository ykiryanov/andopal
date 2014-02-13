        .text
        .align  4
        .globl  _ippsSortDescend_32s_I


_ippsSortDescend_32s_I:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #1, 24
        cmp     r0, #0
        beq     LAXI22
        cmp     r1, #0
        ble     LAXI21
        cmp     r1, #2
        blt     LAXI23
        add     r2, r0, r1, lsl #2
        sub     r2, r2, #4
        mov     r3, #1
LAXI0:
        cmp     r1, #9
        bgt     LAXI6
        cmp     r2, r0
        bls     LAXI4
        add     r12, r0, #4
LAXI1:
        cmp     r12, r2
        mov     lr, r12
        mov     r1, r0
        bhi     LAXI3
LAXI2:
        ldr     r5, [lr]
        ldr     r4, [r1]
        cmp     r5, r4
        movlt   r1, lr
        add     lr, lr, #4
        cmp     lr, r2
        bls     LAXI2
LAXI3:
        ldr     lr, [r2]
        ldr     r4, [r1]
        str     lr, [r1]
        str     r4, [r2], #-4
        cmp     r2, r0
        bhi     LAXI1
LAXI4:
        add     r0, sp, #0x80
        sub     r3, r3, #1
        mov     r1, sp
        ldr     r2, [r1, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
LAXI5:
        sub     r1, r2, r0
        cmp     r3, #0
        mov     r1, r1, asr #2
        add     r1, r1, #1
        bne     LAXI0
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXI6:
        ldr     r4, [r2]
        ldr     r5, [r2, #-4]
        mov     r12, r1, asr #1
        mov     r1, r4
        add     lr, r0, #4
        cmp     r5, r4
        movgt   r4, r5
        movlt   r1, r5
        str     r4, [r2]
        str     r1, [r2, #-4]
        ldr     r6, [r0]
        ldr     r7, [r0, +r12, lsl #2]
        mov     r1, r2
        mov     r5, r6
        cmp     r7, r6
        movgt   r5, r7
        movlt   r6, r7
        cmp     r4, r5
        mov     r7, r5
        movgt   r7, r4
        str     r7, [r0]
        ldr     r4, [r2]
        cmp     r4, r5
        movlt   r5, r4
        cmp     r6, r5
        mov     r4, r5
        movgt   r4, r6
        str     r4, [r0, +r12, lsl #2]
        movlt   r5, r6
        str     r5, [r2]
        ldr     r12, [r0, +r12, lsl #2]
LAXI7:
        cmp     r1, lr
        bls     LAXI13
        sub     r4, r1, lr
        cmp     r4, #0x18
        bcc     LAXI20
        ldr     r5, [lr]
        cmp     r5, r12
        blt     LAXI10
LAXI8:
        add     lr, lr, #4
        ldr     r4, [lr]
        cmp     r4, r12
        blt     LAXI9
        add     lr, lr, #4
        ldr     r4, [lr]
        cmp     r4, r12
        blt     LAXI9
        add     lr, lr, #4
        ldr     r4, [lr]
        cmp     r4, r12
        blt     LAXI9
        add     lr, lr, #4
        ldr     r4, [lr]
        cmp     r4, r12
        blt     LAXI9
        add     lr, lr, #4
        ldr     r4, [lr]
        sub     r5, r1, #0x18
        cmp     lr, r5
        bcs     LAXI18
        cmp     r4, r12
        bge     LAXI8
LAXI9:
        cmp     r1, lr
        subhi   r4, r1, lr
        bls     LAXI13
LAXI10:
        cmp     r4, #0x18
        bcc     LAXI12
        add     r4, lr, #0x18
LAXI11:
        ldr     r5, [r1]
        cmp     r5, r12
        bge     LAXI13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, r12
        bge     LAXI13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, r12
        bge     LAXI13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, r12
        bge     LAXI13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, r12
        bge     LAXI13
        sub     r1, r1, #4
        cmp     r1, r4
        bhi     LAXI11
LAXI12:
        ldr     r4, [r1]
        cmp     r4, r12
        bge     LAXI13
        sub     r1, r1, #4
        cmp     r1, lr
        bhi     LAXI12
LAXI13:
        cmp     lr, r1
        beq     LAXI14
        ldr     r4, [r1]
        ldr     r5, [lr]
        str     r4, [lr]
        str     r5, [r1]
        b       LAXI7
LAXI14:
        ldr     r4, [lr, #-4]!
        cmp     r4, r12
        bne     LAXI16
LAXI15:
        cmp     lr, r0
        bls     LAXI16
        ldr     r4, [lr, #-4]!
        cmp     r4, r12
        beq     LAXI15
LAXI16:
        sub     r4, r2, r1
        sub     r12, lr, r0
        mov     r4, r4, asr #2
        cmp     r4, r12, asr #2
        ble     LAXI17
        cmp     lr, r0
        moveq   r0, r1
        beq     LAXI5
        mov     r12, sp
        add     r4, sp, #0x80
        str     r2, [r12, +r3, lsl #2]
        str     r1, [r4, +r3, lsl #2]
        add     r3, r3, #1
        mov     r2, lr
        b       LAXI5
LAXI17:
        cmp     r1, r2
        moveq   r2, lr
        beq     LAXI5
        add     r5, sp, #0x80
        mov     r12, r3
        str     r0, [r5, +r3, lsl #2]
        mov     r4, sp
        add     r3, r3, #1
        str     lr, [r4, +r12, lsl #2]
        mov     r0, r1
        b       LAXI5
LAXI18:
        cmp     r4, r12
        blt     LAXI9
LAXI19:
        add     lr, lr, #4
        cmp     r1, lr
        bls     LAXI13
        ldr     r4, [lr]
        cmp     r4, r12
        bge     LAXI19
        sub     r4, r1, lr
        b       LAXI10
LAXI20:
        ldr     r5, [lr]
        cmp     r5, r12
        bge     LAXI19
        b       LAXI10
LAXI21:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXI22:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}
LAXI23:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r7, pc}


