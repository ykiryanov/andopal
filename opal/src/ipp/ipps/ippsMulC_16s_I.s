        .text
        .align  4
        .globl  _ippsMulC_16s_I


_ippsMulC_16s_I:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x14
        str     r0, [r11, #-0x18]
        str     r1, [r11, #-0x14]
        str     r2, [r11, #-0x10]
        ldrsh   r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBEA0
        ldr     r1, [r11, #-0x10]
        ldr     r0, [r11, #-0x14]
        bl      _ippsZero_16s
        ldmdb   r11, {r11, sp, pc}
LBEA0:
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBEA1
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBEA1:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBEA2
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBEA2:
        ldrsh   r0, [r11, #-0x18]
        cmp     r0, #1
        bne     LBEA3
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBEA3:
        mov     r0, #0
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBEA5
LBEA4:
        ldrsh   r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x20]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x1C]
        ldr     r0, [r11, #-0x1C]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x1C]
        str     r0, [r11, #-0x1C]
        ldr     r0, [r11, #-0x1C]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
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
        blt     LBEA4
LBEA5:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


