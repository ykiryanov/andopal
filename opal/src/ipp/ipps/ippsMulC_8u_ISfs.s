        .text
        .align  4
        .globl  _ippsMulC_8u_ISfs


_ippsMulC_8u_ISfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x1C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldrb    r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDR12
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0x10
        bgt     LBDR12
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDR0
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDR0:
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bgt     LBDR1
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDR1:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDR2
        ldrb    r0, [r11, #-0x1C]
        cmp     r0, #1
        bne     LBDR2
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDR2:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bne     LBDR4
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDR11
LBDR3:
        ldrb    r0, [r11, #-0x1C]
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
        blt     LBDR3
        b       LBDR11
LBDR4:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        ble     LBDR6
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
        bge     LBDR11
LBDR5:
        ldrb    r0, [r11, #-0x1C]
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
        blt     LBDR5
        b       LBDR11
LBDR6:
        ldr     r0, [r11, #-0x10]
        cmn     r0, #7
        bge     LBDR9
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDR11
LBDR7:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x28]
        ldrb    r1, [r0, +r1]
        cmp     r1, #0
        movne   r0, #0xFF
        bne     LBDR8
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
LBDR8:
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        blt     LBDR7
        b       LBDR11
LBDR9:
        ldr     r1, [r11, #-0x10]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11, #-0x10]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x14]
        cmp     r0, r1
        bge     LBDR11
LBDR10:
        ldrb    r0, [r11, #-0x1C]
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
        blt     LBDR10
LBDR11:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDR12:
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        bl      _ippsZero_8u
        ldmdb   r11, {r11, sp, pc}


