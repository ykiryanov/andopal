        .text
        .align  4
        .globl  _ippsMulC_16sc_ISfs


_ippsMulC_16sc_ISfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x28
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0x1E
        ble     LBDX0
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        bl      _ippsZero_16sc
        ldmdb   r11, {r11, sp, pc}
LBDX0:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDX1
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDX1:
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bgt     LBDX2
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDX2:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDX3
        ldrsh   r0, [r11, #-0x1C]
        cmp     r0, #0
        bne     LBDX3
        ldrsh   r0, [r11, #-0x1A]
        cmp     r0, #0
        bne     LBDX3
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDX3:
        ldr     r0, [r11, #-0x10]
        cmn     r0, #0xF
        bge     LBDX8
        ldrsh   r0, [r11, #-0x1A]
        cmn     r0, #2, 18
        beq     LBDX5
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX7
LBDX4:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        cmp     r0, #0
        ldrle   r0, [r11, #-0x30]
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        ldrle   r0, [r11, #-0x2C]
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        cmp     r0, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x30]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x30]
        ldrne   r0, [r11, #-0x28]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x2C]
        ldrne   r0, [r11, #-0x24]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX4
        b       LBDX7
LBDX5:
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX7
LBDX6:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        ldrne   r0, [r11, #-0x2C]
        mvneq   r0, #2, 2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        cmp     r0, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x30]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x30]
        ldrne   r0, [r11, #-0x28]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x2C]
        ldrne   r0, [r11, #-0x24]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX6
LBDX7:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDX8:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDX12
        ldrsh   r0, [r11, #-0x1A]
        cmn     r0, #2, 18
        beq     LBDX10
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX20
LBDX9:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        cmp     r1, r0
        mov     r2, r0
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        strh    r1, [r2, +r3]
        ldr     r1, [r11, #-0x2C]
        cmp     r1, r0
        movgt   r0, r1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX9
        b       LBDX20
LBDX10:
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX20
LBDX11:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        ldrne   r0, [r11, #-0x2C]
        mvneq   r0, #2, 2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        cmp     r1, r0
        mov     r2, r0
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        strh    r1, [r2, +r3]
        ldr     r1, [r11, #-0x2C]
        cmp     r1, r0
        movgt   r0, r1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX11
        b       LBDX20
LBDX12:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        ble     LBDX16
        ldr     r0, [r11, #-0x10]
        sub     r0, r0, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        sub     r0, r0, #1
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x10]
        sub     r0, r0, #1
        str     r0, [r11, #-0x10]
        ldrsh   r0, [r11, #-0x1A]
        cmn     r0, #2, 18
        beq     LBDX14
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX20
LBDX13:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r0, r0, asr #1
        ldr     r1, [r11, #-0x30]
        and     r1, r1, #1
        ldr     r2, [r11, #-0x20]
        add     r1, r1, r2
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, asr #1
        ldr     r3, [r11, #-0x10]
        mov     r3, r2, asr r3
        and     r2, r3, #1
        add     r2, r1, r2
        mov     r1, r2, asr #1
        add     r1, r0, r1
        ldr     r0, [r11, #-0x10]
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r0, r0, asr #1
        ldr     r1, [r11, #-0x2C]
        and     r1, r1, #1
        ldr     r2, [r11, #-0x20]
        add     r1, r1, r2
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, asr #1
        ldr     r3, [r11, #-0x10]
        mov     r3, r2, asr r3
        and     r2, r3, #1
        add     r2, r1, r2
        mov     r1, r2, asr #1
        add     r1, r0, r1
        ldr     r0, [r11, #-0x10]
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        cmp     r1, r0
        mov     r2, r0
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        strh    r1, [r2, +r3]
        ldr     r1, [r11, #-0x2C]
        cmp     r1, r0
        movgt   r0, r1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX13
        b       LBDX20
LBDX14:
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX20
LBDX15:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        ldrne   r0, [r11, #-0x2C]
        mvneq   r0, #2, 2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r0, r0, asr #1
        ldr     r1, [r11, #-0x30]
        and     r1, r1, #1
        ldr     r2, [r11, #-0x20]
        add     r1, r1, r2
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, asr #1
        ldr     r3, [r11, #-0x10]
        mov     r3, r2, asr r3
        and     r2, r3, #1
        add     r2, r1, r2
        mov     r1, r2, asr #1
        add     r1, r0, r1
        ldr     r0, [r11, #-0x10]
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r0, r0, asr #1
        ldr     r1, [r11, #-0x2C]
        and     r1, r1, #1
        ldr     r2, [r11, #-0x20]
        add     r1, r1, r2
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, asr #1
        ldr     r3, [r11, #-0x10]
        mov     r3, r2, asr r3
        and     r2, r3, #1
        add     r2, r1, r2
        mov     r1, r2, asr #1
        add     r1, r0, r1
        ldr     r0, [r11, #-0x10]
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        cmp     r1, r0
        mov     r2, r0
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        strh    r1, [r2, +r3]
        ldr     r1, [r11, #-0x2C]
        cmp     r1, r0
        movgt   r0, r1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX15
        b       LBDX20
LBDX16:
        ldr     r0, [r11, #-0x10]
        mov     r1, #0
        sub     r0, r1, r0
        str     r0, [r11, #-0x10]
        ldrsh   r0, [r11, #-0x1A]
        cmn     r0, #2, 18
        beq     LBDX18
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX20
LBDX17:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x10]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        cmp     r1, r0
        mov     r2, r0
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        strh    r1, [r2, +r3]
        ldr     r1, [r11, #-0x2C]
        cmp     r1, r0
        movgt   r0, r1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX17
        b       LBDX20
LBDX18:
        mov     r0, #0
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDX20
LBDX19:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1A]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        mov     r2, #0
        sub     r2, r2, r1
        add     r2, r0, r2
        str     r2, [r11, #-0x30]
        ldrsh   r0, [r11, #-0x1A]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldrsh   r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        add     r3, r2, r3
        ldrsh   r2, [r3, #2]
        mul     r1, r2, r1
        add     r1, r0, r1
        str     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        ldrne   r0, [r11, #-0x2C]
        mvneq   r0, #2, 2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x10]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x30]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x2C]
        str     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        cmp     r1, r0
        mov     r2, r0
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x34]
        mov     r3, r3, lsl #2
        strh    r1, [r2, +r3]
        ldr     r1, [r11, #-0x2C]
        cmp     r1, r0
        movgt   r0, r1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x34]
        mov     r2, r2, lsl #2
        add     r2, r1, r2
        strh    r0, [r2, #2]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #1
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDX19
LBDX20:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


