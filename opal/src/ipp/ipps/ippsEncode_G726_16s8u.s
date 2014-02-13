        .text
        .align  4
        .globl  _ippsEncode_G726_16s8u


_ippsEncode_G726_16s8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        mov     r4, r0
        cmp     r4, #0
        beq     LDFH45
        cmp     r1, #0
        beq     LDFH45
        cmp     r2, #0
        beq     LDFH45
        cmp     r3, #0
        bls     LDFH43
        ldr     r10, [pc, #0xB80]
        ldrsh   r11, [r4, #0x16]
        sub     r5, r10, #0xC9, 30
        sub     lr, r10, #0xA7, 30
        sub     r12, r10, #0x67, 30
        ldr     r6, [r5, +r11, lsl #2]
        ldr     r5, [lr, +r11, lsl #2]
        ldr     lr, [r12, +r11, lsl #2]
        cmp     r11, #3
        moveq   r9, #9
        movne   r9, #8
        sub     r12, r10, #0x45, 30
        ldr     r12, [r12, +r11, lsl #2]
        cmp     r3, #0
        ble     LDFH42
        ldrsh   r7, [r4, #0x1A]
        add     r8, r11, #1
        add     r0, r4, #0x28
        str     r7, [sp]
        ldrsh   r7, [r4, #0x18]
        str     r7, [sp, #4]
        ldr     r7, [r4, #0x1C]
        str     r0, [sp, #0x10]
        sub     r0, r10, #0x5C
        str     r7, [sp, #0x14]
        mvn     r7, #0
        str     r2, [sp, #0x34]
        str     r5, [sp, #0x40]
        str     r6, [sp, #0x38]
        ldr     r5, [sp, #4]
        ldr     r6, [pc, #0xB0C]
        ldr     r2, [sp]
        str     r0, [sp, #0xC]
        sub     r0, r10, #0xB8
        add     r7, r7, #2, 20
        str     r0, [sp, #8]
        str     r1, [sp, #0x18]
        str     r7, [sp, #0x4C]
        str     r8, [sp, #0x44]
        str     r12, [sp, #0x50]
        str     r9, [sp, #0x48]
        str     lr, [sp, #0x3C]
        str     r11, [sp, #0x24]
        str     r3, [sp, #0x20]
LDFH0:
        cmp     r2, #1, 24
        movlt   r2, r2, asr #2
        movge   r2, #0x40
        ldr     r1, [sp, #0x14]
        mov     r1, r1, asr #6
        sub     r5, r5, r1
        mov     r3, r5, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #0
        mvnlt   lr, #0
        movge   lr, #1
        cmp     r3, #0
        bge     LDFH1
        cmn     r3, #2, 18
        mvneq   r3, #0
        addeq   r3, r3, #2, 18
        beq     LDFH1
        rsb     r3, r3, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH1:
        mul     r5, r2, r3
        mov     r2, #0
        mov     r3, r4
        mov     r12, #6
        mov     r5, r5, asr #6
        mla     r1, lr, r5, r1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDFH2:
        ldrsh   lr, [r3, #0x28]
        cmp     lr, #0
        movlt   r5, #1
        movge   r5, #0
        mov     lr, lr, asr #2
        cmp     lr, #0
        bge     LDFH3
        cmn     lr, #2, 18
        mvneq   lr, #0
        addeq   lr, lr, #2, 18
        beq     LDFH3
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDFH3:
        mvn     r7, #0
        add     r7, r7, #2, 20
        and     r7, lr, r7
        movs    lr, r7, asr #8
        moveq   lr, r7, lsl #1
        ldreqsh lr, [r6, +lr]
        beq     LDFH4
        mov     lr, lr, lsl #1
        ldrsh   lr, [r6, +lr]
        add     lr, lr, #8
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDFH4:
        cmp     r7, #0
        moveq   r7, #0x20
        movne   r7, r7, lsl #6
        movne   r7, r7, asr lr
        ldrsh   r8, [r3, #0x38]
        mov     r10, r7, lsl #16
        ldrsh   r9, [r3, #0x48]
        and     r7, r8, #0x3F
        mov     r10, r10, asr #16
        mul     r7, r10, r7
        mov     r8, r8, asr #6
        and     r8, r8, #0xF
        add     lr, lr, r8
        eor     r9, r9, r5
        add     r7, r7, #0x30
        mov     r5, lr, lsl #16
        mov     lr, r9, lsl #16
        mov     r8, r7, asr #4
        mov     r7, r5, asr #16
        cmp     r7, #0x1A
        mov     r8, r8, lsl #16
        mov     r5, r8, asr #9
        rsble   r7, r7, #0x1A
        movle   r7, r5, asr r7
        ble     LDFH5
        mvn     r8, #0
        sub     r7, r7, #0x1A
        add     r8, r8, #2, 18
        and     r7, r8, r5, lsl r7
LDFH5:
        cmp     lr, #0
        mov     r7, r7, lsl #16
        addeq   r2, r2, r7, asr #16
        subne   r2, r2, r7, asr #16
        mov     r2, r2, lsl #16
        subs    r12, r12, #1
        mov     r2, r2, asr #16
        add     r3, r3, #2
        bne     LDFH2
        ldrsh   r3, [r4, #0x34]
        mov     r12, r2, asr #1
        strh    r12, [r4, #0x26]
        cmp     r3, #0
        movlt   lr, #1
        movge   lr, #0
        mov     r3, r3, asr #2
        cmp     r3, #0
        bge     LDFH6
        cmn     r3, #2, 18
        mvneq   r3, #0
        addeq   r3, r3, #2, 18
        beq     LDFH6
        rsb     r3, r3, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH6:
        mvn     r12, #0
        add     r12, r12, #2, 20
        and     r12, r3, r12
        movs    r3, r12, asr #8
        moveq   r3, r12, lsl #1
        ldreqsh r3, [r6, +r3]
        beq     LDFH7
        mov     r3, r3, lsl #1
        ldrsh   r3, [r6, +r3]
        add     r3, r3, #8
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH7:
        cmp     r12, #0
        moveq   r12, #0x20
        movne   r12, r12, lsl #6
        movne   r12, r12, asr r3
        ldrsh   r7, [r4, #0x44]
        mov     r8, r12, lsl #16
        ldrsh   r12, [r4, #0x54]
        and     r5, r7, #0x3F
        mov     r8, r8, asr #16
        mul     r5, r8, r5
        mov     r7, r7, asr #6
        and     r7, r7, #0xF
        eor     lr, r12, lr
        add     r3, r3, r7
        add     r5, r5, #0x30
        mov     r12, r3, lsl #16
        mov     r3, lr, lsl #16
        mov     r5, r5, asr #4
        mov     lr, r12, asr #16
        cmp     lr, #0x1A
        mov     r5, r5, lsl #16
        mov     r12, r5, asr #9
        rsble   lr, lr, #0x1A
        movle   lr, r12, asr lr
        ble     LDFH8
        mvn     r5, #0
        sub     lr, lr, #0x1A
        add     r5, r5, #2, 18
        and     lr, r5, r12, lsl lr
LDFH8:
        cmp     r3, #0
        mov     lr, lr, lsl #16
        addeq   r2, r2, lr, asr #16
        subne   r2, r2, lr, asr #16
        ldrsh   r3, [r4, #0x36]
        cmp     r3, #0
        movlt   r12, #1
        movge   r12, #0
        mov     r3, r3, asr #2
        cmp     r3, #0
        bge     LDFH9
        cmn     r3, #2, 18
        mvneq   r3, #0
        addeq   r3, r3, #2, 18
        beq     LDFH9
        rsb     r3, r3, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH9:
        mvn     lr, #0
        add     lr, lr, #2, 20
        and     lr, r3, lr
        movs    r3, lr, asr #8
        moveq   r3, lr, lsl #1
        ldreqsh r3, [r6, +r3]
        beq     LDFH10
        mov     r3, r3, lsl #1
        ldrsh   r3, [r6, +r3]
        add     r3, r3, #8
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH10:
        cmp     lr, #0
        mov     r3, r3, lsl #16
        moveq   lr, #0x20
        moveq   r3, r3, asr #16
        beq     LDFH11
        mov     lr, lr, lsl #6
        mov     r3, r3, asr #16
        mov     lr, lr, asr r3
LDFH11:
        ldrsh   r7, [r4, #0x46]
        mov     r8, lr, lsl #16
        ldrsh   lr, [r4, #0x56]
        and     r5, r7, #0x3F
        mov     r8, r8, asr #16
        mul     r5, r8, r5
        mov     r7, r7, asr #6
        and     r7, r7, #0xF
        eor     lr, lr, r12
        add     r3, r3, r7
        add     r5, r5, #0x30
        mov     r12, r3, lsl #16
        mov     r3, lr, lsl #16
        mov     r5, r5, asr #4
        mov     lr, r12, asr #16
        cmp     lr, #0x1A
        mov     r5, r5, lsl #16
        mov     r12, r5, asr #9
        rsble   lr, lr, #0x1A
        movle   lr, r12, asr lr
        ble     LDFH12
        mvn     r5, #0
        sub     lr, lr, #0x1A
        add     r5, r5, #2, 18
        and     lr, r5, r12, lsl lr
LDFH12:
        mov     r2, r2, lsl #16
        cmp     r3, #0
        mov     lr, lr, lsl #16
        mov     r2, r2, asr #16
        addeq   lr, r2, lr, asr #16
        subne   lr, r2, lr, asr #16
        ldr     r12, [sp, #0x18]
        mov     r3, lr, lsl #16
        ldrsh   r2, [r12], #2
        mov     r3, r3, asr #17
        str     r12, [sp, #0x18]
        mov     r3, r3, lsl #16
        sub     r2, r2, r3, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mov     r12, r2
        cmp     r12, #0
        bge     LDFH13
        cmn     r12, #2, 18
        mvneq   r2, #0
        addeq   r2, r2, #2, 18
        beq     LDFH13
        rsb     r2, r12, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDFH13:
        bic     lr, r2, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r5, lr, asr #8
        moveq   lr, lr, lsl #1
        ldreqsh lr, [r6, +lr]
        beq     LDFH14
        mov     r5, r5, lsl #1
        ldrsh   lr, [r6, +r5]
        add     lr, lr, #8
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDFH14:
        sub     lr, lr, #1
        mov     r12, r12, asr #15
        mov     r5, lr, lsl #16
        mov     lr, r2, lsl #7
        mov     r2, r5, asr #16
        mov     lr, lr, asr r2
        and     lr, lr, #0x7F
        add     r2, lr, r2, lsl #7
        tst     r12, #1
        sub     r2, r2, r1, asr #2
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        beq     LDFH15
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x24]
        ldr     r5, [lr, +r12, lsl #2]
        b       LDFH16
LDFH15:
        ldr     lr, [sp, #8]
        ldr     r12, [sp, #0x24]
        ldr     r5, [lr, +r12, lsl #2]
LDFH16:
        ldr     r12, [sp, #0x24]
        ldr     lr, [pc, #0x69C]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        cmp     r12, #0
        movle   lr, #0
        ble     LDFH20
        cmp     r12, #6
        movlt   r7, #0
        blt     LDFH18
        ldr     r8, [sp, #0x50]
        mov     r7, #0
LDFH17:
        mov     lr, r7, lsl #1
        ldrsh   r9, [r8, +lr]
        cmp     r9, r2
        ble     LDFH20
        add     lr, r7, #1
        mov     lr, lr, lsl #1
        ldrsh   r9, [r8, +lr]
        cmp     r9, r2
        ble     LDFH20
        add     lr, r7, #2
        mov     lr, lr, lsl #1
        ldrsh   r9, [r8, +lr]
        cmp     r9, r2
        ble     LDFH20
        add     lr, r7, #3
        mov     lr, lr, lsl #1
        ldrsh   r9, [r8, +lr]
        cmp     r9, r2
        ble     LDFH20
        add     lr, r7, #4
        mov     lr, lr, lsl #1
        ldrsh   r9, [r8, +lr]
        cmp     r9, r2
        ble     LDFH20
        add     r7, r7, #5
        sub     lr, r12, #6
        cmp     r7, lr
        ble     LDFH17
LDFH18:
        ldr     r8, [sp, #0x50]
LDFH19:
        mov     lr, r7, lsl #1
        ldrsh   r9, [r8, +lr]
        cmp     r9, r2
        ble     LDFH20
        add     r7, r7, #1
        cmp     r7, r12
        blt     LDFH19
        mov     lr, r7, lsl #1
LDFH20:
        ldr     r2, [sp, #0x34]
        ldrsh   lr, [r5, +lr]
        strb    lr, [r2], #1
        ldr     r12, [sp, #0x3C]
        str     r2, [sp, #0x34]
        mov     r2, lr, lsl #1
        ldrsh   r5, [r12, +r2]
        ldr     r12, [sp, #0x44]
        add     r5, r5, r1, asr #2
        mov     r7, r5, lsl #16
        mov     r12, lr, asr r12
        mov     r5, r12, lsl #16
        movs    r12, r7, asr #16
        mov     r5, r5, asr #16
        str     r5, [sp, #0x1C]
        movmi   r12, #0
        bmi     LDFH21
        and     r5, r12, #0x7F
        mov     r7, r12, asr #7
        and     r12, r7, #0xF
        add     r5, r5, #0x80
        rsb     r12, r12, #0xE
        mov     r5, r5, lsl #7
        mov     r12, r5, asr r12
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDFH21:
        ldr     r5, [sp, #0x40]
        ldr     lr, [r5, +lr, lsl #2]
        sub     lr, lr, r1
        add     lr, r1, lr, asr #5
        mov     lr, lr, lsl #16
        mov     r5, lr, asr #16
        cmp     r5, #0x22, 28
        movlt   r5, #0x22, 28
        blt     LDFH22
        cmp     r5, #5, 22
        mov     lr, #5, 22
        movgt   r5, lr
LDFH22:
        ldr     lr, [r4, #0x1C]
        ldrsh   r7, [r4, #0x24]
        rsb     r8, lr, #0
        add     r8, r5, r8, asr #6
        mov     r8, r8, lsl #16
        cmp     r7, #1
        add     r8, lr, r8, asr #16
        str     r8, [sp, #0x14]
        movne   lr, #0
        strne   lr, [sp]
        beq     LDFH44
LDFH23:
        ldr     lr, [sp, #0x1C]
        cmp     lr, #0
        moveq   lr, r12
        rsbne   lr, r12, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        add     r3, lr, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r8, r3, asr #16
        mov     r3, r8
        mov     r7, r3
        cmp     r7, #0
        bge     LDFH24
        cmn     r7, #2, 18
        mvneq   r3, #0
        addeq   r3, r3, #2, 18
        beq     LDFH24
        rsb     r3, r7, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH24:
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    r9, r3, asr #8
        moveq   r3, r3, lsl #1
        ldreqsh r3, [r6, +r3]
        beq     LDFH25
        mov     r9, r9, lsl #1
        ldrsh   r3, [r6, +r9]
        add     r3, r3, #8
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH25:
        cmp     r7, #0
        moveq   r9, #0x20
        beq     LDFH27
        cmp     r7, #0
        bge     LDFH26
        cmn     r7, #2, 18
        mvneq   r8, #0
        addeq   r8, r8, #2, 18
        beq     LDFH26
        rsb     r8, r7, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDFH26:
        mov     r8, r8, lsl #6
        mov     r9, r8, asr r3
LDFH27:
        bic     r8, r12, #0xFF, 8
        mov     r10, r7, asr #15
        bic     r8, r8, #0xFF, 16
        add     r3, r9, r3, lsl #6
        and     r10, r10, #1
        movs    r7, r8, asr #8
        str     r3, [sp, #0x30]
        str     r10, [sp, #0x2C]
        moveq   r8, r8, lsl #1
        ldreqsh r3, [r6, +r8]
        beq     LDFH28
        mov     r7, r7, lsl #1
        ldrsh   r3, [r6, +r7]
        add     r3, r3, #8
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFH28:
        cmp     r12, #0
        moveq   r8, #0x20
        movne   r7, r12, lsl #6
        movne   r8, r7, asr r3
        ldrsh   r7, [r4, #0x26]
        add     r3, r8, r3, lsl #6
        str     r3, [sp, #0x28]
        add     r7, lr, r7
        mov     r3, r7, lsl #16
        movs    lr, r3, asr #16
        movmi   r0, #1
        movpl   r0, #0
        ldrsh   r3, [r4, #0x34]
        cmp     lr, #0
        strh    r0, [r4, #0x10]
        bne     LDFH29
        ldrsh   lr, [r4, #0x36]
        sub     r3, r3, r3, asr #8
        sub     lr, lr, lr, asr #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDFH31
LDFH29:
        ldrsh   lr, [r4, #0x12]
        ldr     r7, [sp, #0x4C]
        eor     lr, r0, lr
        mov     lr, lr, lsl #16
        cmp     r7, r3
        mov     r7, r3, lsl #2
        movlt   r7, #0xFF, 30
        orrlt   r7, r7, #0x1F, 22
        blt     LDFH30
        cmn     r3, #2, 20
        bgt     LDFH30
        mov     r7, #0xFF
        orr     r7, r7, #0x7F, 24
        sub     r7, r7, #3
        rsb     r7, r7, #0
LDFH30:
        cmp     lr, #0
        rsbeq   r7, r7, #0
        ldrsh   r8, [r4, #0x14]
        teq     r0, r8
        moveq   r9, #1, 18
        mvnne   r8, #0xFF
        bicne   r9, r8, #0x3F, 24
        ldrsh   r8, [r4, #0x36]
        add     r9, r7, r9
        cmp     lr, #0
        mov     r7, r3, asr #8
        mov     r9, r9, asr #7
        sub     lr, r9, r8, asr #7
        add     lr, r8, lr
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        rsbeq   r8, r7, #0xC0
        mvnne   r8, #0xBF
        rsbne   r8, r7, r8
        add     r3, r3, r8
LDFH31:
        mov     r3, r3, lsl #16
        cmn     lr, #3, 20
        mov     r7, r3, asr #16
        bgt     LDFH32
        mvn     r3, #0
        mov     r3, r3, lsl #14
        add     r3, r3, #1, 20
        b       LDFH33
LDFH32:
        mov     r3, #3, 20
        cmp     lr, #3, 20
        movlt   r3, lr
LDFH33:
        sub     lr, r3, #0xF, 22
        rsb     r8, r3, #0xF, 22
        mov     lr, lr, lsl #16
        mov     r8, r8, lsl #16
        mov     lr, lr, asr #16
        cmp     r7, lr
        mov     r8, r8, asr #16
        ble     LDFH34
        cmp     r7, r8
        mov     lr, r8
        movlt   lr, r7
LDFH34:
        cmn     r3, #0x2E, 24
        movge   r7, #0
        movlt   r7, #1
        strh    r3, [r4, #0x36]
        strh    lr, [r4, #0x34]
        strh    r7, [r4, #0x24]
        ldr     r3, [sp, #0x38]
        ldr     r7, [sp]
        ldrsh   lr, [r3, +r2]
        ldrsh   r3, [r4, #0x20]
        ldrsh   r2, [r4, #0x22]
        cmp     r7, #0
        sub     r7, lr, r3
        rsb     lr, r2, lr, lsl #2
        add     lr, r2, lr, asr #7
        add     r7, r3, r7, asr #5
        mov     r2, lr, lsl #16
        mov     r7, r7, lsl #16
        mov     r2, r2, asr #16
        mov     r3, r7, asr #16
        strh    r3, [r4, #0x20]
        strh    r2, [r4, #0x22]
        bne     LDFH40
        cmp     r12, #0
        bne     LDFH35
        ldr     r10, [sp, #0x48]
        ldrsh   r7, [r4, #0x28]
        ldrsh   r12, [r4, #0x2A]
        ldrsh   lr, [r4, #0x2C]
        ldrsh   r8, [r4, #0x2E]
        ldrsh   r9, [r4, #0x30]
        ldrsh   r11, [r4, #0x32]
        sub     r7, r7, r7, asr r10
        sub     r12, r12, r12, asr r10
        sub     lr, lr, lr, asr r10
        sub     r8, r8, r8, asr r10
        sub     r9, r9, r9, asr r10
        sub     r10, r11, r11, asr r10
        strh    r7, [r4, #0x28]
        strh    r12, [r4, #0x2A]
        strh    lr, [r4, #0x2C]
        strh    r8, [r4, #0x2E]
        strh    r9, [r4, #0x30]
        strh    r10, [r4, #0x32]
        b       LDFH37
LDFH35:
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x48]
        add     r2, r4, #0x26
        mov     r3, #6
LDFH36:
        ldrsh   r7, [r2, #0x22]
        eor     r7, r7, r12
        movs    r7, r7, lsl #16
        moveq   r7, #0x80
        mvnne   r7, #0x7F
        ldrsh   r8, [r2, #2]
        subs    r3, r3, #1
        sub     r8, r8, r8, asr lr
        add     r7, r8, r7
        strh    r7, [r2, #2]!
        bne     LDFH36
        ldrsh   r0, [r4, #0x10]
        ldrsh   r3, [r4, #0x20]
        ldrsh   r2, [r4, #0x22]
LDFH37:
        rsb     r3, r2, r3, lsl #2
        cmp     r1, #6, 24
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        blt     LDFH39
        cmp     r3, #0
        bge     LDFH38
        cmn     r3, #2, 18
        mvneq   r1, #0
        addeq   r3, r1, #2, 18
        beq     LDFH38
        rsb     r1, r3, #0
        mov     r1, r1, lsl #16
        mov     r3, r1, asr #16
LDFH38:
        cmp     r3, r2, asr #3
        bge     LDFH39
        ldrsh   r1, [r4, #0x24]
        cmp     r1, #0
        bne     LDFH39
        ldrsh   r2, [r4, #0x1A]
        rsb     r1, r2, #0
        add     r1, r2, r1, asr #4
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        strh    r2, [r4, #0x1A]
        b       LDFH41
LDFH39:
        ldrsh   r2, [r4, #0x1A]
        rsb     r1, r2, #2, 24
        add     r1, r2, r1, asr #4
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        strh    r2, [r4, #0x1A]
        b       LDFH41
LDFH40:
        ldr     r0, [sp, #0x10]
        mov     r1, #8
        bl      _ippsZero_16s
        ldrsh   r0, [r4, #0x10]
        mov     r1, #0
        strh    r1, [r4, #0x24]
        mov     r1, #1, 24
        mov     r2, #1, 24
        strh    r1, [r4, #0x1A]
LDFH41:
        ldrsh   r1, [r4, #0x12]
        ldr     r11, [sp, #0x14]
        str     r1, [sp, #0x54]
        ldrsh   r1, [r4, #0x44]
        str     r1, [sp, #0x58]
        ldrsh   r1, [r4, #0x3E]
        ldrsh   r3, [r4, #0x40]
        str     r1, [sp, #0x5C]
        ldrsh   r1, [r4, #0x38]
        ldrsh   r12, [r4, #0x3C]
        ldrsh   lr, [r4, #0x3A]
        str     r1, [sp, #0x60]
        ldrsh   r1, [r4, #0x54]
        str     r1, [sp, #0x64]
        ldrsh   r7, [r4, #0x50]
        ldrsh   r8, [r4, #0x4E]
        ldrsh   r9, [r4, #0x4C]
        ldrsh   r1, [r4, #0x4A]
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x20]
        ldrsh   r10, [r4, #0x48]
        subs    r1, r1, #1
        str     r1, [sp, #0x20]
        str     r11, [r4, #0x1C]
        strh    r5, [r4, #0x18]
        ldr     r11, [sp, #0x54]
        strh    r0, [r4, #0x12]
        strh    r11, [r4, #0x14]
        ldr     r11, [sp, #0x58]
        strh    r11, [r4, #0x46]
        ldr     r11, [sp, #0x30]
        strh    r3, [r4, #0x42]
        strh    r11, [r4, #0x44]
        ldr     r3, [sp, #0x5C]
        strh    r12, [r4, #0x3E]
        strh    lr, [r4, #0x3C]
        strh    r3, [r4, #0x40]
        ldr     r3, [sp, #0x60]
        strh    r3, [r4, #0x3A]
        ldr     r3, [sp, #0x28]
        strh    r3, [r4, #0x38]
        ldr     r3, [sp, #0x64]
        strh    r3, [r4, #0x56]
        ldr     r3, [sp, #0x2C]
        strh    r7, [r4, #0x52]
        strh    r8, [r4, #0x50]
        strh    r3, [r4, #0x54]
        strh    r9, [r4, #0x4E]
        ldr     r3, [sp, #0x68]
        strh    r10, [r4, #0x4A]
        strh    r3, [r4, #0x4C]
        ldr     r3, [sp, #0x1C]
        strh    r3, [r4, #0x48]
        bne     LDFH0
LDFH42:
        mov     r0, #0
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LDFH43:
        mvn     r0, #5
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LDFH44:
        mov     r8, lr, asr #15
        mov     r7, lr, asr #10
        mov     lr, r8, lsl #16
        and     r7, r7, #0x1F
        mov     lr, lr, asr #16
        cmp     lr, #9
        addle   r7, r7, #0x20
        movle   lr, r7, lsl lr
        movgt   lr, #0x1F, 22
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        add     lr, lr, lr, asr #1
        mov     lr, lr, asr #1
        mov     lr, lr, lsl #16
        cmp     r12, lr, asr #16
        movle   lr, #0
        strle   lr, [sp]
        movgt   lr, #1
        strgt   lr, [sp]
        b       LDFH23
LDFH45:
        mvn     r0, #7
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDFH_quan_lens
        .long   LogTable


        .data
        .align  4


LDFH_asc_tab_map:
        .long   LDFH_asc_tab16_map
        .long   LDFH_asc_tab24_map
        .long   LDFH_asc_tab32_map
        .long   LDFH_asc_tab40_map
LDFH_asc_tab16_map:
        .byte   0x00,0x00,0x00,0x0E,0x00,0x0E,0x00,0x00
LDFH_asc_tab24_map:
        .byte   0x00,0x00,0x00,0x02,0x00,0x04,0x00,0x0E,0x00,0x0E,0x00,0x04,0x00,0x02,0x00,0x00
LDFH_asc_tab32_map:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x06,0x00,0x0E
        .byte   0x00,0x0E,0x00,0x06,0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00
LDFH_asc_tab40_map:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x02,0x00,0x02
        .byte   0x00,0x02,0x00,0x02,0x00,0x04,0x00,0x06,0x00,0x08,0x00,0x0A,0x00,0x0C,0x00,0x0C
        .byte   0x00,0x0C,0x00,0x0C,0x00,0x0A,0x00,0x08,0x00,0x06,0x00,0x04,0x00,0x02,0x00,0x02
        .byte   0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LDFH_sfa_tab_wi:
        .long   LDFH_sfa_tab16_wi
        .long   LDFH_sfa_tab24_wi
        .long   LDFH_sfa_tab32_wi
        .long   LDFH_sfa_tab40_wi
LDFH_sfa_tab16_wi:
        .byte   0x40,0xFD,0xFF,0xFF,0xE0,0x36,0x00,0x00,0xE0,0x36,0x00,0x00,0x40,0xFD,0xFF,0xFF
LDFH_sfa_tab24_wi:
        .byte   0x80,0xFF,0xFF,0xFF,0xC0,0x03,0x00,0x00,0x20,0x11,0x00,0x00,0xC0,0x48,0x00,0x00
        .byte   0xC0,0x48,0x00,0x00,0x20,0x11,0x00,0x00,0xC0,0x03,0x00,0x00,0x80,0xFF,0xFF,0xFF
LDFH_sfa_tab32_wi:
        .byte   0x80,0xFE,0xFF,0xFF,0x40,0x02,0x00,0x00,0x20,0x05,0x00,0x00,0x00,0x08,0x00,0x00
        .byte   0x00,0x0E,0x00,0x00,0xC0,0x18,0x00,0x00,0x60,0x2C,0x00,0x00,0x40,0x8C,0x00,0x00
        .byte   0x40,0x8C,0x00,0x00,0x60,0x2C,0x00,0x00,0xC0,0x18,0x00,0x00,0x00,0x0E,0x00,0x00
        .byte   0x00,0x08,0x00,0x00,0x20,0x05,0x00,0x00,0x40,0x02,0x00,0x00,0x80,0xFE,0xFF,0xFF
LDFH_sfa_tab40_wi:
        .byte   0xC0,0x01,0x00,0x00,0xC0,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0xE0,0x04,0x00,0x00
        .byte   0x00,0x05,0x00,0x00,0x20,0x05,0x00,0x00,0x40,0x07,0x00,0x00,0x80,0x0C,0x00,0x00
        .byte   0xA0,0x11,0x00,0x00,0x60,0x16,0x00,0x00,0x60,0x1B,0x00,0x00,0x00,0x23,0x00,0x00
        .byte   0xC0,0x2C,0x00,0x00,0x00,0x37,0x00,0x00,0x20,0x42,0x00,0x00,0x00,0x57,0x00,0x00
        .byte   0x00,0x57,0x00,0x00,0x20,0x42,0x00,0x00,0x00,0x37,0x00,0x00,0xC0,0x2C,0x00,0x00
        .byte   0x00,0x23,0x00,0x00,0x60,0x1B,0x00,0x00,0x60,0x16,0x00,0x00,0xA0,0x11,0x00,0x00
        .byte   0x80,0x0C,0x00,0x00,0x40,0x07,0x00,0x00,0x20,0x05,0x00,0x00,0x00,0x05,0x00,0x00
        .byte   0xE0,0x04,0x00,0x00,0x00,0x03,0x00,0x00,0xC0,0x01,0x00,0x00,0xC0,0x01,0x00,0x00
LDFH_reconst_dqln:
        .long   LDFH_reconst16_dqln
        .long   LDFH_reconst24_dqln
        .long   LDFH_reconst32_dqln
        .long   LDFH_reconst40_dqln
LDFH_reconst16_dqln:
        .byte   0x74,0x00,0x6D,0x01,0x6D,0x01,0x74,0x00
LDFH_reconst24_dqln:
        .byte   0x00,0xF8,0x87,0x00,0x11,0x01,0x75,0x01,0x75,0x01,0x11,0x01,0x87,0x00,0x00,0xF8
LDFH_reconst32_dqln:
        .byte   0x00,0xF8,0x04,0x00,0x87,0x00,0xD5,0x00,0x11,0x01,0x43,0x01,0x75,0x01,0xA9,0x01
        .byte   0xA9,0x01,0x75,0x01,0x43,0x01,0x11,0x01,0xD5,0x00,0x87,0x00,0x04,0x00,0x00,0xF8
LDFH_reconst40_dqln:
        .byte   0x00,0xF8,0xBE,0xFF,0x1C,0x00,0x68,0x00,0xA9,0x00,0xE0,0x00,0x12,0x01,0x3E,0x01
        .byte   0x66,0x01,0x8B,0x01,0xAD,0x01,0xCB,0x01,0xE8,0x01,0x02,0x02,0x1B,0x02,0x36,0x02
        .byte   0x36,0x02,0x1B,0x02,0x02,0x02,0xE8,0x01,0xCB,0x01,0xAD,0x01,0x8B,0x01,0x66,0x01
        .byte   0x3E,0x01,0x12,0x01,0xE0,0x00,0xA9,0x00,0x68,0x00,0x1C,0x00,0xBE,0xFF,0x00,0xF8
LDFH_quan_levs:
        .long   LDFH_quant16_lev
        .long   LDFH_quant24_lev
        .long   LDFH_quant32_lev
        .long   LDFH_quant40_lev
LDFH_quant16_lev:
        .byte   0x00,0x08,0x05,0x01,0x00,0x00,0x00,0x00
LDFH_quant24_lev:
        .byte   0x00,0x08,0x4B,0x01,0xDA,0x00,0x08,0x00,0x00,0x00,0x00,0x00
LDFH_quant32_lev:
        .byte   0x00,0x08,0x90,0x01,0x5D,0x01,0x2C,0x01,0xF6,0x00,0xB2,0x00,0x50,0x00,0x00,0x00
        .byte   0x84,0xFF,0x00,0x00
LDFH_quant40_lev:
        .byte   0x00,0x08,0x29,0x02,0x10,0x02,0xF6,0x01,0xDB,0x01,0xBD,0x01,0x9D,0x01,0x7A,0x01
        .byte   0x53,0x01,0x2A,0x01,0xFA,0x00,0xC6,0x00,0x8B,0x00,0x44,0x00,0x00,0x00,0xF0,0xFF
        .byte   0x86,0xFF,0x00,0x00
LDFH_quan_inds_pos:
        .long   LDFH_quant16_ind_pos
        .long   LDFH_quant24_ind_pos
        .long   LDFH_quant32_ind_pos
        .long   LDFH_quant40_ind_pos
LDFH_quant16_ind_pos:
        .byte   0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00
LDFH_quant24_ind_pos:
        .byte   0x07,0x00,0x03,0x00,0x02,0x00,0x01,0x00,0x07,0x00,0x07,0x00
LDFH_quant32_ind_pos:
        .byte   0x0F,0x00,0x07,0x00,0x06,0x00,0x05,0x00,0x04,0x00,0x03,0x00,0x02,0x00,0x01,0x00
        .byte   0x01,0x00,0x0F,0x00
LDFH_quant40_ind_pos:
        .byte   0x1F,0x00,0x0F,0x00,0x0E,0x00,0x0D,0x00,0x0C,0x00,0x0B,0x00,0x0A,0x00,0x09,0x00
        .byte   0x08,0x00,0x07,0x00,0x06,0x00,0x05,0x00,0x04,0x00,0x03,0x00,0x02,0x00,0x02,0x00
        .byte   0x01,0x00,0x1F,0x00
LDFH_quan_inds_neg:
        .long   LDFH_quant16_ind_neg
        .long   LDFH_quant24_ind_neg
        .long   LDFH_quant32_ind_neg
        .long   LDFH_quant40_ind_neg
LDFH_quant16_ind_neg:
        .byte   0x03,0x00,0x02,0x00,0x03,0x00,0x03,0x00
LDFH_quant24_ind_neg:
        .byte   0x07,0x00,0x04,0x00,0x05,0x00,0x06,0x00,0x07,0x00,0x07,0x00
LDFH_quant32_ind_neg:
        .byte   0x0F,0x00,0x08,0x00,0x09,0x00,0x0A,0x00,0x0B,0x00,0x0C,0x00,0x0D,0x00,0x0E,0x00
        .byte   0x0E,0x00,0x0F,0x00
LDFH_quant40_ind_neg:
        .byte   0x1F,0x00,0x10,0x00,0x11,0x00,0x12,0x00,0x13,0x00,0x14,0x00,0x15,0x00,0x16,0x00
        .byte   0x17,0x00,0x18,0x00,0x19,0x00,0x1A,0x00,0x1B,0x00,0x1C,0x00,0x1D,0x00,0x1D,0x00
        .byte   0x1E,0x00,0x1F,0x00
LDFH_quan_lens:
        .byte   0x03,0x00,0x05,0x00,0x09,0x00,0x11,0x00


