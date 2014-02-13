        .text
        .align  4
        .globl  _ippsMul_8u_Sfs


_ippsMul_8u_Sfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x1C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11]
        cmp     r0, #0x10
        ble     LBCZ2
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBCZ0
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBCZ1
LBCZ0:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBCZ1:
        ldr     r1, [r11, #-0x10]
        ldr     r0, [r11, #-0x14]
        bl      _ippsZero_8u
        ldmdb   r11, {r11, sp, pc}
LBCZ2:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBCZ3
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBCZ3
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBCZ4
LBCZ3:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBCZ4:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBCZ5
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBCZ5:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBCZ7
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBCZ14
LBCZ6:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x1C]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        cmp     r0, r1
        movcc   r1, r0
        and     r0, r1, #0xFF
        ldr     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBCZ6
        b       LBCZ14
LBCZ7:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBCZ9
        ldr     r0, [r11]
        sub     r0, r0, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        sub     r0, r0, #1
        str     r0, [r11, #-0x20]
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBCZ14
LBCZ8:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x1C]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x20]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11]
        mov     r2, r1, lsr r2
        and     r1, r2, #1
        add     r1, r0, r1
        ldr     r0, [r11]
        mov     r1, r1, lsr r0
        str     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        cmp     r0, r1
        movcc   r1, r0
        and     r0, r1, #0xFF
        ldr     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBCZ8
        b       LBCZ14
LBCZ9:
        ldr     r0, [r11]
        cmn     r0, #7
        bge     LBCZ12
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBCZ11
LBCZ10:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x1C]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x24]
        movne   r0, #0xFF
        and     r0, r0, #0xFF
        ldr     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBCZ10
LBCZ11:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBCZ12:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBCZ14
LBCZ13:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x1C]
        ldr     r1, [r11, #-0x28]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        ldr     r1, [r11]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        cmp     r0, r1
        movcc   r1, r0
        and     r0, r1, #0xFF
        ldr     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBCZ13
LBCZ14:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


