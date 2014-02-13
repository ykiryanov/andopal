        .text
        .align  4
        .globl  _ippsMul_16u16s_Sfs


_ippsMul_16u16s_Sfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x1C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11]
        cmp     r0, #0x1F
        ble     LBDI2
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDI0
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDI1
LBDI0:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDI1:
        ldr     r1, [r11, #-0x10]
        ldr     r0, [r11, #-0x14]
        bl      _ippsZero_16s
        ldmdb   r11, {r11, sp, pc}
LBDI2:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDI3
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBDI3
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBDI4
LBDI3:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDI4:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBDI5
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDI5:
        ldr     r0, [r11]
        cmn     r0, #0xE
        bge     LBDI11
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDI10
LBDI6:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        ldrh    r1, [r0, +r1]
        cmp     r1, #0
        beq     LBDI8
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        cmp     r1, #0
        moveq   r0, #0
        beq     LBDI7
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        cmp     r1, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
LBDI7:
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        b       LBDI9
LBDI8:
        ldr     r0, [r11, #-0x14]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        mov     r2, #0
        strh    r2, [r0, +r1]
LBDI9:
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDI6
LBDI10:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDI11:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDI13
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDI17
LBDI12:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        ldrh    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x24]
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDI12
        b       LBDI17
LBDI13:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDI15
        ldr     r0, [r11]
        sub     r0, r0, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        sub     r0, r0, #1
        str     r0, [r11, #-0x20]
        ldr     r0, [r11]
        sub     r0, r0, #1
        str     r0, [r11]
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDI17
LBDI14:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        ldrh    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r0, r0, asr #1
        ldr     r1, [r11, #-0x24]
        and     r1, r1, #1
        ldr     r2, [r11, #-0x20]
        add     r1, r1, r2
        ldr     r2, [r11, #-0x24]
        mov     r2, r2, asr #1
        ldr     r3, [r11]
        mov     r3, r2, asr r3
        and     r2, r3, #1
        add     r2, r1, r2
        mov     r1, r2, asr #1
        add     r1, r0, r1
        ldr     r0, [r11]
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x24]
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDI14
        b       LBDI17
LBDI15:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDI17
LBDI16:
        ldr     r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x28]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        ldrh    r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x24]
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x24]
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x24]
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r0, r1
        movlt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x28]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDI16
LBDI17:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}


