        .text
        .align  4
        .globl  _ippsMulC_16s_ISfs


_ippsMulC_16s_ISfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x20
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldrsh   r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDZ12
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0x1E
        bgt     LBDZ12
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDZ0
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDZ0:
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bgt     LBDZ1
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDZ1:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDZ2
        ldrsh   r0, [r11, #-0x1C]
        cmp     r0, #1
        bne     LBDZ2
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDZ2:
        ldr     r0, [r11, #-0x10]
        cmn     r0, #0xF
        bge     LBDZ5
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDZ4
LBDZ3:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x28]
        ldrne   r0, [r11, #-0x24]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDZ3
LBDZ4:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDZ5:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDZ7
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDZ11
LBDZ6:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDZ6
        b       LBDZ11
LBDZ7:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        ble     LBDZ9
        ldr     r0, [r11, #-0x10]
        sub     r0, r0, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        sub     r0, r0, #1
        str     r0, [r11, #-0x20]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDZ11
LBDZ8:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x20]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x10]
        mov     r2, r1, asr r2
        and     r1, r2, #1
        add     r1, r0, r1
        ldr     r0, [r11, #-0x10]
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDZ8
        b       LBDZ11
LBDZ9:
        ldr     r1, [r11, #-0x10]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11, #-0x10]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDZ11
LBDZ10:
        ldrsh   r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r0, r1
        movlt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDZ10
LBDZ11:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDZ12:
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        bl      _ippsZero_16s
        ldmdb   r11, {r11, sp, pc}


