        .text
        .align  4
        .globl  _ippsMul_32s_ISfs


_ippsMul_32s_ISfs:
        mov     r12, sp
        stmdb   sp!, {r4, r5, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x2C
        str     r0, [r11, #-0x24]
        str     r1, [r11, #-0x20]
        str     r2, [r11, #-0x1C]
        str     r3, [r11, #-0x18]
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0x3E
        ble     LBDF1
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        bne     LBDF0
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDF0:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x20]
        bl      _ippsZero_32s
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDF1:
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        beq     LBDF2
        ldr     r0, [r11, #-0x20]
        cmp     r0, #0
        bne     LBDF3
LBDF2:
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDF3:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bgt     LBDF4
        mvn     r0, #5
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDF4:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        ble     LBDF7
        ldr     r0, [r11, #-0x18]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x40]
        str     r1, [r11, #-0x3C]
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDF6
LBDF5:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x28]
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x38]
        ldr     r0, [r11, #-0x34]
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        adds    r5, r2, r3
        adc     r4, r0, r1
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        ldr     r2, [r11, #-0x18]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        mov     r1, #0
        adds    r0, r5, r0
        adc     r1, r4, r1
        ldr     r2, [r11, #-0x18]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x38]
        str     r1, [r11, #-0x34]
        mov     r1, #0
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x34]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x38]
        ldrlt   r0, [r11, #-0x34]
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDF5
LBDF6:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDF7:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDF9
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDF13
LBDF8:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x28]
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        mov     r1, #0
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x34]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x38]
        ldrlt   r0, [r11, #-0x34]
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDF8
        b       LBDF13
LBDF9:
        ldr     r0, [r11, #-0x18]
        cmn     r0, #0x1F
        bge     LBDF11
        mov     r0, #0
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDF13
LBDF10:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x28]
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        orrs    r1, r0, r1, lsl #1
        tstcs   r1, #0
        moveq   r1, #2, 2
        mvnne   r1, #2, 2
        mov     r0, r1, asr #31
        str     r1, [r11, #-0x30]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        orrs    r1, r0, r1
        ldreq   r0, [r11, #-0x38]
        ldrne   r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDF10
        b       LBDF13
LBDF11:
        ldr     r1, [r11, #-0x18]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11, #-0x18]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDF13
LBDF12:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x28]
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        ldr     r2, [r1, +r2, lsl #2]
        smull   r1, r0, r2, r0
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x38]
        ldrne   r0, [r11, #-0x34]
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        mov     r1, #0
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x34]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x38]
        ldrlt   r0, [r11, #-0x34]
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        ldr     r2, [r11, #-0x18]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x38]
        str     r1, [r11, #-0x34]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x38]
        ldrne   r0, [r11, #-0x34]
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
        mov     r1, #0
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x34]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r0, #2, 2
        ldrlt   r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #1
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDF12
LBDF13:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}


