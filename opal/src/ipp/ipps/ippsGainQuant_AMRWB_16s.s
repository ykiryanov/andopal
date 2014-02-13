        .text
        .align  4
        .globl  _ippsGainQuant_AMRWB_16s


_ippsGainQuant_AMRWB_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x28
        ldr     r7, [sp, #0x48]
        ldr     r6, [sp, #0x4C]
        ldr     r5, [sp, #0x50]
        ldr     r4, [sp, #0x54]
        ldr     lr, [sp, #0x58]
        ldr     r12, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        ldr     r8, [sp, #0x64]
        ldr     r10, [sp, #0x68]
        cmp     r0, #0
        beq     LDIV1
        cmp     r1, #0
        beq     LDIV1
        cmp     r3, #0
        beq     LDIV1
        cmp     r7, #0
        beq     LDIV1
        cmp     r6, #0
        beq     LDIV1
        cmp     r5, #0
        beq     LDIV1
        cmp     r4, #0
        beq     LDIV1
        cmp     lr, #0
        beq     LDIV1
        cmp     r9, #0
        beq     LDIV1
        cmp     r8, #0
        ble     LDIV2
        cmp     r10, #5
        beq     LDIV0
        cmp     r10, #9
        beq     LDIV0
        cmp     r10, #0xD
        beq     LDIV0
        cmp     r10, #0xF
        beq     LDIV0
        cmp     r10, #0x10
        beq     LDIV0
        cmp     r10, #0x12
        beq     LDIV0
        cmp     r10, #0x13
        beq     LDIV0
        cmp     r10, #0x14
        beq     LDIV0
        cmp     r10, #0x15
        beq     LDIV0
        cmp     r10, #0x19
        beq     LDIV0
        mvn     r0, #6
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r10, pc}
LDIV0:
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r10, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r4, [sp, #0xC]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
        bl      LDIV_ownGainQuant_WB_WBE_16s
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r10, pc}
LDIV1:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r10, pc}
LDIV2:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r10, pc}
LDIV_ownGainQuant_WB_WBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x78
        ldr     r5, [sp, #0xA8]
        ldr     r8, [sp, #0xBC]
        ldr     r6, [sp, #0x9C]
        ldr     r9, [sp, #0xA4]
        ldr     r7, [sp, #0xB0]
        add     r12, sp, #0x3C
        and     lr, r12, #0xF
        ldr     r12, [sp, #0xA0]
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #0xAC]
        rsb     lr, lr, #0
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0xB4]
        str     r5, [sp, #8]
        ldr     r5, [sp, #0xB8]
        add     r4, sp, #0x3C
        and     lr, lr, #0xF
        cmp     r8, #5
        str     lr, [sp, #0x1C]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x2C]
        mov     r10, r2
        str     r3, [sp, #0x30]
        add     r4, r4, lr
        beq     LDIV35
        cmp     r8, #9
        beq     LDIV35
        cmp     r8, #0x19
        beq     LDIV35
        cmp     r8, #0x1A
        beq     LDIV34
        ldr     lr, [pc, #0x92C]
        ldr     r11, [pc, #0x92C]
        cmp     r7, #1
        str     lr, [sp, #0xC]
        str     r11, [sp, #0x34]
        add     lr, r11, #0x80
        moveq   r0, #0x25
        movne   r0, #0x40
        ldr     r7, [sp, #0x10]
        ldrsh   r11, [r7]
        ldr     r7, [sp, #0x34]
        ldrsh   r7, [r7, #0x80]
        cmp     r11, r7
        ble     LDIV7
        cmp     r0, #6
        movlt   r7, #0
        blt     LDIV4
        mov     r7, #0
LDIV3:
        mov     r1, r7, lsl #2
        ldrsh   r1, [lr, +r1]
        cmp     r11, r1
        ble     LDIV6
        add     r7, r7, #1
        mov     r1, r7, lsl #2
        ldrsh   r1, [lr, +r1]
        cmp     r11, r1
        ble     LDIV6
        add     r7, r7, #1
        mov     r1, r7, lsl #2
        ldrsh   r1, [lr, +r1]
        cmp     r11, r1
        ble     LDIV6
        add     r7, r7, #1
        mov     r1, r7, lsl #2
        ldrsh   r1, [lr, +r1]
        cmp     r11, r1
        ble     LDIV6
        add     r7, r7, #1
        mov     r1, r7, lsl #2
        ldrsh   r1, [lr, +r1]
        cmp     r11, r1
        ble     LDIV6
        add     r7, r7, #1
        sub     r1, r0, #6
        cmp     r7, r1
        ble     LDIV3
LDIV4:
        add     lr, lr, r7, lsl #2
LDIV5:
        ldrsh   r1, [lr], #4
        cmp     r11, r1
        ble     LDIV6
        add     r7, r7, #1
        cmp     r7, r0
        blt     LDIV5
LDIV6:
        mov     lr, #0x40
        str     lr, [sp, #0x24]
        b       LDIV8
LDIV7:
        mov     lr, #0x40
        mov     r7, #0
        str     lr, [sp, #0x24]
LDIV8:
        ldrsh   lr, [r12, #2]
        ldrsh   r0, [r12, #4]
        ldrsh   r11, [r12]
        str     lr, [sp, #0x14]
        mvn     lr, #0
        cmn     r0, #2, 18
        strh    r11, [r4, #2]
        addeq   r11, lr, #2, 18
        beq     LDIV9
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
LDIV9:
        ldrsh   r12, [r12, #6]
        add     r3, sp, #0x74
        str     r12, [sp, #0x18]
        strh    r11, [r4, #6]
        str     lr, [sp]
        mov     r2, r5
        mov     r1, r6
        mov     r0, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x74]
        cmn     r12, #6, 2
        addne   r12, r12, #1
        strne   r12, [sp, #0x74]
        cmp     r12, #0
        moveq   r11, #0
        beq     LDIV13
        movs    lr, r12, asr #16
        bne     LDIV10
        bic     lr, r12, #0xFF, 8
        bic     r11, lr, #0xFF, 16
        movs    r0, r11, asr #8
        ldrne   lr, [pc, #0x7C4]
        movne   r11, r0, lsl #1
        ldreq   lr, [pc, #0x7C0]
        moveq   r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        add     lr, r11, #0x10
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
        b       LDIV12
LDIV10:
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r11, lr, asr #8
        bne     LDIV11
        ldr     r11, [pc, #0x794]
        mov     lr, lr, lsl #1
        ldrsh   r11, [r11, +lr]
        b       LDIV12
LDIV11:
        ldr     lr, [pc, #0x780]
        mov     r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
LDIV12:
        mov     r12, r12, lsl r11
        str     r12, [sp, #0x74]
LDIV13:
        rsb     lr, r11, #0xC
        mov     r12, r12, asr #16
        strh    r12, [r4, #0xA]
        mov     lr, lr, lsl #16
        mvn     r12, #0
        mov     r11, lr, asr #16
        strh    r11, [sp, #0x70]
        str     r12, [sp]
        ldr     r0, [sp, #0x38]
        add     r3, sp, #0x74
        mov     r2, r5
        mov     r1, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x74]
        add     r11, r11, r10, lsl #1
        str     r11, [sp, #0x38]
        cmn     r12, #6, 2
        addne   r12, r12, #1
        strne   r12, [sp, #0x74]
        cmp     r12, #0
        mov     r11, r12
        moveq   r11, #0
        beq     LDIV17
        cmn     r12, #1
        beq     LDIV30
        cmp     r12, #0
        mvnlt   r11, r12
        cmp     r11, #0
        moveq   r11, #0
        beq     LDIV16
        movs    lr, r11, lsr #16
        bne     LDIV14
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        movs    r0, r11, asr #8
        ldrne   lr, [pc, #0x6E0]
        movne   r11, r0, lsl #1
        ldreq   lr, [pc, #0x6DC]
        moveq   r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        add     lr, r11, #0x10
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
        b       LDIV16
LDIV14:
        movs    r11, r11, lsr #24
        bne     LDIV15
        ldr     r11, [pc, #0x6B8]
        mov     lr, lr, lsl #1
        ldrsh   r11, [r11, +lr]
        b       LDIV16
LDIV15:
        ldr     lr, [pc, #0x6A4]
        mov     r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
LDIV16:
        mov     r12, r12, lsl r11
        str     r12, [sp, #0x74]
LDIV17:
        rsb     r11, r11, #0x16
        cmp     r12, #2, 2
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        strh    r11, [sp, #0x70]
        mvneq   r12, #2, 2
        rsbne   r12, r12, #0
        mov     r12, r12, asr #16
        strh    r12, [r4, #0xE]
        mvn     r12, #0
        str     r12, [sp]
        ldr     r0, [sp, #0x2C]
        add     r3, sp, #0x74
        mov     r2, r5
        mov     r1, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r0, [sp, #0x74]
        add     r11, r11, r10
        str     r11, [sp, #0x2C]
        cmn     r0, #6, 2
        addne   r0, r0, #1
        strne   r0, [sp, #0x74]
        cmp     r0, #0
        mov     r12, r0
        moveq   r1, #0
        beq     LDIV21
        cmn     r0, #1
        beq     LDIV31
        cmp     r0, #0
        mvnlt   r12, r0
        cmp     r12, #0
        moveq   r1, #0
        beq     LDIV20
        movs    r1, r12, lsr #16
        bne     LDIV18
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        ldrne   r1, [pc, #0x5F8]
        movne   r12, lr, lsl #1
        ldreq   r1, [pc, #0x5F4]
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r1, +r12]
        add     r1, r12, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDIV20
LDIV18:
        movs    r12, r12, lsr #24
        bne     LDIV19
        ldr     r12, [pc, #0x5D0]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r12, +r1]
        b       LDIV20
LDIV19:
        ldr     r1, [pc, #0x5BC]
        mov     r12, r12, lsl #1
        ldrsh   r1, [r1, +r12]
LDIV20:
        mov     r0, r0, lsl r1
        str     r0, [sp, #0x74]
LDIV21:
        rsb     r1, r1, #0x16
        mov     r0, r0, asr #16
        strh    r0, [r4, #0x12]
        mov     r1, r1, lsl #16
        add     r3, sp, #0x74
        mov     r6, r1, asr #16
        strh    r6, [sp, #0x70]
        mvn     r0, #0
        str     r0, [sp]
        ldr     r0, [sp, #0x20]
        mov     r2, r5
        mov     r1, r0
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r0, [sp, #0x74]
        add     r10, r6, r10
        str     r10, [sp, #0x28]
        cmn     r0, #6, 2
        addne   r0, r0, #1
        strne   r0, [sp, #0x74]
        cmp     r0, #0
        moveq   r5, #0
        beq     LDIV25
        movs    r1, r0, asr #16
        bne     LDIV22
        bic     r1, r0, #0xFF, 8
        bic     r2, r1, #0xFF, 16
        movs    r12, r2, asr #8
        ldrne   r1, [pc, #0x53C]
        movne   r2, r12, lsl #1
        ldreq   r1, [pc, #0x538]
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r1, r2, #0x10
        mov     r1, r1, lsl #16
        mov     r5, r1, asr #16
        b       LDIV24
LDIV22:
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    r2, r1, asr #8
        bne     LDIV23
        ldr     r2, [pc, #0x50C]
        mov     r1, r1, lsl #1
        ldrsh   r5, [r2, +r1]
        b       LDIV24
LDIV23:
        ldr     r1, [pc, #0x4F8]
        mov     r2, r2, lsl #1
        ldrsh   r5, [r1, +r2]
LDIV24:
        mov     r0, r0, lsl r5
        str     r0, [sp, #0x74]
LDIV25:
        add     r2, sp, #0x6C
        add     r1, sp, #0x70
        bl      ownLog2
        ldrsh   r1, [sp, #0x6C]
        ldrsh   r0, [sp, #0x70]
        mvn     r6, #0x18
        mov     r12, #0x54
        rsb     r6, r5, r6
        add     r2, r0, r6
        orr     r12, r12, #6, 20
        rsb     r12, r12, #0
        mul     r1, r1, r12
        mov     r2, r2, lsl #16
        cmp     r8, #0x1A
        mov     r2, r2, asr #16
        mul     r12, r2, r12
        strh    r2, [sp, #0x70]
        ldrsh   r0, [r9]
        add     r1, r12, r1, asr #15
        mov     lr, r1, lsl #1
        beq     LDIV32
        ldr     r1, [pc, #0x498]
        ldrsh   r12, [r9, #2]
        ldrsh   r2, [r9, #4]
        ldrsh   r5, [r1]
        add     r6, lr, #0x1E, 18
        ldrsh   lr, [r1, #2]
        mov     r6, r6, lsl #9
        mla     r6, r5, r0, r6
        ldrsh   r5, [r1, #4]
        ldrsh   r0, [r9, #6]
        ldrsh   r1, [r1, #6]
        mla     r6, lr, r12, r6
        mla     r6, r5, r2, r6
        mla     r6, r1, r0, r6
        mov     r0, r6, asr #15
LDIV26:
        mov     r0, r0, lsl #16
        mov     r1, #0x43
        mov     r0, r0, asr #16
        orr     r1, r1, #0x15, 24
        mul     r1, r0, r1
        mvn     lr, #0
        str     lr, [sp, #0x20]
        add     r5, lr, #2, 18
        str     r1, [sp, #0x74]
        mov     r2, r1, asr #23
        and     r1, r5, r1, asr #8
        strh    r1, [sp, #0x6C]
        ldr     r0, [sp, #0x14]
        sub     r2, r2, #0xA
        sub     r10, r0, #0xD
        ldr     r0, [sp, #0x18]
        mov     r2, r2, lsl #16
        mov     r10, r10, lsl #16
        mov     r6, r2, asr #16
        sub     r0, r0, #0xD
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x38]
        add     r11, r0, r6, lsl #1
        mov     r0, #0xE
        bl      ownPow2
        ldrsh   r1, [r4, #2]
        mov     r2, r10, asr #16
        add     r12, sp, #0x60
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x18]
        strh    r2, [r12]
        add     r12, sp, #0x60
        ldrsh   lr, [r12]
        mov     r1, r1, lsl #16
        add     r12, sp, #0x60
        add     r11, r11, #0xF
        mov     r1, r1, asr #16
        strh    r1, [r12, #2]
        add     r12, sp, #0x60
        ldrsh   r10, [r12, #2]
        ldr     r12, [sp, #0x2C]
        cmp     r2, r1
        mov     r3, r11, lsl #16
        ldr     r11, [sp, #0x28]
        movgt   r1, r2
        mov     r3, r3, asr #16
        add     r2, sp, #0x60
        strh    r3, [r2, #4]
        add     r11, r11, r6
        add     r11, r11, #1
        add     r2, sp, #0x60
        ldrsh   r2, [r2, #4]
        add     r12, r12, r6
        str     r2, [sp, #0x2C]
        mov     r2, r11, lsl #16
        mov     r12, r12, lsl #16
        add     r11, sp, #0x60
        mov     r12, r12, asr #16
        strh    r12, [r11, #6]
        cmp     r3, r12
        movgt   r12, r3
        mov     r2, r2, asr #16
        cmp     r2, r12
        add     r11, sp, #0x60
        ldrsh   r11, [r11, #6]
        movgt   r12, r2
        cmp     r1, r12
        str     r11, [sp, #0x28]
        movgt   r12, r1
        sub     lr, r12, lr
        add     r11, lr, #2
        mov     r1, #0x1F
        cmp     r11, #0x1F
        movgt   r11, r1
        add     r1, sp, #0x60
        strh    r2, [r1, #8]
        sub     r10, r12, r10
        add     r1, sp, #0x60
        ldrsh   lr, [r1, #8]
        ldr     r1, [sp, #0x38]
        add     r3, sp, #0x3C
        mov     r2, r1, lsl #16
        mov     r11, r2, asr r11
        add     r1, r10, #2
        cmp     r1, #0x1F
        mov     r2, #0x1F
        movgt   r1, r2
        ldr     r2, [sp, #0x2C]
        and     r10, r5, r11, asr #1
        mov     r11, r11, asr #16
        strh    r11, [r4, #2]
        ldr     r11, [sp, #0x1C]
        mov     r10, r10, lsl #16
        sub     r2, r12, r2
        add     r2, r2, #2
        mov     r10, r10, asr #19
        strh    r10, [r11, +r3]
        ldrsh   r10, [r4, #6]
        cmp     r2, #0x1F
        mov     r3, #0x1F
        str     r10, [sp, #0x38]
        ldrsh   r10, [r4, #0xA]
        str     r10, [sp, #0x2C]
        ldrsh   r10, [r4, #0xE]
        ldrsh   r11, [r4, #0x12]
        mov     r10, r10, lsl #16
        str     r11, [sp, #0x1C]
        mov     r11, #0x1F
        movgt   r2, r11
        ldr     r11, [sp, #0x28]
        sub     r11, r12, r11
        add     r11, r11, #2
        cmp     r11, #0x1F
        movgt   r11, r3
        str     r11, [sp, #0x28]
        sub     r12, r12, lr
        add     r11, r12, #2
        cmp     r11, #0x1F
        mov     r12, #0x1F
        movgt   r11, r12
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x2C]
        mov     r3, r12, lsl #16
        ldr     r12, [sp, #0x38]
        str     r0, [sp, #0x38]
        mov     lr, lr, lsl #16
        mov     r11, r3, asr r11
        mov     r12, r12, lsl #16
        mov     r1, r12, asr r1
        ldr     r12, [sp, #0x28]
        mov     r2, lr, asr r2
        str     r11, [sp, #0x74]
        and     lr, r5, r1, asr #1
        mov     r10, r10, asr r12
        and     r0, r5, r2, asr #1
        and     r12, r5, r10, asr #1
        and     r5, r5, r11, asr #1
        mov     r3, lr, lsl #16
        mov     lr, r5, lsl #16
        mov     r0, r0, lsl #16
        mov     r5, r1, asr #16
        mov     r1, r3, asr #19
        mov     r12, r12, lsl #16
        mov     r0, r0, asr #19
        strh    r0, [r4, #8]
        strh    r1, [r4, #4]
        mov     r2, r2, asr #16
        strh    r2, [r4, #0xA]
        mov     r3, r11, asr #16
        strh    r5, [r4, #6]
        mov     r12, r12, asr #19
        mov     lr, lr, asr #19
        strh    r3, [r4, #0x12]
        mov     r10, r10, asr #16
        strh    r12, [r4, #0xC]
        strh    lr, [r4, #0x10]
        strh    r10, [r4, #0xE]
        ldr     r0, [sp, #0x24]
        mov     r3, r4
        str     r0, [sp]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x38]
        add     r2, r1, r7, lsl #1
        ldr     r1, [sp, #0x30]
        mov     r0, r0, lsl #16
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x34]
        mov     r5, r0, asr #16
        mov     r0, r5
        add     r1, r1, r7, lsl #2
        bl      ownWeightedMSE_AMRWB
        ldr     r1, [sp, #0x30]
        cmp     r6, #0
        ldrsh   r2, [r1]
        add     r2, r7, r2
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        strh    r2, [r1]
        mov     r3, r2, lsl #2
        ldr     r2, [sp, #0x34]
        ldr     r12, [sp, #0x10]
        ldrsh   r3, [r2, +r3]
        strh    r3, [r12]
        ldrsh   r1, [r1]
        add     r1, r2, r1, lsl #2
        ldrsh   r0, [r1, #2]
        mul     r5, r5, r0
        blt     LDIV27
        add     r6, r6, #1
        bic     r6, r6, #0xFF, 8
        bic     r2, r6, #0xFF, 16
        mvn     r3, #2, 2
        cmp     r5, r3, asr r2
        mov     r1, #2, 2
        movgt   r1, r3
        bgt     LDIV28
        cmp     r5, r1, asr r2
        movge   r1, r5, lsl r2
        b       LDIV28
LDIV27:
        ldr     r1, [sp, #0x20]
        rsb     r1, r6, r1
        mov     r1, r5, asr r1
LDIV28:
        ldr     r2, [sp, #8]
        cmp     r8, #0x1A
        str     r1, [r2]
        beq     LDIV29
        add     r2, sp, #0x6C
        add     r1, sp, #0x70
        str     r0, [sp, #0x74]
        bl      ownLog2
        ldrsh   r2, [sp, #0x70]
        ldrsh   r0, [sp, #0x6C]
        ldrsh   r1, [r9, #4]
        sub     r3, r2, #0xB
        mov     r2, #0x54
        orr     r2, r2, #6, 20
        mul     r0, r0, r2
        mov     r3, r3, lsl #16
        strh    r1, [r9, #6]
        mov     r3, r3, asr #16
        mul     r2, r3, r2
        ldrsh   r3, [r9, #2]
        ldrsh   r1, [r9]
        add     r0, r2, r0, asr #15
        strh    r3, [r9, #4]
        mov     r0, r0, lsl #1
        strh    r1, [r9, #2]
        mov     r0, r0, asr #3
        strh    r0, [r9]
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
LDIV29:
        ldr     r1, [sp, #0x10]
        strh    r0, [r1, #2]
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
LDIV30:
        mov     r12, #2, 2
        mov     r11, #0x1F
        str     r12, [sp, #0x74]
        b       LDIV17
LDIV31:
        mov     r0, #2, 2
        mov     r1, #0x1F
        str     r0, [sp, #0x74]
        b       LDIV21
LDIV32:
        mvn     r1, #0
        add     r0, lr, r0, lsl #7
        add     r1, r1, #2, 12
        cmp     r1, r0
        mvnlt   r0, #2, 2
        blt     LDIV33
        cmn     r0, #2, 12
        movge   r0, r0, lsl #10
        movlt   r0, #2, 2
LDIV33:
        mov     r0, r0, asr #16
        b       LDIV26
LDIV34:
        ldr     lr, [pc, #0x58]
        mov     r7, #0
        str     lr, [sp, #0x34]
        ldr     lr, [pc, #0x48]
        str     lr, [sp, #0xC]
        mov     lr, #0x80
        str     lr, [sp, #0x24]
        b       LDIV8
LDIV35:
        ldr     r11, [pc, #0x34]
        ldr     lr, [pc, #0x44]
        cmp     r7, #1
        add     r11, r11, #1, 24
        str     r11, [sp, #0xC]
        str     lr, [sp, #0x34]
        beq     LDIV36
        mov     lr, #0x40
        mov     r7, #0
        str     lr, [sp, #0x24]
        b       LDIV8
LDIV36:
        mov     lr, #0x30
        mov     r7, #0
        str     lr, [sp, #0x24]
        b       LDIV8
        .long   LDIV_pitchSq7
        .long   gain_sq7Tbl
        .long   NormTable
        .long   NormTable2
        .long   predTbl
        .long   gain_sq6Tbl


        .data
        .align  4


LDIV_pitchSq7:
        .byte   0x01,0x00,0x07,0x00,0x17,0x00,0x23,0x00,0x32,0x00,0x53,0x00,0x68,0x00,0x69,0x00
        .byte   0x79,0x00,0xA9,0x00,0xD8,0x00,0xDF,0x00,0xE0,0x00,0x38,0x01,0x75,0x01,0x99,0x01
        .byte   0xE4,0x01,0x1E,0x02,0x53,0x02,0xA1,0x02,0x72,0x03,0x75,0x03,0xA1,0x03,0xB2,0x03
        .byte   0xCC,0x03,0xD6,0x03,0x3B,0x04,0x16,0x05,0x85,0x05,0x8B,0x05,0xBD,0x05,0x50,0x06
        .byte   0x5D,0x06,0xA5,0x06,0x85,0x07,0xA5,0x07,0xA5,0x07,0x44,0x08,0x49,0x08,0x0A,0x09
        .byte   0xA2,0x09,0xB9,0x09,0x31,0x0A,0x46,0x0A,0x1C,0x0B,0x79,0x0B,0x35,0x0C,0x44,0x0C
        .byte   0x83,0x0C,0xBC,0x0C,0x10,0x0D,0x86,0x0D,0x4C,0x0E,0x58,0x0E,0xF6,0x0E,0x4A,0x0F
        .byte   0x84,0x10,0xB5,0x10,0xFF,0x10,0x09,0x11,0x18,0x11,0x1A,0x11,0x20,0x11,0x71,0x12
        .byte   0xE8,0x12,0x09,0x13,0x1A,0x13,0xCB,0x13,0x19,0x14,0x9A,0x14,0xD9,0x14,0x38,0x15
        .byte   0x67,0x15,0xE2,0x15,0x12,0x16,0x3A,0x16,0xA5,0x16,0xED,0x16,0x20,0x18,0x25,0x18
        .byte   0x4D,0x18,0xDA,0x18,0xE5,0x18,0xEB,0x18,0x15,0x1A,0x2D,0x1A,0x76,0x1A,0xE2,0x1A
        .byte   0xFE,0x1A,0x12,0x1B,0x4A,0x1C,0x4A,0x1C,0xE6,0x1C,0x56,0x1D,0x5A,0x1D,0x61,0x1D
        .byte   0xA7,0x1D,0x04,0x1E,0x67,0x1E,0x7A,0x1F,0xD2,0x1F,0x28,0x20,0x63,0x20,0x92,0x20
        .byte   0xEE,0x20,0xCD,0x21,0x93,0x22,0x96,0x22,0xD3,0x22,0xF4,0x22,0xE4,0x23,0xFC,0x23
        .byte   0xC9,0x24,0xF7,0x24,0x17,0x25,0x46,0x27,0x79,0x27,0x7F,0x27,0x98,0x29,0xB8,0x2A
        .byte   0x45,0x2C,0x7C,0x2C,0x25,0x2D,0x0C,0x2E,0x91,0x2E,0x44,0x2F,0xE0,0x2F,0xC0,0x35
LDIV_pitchSq6:
        .byte   0x4B,0x00,0x4C,0x00,0x20,0x01,0x19,0x02,0x69,0x02,0x01,0x03,0xB8,0x03,0xE8,0x03
        .byte   0xF7,0x04,0x64,0x05,0xFD,0x06,0xC4,0x07,0x14,0x08,0x4A,0x09,0x4F,0x0B,0x95,0x0B
        .byte   0x21,0x0C,0x81,0x0C,0x0F,0x0E,0x47,0x0F,0x8A,0x0F,0x29,0x10,0x5E,0x10,0x12,0x12
        .byte   0xB2,0x12,0xD9,0x12,0xEE,0x12,0xAF,0x14,0x0A,0x15,0x76,0x15,0x98,0x15,0x3B,0x16
        .byte   0xBD,0x17,0xD9,0x17,0xCE,0x18,0xD3,0x18,0xE0,0x18,0x82,0x19,0x53,0x1A,0x67,0x1B
        .byte   0x93,0x1B,0xE7,0x1B,0xB5,0x1C,0x3F,0x1D,0x9B,0x1D,0x49,0x1E,0x98,0x1E,0xD9,0x1E
        .byte   0x8A,0x20,0xC1,0x20,0x06,0x22,0x12,0x22,0x52,0x23,0xF8,0x24,0x2D,0x26,0x59,0x27
        .byte   0x9E,0x27,0x46,0x29,0xD0,0x29,0xA8,0x2B,0xF8,0x2C,0x14,0x2D,0x19,0x2D,0x78,0x31


