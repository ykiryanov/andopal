        .text
        .align  4
        .globl  fdim


fdim:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x18
        str     r0, [sp, #8]
        str     r2, [sp, #0x10]
        mvn     r12, #0
        str     r1, [sp, #0xC]
        add     r6, r12, #2, 22
        str     r3, [sp, #0x14]
        and     r4, r6, r1, lsr #20
        sub     lr, r4, r6
        and     r5, r6, r3, lsr #20
        sub     r6, r5, r6
        tst     lr, r6
        mov     lr, #0xFF
        orr     lr, lr, #7, 24
        bmi     LACX1
        rsb     r12, r0, #0
        orr     r4, r0, r12
        rsb     r12, r2, #0
        orr     r5, r2, r12
        orr     r4, r1, r4, lsr #31
        orr     r5, r3, r5, lsr #31
        mov     r12, r4, lsl #1
        cmn     r12, #2, 12
        orrhi   r1, r1, #2, 14
        bhi     LACX0
        mov     r0, r5, lsl #1
        cmn     r0, #2, 12
        orrhi   r1, r3, #2, 14
        movhi   r0, r2
        bhi     LACX0
        mov     r4, r4, asr #31
        mov     r5, r5, asr #31
        eor     r12, r4, r12, lsr #1
        eor     r0, r5, r0, lsr #1
        cmp     r12, r0
        movle   r1, #0
        movgt   r1, lr, lsl #20
        mov     r0, #0
LACX0:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r9, pc}
LACX1:
        subs    r6, r0, r2
        bic     r7, r1, #2, 2
        bic     r6, r3, #2, 2
        sbc     r7, r7, r6
        eor     r8, r1, r7
        eor     r6, r1, r3
        orr     r8, r8, r6
        mvn     r8, r8
        bic     r9, r3, r1
        orr     r8, r9, r8
        tst     r8, #2, 2
        moveq   r0, #0
        moveq   r1, r0
        beq     LACX0
        tst     r7, #2, 2
        moveq   r9, r1
        moveq   r8, r0
        beq     LACX2
        mov     r7, r4
        mov     r9, r3
        mov     r3, r1
        mov     r8, r2
        mov     r2, r0
        mov     r4, r5
        mov     r5, r7
LACX2:
        mov     r9, r9, lsl #11
        mov     r3, r3, lsl #11
        orr     r9, r9, #2, 2
        orr     r3, r3, #2, 2
        orr     r0, r9, r8, lsr #21
        orr     r7, r3, r2, lsr #21
        cmp     r4, #0
        mov     r2, r2, lsl #11
        mvn     r9, #0x1F
        mov     r1, r8, lsl #11
        bne     LACX4
        mov     r1, r1, lsr #31
        orrs    r0, r1, r0, lsl #1
        mov     r1, r8, lsl #12
        bne     LACX3
        cmp     r1, #0
        beq     LACX4
        clz     r3, r1
        mov     r0, r1, lsl r3
        rsb     r4, r3, r9
        mov     r1, #0
        b       LACX4
LACX3:
        clz     r3, r0
        rsb     r4, r3, #0x1F
        mov     r4, r1, lsr r4
        mov     r1, r1, lsl r3
        mov     r4, r4, lsr #1
        orr     r0, r4, r0, lsl r3
        rsb     r4, r3, #0
LACX4:
        cmp     r5, #0
        mov     r3, #0
        bne     LACX6
        mov     r8, r2, lsr #31
        orrs    r7, r8, r7, lsl #1
        mov     r2, r2, lsl #1
        bne     LACX5
        cmp     r2, #0
        bne     LACX14
        b       LACX6
LACX5:
        clz     r5, r7
        rsb     r8, r5, #0x1F
        mov     r8, r2, lsr r8
        mov     r2, r2, lsl r5
        mov     r8, r8, lsr #1
        orr     r7, r8, r7, lsl r5
        rsb     r5, r5, #0
LACX6:
        sub     r5, r4, r5
        sub     r8, r5, #0x37
        cmp     r5, #0x20
        and     r7, r7, r8, asr #31
        and     r8, r2, r8, asr #31
        mov     r2, r7, lsl #31
        orr     r2, r2, r8, lsr #1
        mov     r8, r0, lsl #31
        mov     r7, r7, lsr #1
        orr     r1, r8, r1, lsr #1
        mov     r0, r0, lsr #1
        bge     LACX7
        rsb     r8, r5, #0x1F
        mov     r8, r7, lsl r8
        mov     r7, r7, lsr r5
        mov     r8, r8, lsl #1
        orr     r8, r8, r2, lsr r5
        bic     r5, r2, r12, lsl r5
        rsb     r2, r5, #0
        orr     r2, r8, r2, lsr #31
        b       LACX8
LACX7:
        sub     r5, r5, #0x20
        bic     r8, r7, r12, lsl r5
        orr     r2, r2, r8
        mov     r5, r7, lsr r5
        rsb     r7, r2, #0
        orr     r2, r2, r7
        mov     r7, #0
        orr     r2, r5, r2, lsr #31
LACX8:
        cmp     r6, #0
        blt     LACX18
        subs    r1, r1, r2
        sbc     r0, r0, r7
LACX9:
        cmp     r0, #0
        bne     LACX11
        cmp     r1, #0
        beq     LACX10
        clz     r2, r1
        mov     r0, r1, lsl r2
        add     r2, r2, #0x20
        mov     r1, #0
        b       LACX12
LACX10:
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r9, pc}
LACX11:
        clz     r2, r0
        rsb     r5, r2, #0x1F
        mov     r5, r1, lsr r5
        mov     r1, r1, lsl r2
        mov     r5, r5, lsr #1
        orr     r0, r5, r0, lsl r2
LACX12:
        sub     r4, r4, r2
        mov     r2, r0, lsl #21
        orr     r2, r2, r1, lsr #11
        mov     r1, r1, lsl #21
        and     r5, r2, #1
        orr     r1, r5, r1, lsr #1
        rsb     r1, r1, #1, 2
        mov     r5, r0, lsr #11
        adds    r0, r2, r1, lsr #31
        adc     r1, r5, #0
        cmp     r4, #0
        addgt   r1, r1, r4, lsl #20
        ble     LACX16
LACX13:
        rsbs    lr, lr, r1, lsr #20
        bne     LACX0
        b       LACX15
LACX14:
        clz     r5, r2
        mov     r7, r2, lsl r5
        rsb     r5, r5, r9
        mov     r2, #0
        b       LACX6
LACX15:
        add     r12, r12, #2, 22
        str     r3, [sp]
        mov     r2, sp
        add     r1, sp, #0x10
        add     r0, sp, #8
        mov     r12, r12, lsl #20
        str     r12, [sp, #4]
        mov     r3, #0xC4
        bl      __libm_error_support
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        b       LACX0
LACX16:
        rsb     r4, r4, #0
        cmp     r4, #0x20
        bcs     LACX17
        rsb     r2, r4, #0x1F
        mov     r2, r1, lsl r2
        mov     r1, r1, lsr r4
        mov     r2, r2, lsl #1
        orr     r0, r2, r0, lsr r4
        b       LACX13
LACX17:
        sub     r4, r4, #0x20
        mov     r0, r1, lsr r4
        mov     r1, #0
        b       LACX13
LACX18:
        adds    r1, r1, r2
        adc     r0, r0, r7
        b       LACX9


