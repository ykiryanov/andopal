        .text
        .align  4
        .globl  _ippsMul_8u_ISfs


_ippsMul_8u_ISfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x1C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0x10
        ble     LBDA1
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bne     LBDA0
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDA0:
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        bl      _ippsZero_8u
        ldmdb   r11, {r11, sp, pc}
LBDA1:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDA2
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDA3
LBDA2:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDA3:
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bgt     LBDA4
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDA4:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDA6
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDA12
LBDA5:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        cmp     r0, r1
        movcc   r1, r0
        and     r0, r1, #0xFF
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDA5
        b       LBDA12
LBDA6:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        ble     LBDA8
        ldr     r0, [r11, #-0x10]
        sub     r0, r0, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        sub     r0, r0, #1
        str     r0, [r11, #-0x20]
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDA12
LBDA7:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x20]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x10]
        mov     r2, r1, lsr r2
        and     r1, r2, #1
        add     r1, r0, r1
        ldr     r0, [r11, #-0x10]
        mov     r1, r1, lsr r0
        str     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        cmp     r0, r1
        movcc   r1, r0
        and     r0, r1, #0xFF
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDA7
        b       LBDA12
LBDA8:
        ldr     r0, [r11, #-0x10]
        cmn     r0, #7
        bge     LBDA10
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDA12
LBDA9:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x24]
        movne   r0, #0xFF
        and     r0, r0, #0xFF
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDA9
        b       LBDA12
LBDA10:
        ldr     r1, [r11, #-0x10]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11, #-0x10]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDA12
LBDA11:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        ldr     r1, [r11, #-0x10]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        cmp     r0, r1
        movcc   r1, r0
        and     r0, r1, #0xFF
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDA11
LBDA12:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


