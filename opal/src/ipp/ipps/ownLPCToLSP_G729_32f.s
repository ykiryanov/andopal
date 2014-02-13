        .text
        .align  4
        .globl  ownLPCToLSP_G729_32f


ownLPCToLSP_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x94
        ldr     lr, [pc, #0xCE8]
        mov     r9, r2
        str     r9, [sp, #0x30]
        ldr     r6, [lr]
        mov     r7, r0
        str     r7, [sp, #0x28]
        str     r6, [sp, #0x10]
        ldr     r8, [r7, #4]
        add     r12, sp, #0x7C
        str     r6, [r12]
        ldr     r12, [sp, #0xB8]
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0xBC]
        str     r12, [sp, #0x3C]
        add     r12, sp, #0x7C
        ldr     r0, [r12]
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x2C]
        ldr     r4, [r7, #0x28]
        add     r12, sp, #0x64
        str     r6, [r12]
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r1, r4
        bl      __addsf3
        add     r5, sp, #0x64
        ldr     r1, [r5]
        add     r3, sp, #0x7C
        str     r0, [r3, #4]
        mov     r0, r8
        bl      __addsf3
        mov     r1, r4
        bl      __subsf3
        ldr     r10, [r7, #0x24]
        ldr     r8, [r7, #8]
        add     r3, sp, #0x7C
        ldr     r1, [r3, #4]
        str     r0, [r5, #4]
        mov     r0, r8
        bl      __subsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r5, #4]
        mov     r4, r0
        add     r3, sp, #0x7C
        str     r4, [r3, #8]
        mov     r0, r8
        bl      __addsf3
        mov     r1, r10
        bl      __subsf3
        ldr     r10, [r7, #0xC]
        ldr     r11, [r7, #0x20]
        mov     r8, r0
        str     r8, [r5, #8]
        mov     r1, r4
        mov     r0, r10
        bl      __subsf3
        mov     r1, r11
        bl      __addsf3
        mov     r4, r0
        add     r3, sp, #0x7C
        str     r4, [r3, #0xC]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r8, [r7, #0x10]
        ldr     r11, [r7, #0x1C]
        mov     r10, r0
        str     r10, [r5, #0xC]
        mov     r1, r4
        mov     r0, r8
        bl      __subsf3
        mov     r1, r11
        bl      __addsf3
        add     r3, sp, #0x7C
        mov     r4, r0
        str     r4, [r3, #0x10]
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r10, [r7, #0x14]
        ldr     r7, [r7, #0x18]
        mov     r8, r0
        str     r8, [r5, #0x10]
        mov     r1, r4
        mov     r0, r10
        bl      __subsf3
        mov     r1, r7
        bl      __addsf3
        add     r3, sp, #0x7C
        str     r0, [r3, #0x14]
        mov     r1, r8
        mov     r0, r10
        bl      __addsf3
        mov     r1, r7
        bl      __subsf3
        ldr     r4, [r9], #-4
        str     r0, [r5, #0x14]
        mov     r1, r4
        mov     r0, r4
        bl      __addsf3
        add     r3, sp, #0x7C
        ldr     r7, [r3, #4]
        mov     r5, r0
        mov     r1, r7
        bl      __addsf3
        mov     r8, r0
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __subsf3
        add     r3, sp, #0x7C
        ldr     r6, [r3, #8]
        str     r9, [sp, #0x14]
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __subsf3
        add     r2, sp, #0x7C
        ldr     r1, [r2, #0xC]
        str     r1, [sp, #0xC]
        bl      __addsf3
        add     r2, sp, #0x7C
        ldr     r8, [r2, #0x10]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x4C]
        mov     r1, r5
        mov     r10, #0
        bl      __mulsf3
        mov     r1, r9
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [pc, #0xAB8]
        add     r3, sp, #0x7C
        ldr     r1, [r3, #0x14]
        ldr     r2, [r2]
        mov     r5, r0
        mov     r11, r10
        mov     r0, r1
        str     r2, [sp, #8]
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        mov     r9, r0
        bl      __subsf3
        str     r0, [sp, #0x4C]
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r2, [pc, #0xA70]
        mov     r5, r0
        ldr     r2, [r2]
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0xC]
        str     r11, [sp, #0x44]
        str     r2, [sp, #0x4C]
LDIC0:
        ldr     r2, [sp, #0x38]
        cmp     r10, r2
        bge     LDIC5
        ldr     r2, [sp, #0x30]
        add     r10, r10, #2
        str     r4, [sp, #0x1C]
        ldr     r4, [r2, +r10, lsl #2]
        mov     r11, r5
        mov     r0, r4
        mov     r1, r4
        bl      __addsf3
        mov     r5, r0
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __subsf3
        mov     r1, r6
        bl      __addsf3
        str     r0, [sp, #0x20]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __subsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x20]
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x18]
        bl      __subsf3
        ldr     r1, [sp, #0x20]
        mov     r5, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LDIC0
        ldr     r2, [sp, #0x14]
        ldr     r1, [r2, +r10, lsl #2]
        str     r1, [sp, #0x20]
        mov     r0, r1
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        str     r0, [sp, #0x5C]
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __subsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        str     r0, [sp, #0x60]
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __subsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        str     r0, [sp, #0x5C]
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x18]
        bl      __subsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x60]
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r11
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LDIC1
        ldr     r5, [sp, #0x24]
        ldr     r4, [sp, #0x20]
        sub     r10, r10, #1
        b       LDIC2
LDIC1:
        ldr     r2, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        str     r2, [sp, #0x1C]
LDIC2:
        ldr     r2, [sp, #0x3C]
        sub     r10, r10, #1
        cmp     r2, #0
        ble     LDIC4
        ldr     r0, [sp, #0x3C]
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x1C]
        str     r10, [sp, #0x40]
        str     r8, [sp, #0x58]
        str     r9, [sp, #0xC]
        str     r6, [sp, #0x54]
        str     r7, [sp, #0x50]
        mov     r10, r0
LDIC3:
        mov     r0, r4
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #8]
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        mov     r6, r0
        bl      __addsf3
        mov     r8, r0
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __subsf3
        ldr     r1, [sp, #0x54]
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        mov     r8, r0
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #0x18]
        mov     r1, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r6
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r6, r0
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __lesf2
        cmp     r0, #0
        movgt   r5, r6
        movgt   r4, r7
        strle   r6, [sp, #0x48]
        movle   r11, r7
        subs    r10, r10, #1
        bne     LDIC3
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp, #0x40]
LDIC4:
        mov     r1, r4
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r5
        bl      __subsf3
        mov     r1, r0
        mov     r0, r6
        bl      __divsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x34]
        mov     r4, r0
        str     r4, [r3, +r2, lsl #2]
        add     r2, r2, #1
        tst     r2, #1
        str     r2, [sp, #0x44]
        addeq   r11, sp, #0x7C
        addne   r11, sp, #0x64
        mov     r0, r4
        mov     r1, r4
        bl      __addsf3
        ldr     r7, [r11, #4]
        mov     r5, r0
        mov     r1, r7
        bl      __addsf3
        ldr     r6, [r11, #8]
        mov     r8, r0
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __subsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r9, [r11, #0xC]
        str     r0, [sp, #0x60]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r8
        bl      __subsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r8, [r11, #0x10]
        str     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r11, #0x14]
        ldr     r1, [sp, #8]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x18]
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        mov     r5, r0
        cmp     r2, #0xA
        blt     LDIC0
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LDIC5:
        ldr     r0, [sp, #0x3C]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x38]
        str     r0, [sp]
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        bl      LDIC_ownLPCToLSP_Acc_G729_32f
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LDIC_ownLPCToLSP_Acc_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x78
        ldr     lr, [pc, #0x62C]
        mov     r7, r1
        add     r12, sp, #0x60
        ldr     r5, [lr]
        mov     r10, r0
        mov     r6, r3
        add     lr, sp, #0x60
        str     r5, [sp, #0x18]
        ldr     r9, [r10, #4]
        ldr     r8, [r10, #0x28]
        str     r5, [r12]
        ldr     r0, [lr]
        ldr     lr, [sp, #0x9C]
        add     r12, sp, #0x48
        mov     r4, r2
        str     lr, [sp, #0xC]
        str     r5, [r12]
        ldr     r12, [sp, #0xA0]
        mov     r1, r0
        str     r4, [sp]
        str     r12, [sp, #0x10]
        mov     r0, r9
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        add     r12, sp, #0x60
        str     r0, [r12, #4]
        mov     r0, r9
        mov     r9, #0
        str     r9, [sp, #4]
        add     r12, sp, #0x48
        ldr     r1, [r12]
        bl      __addsf3
        mov     r1, r8
        bl      __subsf3
        ldr     r11, [r10, #8]
        add     r12, sp, #0x48
        str     r0, [r12, #4]
        add     r12, sp, #0x60
        ldr     r1, [r12, #4]
        ldr     r12, [r10, #0x24]
        mov     r0, r11
        str     r9, [sp, #8]
        str     r12, [sp, #0x44]
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        add     r12, sp, #0x48
        ldr     r1, [r12, #4]
        mov     r8, r0
        add     r12, sp, #0x60
        str     r8, [r12, #8]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        bl      __subsf3
        add     r12, sp, #0x48
        mov     r11, r0
        str     r11, [r12, #8]
        ldr     r12, [r10, #0xC]
        mov     r1, r8
        str     r12, [sp, #0x44]
        ldr     r12, [r10, #0x20]
        ldr     r0, [sp, #0x44]
        str     r9, [sp, #0x14]
        str     r12, [sp, #0x40]
        bl      __subsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        mov     r8, r0
        add     r12, sp, #0x60
        str     r8, [r12, #0xC]
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        bl      __subsf3
        ldr     r12, [r10, #0x10]
        mov     r1, r8
        mov     r9, r0
        str     r12, [sp, #0x44]
        ldr     r12, [r10, #0x1C]
        str     r12, [sp, #0x40]
        add     r12, sp, #0x48
        str     r9, [r12, #0xC]
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        add     r12, sp, #0x60
        mov     r8, r0
        str     r8, [r12, #0x10]
        ldr     r0, [sp, #0x44]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        bl      __subsf3
        ldr     r12, [r10, #0x14]
        mov     r9, r0
        mov     r1, r8
        str     r12, [sp, #0x44]
        ldr     r10, [r10, #0x18]
        add     r12, sp, #0x48
        str     r9, [r12, #0x10]
        ldr     r0, [sp, #0x44]
        bl      __subsf3
        mov     r1, r10
        bl      __addsf3
        add     r12, sp, #0x60
        str     r0, [r12, #0x14]
        ldr     r0, [sp, #0x44]
        mov     r1, r9
        bl      __addsf3
        mov     r1, r10
        bl      __subsf3
        ldr     r4, [r4]
        add     r12, sp, #0x48
        str     r0, [r12, #0x14]
        add     r8, sp, #0x60
        mov     r1, r4
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r8, #4]
        mov     r9, r0
        bl      __addsf3
        mov     r11, r0
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __subsf3
        ldr     r1, [r8, #8]
        bl      __addsf3
        mov     r10, r0
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [r8, #0xC]
        bl      __addsf3
        mov     r5, r0
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [r8, #0x10]
        bl      __addsf3
        ldr     r2, [pc, #0x3E8]
        mov     r10, r0
        ldr     r0, [r8, #0x14]
        ldr     r9, [r2]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [pc, #0x3B4]
        mov     r5, r0
        ldr     r2, [r2]
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #4]
        str     r9, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r7, [sp, #0x30]
LDIC6:
        ldr     r2, [sp, #0xC]
        cmp     r6, r2
        bge     LDIC9
        ldr     r2, [sp]
        str     r4, [sp, #0x2C]
        add     r6, r6, #1
        ldr     r4, [r2, +r6, lsl #2]
        mov     r7, r5
        str     r7, [sp, #0x38]
        mov     r0, r4
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r8, #4]
        mov     r5, r0
        str     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r10, [r8, #8]
        mov     r9, r0
        mov     r1, r5
        str     r10, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __subsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r11, [r8, #0xC]
        mov     r10, r0
        str     r11, [sp, #0x28]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __subsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r8, #0x10]
        mov     r9, r0
        mov     r1, r5
        str     r11, [sp, #0x24]
        bl      __mulsf3
        mov     r1, r10
        bl      __subsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r8, #0x14]
        ldr     r1, [sp, #0x40]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r9
        bl      __subsf3
        mov     r9, r0
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r5, r0
        mov     r1, r7
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LDIC6
        ldr     r2, [sp, #0x10]
        sub     r6, r6, #1
        cmp     r2, #0
        ble     LDIC8
        ldr     r7, [sp, #0x10]
        ldr     r11, [sp, #0x2C]
        str     r10, [sp, #0x3C]
        str     r6, [sp, #4]
LDIC7:
        mov     r0, r4
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        mov     r6, r0
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __subsf3
        ldr     r1, [sp, #0x20]
        bl      __addsf3
        mov     r10, r0
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #0x3C]
        mov     r1, r9
        bl      __subsf3
        mov     r9, r0
        mov     r1, r6
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r6, r0
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __lesf2
        cmp     r0, #0
        movgt   r5, r6
        movgt   r4, r8
        strle   r6, [sp, #0x38]
        movle   r11, r8
        subs    r7, r7, #1
        bne     LDIC7
        ldr     r6, [sp, #4]
        str     r11, [sp, #0x2C]
LDIC8:
        mov     r1, r4
        ldr     r0, [sp, #0x2C]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x38]
        mov     r1, r5
        bl      __subsf3
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #8]
        ldr     r12, [sp, #0x34]
        rsbs    r2, r2, #1
        str     r2, [sp, #0x14]
        mov     r4, r0
        str     r4, [r12, +r3, lsl #2]
        add     r3, r3, #1
        str     r3, [sp, #8]
        addeq   r8, sp, #0x60
        addne   r8, sp, #0x48
        mov     r1, r4
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r8, #4]
        mov     r5, r0
        bl      __addsf3
        mov     r7, r0
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __subsf3
        ldr     r1, [r8, #8]
        bl      __addsf3
        mov     r9, r0
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __subsf3
        ldr     r1, [r8, #0xC]
        bl      __addsf3
        mov     r7, r0
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [r8, #0x10]
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        ldr     r2, [r8, #0x14]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #8]
        mov     r5, r0
        cmp     r2, #0xA
        blt     LDIC6
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
LDIC9:
        ldr     r7, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r0, [r7]
        str     r0, [r6]
        ldr     r0, [r7, #4]
        str     r0, [r6, #4]
        ldr     r0, [r7, #8]
        str     r0, [r6, #8]
        ldr     r0, [r7, #0xC]
        str     r0, [r6, #0xC]
        ldr     r0, [r7, #0x10]
        str     r0, [r6, #0x10]
        ldr     r0, [r7, #0x14]
        str     r0, [r6, #0x14]
        ldr     r0, [r7, #0x18]
        str     r0, [r6, #0x18]
        ldr     r0, [r7, #0x1C]
        str     r0, [r6, #0x1C]
        ldr     r0, [r7, #0x20]
        str     r0, [r6, #0x20]
        ldr     r7, [r7, #0x24]
        str     r7, [r6, #0x24]
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
        .long   LDIC__2il0floatpacket.1
        .long   LDIC__2il0floatpacket.2
        .long   LDIC__2il0floatpacket.3
        .long   LDIC__2il0floatpacket.4
        .long   LDIC__2il0floatpacket.5
        .long   LDIC__2il0floatpacket.6


        .data
        .align  4


LDIC__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LDIC__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x3F
LDIC__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00
LDIC__2il0floatpacket.4:
        .byte   0x00,0x00,0x80,0x3F
LDIC__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F
LDIC__2il0floatpacket.6:
        .byte   0x00,0x00,0x00,0x00


