        .text
        .align  4
        .globl  _ippsMulC_8u_Sfs


_ippsMulC_8u_Sfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x1C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDQ0
        ldrb    r0, [r11, #-0x18]
        cmp     r0, #1
        bne     LBDQ0
        ldr     r2, [r11, #-0x10]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x1C]
        bl      _ippsCopy_8u
        ldmdb   r11, {r11, sp, pc}
LBDQ0:
        ldrb    r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBDQ13
        ldr     r0, [r11]
        cmp     r0, #0x10
        bgt     LBDQ13
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDQ1
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBDQ2
LBDQ1:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDQ2:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBDQ3
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDQ3:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDQ5
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDQ12
LBDQ4:
        ldrb    r0, [r11, #-0x18]
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
        blt     LBDQ4
        b       LBDQ12
LBDQ5:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDQ7
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
        bge     LBDQ12
LBDQ6:
        ldrb    r0, [r11, #-0x18]
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
        blt     LBDQ6
        b       LBDQ12
LBDQ7:
        ldr     r0, [r11]
        cmn     r0, #7
        bge     LBDQ10
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDQ12
LBDQ8:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x28]
        ldrb    r1, [r0, +r1]
        cmp     r1, #0
        movne   r0, #0xFF
        bne     LBDQ9
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x28]
        ldrb    r0, [r0, +r1]
LBDQ9:
        ldr     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x28]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDQ8
        b       LBDQ12
LBDQ10:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDQ12
LBDQ11:
        ldrb    r0, [r11, #-0x18]
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
        blt     LBDQ11
LBDQ12:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDQ13:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bne     LBDQ14
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDQ14:
        ldr     r1, [r11, #-0x10]
        ldr     r0, [r11, #-0x14]
        bl      _ippsZero_8u
        ldmdb   r11, {r11, sp, pc}


