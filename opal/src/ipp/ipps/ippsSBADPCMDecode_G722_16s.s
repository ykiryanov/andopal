        .text
        .align  4
        .globl  _ippsSBADPCMDecode_G722_16s


_ippsSBADPCMDecode_G722_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r12, [sp, #0x60]
        cmp     r0, #0
        beq     LDFR40
        cmp     r1, #0
        beq     LDFR40
        cmp     r12, #0
        beq     LDFR40
        cmp     r2, #0
        ble     LDFR0
        tst     r2, #1
        beq     LDFR1
LDFR0:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LDFR1:
        and     lr, r12, #0xF
        rsb     lr, lr, #0
        and     lr, lr, #0xF
        cmp     r2, #0
        add     r9, r12, lr
        ble     LDFR38
        ldr     r10, [pc, #0x8C0]
        ldr     r4, [pc, #0x8C0]
        add     r8, r0, #2
        str     r8, [sp, #0x18]
        add     r8, r1, #2
        mvn     r12, #0xFF
        mov     r5, #0xFF
        mov     r11, #0
        str     r8, [sp, #0x14]
        sub     r8, r11, #1, 18
        bic     lr, r12, #0x3F, 24
        orr     r5, r5, #0x7F, 24
        str     r8, [sp, #8]
        bic     r12, r12, #0x7F, 24
        sub     r8, r11, #2, 18
        sub     r5, r5, #6, 20
        add     r7, sp, #0x38
        add     r6, sp, #0x34
        mvn     lr, lr
        mvn     r12, r12
        str     r8, [sp, #0xC]
        str     r5, [sp, #4]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x28]
LDFR2:
        ldr     r0, [sp, #0x1C]
        subs    r5, r0, #3
        beq     LDFR5
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        adds    r5, r5, #1
        add     r6, sp, #0x34
        add     r7, sp, #0x38
        beq     LDFR4
        adds    r5, r5, #1
        beq     LDFR3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x20]
        mov     r5, r11, lsl #1
        ldrsh   r0, [r0, +r5]
        ldr     r1, [pc, #0x810]
        mov     r0, r0, asr #2
        mov     r0, r0, lsl #1
        ldrsh   r1, [r1, +r0]
        ldrsh   r0, [r10, +r0]
        cmp     r1, #0
        mov     r0, r0, lsl #1
        ldreq   r1, [pc, #0x7F8]
        ldreqsh r2, [r1, +r0]
        beq     LDFR6
        ldr     r1, [pc, #0x7EC]
        ldrsh   r0, [r1, +r0]
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LDFR6
LDFR3:
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x20]
        str     r3, [sp, #0x1C]
        mov     r5, r11, lsl #1
        ldrsh   r0, [r0, +r5]
        ldr     r1, [pc, #0x7BC]
        ldr     r2, [pc, #0x7BC]
        mov     r0, r0, lsl #1
        ldrsh   r1, [r1, +r0]
        ldrsh   r0, [r2, +r0]
        cmp     r1, #0
        mov     r0, r0, lsl #1
        ldreq   r1, [pc, #0x7A8]
        ldreqsh r2, [r1, +r0]
        beq     LDFR6
        ldr     r1, [pc, #0x79C]
        ldrsh   r0, [r1, +r0]
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LDFR6
LDFR4:
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x20]
        str     r3, [sp, #0x1C]
        mov     r5, r11, lsl #1
        ldrsh   r0, [r0, +r5]
        ldr     r1, [pc, #0x76C]
        ldr     r2, [pc, #0x76C]
        mov     r0, r0, asr #1
        mov     r0, r0, lsl #1
        ldrsh   r1, [r1, +r0]
        ldrsh   r0, [r2, +r0]
        cmp     r1, #0
        mov     r0, r0, lsl #1
        ldreq   r1, [pc, #0x754]
        ldreqsh r2, [r1, +r0]
        beq     LDFR6
        ldr     r1, [pc, #0x748]
        ldrsh   r0, [r1, +r0]
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LDFR6
LDFR5:
        ldr     r0, [sp, #0x28]
        mov     r5, r11, lsl #1
        ldr     r1, [pc, #0x70C]
        ldrsh   r0, [r0, +r5]
        mov     r0, r0, asr #2
        mov     r0, r0, lsl #1
        ldrsh   r1, [r1, +r0]
        ldrsh   r0, [r10, +r0]
        cmp     r1, #0
        mov     r0, r0, lsl #1
        ldreq   r1, [pc, #0x6F0]
        ldreqsh r2, [r1, +r0]
        beq     LDFR6
        ldr     r1, [pc, #0x6E4]
        ldrsh   r0, [r1, +r0]
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LDFR6:
        ldrsh   r1, [r9, #0x20]
        ldrsh   r0, [r9, #0x7C]
        mul     r2, r1, r2
        add     r2, r0, r2, asr #12
        cmp     lr, r2
        ldrlt   r0, [sp, #0x24]
        strlth  lr, [r0, +r5]
        blt     LDFR7
        cmn     r2, #1, 18
        ldrge   r0, [sp, #0x24]
        strgeh  r2, [r0, +r5]
        bge     LDFR7
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x24]
        strh    r0, [r1, +r5]
LDFR7:
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x18]
        ldr     r3, [pc, #0x688]
        ldrsh   r0, [r5, +r0]
        ldrsh   r2, [r1, +r5]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #18
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mov     r6, r0, lsl #1
        ldrsh   r1, [r10, +r6]
        ldrsh   r3, [r3, +r6]
        ldr     r6, [pc, #0x664]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r6, +r1]
        cmp     r3, #0
        beq     LDFR8
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDFR8:
        ldr     r3, [pc, #0x660]
        mov     r6, r2, lsl #1
        ldr     r7, [pc, #0x65C]
        ldrsh   r3, [r3, +r6]
        ldrsh   r6, [r7, +r6]
        ldr     r7, [pc, #0x654]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r7, +r3]
        cmp     r6, #0
        beq     LDFR9
        rsb     r3, r3, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDFR9:
        ldrsh   r6, [r9, #0x22]
        ldrsh   r7, [r9, #0x24]
        ldrsh   r8, [r9, #0x20]
        mul     r3, r6, r3
        mov     r2, r2, lsl #1
        str     r7, [sp, #0x2C]
        ldrsh   r7, [r9, #0x26]
        mul     r1, r8, r1
        mov     r6, r0, lsl #1
        ldr     r0, [sp, #0x2C]
        str     r7, [sp, #0x30]
        ldr     r8, [pc, #0x60C]
        mov     r1, r1, asr #12
        rsb     r7, r0, r0, lsl #7
        mov     r0, r3, asr #12
        mov     r1, r1, lsl #16
        mov     r3, r7, lsl #8
        mov     r7, r0, lsl #16
        mov     r0, r1, asr #16
        strh    r0, [r9, #0x70]
        mov     r1, r7, asr #16
        strh    r1, [r9, #0x72]
        ldrsh   r6, [r10, +r6]
        ldr     r7, [pc, #0x5D0]
        mov     r6, r6, lsl #1
        ldrsh   r6, [r8, +r6]
        ldr     r8, [pc, #0x5D4]
        ldrsh   r7, [r7, +r2]
        ldr     r2, [sp, #0x30]
        add     r3, r6, r3, asr #15
        rsb     r2, r2, r2, lsl #7
        mov     r7, r7, lsl #1
        ldrsh   r7, [r8, +r7]
        mov     r2, r2, lsl #8
        mov     r3, r3, lsl #16
        add     r2, r7, r2, asr #15
        mov     r2, r2, lsl #16
        movs    r3, r3, asr #16
        mov     r2, r2, asr #16
        movmi   r3, #0
        bmi     LDFR10
        cmp     r3, #0x12, 22
        mov     r6, #0x12, 22
        movgt   r3, r6
LDFR10:
        cmp     r2, #0
        movlt   r2, #0
        blt     LDFR11
        cmp     r2, #0x16, 22
        mov     r6, #0x16, 22
        movgt   r2, r6
LDFR11:
        mov     r6, #0xFF
        ldrsh   r8, [r9, #0x74]
        strh    r3, [r9, #0x24]
        strh    r2, [r9, #0x26]
        orr     r6, r6, #0x7F, 24
        sub     r7, r6, #0x7E, 24
        mov     r3, r3, lsl #16
        mov     r6, r2, lsl #16
        and     r3, r7, r3, asr #22
        add     r2, r0, r8
        ldr     r8, [pc, #0x550]
        mov     r3, r3, lsl #1
        add     r3, r3, #0x80
        ldrsh   r3, [r8, +r3]
        and     r6, r7, r6, asr #22
        cmp     r12, r2
        add     r3, r3, #1
        mov     r6, r6, lsl #1
        mov     r3, r3, lsl #2
        strh    r3, [r9, #0x20]
        ldr     r3, [pc, #0x528]
        ldrsh   r6, [r3, +r6]
        add     r3, r6, #1
        mov     r3, r3, lsl #2
        strh    r3, [r9, #0x22]
        strlth  r12, [r9, #0x58]
        blt     LDFR12
        cmn     r2, #2, 18
        strgeh  r2, [r9, #0x58]
        ldrlt   r2, [sp, #0xC]
        strlth  r2, [r9, #0x58]
LDFR12:
        ldrsh   r2, [r9, #0x76]
        add     r2, r1, r2
        cmp     r12, r2
        strlth  r12, [r9, #0x5A]
        blt     LDFR13
        cmn     r2, #2, 18
        strgeh  r2, [r9, #0x5A]
        ldrlt   r2, [sp, #0xC]
        strlth  r2, [r9, #0x5A]
LDFR13:
        ldrsh   r2, [r9, #0x7C]
        add     r2, r2, r0
        cmp     r12, r2
        strlth  r12, [r9, #0x5C]
        blt     LDFR14
        cmn     r2, #2, 18
        strgeh  r2, [r9, #0x5C]
        ldrlt   r2, [sp, #0xC]
        strlth  r2, [r9, #0x5C]
LDFR14:
        ldrsh   r2, [r9, #0x7E]
        add     r2, r2, r1
        cmp     r12, r2
        strlth  r12, [r9, #0x5E]
        blt     LDFR15
        cmn     r2, #2, 18
        strgeh  r2, [r9, #0x5E]
        ldrlt   r2, [sp, #0xC]
        strlth  r2, [r9, #0x5E]
LDFR15:
        cmp     r0, #0
        movne   r2, #0x80
        moveq   r2, #0
        add     r3, sp, #0x38
        add     r6, sp, #0x34
        mov     r0, r0, asr #15
        cmp     r1, #0
        strh    r2, [r3]
        strh    r0, [r6]
        movne   r0, #0x80
        moveq   r0, #0
        add     r2, sp, #0x38
        strh    r0, [r2, #2]
        mov     r1, r1, asr #15
        add     r0, sp, #0x34
        strh    r1, [r0, #2]
        mov     r0, r9
        add     r3, r9, #6
        mov     r1, r4
        mov     r2, #0xC
        str     r9, [sp]
LDFR16:
        ldrsh   r6, [r1], #2
        ldr     r9, [r0, #0x28]
        add     r7, sp, #0x34
        mov     r6, r6, lsl #1
        ldrsh   r7, [r7, +r6]
        add     r8, sp, #0x38
        ldrsh   r6, [r8, +r6]
        mov     r9, r9, asr #31
        mov     r9, r9, lsl #16
        cmp     r7, r9, asr #16
        beq     LDFR17
        rsb     r6, r6, #0
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDFR17:
        ldrsh   r8, [r3, #2]
        add     r0, r0, #4
        subs    r2, r2, #1
        mov     r7, r8, lsl #15
        sub     r7, r7, r8, lsl #7
        add     r7, r6, r7, asr #15
        strh    r7, [r3, #2]!
        bne     LDFR16
        ldr     r9, [sp]
        mov     r1, #5
        add     r0, r9, #0x58
LDFR18:
        ldr     r2, [r0, #-0x20]
        ldr     r3, [r0, #-8]
        sub     r1, r1, #1
        str     r2, [r0, #-0x1C]
        cmp     r1, #0
        str     r3, [r0, #-4]!
        bgt     LDFR18
        ldrsh   r1, [r9, #0x70]
        ldrsh   r0, [r9, #0x72]
        add     r6, r9, #0x5C
        str     r1, [r9, #0x28]
        add     r7, r9, #0x56
        str     r0, [r9, #0x40]
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #4]
        mov     r8, #2
        str     r9, [sp]
LDFR19:
        ldrsh   r0, [r6, #6]
        ldrsh   r10, [r6, #4]
        ldrsh   r1, [r7, #2]
        ldrsh   r9, [r6, #-0x5C]
        mov     r0, r0, lsl #16
        mov     r2, r10, lsl #16
        mov     r1, r1, lsl #16
        mov     r0, r0, asr #31
        mov     r2, r2, asr #31
        mov     r1, r1, asr #31
        mov     r0, r0, lsl #16
        mov     r2, r2, lsl #16
        cmp     r11, r9
        mov     r1, r1, lsl #16
        mov     r2, r2, asr #16
        mov     r0, r0, asr #16
        blt     LDFR20
        cmn     r9, #2, 20
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        blt     LDFR21
        mov     r3, r9, lsl #2
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDFR21
LDFR20:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDFR21:
        cmp     r2, r1, asr #16
        mvnne   r2, #0xBF
        bne     LDFR23
        cmn     r3, #2, 18
        beq     LDFR39
        rsb     r3, r3, #0
        mov     r2, r3, lsl #16
        mov     r3, r2, asr #16
LDFR22:
        mov     r2, #0xC0
LDFR23:
        mov     r3, r3, lsl #16
        cmp     r0, r1, asr #16
        mov     r3, r3, asr #23
        mov     r0, r3, lsl #16
        mov     r0, r0, asr #16
        subne   r1, r0, #0x80
        addeq   r1, r0, #0x80
        ldrsh   r0, [r6, #-0x5A]
        mov     r3, r1, lsl #16
        mov     r1, r9, lsl #15
        rsb     r0, r0, r0, lsl #7
        mov     r3, r3, asr #16
        sub     r1, r1, r9, lsl #7
        mov     r0, r0, lsl #8
        add     r0, r3, r0, asr #15
        add     r2, r2, r1, asr #15
        mov     r0, r0, lsl #16
        mov     r2, r2, lsl #16
        mov     r1, r0, asr #16
        cmp     r1, #3, 20
        mov     r0, r2, asr #16
        movgt   r1, #3, 20
        bgt     LDFR24
        mov     r2, #0
        cmn     r1, #3, 20
        sub     r2, r2, #3, 20
        movlt   r1, r2
LDFR24:
        rsb     r2, r1, #0xF, 22
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r0, r2
        bgt     LDFR25
        rsb     r2, r2, #0
        cmp     r2, r0
        movgt   r0, r2
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LDFR25:
        strh    r2, [r6, #-0x5C]
        strh    r1, [r6, #-0x5A]
        strh    r10, [r6, #6]
        ldrsh   r0, [r7, #2]!
        subs    r8, r8, #1
        strh    r0, [r6, #4]!
        bne     LDFR19
        ldr     r9, [sp]
        ldr     r11, [sp, #0x10]
        ldr     r10, [pc, #0x20C]
        mov     r6, #0
        mov     r3, r6
        add     r2, r9, #0x3C
        add     r1, r9, #0x12
        mov     r0, #6
        str     r11, [sp, #0x10]
        str     r9, [sp]
LDFR26:
        ldrsh   r9, [r1, #-0xA]
        ldrsh   r7, [r1, #2]!
        ldr     r11, [r2, #-0x14]
        ldr     r8, [r2, #4]!
        mul     r9, r11, r9
        mul     r7, r8, r7
        subs    r0, r0, #1
        add     r6, r6, r9, asr #14
        add     r3, r3, r7, asr #14
        bne     LDFR26
        ldr     r11, [sp, #0x10]
        ldr     r9, [sp]
        cmp     r12, r6
        strlth  r12, [r9, #0x74]
        blt     LDFR27
        cmn     r6, #2, 18
        strgeh  r6, [r9, #0x74]
        ldrlt   r0, [sp, #0xC]
        strlth  r0, [r9, #0x74]
LDFR27:
        cmp     r12, r3
        strlth  r12, [r9, #0x76]
        blt     LDFR28
        cmn     r3, #2, 18
        strgeh  r3, [r9, #0x76]
        ldrlt   r0, [sp, #0xC]
        strlth  r0, [r9, #0x76]
LDFR28:
        mov     r2, r9
        ldr     r7, [sp, #0xC]
        mov     r3, r2
        mov     r6, #2
LDFR29:
        ldrsh   r0, [r2, #0x68]
        strh    r0, [r2, #0x6A]
        ldrsh   r1, [r3, #0x5C]
        mov     r8, r1, lsl #1
        cmp     r12, r8
        strh    r1, [r2, #0x68]
        mov     r1, r8, lsl #16
        mov     r1, r1, asr #16
        bge     LDFR30
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LDFR31
LDFR30:
        cmn     r8, #2, 18
        movlt   r1, #0
        sublt   r1, r1, #2, 18
LDFR31:
        ldrsh   r8, [r2]
        mov     r0, r0, lsl #1
        cmp     r12, r0
        mul     r8, r8, r1
        mov     r1, r0, lsl #16
        mov     r1, r1, asr #16
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        bge     LDFR32
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
        b       LDFR33
LDFR32:
        cmn     r0, #2, 18
        mvnlt   r0, #0xFF
        biclt   r1, r0, #0x7F, 24
LDFR33:
        ldrsh   r0, [r2, #2]
        mul     r1, r0, r1
        mov     r0, r1, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        add     r8, r0, r8, asr #16
        cmp     r12, r8
        strlth  r12, [r3, #0x78]
        blt     LDFR34
        cmn     r8, #2, 18
        strgeh  r8, [r3, #0x78]
        strlth  r7, [r3, #0x78]
LDFR34:
        subs    r6, r6, #1
        add     r3, r3, #2
        add     r2, r2, #4
        bne     LDFR29
        ldrsh   r1, [r9, #0x74]
        ldrsh   r0, [r9, #0x78]
        add     r1, r0, r1
        cmp     r12, r1
        strlth  r12, [r9, #0x7C]
        blt     LDFR35
        cmn     r1, #2, 18
        strgeh  r1, [r9, #0x7C]
        ldrlt   r0, [sp, #0xC]
        strlth  r0, [r9, #0x7C]
LDFR35:
        ldrsh   r1, [r9, #0x76]
        ldrsh   r0, [r9, #0x7A]
        add     r1, r0, r1
        cmp     r12, r1
        strlth  r12, [r9, #0x7E]
        blt     LDFR36
        cmn     r1, #2, 18
        strgeh  r1, [r9, #0x7E]
        ldrlt   r0, [sp, #0xC]
        strlth  r0, [r9, #0x7E]
LDFR36:
        ldrsh   r0, [r9, #0x5E]
        ldr     r1, [sp, #0x14]
        strh    r0, [r1, +r5]
        ldrsh   r0, [r9, #0x5E]
        cmp     lr, r0
        ldrlt   r0, [sp, #0x14]
        strlth  lr, [r0, +r5]
        blt     LDFR37
        cmn     r0, #1, 18
        bge     LDFR37
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x14]
        strh    r0, [r1, +r5]
LDFR37:
        ldr     r0, [sp, #0x20]
        add     r11, r11, #2
        cmp     r11, r0
        blt     LDFR2
LDFR38:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LDFR39:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     r3, r2
        b       LDFR22
LDFR40:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   table_quant_ril4
        .long   LDFR_index_pred_coeff
        .long   table_quant_risi4
        .long   table_quant_oq4
        .long   table_quant_risi6
        .long   table_quant_ril6
        .long   table_quant_oq6
        .long   table_quant_risi5
        .long   table_quant_ril5
        .long   table_quant_oq5
        .long   table_quant_ih2
        .long   table_quant_sih
        .long   table_quant_oq2
        .long   table_quant_wl
        .long   table_quant_wh
        .long   table_ila


        .data
        .align  4


LDFR_index_pred_coeff:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00
        .byte   0x01,0x00,0x01,0x00,0x01,0x00,0x01,0x00


