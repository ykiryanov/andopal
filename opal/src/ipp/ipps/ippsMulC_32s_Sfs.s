        .text
        .align  4
        .globl  _ippsMulC_32s_Sfs


_ippsMulC_32s_Sfs:
        mov     r12, sp
        stmdb   sp!, {r4, r5, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x28
        str     r0, [r11, #-0x24]
        str     r1, [r11, #-0x20]
        str     r2, [r11, #-0x1C]
        str     r3, [r11, #-0x18]
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDU0
        ldr     r0, [r11, #-0x20]
        cmp     r0, #1
        bne     LBDU0
        ldr     r2, [r11, #-0x18]
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x24]
        bl      _ippsCopy_32s
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDU0:
        ldr     r0, [r11, #-0x20]
        cmp     r0, #0
        beq     LBDU13
        ldr     r0, [r11]
        cmp     r0, #0x3E
        bgt     LBDU13
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        beq     LBDU1
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bne     LBDU2
LBDU1:
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDU2:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bgt     LBDU3
        mvn     r0, #5
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDU3:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDU6
        ldr     r0, [r11]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x3C]
        str     r1, [r11, #-0x38]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        bge     LBDU5
LBDU4:
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x2C]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        ldr     r2, [r11, #-0x34]
        ldr     r0, [r11, #-0x30]
        ldr     r3, [r11, #-0x3C]
        ldr     r1, [r11, #-0x38]
        adds    r5, r2, r3
        adc     r4, r0, r1
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r5, r0
        adc     r1, r4, r1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x34]
        str     r1, [r11, #-0x30]
        mov     r1, #0
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x30]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x34]
        ldrlt   r0, [r11, #-0x30]
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        blt     LBDU4
LBDU5:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDU6:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDU8
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        bge     LBDU12
LBDU7:
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x2C]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        mov     r1, #0
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x30]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x34]
        ldrlt   r0, [r11, #-0x30]
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        blt     LBDU7
        b       LBDU12
LBDU8:
        ldr     r0, [r11]
        cmn     r0, #0x1F
        bge     LBDU10
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        bge     LBDU12
LBDU9:
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x2C]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        moveq   r0, #2, 2
        mvnne   r0, #2, 2
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        orrs    r1, r0, r1
        ldreq   r0, [r11, #-0x34]
        ldrne   r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        blt     LBDU9
        b       LBDU12
LBDU10:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        bge     LBDU12
LBDU11:
        ldr     r0, [r11, #-0x20]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x2C]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x34]
        ldrne   r0, [r11, #-0x30]
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        mov     r1, #0
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x30]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x34]
        ldrlt   r0, [r11, #-0x30]
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x34]
        str     r1, [r11, #-0x30]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x34]
        ldrne   r0, [r11, #-0x30]
        str     r1, [r11, #-0x34]
        str     r0, [r11, #-0x30]
        mov     r1, #0
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x30]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r0, #2, 2
        ldrlt   r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x18]
        cmp     r0, r1
        blt     LBDU11
LBDU12:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDU13:
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        bne     LBDU14
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDU14:
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x1C]
        bl      _ippsZero_32s
        ldmdb   r11, {r4, r5, r11, sp, pc}


