        .text
        .align  4
        .globl  _ippsWinHybrid_G728_16s


_ippsWinHybrid_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA5, 30
        add     lr, sp, #2, 24
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        and     lr, lr, #0xF
        add     r12, sp, #2, 24
        mov     r6, r1
        add     lr, r12, lr
        cmp     r6, #0
        str     r0, [sp]
        str     lr, [sp, #0x2C]
        str     r2, [sp, #0x34]
        mov     r5, r3
        beq     LDEM44
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        beq     LDEM44
        cmp     r5, #0
        beq     LDEM44
        ldrsh   r0, [r5, #8]
        ldrsh   r10, [r5, #4]
        ldr     r9, [r5, #0x14]
        ldrsh   r7, [r5, #6]
        str     r0, [sp, #0x1C]
        ldr     r2, [r5]
        add     r11, r10, #1
        mov     r8, r11, lsl #1
        str     r2, [sp, #0x20]
        mov     r2, r10, lsl #1
        add     r2, r2, #4
        str     r2, [sp, #0x28]
        add     r4, r9, r2
        add     r2, r10, r0
        str     r2, [sp, #0x24]
        add     r0, r4, r7, lsl #1
        mov     r1, r4
        bl      _ippsMove_16s
        cmp     r7, #0
        ble     LDEM3
        cmp     r7, #6
        blt     LDEM43
        ldr     r0, [sp, #0x24]
        mov     r2, #0
        sub     r1, r7, #6
        add     r0, r4, r0, lsl #1
        mov     lr, r6
        mov     r12, r0
LDEM0:
        ldrsh   r3, [lr]
        add     r2, r2, #5
        cmp     r2, r1
        strh    r3, [r12]
        ldrsh   r3, [lr, #2]
        strh    r3, [r12, #2]
        ldrsh   r3, [lr, #4]
        strh    r3, [r12, #4]
        ldrsh   r3, [lr, #6]
        strh    r3, [r12, #6]
        ldrsh   r3, [lr, #8]
        add     lr, lr, #0xA
        strh    r3, [r12, #8]
        add     r12, r12, #0xA
        ble     LDEM0
LDEM1:
        mov     r12, r2, lsl #1
        add     r6, r6, r2, lsl #1
LDEM2:
        ldrsh   lr, [r6], #2
        add     r2, r2, #1
        cmp     r2, r7
        strh    lr, [r0, +r12]
        add     r12, r12, #2
        blt     LDEM2
LDEM3:
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x1C]
        add     r7, r10, r7
        ldrsh   r0, [r9, +r0]
        str     r7, [sp, #0x28]
        add     r7, r2, r7
        cmp     r7, #0
        str     r7, [sp, #0x30]
        mov     r2, r0
        ble     LDEM5
        mov     r12, r4
        ldr     lr, [sp, #0x30]
LDEM4:
        ldrsh   r6, [r12], #2
        cmp     r6, r2
        movgt   r2, r6
        cmp     r6, r0
        movlt   r0, r6
        subs    lr, lr, #1
        bne     LDEM4
LDEM5:
        cmp     r2, #0
        bne     LDEM6
        cmp     r0, #0
        moveq   r12, #0xF
        beq     LDEM12
LDEM6:
        cmp     r2, #0
        blt     LDEM7
        rsb     r12, r2, #0
        cmp     r0, r12
        bge     LDEM9
LDEM7:
        cmn     r0, #1, 18
        movlt   r12, #0
        blt     LDEM11
        mov     r12, #0
LDEM8:
        mov     r0, r0, lsl #1
        add     r12, r12, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmn     r0, #1, 18
        bge     LDEM8
        b       LDEM11
LDEM9:
        cmp     r2, #1, 18
        movge   r12, #0
        bge     LDEM11
        mov     r12, #0
LDEM10:
        mov     r2, r2, lsl #1
        add     r12, r12, #1
        mov     r0, r2, lsl #16
        mov     r2, r0, asr #16
        cmp     r2, #1, 18
        blt     LDEM10
LDEM11:
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDEM12:
        ldr     r0, [sp, #0x30]
        sub     r12, r12, #1
        mov     r12, r12, lsl #16
        sub     r0, r0, #1
        mov     r2, r12, asr #16
        cmp     r2, #0
        ble     LDEM40
        cmp     r0, #0
        blt     LDEM15
        ldr     r1, [sp, #0x2C]
        ldr     lr, [sp, #0x20]
        mov     r12, #2, 2
        sub     r12, r12, #2, 18
        add     r4, r4, r0, lsl #1
        add     r1, r1, r0, lsl #1
LDEM13:
        ldrsh   r6, [lr], #2
        ldrsh   r7, [r4], #-2
        mul     r6, r7, r6
        mov     r6, r6, lsl r2
        cmp     r12, r6
        mvnle   r6, #0
        addle   r6, r6, #2, 18
        ble     LDEM14
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEM14:
        strh    r6, [r1], #-2
        subs    r0, r0, #1
        bpl     LDEM13
LDEM15:
        add     r1, sp, #0x12, 28
        and     r1, r1, #0xF
        rsb     r1, r1, #0
        add     r0, sp, #0x12, 28
        and     r1, r1, #0xF
        add     r4, r0, r1
        ldrsh   r0, [r5, #0x10]
        mov     r2, r2, lsl #1
        mov     r3, r11
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        ldr     r6, [r5, #0x14]
        mov     r7, r2, lsl #16
        sub     r1, r0, r10
        ldr     r0, [sp, #0x2C]
        add     r5, sp, #0x40
        mov     r2, r4
        add     r0, r0, r10, lsl #1
        bl      _ippsAutoCorr_Inv_16s32s
        ldrsh   r12, [r9, +r8]
        add     r0, sp, #0x40
        and     r0, r0, #0xF
        rsb     r0, r0, #0
        and     r0, r0, #0xF
        cmp     r12, r7, asr #16
        str     r0, [sp, #0x38]
        add     r5, r5, r0
        ble     LDEM16
        sub     r12, r12, r7, asr #16
        add     r12, r12, #1
        mov     lr, #1
        b       LDEM17
LDEM16:
        cmp     r12, r7, asr #16
        moveq   r12, #1
        moveq   lr, r12
        beq     LDEM17
        rsb     r12, r12, r7, asr #16
        add     lr, r12, #1
        mov     r12, #1
LDEM17:
        cmp     lr, #0x1F
        mov     r0, #0x1F
        movgt   lr, r0
        cmp     r12, #0x1F
        movgt   r12, r0
        cmp     r11, #0
        ble     LDEM21
        cmp     r11, #4
        movlt   r0, #0
        blt     LDEM19
        sub     r3, r11, #4
        str     r4, [sp, #0x20]
        str     r3, [sp, #4]
        str     r7, [sp, #0x14]
        ldr     r3, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        mov     r0, #0
        mov     r2, r6
        mov     r1, r5
        str     r8, [sp, #8]
        str     r11, [sp, #0x18]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
LDEM18:
        ldrsh   r9, [r2], #6
        ldr     r8, [r3], #0xC
        mov     r10, r9, lsl r7
        rsb     r9, r10, r9, lsl #16
        mov     r9, r9, asr r12
        add     r8, r9, r8, asr lr
        str     r8, [r1], #0xC
        add     r9, r0, #1
        ldr     r8, [r4, +r9, lsl #2]
        str     r8, [sp, #0x3C]
        mov     r8, r9, lsl #1
        ldrsh   r10, [r6, +r8]
        add     r8, r0, #2
        add     r0, r0, #3
        mov     r11, r10, lsl r7
        rsb     r10, r11, r10, lsl #16
        ldr     r11, [sp, #0x3C]
        mov     r10, r10, asr r12
        add     r11, r10, r11, asr lr
        str     r11, [r5, +r9, lsl #2]
        mov     r9, r8, lsl #1
        ldrsh   r10, [r6, +r9]
        ldr     r9, [r4, +r8, lsl #2]
        mov     r11, r10, lsl r7
        rsb     r10, r11, r10, lsl #16
        mov     r10, r10, asr r12
        add     r9, r10, r9, asr lr
        ldr     r10, [sp, #4]
        str     r9, [r5, +r8, lsl #2]
        cmp     r0, r10
        ble     LDEM18
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #8]
        ldr     r11, [sp, #0x18]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
LDEM19:
        str     r8, [sp, #8]
        ldr     r8, [sp, #0x24]
        add     r3, r6, r0, lsl #1
        add     r2, r4, r0, lsl #2
        add     r1, r5, r0, lsl #2
        str     r6, [sp, #0x1C]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
LDEM20:
        ldrsh   r9, [r3], #2
        ldr     r6, [r2], #4
        mov     r10, r9, lsl r8
        rsb     r9, r10, r9, lsl #16
        mov     r9, r9, asr r12
        add     r6, r9, r6, asr lr
        add     r0, r0, #1
        str     r6, [r1], #4
        cmp     r0, r11
        blt     LDEM20
        ldr     r6, [sp, #0x1C]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
LDEM21:
        add     r2, sp, #0x29, 28
        mov     r1, r5
        mov     r0, r5
        bl      ownVscaleOne_Range30_32s
        ldrsh   r12, [r9, +r8]
        add     r3, sp, #2, 24
        ldrsh   r3, [r3, #0x90]
        cmp     r12, r7, asr #16
        addle   r3, r3, r12
        addgt   r3, r3, r7, asr #16
        sub     r3, r3, #1
        strh    r3, [r9, +r8]
        ldr     r3, [sp, #0x38]
        add     r12, sp, #0x40
        ldr     r3, [r3, +r12]
        mov     r12, #2, 2
        sub     r12, r12, #2, 18
        cmp     r12, r3
        mvnle   r3, #0
        addle   r3, r3, #2, 18
        ble     LDEM22
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDEM22:
        cmp     r10, #0
        strh    r3, [r6]
        ble     LDEM25
        mov     r3, #2, 2
        add     r12, r5, #4
        add     r11, r6, #2
        sub     r3, r3, #2, 18
        mov     lr, r10
LDEM23:
        ldr     r1, [r12], #4
        add     r0, sp, #2, 24
        ldrsh   r0, [r0, #0x90]
        mov     r0, r1, lsl r0
        cmp     r3, r0
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDEM24
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEM24:
        strh    r0, [r11], #2
        subs    lr, lr, #1
        bne     LDEM23
LDEM25:
        ldr     r3, [sp]
        cmp     r3, #1
        moveq   r10, #0xA
        ldr     r12, [sp, #0x30]
        ldr     r3, [sp, #0x28]
        add     r11, r10, #1
        mov     r2, r4
        sub     r1, r12, r3
        ldr     r12, [sp, #0x2C]
        add     r0, r12, r3, lsl #1
        mov     r3, r11
        bl      _ippsAutoCorr_Inv_16s32s
        ldrsh   lr, [r9, +r8]
        mov     r12, #1
        cmp     lr, r7, asr #16
        subgt   lr, lr, r7, asr #16
        rsbgt   lr, lr, #0xF
        bgt     LDEM26
        cmp     lr, r7, asr #16
        moveq   lr, #0xF
        beq     LDEM26
        rsb     r7, lr, r7, asr #16
        add     r12, r7, #1
        mov     lr, #0xF
LDEM26:
        cmp     r12, #0x1F
        mov     r7, #0x1F
        movgt   r12, r7
        cmp     lr, #0
        blt     LDEM30
        cmp     r11, #0
        ble     LDEM34
        cmp     r11, #5
        movlt   r2, #0
        blt     LDEM28
        sub     r3, r11, #5
        mov     r2, #0
        mov     r1, r6
        mov     r0, r4
        mov     r7, r5
        str     r3, [sp]
        str     r11, [sp, #4]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
LDEM27:
        ldrsh   r8, [r1], #8
        ldr     r3, [r0], #0x10
        mov     r8, r8, lsl lr
        add     r9, r2, #1
        add     r3, r8, r3, asr r12
        str     r3, [r7], #0x10
        ldr     r8, [r4, +r9, lsl #2]
        mov     r3, r9, lsl #1
        ldrsh   r10, [r6, +r3]
        add     r3, r2, #2
        mov     r10, r10, lsl lr
        add     r8, r10, r8, asr r12
        str     r8, [r5, +r9, lsl #2]
        ldr     r9, [r4, +r3, lsl #2]
        mov     r8, r3, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r11, r2, #3
        ldr     r10, [r4, +r11, lsl #2]
        mov     r8, r8, lsl lr
        add     r9, r8, r9, asr r12
        add     r2, r2, #4
        str     r10, [sp, #0x3C]
        str     r9, [r5, +r3, lsl #2]
        ldr     r3, [sp]
        mov     r10, r11, lsl #1
        ldrsh   r10, [r6, +r10]
        ldr     r8, [sp, #0x3C]
        cmp     r2, r3
        mov     r3, r10, lsl lr
        add     r8, r3, r8, asr r12
        str     r8, [r5, +r11, lsl #2]
        ble     LDEM27
        ldr     r11, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
LDEM28:
        add     r6, r6, r2, lsl #1
        add     r4, r4, r2, lsl #2
        add     r7, r5, r2, lsl #2
LDEM29:
        ldrsh   r1, [r6], #2
        ldr     r0, [r4], #4
        mov     r1, r1, lsl lr
        add     r2, r2, #1
        add     r0, r1, r0, asr r12
        str     r0, [r7], #4
        cmp     r2, r11
        blt     LDEM29
        b       LDEM34
LDEM30:
        cmp     r11, #0
        rsb     lr, lr, #0
        ble     LDEM34
        cmp     r11, #5
        movlt   r2, #0
        blt     LDEM32
        sub     r3, r11, #5
        mov     r2, #0
        mov     r1, r6
        mov     r0, r4
        mov     r7, r5
        str     r3, [sp, #0x30]
        str     r11, [sp, #4]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
LDEM31:
        ldrsh   r8, [r1], #8
        ldr     r3, [r0], #0x10
        mov     r8, r8, asr lr
        add     r9, r2, #1
        add     r3, r8, r3, asr r12
        str     r3, [r7], #0x10
        ldr     r8, [r4, +r9, lsl #2]
        mov     r3, r9, lsl #1
        ldrsh   r10, [r6, +r3]
        add     r3, r2, #2
        mov     r10, r10, asr lr
        add     r8, r10, r8, asr r12
        str     r8, [r5, +r9, lsl #2]
        ldr     r9, [r4, +r3, lsl #2]
        mov     r8, r3, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r11, r2, #3
        ldr     r10, [r4, +r11, lsl #2]
        mov     r8, r8, asr lr
        add     r9, r8, r9, asr r12
        add     r2, r2, #4
        str     r10, [sp, #0x3C]
        str     r9, [r5, +r3, lsl #2]
        ldr     r3, [sp, #0x30]
        mov     r10, r11, lsl #1
        ldrsh   r10, [r6, +r10]
        cmp     r2, r3
        ldr     r3, [sp, #0x3C]
        mov     r10, r10, asr lr
        add     r3, r10, r3, asr r12
        str     r3, [r5, +r11, lsl #2]
        ble     LDEM31
        ldr     r11, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
LDEM32:
        add     r6, r6, r2, lsl #1
        add     r4, r4, r2, lsl #2
        add     r7, r5, r2, lsl #2
LDEM33:
        ldrsh   r1, [r6], #2
        ldr     r0, [r4], #4
        mov     r1, r1, asr lr
        add     r2, r2, #1
        add     r0, r1, r0, asr r12
        str     r0, [r7], #4
        cmp     r2, r11
        blt     LDEM33
LDEM34:
        ldr     r2, [sp, #0x38]
        add     r3, sp, #0x40
        mvn     r6, #0
        ldr     r12, [r2, +r3]
        mov     r4, #2, 2
        mov     r2, r12, asr #8
        adds    r3, r2, r12
        mov     r12, r12, asr #31
        adc     r2, r12, r2, asr #31
        mvn     r12, #2, 2
        subs    lr, r3, r12
        sbcs    r7, r2, #0
        movlt   lr, #0
        movlt   r7, #0
        orrs    r7, lr, r7
        movne   r3, r12
        bne     LDEM35
        cmp     r3, #2, 2
        sbcs    r2, r2, r6
        movlt   r3, #2, 2
LDEM35:
        add     r2, sp, #0xA3, 30
        add     r1, sp, #0xA2, 30
        add     r0, sp, #0xA2, 30
        str     r3, [sp, #0x288]
        bl      ownVscaleOne_Range30_32s
        ldr     r3, [sp, #0x288]
        sub     r2, r4, #2, 18
        cmp     r2, r3
        addle   r2, r6, #2, 18
        ble     LDEM36
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
LDEM36:
        ldr     r3, [sp, #0x34]
        cmp     r10, #0
        strh    r2, [r3]
        ble     LDEM39
        ldr     r2, [sp, #0x34]
        add     r3, sp, #2, 24
        ldrsh   r3, [r3, #0x8C]
        add     r2, r2, #2
        sub     r4, r4, #2, 18
        mov     r7, #0
        add     lr, r5, #4
LDEM37:
        ldr     r12, [lr], #4
        mov     r12, r12, lsl r3
        cmp     r4, r12
        addle   r11, r6, #2, 18
        ble     LDEM38
        add     r11, r12, #2, 18
        mov     r11, r11, asr #16
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
LDEM38:
        add     r7, r7, #1
        strh    r11, [r2], #2
        cmp     r7, r10
        blt     LDEM37
        str     r12, [sp, #0x288]
LDEM39:
        ldr     r10, [r5, +r10, lsl #2]
        cmp     r10, #0
        movne   r1, #0
        moveq   r1, #1
        ldrsh   r0, [r9, +r8]
        mov     r2, #0x29
        cmp     r0, #0x29
        movlt   r2, r0
        cmp     r1, #1
        strh    r2, [r9, +r8]
        beq     LDEM45
        mov     r0, #0
        add     sp, sp, #0xA5, 30
        ldmia   sp!, {r4 - r11, pc}
LDEM40:
        cmp     r0, #0
        blt     LDEM15
        ldr     r1, [sp, #0x2C]
        ldr     r6, [sp, #0x20]
        mov     r12, #2, 2
        rsb     lr, r2, #0
        sub     r12, r12, #2, 18
        add     r4, r4, r0, lsl #1
        add     r1, r1, r0, lsl #1
LDEM41:
        ldrsh   r3, [r6], #2
        ldrsh   r7, [r4], #-2
        mul     r3, r7, r3
        mov     r7, r3, asr lr
        cmp     r12, r7
        mvnle   r7, #0
        addle   r7, r7, #2, 18
        ble     LDEM42
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
LDEM42:
        strh    r7, [r1], #-2
        subs    r0, r0, #1
        bpl     LDEM41
        b       LDEM15
LDEM43:
        ldr     r0, [sp, #0x24]
        mov     r2, #0
        add     r0, r4, r0, lsl #1
        b       LDEM1
LDEM44:
        mvn     r0, #7
        add     sp, sp, #0xA5, 30
        ldmia   sp!, {r4 - r11, pc}
LDEM45:
        mov     r0, #0x11
        add     sp, sp, #0xA5, 30
        ldmia   sp!, {r4 - r11, pc}


