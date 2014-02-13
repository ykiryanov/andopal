        .text
        .align  4
        .globl  _ippsMulC_32s_ISfs


_ippsMulC_32s_ISfs:
        mov     r12, sp
        stmdb   sp!, {r4, r5, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x28
        str     r0, [r11, #-0x24]
        str     r1, [r11, #-0x20]
        str     r2, [r11, #-0x1C]
        str     r3, [r11, #-0x18]
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        beq     LBDV12
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0x3E
        bgt     LBDV12
        ldr     r0, [r11, #-0x20]
        cmp     r0, #0
        bne     LBDV0
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDV0:
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bgt     LBDV1
        mvn     r0, #5
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDV1:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDV2
        ldr     r0, [r11, #-0x24]
        cmp     r0, #1
        bne     LBDV2
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDV2:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        ble     LBDV5
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
        str     r0, [r11, #-0x3C]
        str     r1, [r11, #-0x38]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDV4
LBDV3:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x20]
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
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDV3
LBDV4:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDV5:
        ldr     r0, [r11, #-0x18]
        cmp     r0, #0
        bne     LBDV7
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDV11
LBDV6:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x20]
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
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDV6
        b       LBDV11
LBDV7:
        ldr     r0, [r11, #-0x18]
        cmn     r0, #0x1F
        bge     LBDV9
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDV11
LBDV8:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x20]
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
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDV8
        b       LBDV11
LBDV9:
        ldr     r1, [r11, #-0x18]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11, #-0x18]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        bge     LBDV11
LBDV10:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x20]
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
        ldr     r2, [r11, #-0x18]
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
        ldr     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x2C]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x1C]
        cmp     r0, r1
        blt     LBDV10
LBDV11:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LBDV12:
        ldr     r1, [r11, #-0x1C]
        ldr     r0, [r11, #-0x20]
        bl      _ippsZero_32s
        ldmdb   r11, {r4, r5, r11, sp, pc}


