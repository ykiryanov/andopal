        .text
        .align  4
        .globl  _ippsMulC_16s_Sfs


_ippsMulC_16s_Sfs:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x20
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDY0
        ldrsh   r0, [r11, #-0x18]
        cmp     r0, #1
        bne     LBDY0
        ldr     r2, [r11, #-0x10]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x1C]
        bl      _ippsCopy_16s
        ldmdb   r11, {r11, sp, pc}
LBDY0:
        ldrsh   r0, [r11, #-0x18]
        cmp     r0, #0
        beq     LBDY13
        ldr     r0, [r11]
        cmp     r0, #0x1E
        bgt     LBDY13
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        beq     LBDY1
        ldr     r0, [r11, #-0x14]
        cmp     r0, #0
        bne     LBDY2
LBDY1:
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDY2:
        ldr     r0, [r11, #-0x10]
        cmp     r0, #0
        bgt     LBDY3
        mvn     r0, #5
        ldmdb   r11, {r11, sp, pc}
LBDY3:
        ldr     r0, [r11]
        cmn     r0, #0xF
        bge     LBDY6
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDY5
LBDY4:
        ldrsh   r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        movgt   r0, #0xFF
        orrgt   r0, r0, #0x7F, 24
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        ldreq   r0, [r11, #-0x28]
        ldrne   r0, [r11, #-0x24]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDY4
LBDY5:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDY6:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDY8
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDY12
LBDY7:
        ldrsh   r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDY7
        b       LBDY12
LBDY8:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDY10
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
        bge     LBDY12
LBDY9:
        ldrsh   r0, [r11, #-0x18]
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
        mov     r1, r1, asr r0
        str     r1, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        cmp     r0, r1
        movgt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDY9
        b       LBDY12
LBDY10:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        bge     LBDY12
LBDY11:
        ldrsh   r0, [r11, #-0x18]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r1, r0
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11]
        mov     r0, r0, lsl r1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        cmn     r0, #2, 18
        mvnle   r0, #0xFF
        bicle   r0, r0, #0x7F, 24
        ldrgt   r0, [r11, #-0x28]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        cmp     r0, r1
        movlt   r1, r0
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x10]
        cmp     r0, r1
        blt     LBDY11
LBDY12:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LBDY13:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bne     LBDY14
        mvn     r0, #7
        ldmdb   r11, {r11, sp, pc}
LBDY14:
        ldr     r1, [r11, #-0x10]
        ldr     r0, [r11, #-0x14]
        bl      _ippsZero_16s
        ldmdb   r11, {r11, sp, pc}


