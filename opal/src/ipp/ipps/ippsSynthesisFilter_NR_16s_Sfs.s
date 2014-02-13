        .text
        .align  4
        .globl  _ippsSynthesisFilter_NR_16s_Sfs


_ippsSynthesisFilter_NR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r12, [sp, #0x78]
        ldr     lr, [sp, #0x7C]
        cmp     r0, #0
        beq     LDTT31
        cmp     r1, #0
        beq     LDTT31
        cmp     r2, #0
        beq     LDTT31
        cmp     r3, #0
        ble     LDTT32
        cmp     r12, #0xC
        blt     LDTT13
        cmp     r12, #0xD
        bgt     LDTT13
        cmp     lr, #0
        mov     r4, #0
        mov     r6, #0xB
        sub     r5, r12, #1
        beq     LDTT23
        adds    r9, lr, #0x14
        beq     LDTT16
        cmp     r3, #0
        movle   r10, r4
        ble     LDTT11
        mvn     r7, #0
        mov     r10, r4
        mov     r11, r7, lsl #15
        add     r8, r7, #2, 18
        mov     r7, r2
        str     r10, [sp, #0x4C]
        str     r11, [sp, #0x48]
        str     r9, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x2C]
LDTT0:
        ldrsh   r9, [r1], #2
        ldrsh   lr, [r0]
        rsb     r12, r6, #0xB
        str     r12, [sp, #0x38]
        cmp     r12, #1
        mul     r10, lr, r9
        blt     LDTT15
        rsb     r12, r6, #0xA
        cmp     r12, #6
        blt     LDTT14
        rsb     r11, r6, #5
        str     r11, [sp, #0x3C]
        add     r11, r0, #2
        str     r11, [sp, #0x40]
        str     r8, [sp, #8]
        str     r5, [sp, #0x1C]
        ldr     r5, [sp, #0x40]
        ldr     r8, [sp, #0x3C]
        mov     r9, #0
        mov     r12, #1
        add     lr, r2, r4, lsl #1
        str     r1, [sp, #0x20]
        str     r7, [sp]
        str     r10, [sp, #4]
        str     r6, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r0, [sp, #0xC]
LDTT1:
        rsb     r0, r12, #0
        ldrsh   r11, [r5]
        ldrsh   r3, [r5, #2]
        ldrsh   r2, [r5, #4]
        ldrsh   r7, [r5, #6]
        ldrsh   r6, [r5, #8]
        mov     r0, r0, lsl #1
        ldrsh   r10, [lr, +r0]
        mvn     r0, #0
        rsb     r0, r12, r0
        mvn     r1, #1
        mla     r9, r11, r10, r9
        mov     r0, r0, lsl #1
        ldrsh   r10, [lr, +r0]
        rsb     r1, r12, r1
        mvn     r0, #2
        mla     r9, r3, r10, r9
        mov     r1, r1, lsl #1
        ldrsh   r3, [lr, +r1]
        rsb     r1, r12, r0
        mvn     r0, #3
        mla     r9, r2, r3, r9
        mov     r1, r1, lsl #1
        ldrsh   r1, [lr, +r1]
        rsb     r0, r12, r0
        add     r5, r5, #0xA
        mla     r9, r7, r1, r9
        mov     r0, r0, lsl #1
        ldrsh   r0, [lr, +r0]
        add     r12, r12, #5
        cmp     r12, r8
        mla     r9, r6, r0, r9
        ble     LDTT1
        ldr     r1, [sp, #0x20]
        ldr     r7, [sp]
        ldr     r10, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT2:
        add     r11, r0, r12, lsl #1
        str     r11, [sp, #0x44]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0xC]
LDTT3:
        rsb     r11, r12, #0
        ldrsh   r0, [r3], #2
        mov     r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        add     r12, r12, #1
        cmp     r12, r2
        mla     r9, r0, r11, r9
        ble     LDTT3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT4:
        cmp     r6, #1
        ble     LDTT8
        sub     r11, r6, #1
        cmp     r11, #6
        movlt   r11, #1
        strlt   r11, [sp, #0x50]
        blt     LDTT6
        mov     r11, #1
        str     r11, [sp, #0x50]
        sub     r11, r6, #6
        str     r11, [sp, #0x44]
        add     r11, r0, r12, lsl #1
        str     r11, [sp, #0x40]
        mov     r11, #2
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x30]
        str     r4, [sp, #0x24]
        ldr     r4, [sp, #0x50]
        add     r11, r11, #0x10
        str     r11, [sp, #0x38]
        str     r1, [sp, #0x20]
        str     lr, [sp, #0x28]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        ldr     lr, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x40]
        ldr     r1, [sp, #0x34]
        str     r7, [sp]
        str     r10, [sp, #4]
        str     r8, [sp, #8]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r0, [sp, #0xC]
LDTT5:
        sub     r0, r1, r3
        ldrsh   r8, [r0]
        ldrsh   r7, [r2]
        ldrsh   r6, [lr]
        ldrsh   r5, [r2, #2]
        ldrsh   r0, [lr, #-2]
        mla     r11, r7, r8, r9
        ldrsh   r7, [r2, #4]
        ldrsh   r8, [lr, #-4]
        ldrsh   r9, [r2, #6]
        ldrsh   r10, [lr, #-6]
        mla     r11, r5, r6, r11
        ldrsh   r5, [r2, #8]
        add     r2, r2, #0xA
        add     r12, r12, #5
        add     r3, r3, #0xA
        mla     r11, r7, r0, r11
        ldr     r0, [sp, #0x44]
        sub     lr, lr, #0xA
        add     r4, r4, #5
        cmp     r4, r0
        mla     r11, r9, r8, r11
        mla     r9, r5, r10, r11
        ble     LDTT5
        str     r4, [sp, #0x50]
        ldr     r4, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     lr, [sp, #0x28]
        ldr     r7, [sp]
        ldr     r10, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT6:
        ldr     r11, [sp, #0x50]
        add     r12, r0, r12, lsl #1
        str     r5, [sp, #0x1C]
        mov     r11, r11, lsl #1
        str     r11, [sp, #0x44]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r0, [sp, #0xC]
        ldr     r2, [sp, #0x44]
        ldr     r0, [sp, #0x50]
        ldr     r3, [sp, #0x34]
LDTT7:
        sub     r11, r3, r2
        ldrsh   r5, [r12], #2
        ldrsh   r11, [r11]
        add     r0, r0, #1
        cmp     r0, r6
        mla     r9, r5, r11, r9
        add     r2, r2, #2
        blt     LDTT7
        ldr     r5, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT8:
        sub     r10, r10, r9
        mov     r12, #1
        add     r10, r10, r12, lsl r5
        ldr     r12, [sp, #0x2C]
        mov     r12, r10, asr r12
        cmp     r8, r12
        bge     LDTT9
        strh    r8, [r7]
        mov     r12, #1
        str     r12, [sp, #0x4C]
        b       LDTT10
LDTT9:
        cmn     r12, #2, 18
        strgeh  r12, [lr]
        bge     LDTT10
        ldr     r12, [sp, #0x48]
        strh    r12, [r7]
        mov     r12, #1
        str     r12, [sp, #0x4C]
LDTT10:
        cmp     r6, #1
        subgt   r6, r6, #1
        add     r4, r4, #1
        cmp     r4, r3
        add     r7, r7, #2
        blt     LDTT0
        ldr     r10, [sp, #0x4C]
LDTT11:
        cmp     r10, #0
        beq     LDTT12
        mov     r0, #0xC
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDTT12:
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDTT13:
        mvn     r0, #0xC
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDTT14:
        mov     r9, #0
        mov     r12, #1
        add     lr, r2, r4, lsl #1
        b       LDTT2
LDTT15:
        mov     r9, #0
        mov     r12, #1
        add     lr, r2, r4, lsl #1
        b       LDTT4
LDTT16:
        cmp     r3, #0
        movle   r10, r4
        ble     LDTT11
        mov     r10, r2
LDTT17:
        ldrsh   lr, [r0]
        ldrsh   r7, [r1], #2
        mul     r9, lr, r7
        rsb     lr, r6, #0xB
        cmp     lr, #1
        str     lr, [sp, #8]
        movlt   lr, #0
        blt     LDTT21
        rsb     lr, r6, #0xA
        cmp     lr, #6
        blt     LDTT22
        rsb     r11, r6, #5
        str     r11, [sp]
        add     r11, r0, #2
        str     r11, [sp, #4]
        str     r9, [sp, #0x4C]
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #4]
        ldr     r9, [sp]
        mov     lr, #0
        mov     r8, #1
        add     r7, r2, r4, lsl #1
        str     r1, [sp, #0x20]
        str     r10, [sp, #0x50]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r0, [sp, #0xC]
LDTT18:
        rsb     r0, r8, #0
        ldrsh   r11, [r12]
        ldrsh   r3, [r12, #2]
        ldrsh   r2, [r12, #4]
        ldrsh   r6, [r12, #6]
        ldrsh   r5, [r12, #8]
        mov     r0, r0, lsl #1
        ldrsh   r10, [r7, +r0]
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r1, #1
        mla     lr, r11, r10, lr
        mov     r0, r0, lsl #1
        ldrsh   r10, [r7, +r0]
        rsb     r1, r8, r1
        mvn     r0, #2
        mla     lr, r3, r10, lr
        mov     r1, r1, lsl #1
        ldrsh   r1, [r7, +r1]
        rsb     r3, r8, r0
        mvn     r0, #3
        mla     lr, r2, r1, lr
        mov     r3, r3, lsl #1
        ldrsh   r1, [r7, +r3]
        rsb     r0, r8, r0
        add     r12, r12, #0xA
        mla     lr, r6, r1, lr
        mov     r0, r0, lsl #1
        ldrsh   r0, [r7, +r0]
        add     r8, r8, #5
        cmp     r8, r9
        mla     lr, r5, r0, lr
        ble     LDTT18
        ldr     r1, [sp, #0x20]
        ldr     r10, [sp, #0x50]
        ldr     r9, [sp, #0x4C]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [sp, #0x2C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT19:
        add     r11, r0, r8, lsl #1
        str     r11, [sp, #4]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        str     r0, [sp, #0xC]
LDTT20:
        rsb     r11, r8, #0
        ldrsh   r0, [r2], #2
        mov     r11, r11, lsl #1
        ldrsh   r11, [r7, +r11]
        add     r8, r8, #1
        cmp     r8, r3
        mla     lr, r0, r11, lr
        ble     LDTT20
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT21:
        sub     r9, r9, lr
        mov     lr, #1
        add     lr, r9, lr, lsl r5
        mov     lr, lr, asr r12
        strh    lr, [r10], #2
        cmp     r6, #1
        subgt   r6, r6, #1
        add     r4, r4, #1
        cmp     r4, r3
        blt     LDTT17
        mov     r10, #0
        b       LDTT11
LDTT22:
        mov     lr, #0
        mov     r8, #1
        add     r7, r2, r4, lsl #1
        b       LDTT19
LDTT23:
        cmp     r3, #0
        ble     LDTT29
        mov     r7, r2
LDTT24:
        ldrsh   lr, [r1], #2
        ldrsh   r8, [r0]
        rsb     r10, r6, #0xB
        cmp     r10, #1
        mul     r9, r8, lr
        movlt   lr, #0
        blt     LDTT28
        rsb     lr, r6, #0
        sub     lr, lr, #1
        add     lr, lr, #0xB
        cmp     lr, #6
        blt     LDTT30
        add     r11, r2, r4, lsl #1
        str     r11, [sp, #0x48]
        rsb     r11, r6, #5
        str     r11, [sp, #0x44]
        add     r11, r0, #2
        str     r11, [sp, #0x40]
        str     r4, [sp, #0x24]
        str     r9, [sp, #0x50]
        str     r12, [sp, #0x2C]
        ldr     r4, [sp, #0x48]
        ldr     r12, [sp, #0x40]
        ldr     r9, [sp, #0x44]
        mov     lr, #0
        mov     r8, #1
        str     r10, [sp, #0x4C]
        str     r1, [sp, #0x20]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r0, [sp, #0xC]
LDTT25:
        rsb     r0, r8, #0
        ldrsh   r11, [r12]
        ldrsh   r3, [r12, #2]
        ldrsh   r2, [r12, #4]
        ldrsh   r6, [r12, #6]
        ldrsh   r5, [r12, #8]
        mov     r0, r0, lsl #1
        ldrsh   r10, [r4, +r0]
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r1, #1
        mla     lr, r11, r10, lr
        mov     r0, r0, lsl #1
        ldrsh   r10, [r4, +r0]
        rsb     r1, r8, r1
        mvn     r0, #2
        mla     lr, r3, r10, lr
        mov     r1, r1, lsl #1
        ldrsh   r3, [r4, +r1]
        rsb     r1, r8, r0
        mvn     r0, #3
        mla     lr, r2, r3, lr
        mov     r1, r1, lsl #1
        ldrsh   r1, [r4, +r1]
        rsb     r0, r8, r0
        add     r12, r12, #0xA
        mla     lr, r6, r1, lr
        mov     r0, r0, lsl #1
        ldrsh   r0, [r4, +r0]
        add     r8, r8, #5
        cmp     r8, r9
        mla     lr, r5, r0, lr
        ble     LDTT25
        ldr     r4, [sp, #0x24]
        ldr     r10, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r1, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [sp, #0x2C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT26:
        add     r11, r0, r8, lsl #1
        str     r11, [sp, #0x44]
        str     r3, [sp, #0x14]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        str     r2, [sp, #0x10]
LDTT27:
        rsb     r11, r8, #0
        ldrsh   r2, [r3], #2
        mov     r11, r11, lsl #1
        ldrsh   r11, [r0, +r11]
        add     r8, r8, #1
        cmp     r8, r10
        mla     lr, r2, r11, lr
        ble     LDTT27
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0xC]
LDTT28:
        sub     r9, r9, lr
        mov     lr, #1
        add     lr, r9, lr, lsl r5
        mov     lr, lr, asr r12
        strh    lr, [r7], #2
        cmp     r6, #1
        subgt   r6, r6, #1
        add     r4, r4, #1
        cmp     r4, r3
        blt     LDTT24
LDTT29:
        mov     r10, #0
        b       LDTT11
LDTT30:
        add     r11, r2, r4, lsl #1
        mov     lr, #0
        mov     r8, #1
        str     r11, [sp, #0x48]
        b       LDTT26
LDTT31:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDTT32:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


