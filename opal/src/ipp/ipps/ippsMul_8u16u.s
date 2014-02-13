        .text
        .align  4
        .globl  _ippsMul_8u16u


_ippsMul_8u16u:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x14
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDB0
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBDB0
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBDB1
LBDB0:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDB1:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBDB2
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDB2:
        mov     r0, #0
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDB4
LBDB3:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x20]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x1C]
        ldr     r1, [r11, #-0x20]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x20]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x20]
        add     r0, r0, #1
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDB3
LBDB4:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


