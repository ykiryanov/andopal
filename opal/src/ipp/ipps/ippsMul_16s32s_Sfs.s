        .text
        .align  4
        .globl  _ippsMul_16s32s_Sfs


_ippsMul_16s32s_Sfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x28
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11]
        cmp     r0, #0x1E
        ble     LBDO2
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDO0
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDO1
LBDO0:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDO1:
        ldr     r1, [r11, #-0x10]
        ldr     r0, [r11, #-0x14]
        bl      _ippsZero_32s
        ldmdb   r11, {r11, sp, pc}
LBDO2:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDO3
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBDO3
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBDO4
LBDO3:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDO4:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBDO5
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDO5:
        ldr     r0, [r11]
        cmp     r0, #0
        bge     LBDO14
        ldr     r0, [r11]
        cmn     r0, #0x1E
        bge     LBDO7
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDO13
LBDO6:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        movle   r0, #2, 2
        mvngt   r0, #2, 2
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x28]
        ldrne   r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDO6
        b       LBDO13
LBDO7:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        ldr     r2, [r11]
        mvn     r1, #2, 2
        mov     r1, r1, asr r2
        str     r1, [r11, #-0x34]
        ldr     r2, [r11]
        mov     r1, #2, 2
        mov     r1, r1, asr r2
        str     r1, [r11, #-0x30]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDO13
LBDO8:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        ble     LBDO10
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x34]
        cmp     r0, r1
        mvngt   r0, #2, 2
        bgt     LBDO9
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11]
        mov     r0, r0, lsl r1
LBDO9:
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        b       LBDO12
LBDO10:
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        cmp     r0, r1
        movlt   r0, #2, 2
        blt     LBDO11
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11]
        mov     r0, r0, lsl r1
LBDO11:
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
LBDO12:
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDO8
LBDO13:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDO14:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDO16
        ldr     r0, [r11]
        sub     r0, r0, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        sub     r0, r0, #1
        str     r0, [r11, #-0x20]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDO18
LBDO15:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x20]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11]
        mov     r2, r1, asr r2
        and     r1, r2, #1
        add     r1, r0, r1
        ldr     r0, [r11]
        mov     r0, r1, asr r0
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDO15
        b       LBDO18
LBDO16:
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDO18
LBDO17:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDO17
LBDO18:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


