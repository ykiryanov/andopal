        .text
        .align  4
        .globl  ippiBiDirWeightBlockImplicit_H264_8u_P3P1R


ippiBiDirWeightBlockImplicit_H264_8u_P3P1R:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x1C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LKXC0
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LKXC0
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LKXC1
LKXC0:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LKXC1:
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #0x14]
        cmp     r0, r1
        bge     LKXC5
LKXC2:
        mov     r0, #0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #0x10]
        cmp     r0, r1
        bge     LKXC4
LKXC3:
        ldr     r0, [r11, #8]
        ldr     r2, [r11, #-0x1C]
        ldr     r1, [r11, #-0x24]
        ldrb    r2, [r1, +r2]
        mul     r0, r2, r0
        ldr     r1, [r11, #0xC]
        ldr     r3, [r11, #-0x18]
        ldr     r2, [r11, #-0x24]
        ldrb    r3, [r2, +r3]
        mul     r1, r3, r1
        add     r1, r0, r1
        add     r0, r1, #0x20
        mov     r0, r0, asr #6
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        cmp     r0, #0xFF
        movgt   r0, #0xFF
        strgt   r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        cmp     r0, #0
        movlt   r0, #0
        strlt   r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        and     r0, r0, #0xFF
        ldr     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x24]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x24]
        add     r0, r0, #1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #0x10]
        cmp     r0, r1
        blt     LKXC3
LKXC4:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x10]
        add     r0, r0, r1
        str     r0, [r11, #-0x1C]
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11]
        add     r0, r0, r1
        str     r0, [r11, #-0x18]
        ldr     r0, [r11, #-0x14]
        ldr     r1, [r11, #4]
        add     r0, r0, r1
        str     r0, [r11, #-0x14]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #0x14]
        cmp     r0, r1
        blt     LKXC2
LKXC5:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


