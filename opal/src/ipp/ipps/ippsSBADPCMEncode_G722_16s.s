        .text
        .align  4
        .globl  _ippsSBADPCMEncode_G722_16s


_ippsSBADPCMEncode_G722_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        cmp     r0, #0
        beq     LDFN43
        cmp     r1, #0
        beq     LDFN43
        cmp     r3, #0
        beq     LDFN43
        cmp     r2, #0
        ble     LDFN0
        tst     r2, #1
        beq     LDFN1
LDFN0:
        mvn     r0, #5
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LDFN1:
        and     r12, r3, #0xF
        rsb     r12, r12, #0
        and     r6, r12, #0xF
        cmp     r2, #0
        add     lr, r3, r6
        ble     LDFN40
        ldrsh   r5, [lr, #0x7C]
        ldrsh   r4, [lr, #0x7E]
        mov     r7, #0xFF
        mvn     r12, #0xFF
        orr     r7, r7, #0x7F, 24
        str     r3, [sp, #0x20]
        ldr     r3, [pc, #0xD90]
        mov     r8, #0
        bic     r12, r12, #0x7F, 24
        add     r9, r0, #2
        add     r10, r1, #2
        sub     r7, r7, #6, 20
        sub     r11, r8, #2, 18
        mvn     r12, r12
        str     r1, [sp, #0x28]
        str     r10, [sp, #8]
        str     r0, [sp, #0xC]
        str     r9, [sp, #0x24]
        str     r11, [sp, #0x10]
        str     r7, [sp, #0x14]
        str     r8, [sp, #4]
        str     r6, [sp, #0x18]
        str     r2, [sp]
LDFN2:
        ldr     r6, [sp, #0xC]
        ldr     r1, [sp, #0x24]
        ldrsh   r2, [r6], #4
        ldrsh   r0, [r1], #4
        subs    r5, r2, r5
        str     r6, [sp, #0xC]
        str     r1, [sp, #0x24]
        sub     r4, r0, r4
        mvnmi   r0, #0
        rsbmi   r5, r5, r0
        movpl   r0, #0
        cmp     r4, #0
        mvnlt   r1, #0
        rsblt   r4, r4, r1
        movge   r1, #0
        ldrsh   r6, [r3]
        ldrsh   r2, [lr, #0x20]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0
        blt     LDFN3
        ldrsh   r6, [r3, #2]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #1
        blt     LDFN3
        ldrsh   r6, [r3, #4]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #2
        blt     LDFN3
        ldrsh   r6, [r3, #6]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #3
        blt     LDFN3
        ldrsh   r6, [r3, #8]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #4
        blt     LDFN3
        ldrsh   r6, [r3, #0xA]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #5
        blt     LDFN3
        ldrsh   r6, [r3, #0xC]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #6
        blt     LDFN3
        ldrsh   r6, [r3, #0xE]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #7
        blt     LDFN3
        ldrsh   r6, [r3, #0x10]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #8
        blt     LDFN3
        ldrsh   r6, [r3, #0x12]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #9
        blt     LDFN3
        ldrsh   r6, [r3, #0x14]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0xA
        blt     LDFN3
        ldrsh   r6, [r3, #0x16]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0xB
        blt     LDFN3
        ldrsh   r6, [r3, #0x18]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0xC
        blt     LDFN3
        ldrsh   r6, [r3, #0x1A]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0xD
        blt     LDFN3
        ldrsh   r6, [r3, #0x1C]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0xE
        blt     LDFN3
        ldrsh   r6, [r3, #0x1E]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0xF
        blt     LDFN3
        ldrsh   r6, [r3, #0x20]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x10
        blt     LDFN3
        ldrsh   r6, [r3, #0x22]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x11
        blt     LDFN3
        ldrsh   r6, [r3, #0x24]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x12
        blt     LDFN3
        ldrsh   r6, [r3, #0x26]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x13
        blt     LDFN3
        ldrsh   r6, [r3, #0x28]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x14
        blt     LDFN3
        ldrsh   r6, [r3, #0x2A]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x15
        blt     LDFN3
        ldrsh   r6, [r3, #0x2C]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x16
        blt     LDFN3
        ldrsh   r6, [r3, #0x2E]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x17
        blt     LDFN3
        ldrsh   r6, [r3, #0x30]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x18
        blt     LDFN3
        ldrsh   r6, [r3, #0x32]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x19
        blt     LDFN3
        ldrsh   r6, [r3, #0x34]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x1A
        blt     LDFN3
        ldrsh   r6, [r3, #0x36]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x1B
        blt     LDFN3
        ldrsh   r6, [r3, #0x38]
        mul     r6, r2, r6
        mov     r6, r6, asr #12
        mov     r6, r6, lsl #16
        cmp     r5, r6, asr #16
        movlt   r2, #0x1C
        blt     LDFN3
        ldrsh   r6, [r3, #0x3A]
        mul     r6, r2, r6
        mov     r2, r6, asr #12
        mov     r2, r2, lsl #16
        cmp     r5, r2, asr #16
        movlt   r2, #0x1D
        movge   r2, #0x1E
LDFN3:
        ldrsh   r5, [lr, #0x22]
        mov     r6, #0x8D, 30
        mul     r6, r5, r6
        mov     r5, r6, asr #12
        mov     r5, r5, lsl #16
        cmp     r4, r5, asr #16
        movlt   r4, #1
        movge   r4, #2
        ldr     r5, [pc, #0x9A8]
        mov     r0, r0, lsl #6
        add     r0, r0, #0x40
        add     r2, r5, r2, lsl #1
        ldrsh   r2, [r2, +r0]
        ldr     r0, [sp, #0x28]
        add     r1, r1, #1
        ldr     r5, [pc, #0x990]
        mov     r4, r4, lsl #1
        strh    r2, [r0]
        add     r2, r1, r1, lsl #2
        add     r1, r1, r2
        ldr     r2, [pc, #0x980]
        add     r1, r2, r1
        ldrsh   r1, [r1, +r4]
        ldr     r4, [sp, #8]
        strh    r1, [r4], #4
        ldrsh   r2, [r0], #4
        str     r0, [sp, #0x28]
        ldr     r0, [pc, #0x968]
        mov     r2, r2, lsl #16
        str     r4, [sp, #8]
        mov     r2, r2, asr #18
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mov     r4, r2, lsl #1
        ldrsh   r0, [r0, +r4]
        ldrsh   r4, [r5, +r4]
        ldr     r5, [pc, #0x948]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r5, +r0]
        cmp     r4, #0
        beq     LDFN4
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDFN4:
        ldr     r5, [pc, #0x92C]
        mov     r4, r1, lsl #1
        ldr     r6, [pc, #0x928]
        ldrsh   r5, [r5, +r4]
        ldrsh   r4, [r6, +r4]
        ldr     r6, [pc, #0x920]
        mov     r5, r5, lsl #1
        ldrsh   r6, [r6, +r5]
        cmp     r4, #0
        beq     LDFN5
        rsb     r6, r6, #0
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDFN5:
        ldrsh   r5, [lr, #0x20]
        ldrsh   r7, [lr, #0x22]
        ldrsh   r4, [lr, #0x24]
        mul     r5, r5, r0
        ldrsh   r0, [lr, #0x26]
        mul     r6, r7, r6
        rsb     r7, r4, r4, lsl #7
        mov     r1, r1, lsl #1
        mov     r2, r2, lsl #1
        mov     r5, r5, asr #12
        mov     r4, r6, asr #12
        mov     r6, r7, lsl #8
        ldr     r7, [pc, #0x8C0]
        mov     r5, r5, lsl #16
        mov     r4, r4, lsl #16
        mov     r5, r5, asr #16
        strh    r5, [lr, #0x70]
        mov     r4, r4, asr #16
        strh    r4, [lr, #0x72]
        ldrsh   r2, [r7, +r2]
        ldr     r7, [pc, #0x8A8]
        rsb     r0, r0, r0, lsl #7
        mov     r2, r2, lsl #1
        mov     r0, r0, lsl #8
        ldrsh   r1, [r7, +r1]
        ldr     r7, [pc, #0x8A0]
        ldrsh   r2, [r7, +r2]
        ldr     r7, [pc, #0x89C]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r7, +r1]
        add     r6, r2, r6, asr #15
        add     r0, r1, r0, asr #15
        mov     r6, r6, lsl #16
        mov     r1, r0, lsl #16
        movs    r0, r6, asr #16
        mov     r6, r1, asr #16
        movmi   r0, #0
        bmi     LDFN6
        cmp     r0, #0x12, 22
        mov     r1, #0x12, 22
        movgt   r0, r1
LDFN6:
        cmp     r6, #0
        movlt   r6, #0
        blt     LDFN7
        cmp     r6, #0x16, 22
        mov     r1, #0x16, 22
        movgt   r6, r1
LDFN7:
        mov     r1, #0xFF
        orr     r1, r1, #0x7F, 24
        sub     r2, r1, #0x7E, 24
        mov     r1, r0, lsl #16
        ldr     r9, [pc, #0x840]
        and     r1, r2, r1, asr #22
        ldrsh   r7, [lr, #0x76]
        ldrsh   r8, [lr, #0x7C]
        mov     r1, r1, lsl #1
        strh    r6, [lr, #0x26]
        strh    r0, [lr, #0x24]
        ldrsh   r0, [lr, #0x74]
        add     r1, r1, #0x80
        ldrsh   r1, [r9, +r1]
        ldrsh   r10, [lr, #0x7E]
        mov     r6, r6, lsl #16
        add     r1, r1, #1
        and     r6, r2, r6, asr #22
        add     r0, r5, r0
        mov     r1, r1, lsl #2
        strh    r1, [lr, #0x20]
        mov     r6, r6, lsl #1
        ldrsh   r6, [r9, +r6]
        add     r7, r4, r7
        strh    r0, [lr, #0x58]
        add     r6, r6, #1
        add     r8, r8, r5
        mov     r6, r6, lsl #2
        add     r10, r10, r4
        cmp     r5, #0
        strh    r7, [lr, #0x5A]
        strh    r6, [lr, #0x22]
        strh    r8, [lr, #0x5C]
        strh    r10, [lr, #0x5E]
        movne   r0, #0x80
        moveq   r0, #0
        add     r1, sp, #0x54
        add     r2, sp, #0x50
        mov     r5, r5, asr #15
        cmp     r4, #0
        strh    r0, [r1]
        strh    r5, [r2]
        movne   r0, #0x80
        moveq   r0, #0
        add     r1, sp, #0x54
        strh    r0, [r1, #2]
        add     r0, sp, #0x50
        mov     r4, r4, asr #15
        strh    r4, [r0, #2]
        ldr     r0, [pc, #0x790]
        mov     r1, lr
        add     r4, lr, #6
        mov     r2, #0xC
LDFN8:
        ldrsh   r7, [r0], #2
        ldr     r8, [r1, #0x28]
        add     r5, sp, #0x50
        mov     r7, r7, lsl #1
        ldrsh   r5, [r5, +r7]
        add     r6, sp, #0x54
        ldrsh   r6, [r6, +r7]
        mov     r8, r8, asr #31
        mov     r8, r8, lsl #16
        cmp     r5, r8, asr #16
        beq     LDFN9
        rsb     r6, r6, #0
        mov     r5, r6, lsl #16
        mov     r6, r5, asr #16
LDFN9:
        ldrsh   r7, [r4, #2]
        add     r1, r1, #4
        subs    r2, r2, #1
        mov     r5, r7, lsl #15
        sub     r5, r5, r7, lsl #7
        add     r5, r6, r5, asr #15
        strh    r5, [r4, #2]!
        bne     LDFN8
        ldrsh   r1, [lr, #0x60]
        ldr     r2, [sp, #0x18]
        ldr     r4, [sp, #0x20]
        str     r1, [sp, #0x2C]
        ldrsh   r0, [lr, #0x62]
        ldrsh   r10, [lr, #0x58]
        ldrsh   r2, [r2, +r4]
        ldr     r4, [lr, #0x38]
        ldr     r5, [lr, #0x50]
        mov     r1, r1, lsl #16
        mov     r0, r0, lsl #16
        mov     r11, r10, lsl #16
        str     r5, [sp, #0x1C]
        ldr     r5, [lr, #0x34]
        mov     r1, r1, asr #31
        mov     r0, r0, asr #31
        str     r5, [sp, #0x30]
        ldr     r5, [lr, #0x4C]
        ldr     r6, [lr, #0x30]
        mov     r11, r11, asr #31
        mov     r1, r1, lsl #16
        mov     r0, r0, lsl #16
        str     r6, [sp, #0x34]
        ldr     r7, [lr, #0x2C]
        ldr     r6, [lr, #0x48]
        mov     r11, r11, lsl #16
        str     r7, [sp, #0x38]
        ldr     r7, [lr, #0x44]
        mov     r1, r1, asr #16
        str     r7, [sp, #0x3C]
        ldr     r7, [lr, #0x28]
        str     r7, [sp, #0x40]
        ldr     r7, [lr, #0x40]
        ldrsh   r8, [lr, #0x70]
        ldrsh   r9, [lr, #0x72]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x14]
        str     r4, [lr, #0x3C]
        cmp     r0, r2
        ldr     r0, [sp, #0x1C]
        str     r0, [lr, #0x54]
        ldr     r0, [sp, #0x30]
        str     r5, [lr, #0x50]
        str     r0, [lr, #0x38]
        ldr     r0, [sp, #0x34]
        str     r6, [lr, #0x4C]
        str     r0, [lr, #0x34]
        ldr     r0, [sp, #0x38]
        str     r0, [lr, #0x30]
        ldr     r0, [sp, #0x3C]
        str     r0, [lr, #0x48]
        ldr     r0, [sp, #0x40]
        str     r7, [lr, #0x44]
        str     r8, [lr, #0x28]
        str     r0, [lr, #0x2C]
        str     r9, [lr, #0x40]
        ldr     r0, [sp, #0x44]
        mov     r0, r0, asr #16
        blt     LDFN10
        cmn     r2, #2, 20
        movlt   r4, #0
        sublt   r4, r4, #2, 18
        blt     LDFN11
        mov     r4, r2, lsl #2
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        b       LDFN11
LDFN10:
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
LDFN11:
        cmp     r1, r11, asr #16
        mvnne   r1, #0xBF
        bne     LDFN13
        cmn     r4, #2, 18
        beq     LDFN42
        rsb     r4, r4, #0
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDFN12:
        mov     r1, #0xC0
LDFN13:
        mov     r4, r4, lsl #16
        cmp     r0, r11, asr #16
        mov     r4, r4, asr #23
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        subne   r0, r4, #0x80
        addeq   r0, r4, #0x80
        ldrsh   r4, [lr, #2]
        mov     r0, r0, lsl #16
        mov     r5, r2, lsl #15
        rsb     r4, r4, r4, lsl #7
        mov     r0, r0, asr #16
        sub     r5, r5, r2, lsl #7
        mov     r4, r4, lsl #8
        add     r4, r0, r4, asr #15
        add     r5, r1, r5, asr #15
        mov     r4, r4, lsl #16
        mov     r5, r5, lsl #16
        mov     r0, r4, asr #16
        cmp     r0, #3, 20
        mov     r2, r5, asr #16
        movgt   r0, #3, 20
        bgt     LDFN14
        mov     r1, #0
        cmn     r0, #3, 20
        sub     r1, r1, #3, 20
        movlt   r0, r1
LDFN14:
        rsb     r1, r0, #0xF, 22
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r2, r1
        bgt     LDFN15
        rsb     r1, r1, #0
        cmp     r1, r2
        movgt   r2, r1
        mov     r2, r2, lsl #16
        mov     r1, r2, asr #16
LDFN15:
        ldrsh   r6, [lr, #0x64]
        ldr     r9, [sp, #0x20]
        str     r6, [sp, #0x1C]
        ldrsh   r5, [lr, #0x66]
        ldrsh   r2, [lr, #0x5A]
        ldrsh   r4, [lr, #4]
        mov     r6, r6, lsl #16
        mov     r7, r5, lsl #16
        mov     r6, r6, asr #31
        mov     r5, r2, lsl #16
        mov     r8, r7, asr #31
        mov     r7, r6, lsl #16
        mov     r5, r5, asr #31
        mov     r6, r8, lsl #16
        ldr     r8, [sp, #0x14]
        mov     r5, r5, lsl #16
        mov     r7, r7, asr #16
        mov     r6, r6, asr #16
        cmp     r8, r4
        ldr     r8, [sp, #0x18]
        strh    r0, [lr, #2]
        strh    r1, [r8, +r9]
        ldr     r8, [sp, #0x2C]
        strh    r10, [lr, #0x60]
        strh    r8, [lr, #0x62]
        blt     LDFN16
        cmn     r4, #2, 20
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        blt     LDFN17
        mov     r8, r4, lsl #2
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        b       LDFN17
LDFN16:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDFN17:
        cmp     r7, r5, asr #16
        mvnne   r7, #0xBF
        bne     LDFN19
        cmn     r8, #2, 18
        beq     LDFN41
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDFN18:
        mov     r7, #0xC0
LDFN19:
        mov     r8, r8, lsl #16
        cmp     r6, r5, asr #16
        mov     r8, r8, asr #23
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        subne   r5, r8, #0x80
        addeq   r5, r8, #0x80
        ldrsh   r6, [lr, #6]
        mov     r5, r5, lsl #16
        mov     r8, r4, lsl #15
        rsb     r6, r6, r6, lsl #7
        mov     r5, r5, asr #16
        sub     r8, r8, r4, lsl #7
        mov     r6, r6, lsl #8
        add     r6, r5, r6, asr #15
        add     r8, r7, r8, asr #15
        mov     r6, r6, lsl #16
        mov     r8, r8, lsl #16
        mov     r4, r6, asr #16
        cmp     r4, #3, 20
        mov     r6, r8, asr #16
        movgt   r4, #3, 20
        bgt     LDFN20
        mov     r5, #0
        cmn     r4, #3, 20
        sub     r5, r5, #3, 20
        movlt   r4, r5
LDFN20:
        rsb     r5, r4, #0xF, 22
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        cmp     r6, r5
        bgt     LDFN21
        rsb     r5, r5, #0
        cmp     r5, r6
        movgt   r6, r5
        mov     r6, r6, lsl #16
        mov     r5, r6, asr #16
LDFN21:
        ldr     r9, [lr, #0x28]
        ldrsh   r10, [lr, #8]
        ldr     r8, [lr, #0x30]
        ldrsh   r6, [lr, #0xA]
        ldr     r7, [lr, #0x2C]
        mul     r10, r9, r10
        mul     r6, r7, r6
        str     r10, [sp, #0x44]
        ldrsh   r9, [lr, #0xC]
        str     r6, [sp, #0x40]
        ldrsh   r11, [lr, #0x14]
        ldr     r10, [lr, #0x40]
        mul     r9, r8, r9
        ldr     r6, [lr, #0x34]
        mul     r11, r10, r11
        ldrsh   r7, [lr, #0xE]
        str     r9, [sp, #0x3C]
        str     r11, [sp, #0x38]
        ldrsh   r11, [lr, #0x10]
        ldrsh   r10, [lr, #0x16]
        ldr     r9, [lr, #0x44]
        ldr     r8, [lr, #0x38]
        str     r11, [sp, #0x34]
        mul     r10, r9, r10
        ldr     r11, [lr, #0x48]
        mul     r7, r6, r7
        str     r11, [sp, #0x30]
        ldr     r6, [sp, #0x30]
        str     r10, [sp, #0x2C]
        ldrsh   r9, [lr, #0x18]
        ldr     r11, [sp, #0x40]
        str     r7, [sp, #0x48]
        ldr     r10, [lr, #0x4C]
        mul     r9, r6, r9
        ldr     r6, [sp, #0x34]
        ldrsh   r7, [lr, #0x1A]
        str     r9, [sp, #0x30]
        mul     r6, r8, r6
        mul     r7, r10, r7
        str     r6, [sp, #0x34]
        ldr     r6, [lr, #0x3C]
        str     r7, [sp, #0x4C]
        ldrsh   r8, [lr, #0x12]
        ldr     r7, [lr, #0x50]
        ldrsh   r10, [lr, #0x1C]
        ldr     r9, [lr, #0x54]
        mul     r6, r6, r8
        ldrsh   r8, [lr, #0x1E]
        mul     r7, r7, r10
        ldr     r10, [sp, #0x44]
        mul     r8, r9, r8
        ldr     r9, [sp, #0x3C]
        mov     r10, r10, asr #14
        add     r10, r10, r11, asr #14
        ldr     r11, [sp, #0x48]
        add     r10, r10, r9, asr #14
        ldr     r9, [sp, #0x38]
        add     r10, r10, r11, asr #14
        ldr     r11, [sp, #0x2C]
        mov     r9, r9, asr #14
        add     r9, r9, r11, asr #14
        ldr     r11, [sp, #0x34]
        add     r10, r10, r11, asr #14
        ldr     r11, [sp, #0x30]
        add     r10, r10, r6, asr #14
        ldr     r6, [sp, #0x4C]
        add     r9, r9, r11, asr #14
        strh    r5, [lr, #4]
        strh    r4, [lr, #6]
        add     r6, r9, r6, asr #14
        ldr     r9, [sp, #0x1C]
        add     r7, r6, r7, asr #14
        mov     r6, r10, lsl #16
        cmp     r12, r10
        strh    r9, [lr, #0x66]
        strh    r2, [lr, #0x64]
        add     r8, r7, r8, asr #14
        mov     r6, r6, asr #16
        bge     LDFN22
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r6, r2
        strh    r12, [lr, #0x74]
        b       LDFN23
LDFN22:
        cmn     r10, #2, 18
        strgeh  r6, [lr, #0x74]
        bge     LDFN23
        mov     r2, #0
        sub     r6, r2, #2, 18
        ldr     r2, [sp, #0x10]
        strh    r2, [lr, #0x74]
LDFN23:
        mov     r2, r8, lsl #16
        cmp     r12, r8
        mov     r2, r2, asr #16
        bge     LDFN24
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
        strh    r12, [lr, #0x76]
        b       LDFN25
LDFN24:
        cmn     r8, #2, 18
        strgeh  r2, [lr, #0x76]
        bge     LDFN25
        ldr     r7, [sp, #0x10]
        mov     r2, #0
        sub     r2, r2, #2, 18
        strh    r7, [lr, #0x76]
LDFN25:
        ldrsh   r9, [lr, #0x5C]
        ldrsh   r7, [lr, #0x68]
        mov     r8, r9, lsl #1
        cmp     r12, r8
        mov     r10, r8, lsl #16
        strh    r7, [lr, #0x6A]
        strh    r9, [lr, #0x68]
        mov     r10, r10, asr #16
        bge     LDFN26
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r10, r8
        b       LDFN27
LDFN26:
        cmn     r8, #2, 18
        movlt   r8, #0
        sublt   r10, r8, #2, 18
LDFN27:
        mul     r1, r1, r10
        mov     r7, r7, lsl #1
        cmp     r12, r7
        mov     r8, r7, lsl #16
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r8, r8, asr #16
        bge     LDFN28
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r8, r7
        b       LDFN29
LDFN28:
        cmn     r7, #2, 18
        movlt   r7, #0
        sublt   r8, r7, #2, 18
LDFN29:
        mul     r8, r0, r8
        mov     r0, r8, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        add     r1, r0, r1, asr #16
        cmp     r12, r1
        strlth  r12, [lr, #0x78]
        blt     LDFN30
        cmn     r1, #2, 18
        strgeh  r1, [lr, #0x78]
        ldrlt   r0, [sp, #0x10]
        strlth  r0, [lr, #0x78]
LDFN30:
        ldrsh   r7, [lr, #0x5E]
        ldrsh   r0, [lr, #0x6C]
        mov     r1, r7, lsl #1
        cmp     r12, r1
        mov     r8, r1, lsl #16
        strh    r0, [lr, #0x6E]
        strh    r7, [lr, #0x6C]
        mov     r8, r8, asr #16
        bge     LDFN31
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r8, r1
        b       LDFN32
LDFN31:
        cmn     r1, #2, 18
        movlt   r1, #0
        sublt   r8, r1, #2, 18
LDFN32:
        mul     r7, r5, r8
        mov     r1, r0, lsl #1
        cmp     r12, r1
        mov     r5, r1, lsl #16
        mov     r7, r7, asr #15
        mov     r0, r7, lsl #16
        mov     r5, r5, asr #16
        bge     LDFN33
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r5, r1
        b       LDFN34
LDFN33:
        cmn     r1, #2, 18
        movlt   r1, #0
        sublt   r5, r1, #2, 18
LDFN34:
        mul     r5, r4, r5
        mov     r1, r5, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        add     r0, r1, r0, asr #16
        cmp     r12, r0
        strlth  r12, [lr, #0x7A]
        blt     LDFN35
        cmn     r0, #2, 18
        strgeh  r0, [lr, #0x7A]
        ldrlt   r0, [sp, #0x10]
        strlth  r0, [lr, #0x7A]
LDFN35:
        ldrsh   r0, [lr, #0x78]
        add     r6, r0, r6
        cmp     r12, r6
        mov     r0, r6, lsl #16
        mov     r5, r0, asr #16
        bge     LDFN36
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r5, r0
        strh    r12, [lr, #0x7C]
        b       LDFN37
LDFN36:
        cmn     r6, #2, 18
        strgeh  r5, [lr, #0x7C]
        bge     LDFN37
        mov     r0, #0
        sub     r5, r0, #2, 18
        ldr     r0, [sp, #0x10]
        strh    r0, [lr, #0x7C]
LDFN37:
        ldrsh   r0, [lr, #0x7A]
        add     r2, r0, r2
        cmp     r12, r2
        mov     r0, r2, lsl #16
        mov     r4, r0, asr #16
        bge     LDFN38
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r4, r0
        strh    r12, [lr, #0x7E]
        b       LDFN39
LDFN38:
        cmn     r2, #2, 18
        strgeh  r4, [lr, #0x7E]
        bge     LDFN39
        mvn     r0, #0xFF
        bic     r4, r0, #0x7F, 24
        ldr     r0, [sp, #0x10]
        strh    r0, [lr, #0x7E]
LDFN39:
        ldr     r0, [sp, #4]
        ldr     r1, [sp]
        add     r0, r0, #2
        str     r0, [sp, #4]
        cmp     r0, r1
        blt     LDFN2
LDFN40:
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LDFN41:
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r8, r7
        b       LDFN18
LDFN42:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r4, r1
        b       LDFN12
LDFN43:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   table_quant_q6
        .long   table_misil
        .long   table_quant_risi4
        .long   table_misih
        .long   table_quant_ril4
        .long   table_quant_oq4
        .long   table_quant_ih2
        .long   table_quant_sih
        .long   table_quant_oq2
        .long   table_quant_wl
        .long   table_quant_wh
        .long   table_ila
        .long   LDFN_index_pred_coeff


        .data
        .align  4


LDFN_index_pred_coeff:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00
        .byte   0x01,0x00,0x01,0x00,0x01,0x00,0x01,0x00


