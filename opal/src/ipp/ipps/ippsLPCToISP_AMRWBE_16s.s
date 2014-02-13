        .text
        .align  4
        .globl  _ippsLPCToISP_AMRWBE_16s


_ippsLPCToISP_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD0
        add     r5, sp, #0xA0
        add     r12, sp, #0x6C
        and     lr, r12, #0xF
        and     r5, r5, #0xF
        rsb     lr, lr, #0
        rsb     r5, r5, #0
        str     r1, [sp, #0x68]
        add     r12, sp, #0xA0
        add     r4, sp, #0x6C
        and     lr, lr, #0xF
        and     r5, r5, #0xF
        mov     r1, r2
        cmp     r0, #0
        add     r12, r12, r5
        mov     r2, r3
        add     r8, r4, lr
        beq     LDIL48
        cmp     r1, #0
        beq     LDIL48
        ldr     r4, [sp, #0x68]
        cmp     r4, #0
        beq     LDIL48
        cmp     r2, #0
        ble     LDIL49
        mov     r9, r2, asr #1
        cmp     r9, #0
        ble     LDIL3
        cmp     r9, #4
        mov     r11, #0
        addlt   r4, r0, r2, lsl #1
        blt     LDIL1
        add     r4, r0, r2, lsl #1
        sub     r10, r9, #4
        mov     r7, r0
        mov     r6, r8
        mov     r5, r12
        str     r12, [sp, #0x14]
        str     r8, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDIL0:
        ldrsh   lr, [r7]
        ldrsh   r12, [r7, #2]
        ldrsh   r8, [r7, #4]
        rsb     r1, r11, #0
        mvn     r2, #0
        mvn     r0, #1
        mov     r1, r1, lsl #1
        ldrsh   r1, [r4, +r1]
        rsb     r2, r11, r2
        rsb     r0, r11, r0
        add     r3, lr, r1
        mov     r2, r2, lsl #1
        ldrsh   r2, [r4, +r2]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r4, +r0]
        sub     r1, lr, r1
        add     lr, r12, r2
        sub     r2, r12, r2
        add     r12, r8, r0
        sub     r0, r8, r0
        add     r3, r3, #1
        add     r1, r1, #1
        add     lr, lr, #1
        add     r2, r2, #1
        add     r12, r12, #1
        add     r0, r0, #1
        mov     r3, r3, asr #1
        mov     r1, r1, asr #1
        mov     lr, lr, asr #1
        mov     r2, r2, asr #1
        mov     r12, r12, asr #1
        mov     r0, r0, asr #1
        add     r11, r11, #3
        strh    r3, [r6]
        strh    r1, [r5]
        strh    lr, [r6, #2]
        strh    r2, [r5, #2]
        strh    r12, [r6, #4]
        strh    r0, [r5, #4]
        cmp     r11, r10
        add     r7, r7, #6
        add     r6, r6, #6
        add     r5, r5, #6
        ble     LDIL0
        ldr     r12, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDIL1:
        add     r7, r0, r11, lsl #1
        add     r6, r8, r11, lsl #1
        add     r5, r12, r11, lsl #1
        str     r0, [sp]
LDIL2:
        ldrsh   r3, [r7], #2
        rsb     r0, r11, #0
        add     r11, r11, #1
        mov     r0, r0, lsl #1
        ldrsh   r0, [r4, +r0]
        cmp     r11, r9
        add     r10, r3, r0
        sub     r3, r3, r0
        add     r10, r10, #1
        add     r0, r3, #1
        mov     r10, r10, asr #1
        strh    r10, [r6], #2
        mov     r0, r0, asr #1
        strh    r0, [r5], #2
        blt     LDIL2
        ldr     r0, [sp]
LDIL3:
        mov     r4, r9, lsl #1
        ldrsh   r6, [r0, +r4]
        cmp     r9, #2
        strh    r6, [r8, +r4]
        ble     LDIL7
        sub     r4, r9, #2
        cmp     r4, #6
        mov     r11, #2
        sublt   r4, r12, #4
        blt     LDIL5
        sub     r4, r12, #4
        sub     r10, r9, #6
        add     r7, r12, #4
        add     r5, r4, #4
        str     lr, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDIL4:
        ldrsh   r0, [r5]
        ldrsh   lr, [r7]
        ldrsh   r1, [r7, #2]
        ldrsh   r2, [r7, #4]
        ldrsh   r3, [r7, #6]
        add     r0, lr, r0
        strh    r0, [r7]
        ldrsh   lr, [r5, #2]
        ldrsh   r0, [r7, #8]
        add     r11, r11, #5
        add     lr, r1, lr
        strh    lr, [r7, #2]
        ldrsh   r1, [r5, #4]
        cmp     r11, r10
        add     r1, r2, r1
        strh    r1, [r7, #4]
        ldrsh   r1, [r5, #6]
        add     r1, r3, r1
        strh    r1, [r7, #6]
        ldrsh   r1, [r5, #8]
        add     r5, r5, #0xA
        add     r1, r0, r1
        strh    r1, [r7, #8]
        add     r7, r7, #0xA
        ble     LDIL4
        ldr     lr, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDIL5:
        mov     r7, r11, lsl #1
        add     r5, r12, r11, lsl #1
LDIL6:
        ldrsh   r3, [r4, +r7]
        ldrsh   r10, [r5]
        add     r11, r11, #1
        add     r7, r7, #2
        cmp     r11, r9
        add     r3, r10, r3
        strh    r3, [r5], #2
        blt     LDIL6
LDIL7:
        ldr     r4, [pc, #0x888]
        add     r5, sp, #0x6C
        ldrsh   r5, [lr, +r5]
        ldrsh   r4, [r4]
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r10, r7
        mov     r5, r5, lsl #12
        and     r7, r5, r10
        mul     r11, r4, r7
        mov     r5, r5, asr #15
        ldrsh   r3, [r8, #2]
        mov     r5, r5, lsl #16
        cmp     r9, #2
        mov     r11, r11, asr #15
        mov     r5, r5, asr #16
        mla     r11, r4, r5, r11
        mov     r3, r3, lsl #12
        str     r8, [sp, #0x38]
        add     r3, r3, r11, lsl #1
        and     r11, r3, r10
        mov     r3, r3, asr #15
        str     r9, [sp, #0x3C]
        mov     r3, r3, lsl #16
        mov     r10, r3, asr #16
        ble     LDIL9
        mov     r3, #2
        str     r3, [sp, #0x34]
        str     lr, [sp, #0xC]
        ldr     lr, [sp, #0x34]
        add     r3, r8, #4
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDIL8:
        mul     r0, r4, r11
        ldrsh   r2, [r3], #2
        mov     r1, r5, lsl #15
        mov     r0, r0, asr #15
        mla     r0, r4, r10, r0
        mov     r5, r10
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        rsb     r0, r1, r0, lsl #1
        add     r2, r0, r2, lsl #12
        sub     r0, r2, r7
        mvn     r10, r10
        mov     r1, r0, asr #15
        mov     r7, r11
        add     lr, lr, #1
        and     r11, r0, r10
        mov     r1, r1, lsl #16
        cmp     lr, r9
        mov     r10, r1, asr #16
        blt     LDIL8
        ldr     lr, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDIL9:
        mul     r11, r4, r11
        rsb     r5, r5, #0
        mvn     r3, #0xFE, 8
        mov     r5, r5, lsl #15
        mov     r11, r11, asr #15
        mla     r10, r4, r10, r11
        add     r6, r5, r6, lsl #11
        sub     r6, r6, r7
        mov     r5, r6, lsl #1
        add     r10, r5, r10, lsl #1
        cmp     r3, r10
        mvnlt   r10, #2, 2
        blt     LDIL10
        cmp     r10, #0xFE, 8
        movge   r10, r10, lsl #6
        movlt   r10, #2, 2
LDIL10:
        mov     r10, r10, asr #16
        mov     r10, r10, lsl #16
        mov     r7, r10, asr #16
        cmn     r7, #2, 18
        beq     LDIL47
LDIL11:
        mvn     r6, #0xFF
        sub     r5, r2, #1
        bic     r6, r6, #0x7F, 24
        cmp     r5, #0
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x50]
        movle   r6, #0
        ble     LDIL18
        add     r5, sp, #0x6C
        ldrsh   lr, [lr, +r5]
        ldrsh   r5, [r8, #2]
        ldr     r11, [sp, #0x50]
        mov     r10, lr, lsl #12
        ldr     lr, [pc, #0x718]
        str     r5, [sp, #0x58]
        mov     r5, r9, lsl #1
        ldrsh   r5, [r8, +r5]
        str     lr, [sp, #0x20]
        mvn     r11, r11
        mov     lr, r10, asr #15
        str     r11, [sp, #0x48]
        mov     r11, lr, lsl #16
        ldr     lr, [sp, #0x58]
        mov     r11, r11, asr #16
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x48]
        str     r5, [sp, #0x4C]
        mov     lr, lr, lsl #12
        str     lr, [sp, #0x30]
        ldr     lr, [sp, #0x4C]
        mov     r5, #0
        mov     r6, r5
        and     r11, r10, r11
        mov     r3, r6
        str     r11, [sp, #0x24]
        str     r3, [sp, #0x5C]
        str     r8, [sp, #0x10]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        ldr     r8, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x30]
        ldr     r0, [sp, #0x3C]
        mov     lr, lr, lsl #11
        sub     r10, r9, #1
        mvn     r11, #0xFE, 8
        str     r11, [sp, #0x40]
        str     r10, [sp, #0x58]
        str     lr, [sp, #0x2C]
        str     r9, [sp, #0x64]
        str     r12, [sp, #0x14]
LDIL12:
        str     r4, [sp, #0x1C]
        add     r8, r8, #2
        ldrsh   r4, [r8]
        mov     r12, r1
        add     r5, r5, #1
        mul     r10, r4, r12
        mov     r9, r3
        mov     lr, r7
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mov     r10, r10, asr #15
        mla     r10, r4, r9, r10
        mvn     r7, r7
        cmp     r0, #2
        add     r10, r2, r10, lsl #1
        and     r7, r10, r7
        mov     r10, r10, asr #15
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        ble     LDIL14
        mov     r11, #2
        str     r11, [sp, #0x18]
        mov     r11, #4
        str     r11, [sp, #0xC]
        str     r8, [sp, #0x20]
        str     r3, [sp, #0x28]
        str     r5, [sp, #0x34]
        ldr     r8, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        ldr     r5, [sp, #0x38]
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x30]
LDIL13:
        mul     r11, r4, r7
        ldrsh   r1, [r5, +r8]
        mov     r2, r9, lsl #15
        mov     r9, r10
        mov     r11, r11, asr #15
        mla     r11, r4, r10, r11
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
        rsb     r11, r2, r11, lsl #1
        add     r1, r11, r1, lsl #12
        sub     r1, r1, r12
        mov     r12, r7
        mov     r2, r1, asr #15
        add     r3, r3, #1
        and     r7, r1, r10
        mov     r2, r2, lsl #16
        cmp     r3, r0
        add     r8, r8, #2
        mov     r10, r2, asr #16
        blt     LDIL13
        ldr     r8, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x30]
        ldr     r5, [sp, #0x34]
LDIL14:
        mul     r7, r4, r7
        ldr     r11, [sp, #0x2C]
        rsb     r9, r9, #0
        mov     r7, r7, asr #15
        mla     r7, r4, r10, r7
        add     r9, r11, r9, lsl #15
        sub     r12, r9, r12
        mov     r12, r12, lsl #1
        add     r7, r12, r7, lsl #1
        ldr     r12, [sp, #0x40]
        cmp     r12, r7
        mvnlt   r7, #2, 2
        blt     LDIL15
        cmp     r7, #0xFE, 8
        movge   r7, r7, lsl #6
        movlt   r7, #2, 2
LDIL15:
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        cmn     r7, #2, 18
        beq     LDIL46
LDIL16:
        mul     r12, lr, r7
        cmp     r12, #0
        ble     LDIL23
LDIL17:
        ldr     r12, [sp, #0x60]
        cmp     r6, r12
        bge     LDIL22
        cmp     r5, #0x64
        blt     LDIL12
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDIL18:
        ldr     r12, [sp, #0x60]
        cmp     r6, r12
        bge     LDIL19
        ldr     r0, [sp, #0x68]
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xD0
        ldmia   sp!, {r4 - r11, pc}
LDIL19:
        mov     r2, r2, lsl #1
        ldrsh   r0, [r0, +r2]
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        sub     r3, r3, #7, 20
        cmp     r3, r0
        blt     LDIL20
        cmn     r0, #1, 20
        blt     LDIL21
        mov     r0, r0, lsl #3
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x50]
        b       LDIL21
LDIL20:
        ldr     r0, [sp, #0x50]
        mvn     r0, r0
        str     r0, [sp, #0x50]
LDIL21:
        ldr     r0, [sp, #0x50]
        sub     r1, r1, #2
        strh    r0, [r1, +r2]
        mov     r0, #0
        add     sp, sp, #0xD0
        ldmia   sp!, {r4 - r11, pc}
LDIL22:
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
        b       LDIL18
LDIL23:
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x2C]
        mov     r12, #2
        str     r6, [sp, #0x54]
        str     lr, [sp, #0x4C]
        str     r8, [sp, #0x20]
        str     r3, [sp, #0x28]
        str     r5, [sp, #0x34]
LDIL24:
        mov     r3, r9, asr #1
        add     lr, r3, r4, asr #1
        ldr     r3, [sp, #0x28]
        mov     lr, lr, lsl #16
        mov     r8, r1
        mov     r5, lr, asr #16
        mul     r6, r5, r8
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        cmp     r0, #2
        mov     r6, r6, asr #15
        mla     r6, r5, r3, r6
        add     r6, r2, r6, lsl #1
        and     lr, r6, lr
        mov     r6, r6, asr #15
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        ble     LDIL26
        mov     r11, #2
        str     r11, [sp, #0x48]
        mov     r11, #4
        str     r11, [sp, #0xC]
        str     r7, [sp, #0x18]
        str     r2, [sp, #0x30]
        ldr     r10, [sp, #0xC]
        ldr     r2, [sp, #0x48]
        ldr     r7, [sp, #0x38]
        str     r4, [sp, #0x44]
        str     r1, [sp, #0x24]
LDIL25:
        mul     r11, r5, lr
        ldrsh   r1, [r7, +r10]
        mov     r4, r3, lsl #15
        mov     r3, r6
        mov     r11, r11, asr #15
        mla     r11, r5, r6, r11
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
        rsb     r11, r4, r11, lsl #1
        add     r1, r11, r1, lsl #12
        sub     r1, r1, r8
        mov     r8, lr
        mov     r4, r1, asr #15
        add     r2, r2, #1
        and     lr, r1, r6
        mov     r4, r4, lsl #16
        cmp     r2, r0
        add     r10, r10, #2
        mov     r6, r4, asr #16
        blt     LDIL25
        ldr     r4, [sp, #0x44]
        ldr     r7, [sp, #0x18]
        ldr     r1, [sp, #0x24]
        ldr     r10, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
LDIL26:
        mul     lr, r5, lr
        rsb     r3, r3, #0
        add     r3, r10, r3, lsl #15
        sub     r8, r3, r8
        mov     lr, lr, asr #15
        mla     lr, r5, r6, lr
        ldr     r3, [sp, #0x40]
        mov     r8, r8, lsl #1
        add     lr, r8, lr, lsl #1
        cmp     r3, lr
        mvnlt   lr, #2, 2
        blt     LDIL27
        cmp     lr, #0xFE, 8
        movge   lr, lr, lsl #6
        movlt   lr, #2, 2
LDIL27:
        mov     r3, lr, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmn     r3, #2, 18
        beq     LDIL45
LDIL28:
        mul     lr, r7, r3
        cmp     lr, #0
        strle   r3, [sp, #0x4C]
        movle   r9, r5
        movgt   r4, r5
        movgt   r7, r3
        subs    r12, r12, #1
        bne     LDIL24
        ldr     lr, [sp, #0x4C]
        str     r9, [sp, #0x1C]
        ldr     r0, [sp, #0x1C]
        ldr     r6, [sp, #0x54]
        ldr     r8, [sp, #0x20]
        ldr     r5, [sp, #0x34]
        sub     lr, lr, r7
        sub     r0, r0, r4
        mov     lr, lr, lsl #16
        mov     r0, r0, lsl #16
        movs    r9, lr, asr #16
        mov     r10, r0, asr #16
        beq     LDIL35
        cmp     r9, #0
        mov     r1, r9
        bge     LDIL29
        cmn     r9, #2, 18
        beq     LDIL41
        rsb     r0, r9, #0
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
LDIL29:
        mov     r0, r1
        cmp     r0, #0
        moveq   r11, #0
        beq     LDIL33
        cmp     r0, #0
        blt     LDIL42
LDIL30:
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    r2, r1, asr #8
        bne     LDIL31
        ldr     r2, [pc, #0x29C]
        mov     r1, r1, lsl #1
        ldrsh   r11, [r2, +r1]
        b       LDIL32
LDIL31:
        mov     r1, r2, lsl #1
        ldr     r2, [pc, #0x28C]
        ldrsh   r11, [r2, +r1]
LDIL32:
        mov     r0, r0, lsl r11
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
LDIL33:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        add     r0, r0, #2, 4
        bl      __intel_idiv
        rsb     r11, r11, #0x13
        mov     r0, r0, lsl #16
        cmp     r9, #0
        mov     r0, r0, asr #16
        mul     r0, r10, r0
        mov     r11, r0, asr r11
        mov     r0, r11, lsl #16
        mov     r0, r0, asr #16
        blt     LDIL44
LDIL34:
        mul     r0, r7, r0
        sub     r4, r4, r0, asr #10
        mov     r0, r4, lsl #16
        mov     r4, r0, asr #16
LDIL35:
        ldr     r1, [sp, #0x5C]
        mov     r0, r6, lsl #1
        add     r6, r6, #1
        cmp     r1, #0
        ldr     r1, [sp, #4]
        strh    r4, [r1, +r0]
        bne     LDIL36
        ldr     r0, [sp, #0x14]
        mov     r1, #1
        str     r1, [sp, #0x5C]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x58]
        b       LDIL37
LDIL36:
        ldr     r0, [sp, #0x10]
        mov     r1, #0
        str     r1, [sp, #0x5C]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x64]
LDIL37:
        ldr     r2, [sp, #0x38]
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        ldrsh   r1, [r2]
        ldrsh   r2, [r2, #2]
        mvn     r12, r3
        mov     lr, r1, lsl #12
        and     r1, lr, r12
        mul     r3, r4, r1
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        str     r1, [sp, #0xC]
        mov     r7, r3, asr #15
        mov     r3, lr, asr #16
        mla     r7, r4, r3, r7
        mov     r2, r2, lsl #12
        mov     r9, r3
        cmp     r0, #2
        add     lr, r2, r7, lsl #1
        and     r12, lr, r12
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        str     lr, [sp, #0x18]
        ble     LDIL39
        str     r3, [sp, #0x28]
        str     r5, [sp, #0x34]
        ldr     r10, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        ldr     r5, [sp, #0x38]
        mov     r7, #2
        mov     lr, #4
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x30]
LDIL38:
        mul     r11, r4, r12
        ldrsh   r1, [r5, +lr]
        mov     r2, r9, lsl #15
        mov     r9, r10
        mov     r11, r11, asr #15
        mla     r11, r4, r10, r11
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
        rsb     r11, r2, r11, lsl #1
        add     r1, r11, r1, lsl #12
        sub     r1, r1, r3
        mov     r3, r12
        mov     r2, r1, asr #15
        add     r7, r7, #1
        and     r12, r1, r10
        mov     r2, r2, lsl #16
        cmp     r7, r0
        add     lr, lr, #2
        mov     r10, r2, asr #16
        blt     LDIL38
        str     r3, [sp, #0xC]
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x30]
        ldr     r5, [sp, #0x34]
        str     r10, [sp, #0x18]
LDIL39:
        mul     lr, r4, r12
        ldr     r12, [sp, #0x38]
        mov     r7, r0, lsl #1
        rsb     r9, r9, #0
        ldrsh   r12, [r12, +r7]
        ldr     r7, [sp, #0x18]
        mov     lr, lr, asr #15
        mov     r12, r12, lsl #11
        mla     lr, r4, r7, lr
        add     r9, r12, r9, lsl #15
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0xC]
        sub     r9, r9, r12
        mov     r12, r9, lsl #1
        add     lr, r12, lr, lsl #1
        ldr     r12, [sp, #0x40]
        cmp     r12, lr
        mvnlt   lr, #2, 2
        blt     LDIL40
        cmp     lr, #0xFE, 8
        movge   lr, lr, lsl #6
        movlt   lr, #2, 2
LDIL40:
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     r7, lr, asr #16
        cmn     r7, #2, 18
        beq     LDIL43
        b       LDIL17
LDIL41:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
        b       LDIL29
LDIL42:
        mvn     r1, r0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDIL30
LDIL43:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        add     r7, r12, #1
        b       LDIL17
LDIL44:
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDIL34
LDIL45:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        add     r3, r3, #1
        b       LDIL28
LDIL46:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        add     r7, r12, #1
        b       LDIL16
LDIL47:
        mov     r5, #0
        sub     r5, r5, #2, 18
        add     r7, r5, #1
        b       LDIL11
LDIL48:
        mvn     r0, #7
        add     sp, sp, #0xD0
        ldmia   sp!, {r4 - r11, pc}
LDIL49:
        mvn     r0, #5
        add     sp, sp, #0xD0
        ldmia   sp!, {r4 - r11, pc}
        .long   gridTbl
        .long   NormTable2
        .long   NormTable


