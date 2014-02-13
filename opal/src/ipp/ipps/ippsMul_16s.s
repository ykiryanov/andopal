        .text
        .align  4
        .globl  _ippsMul_16s


_ippsMul_16s:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x18
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDP0
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBDP0
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBDP1
LBDP0:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDP1:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBDP2
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDP2:
        mov     r0, #0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDP4
LBDP3:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x24]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x24]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x20]
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x24]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x24]
        add     r0, r0, #1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDP3
LBDP4:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


