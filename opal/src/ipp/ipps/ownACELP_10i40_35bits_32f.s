        .text
        .align  4
        .globl  ownACELP_10i40_35bits_32f


ownACELP_10i40_35bits_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB2, 28
        ldr     r4, [sp, #0xB44]
        add     lr, sp, #1, 22
        add     lr, lr, #0x71, 30
        and     lr, lr, #0x1F
        add     r12, sp, #1, 22
        rsb     lr, lr, #0
        str     r4, [sp, #0x8C]
        ldr     r4, [sp, #0xB48]
        add     r12, r12, #0x71, 30
        and     lr, lr, #0x1F
        add     r7, r12, lr
        add     r6, sp, #2, 22
        add     r12, sp, #2, 22
        str     r4, [sp, #0x90]
        add     r6, r6, #0x45, 30
        add     r12, r12, #0x64
        str     r3, [sp, #0x88]
        and     r6, r6, #0xF
        add     r4, sp, #2, 22
        rsb     r6, r6, #0
        add     r3, sp, #2, 22
        and     r12, r12, #0xF
        add     r4, r4, #0x45, 30
        add     lr, sp, #2, 22
        and     r6, r6, #0xF
        add     r3, r3, #0x7D, 30
        rsb     r12, r12, #0
        add     lr, lr, #0x64
        add     r6, r4, r6
        and     r12, r12, #0xF
        and     r3, r3, #0xF
        add     r4, lr, r12
        rsb     r3, r3, #0
        add     r12, sp, #2, 22
        and     r3, r3, #0xF
        add     r12, r12, #0x7D, 30
        add     r3, r12, r3
        str     r2, [sp, #0x84]
        str     r3, [sp, #0x94]
        mov     r5, r0
        mov     r10, r1
        mov     r0, r7
        mov     r1, #0xA0
        add     r9, sp, #2, 22
        add     r8, sp, #0xA4
        bl      _ippsZero_32f
        ldr     r12, [pc, #0xD18]
        add     r3, sp, #0xA4
        add     r9, r9, #0x71, 30
        ldr     r11, [r12]
        and     r3, r3, #0x1F
        and     r9, r9, #0xF
        rsb     r12, r3, #0
        rsb     r9, r9, #0
        add     lr, sp, #2, 22
        and     r3, r9, #0xF
        add     lr, lr, #0x71, 30
        add     r3, lr, r3
        str     r3, [sp, #0x3C]
        and     r12, r12, #0x1F
        add     r3, r7, #0xA0
        add     r7, r7, #0x1E, 28
        add     r12, r8, r12
        str     r7, [sp, #0xA0]
        str     r12, [sp, #0x98]
        str     r3, [sp, #0x9C]
        mov     r8, r11
        mov     r9, #0
        add     r7, r10, #4
LDNL0:
        ldr     r0, [r7, #-4]
        add     r9, r9, #4
        mov     r1, r0
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r7]
        mov     r8, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r7, #4]
        mov     r8, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r7, #8]
        mov     r8, r0
        add     r7, r7, #0x10
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        cmp     r9, #0x28
        mov     r8, r0
        blt     LDNL0
        ldr     r3, [pc, #0xC50]
        mov     r1, r8
        mov     r7, r11
        ldr     r9, [r3]
        mov     r3, #0
        str     r3, [sp, #0x28]
        add     r3, r5, #4
        str     r3, [sp, #0x24]
        mov     r0, r9
        bl      __gtsf2
        cmp     r0, #0
        movgt   r8, r9
        mov     r0, r8
        bl      sqrtf
        ldr     r3, [pc, #0xC1C]
        mov     r1, r0
        ldr     r8, [r3]
        mov     r0, r8
        bl      __divsf3
        str     r10, [sp, #0x14]
        str     r5, [sp, #0x10]
        ldr     r10, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        str     r0, [sp, #0x20]
LDNL1:
        ldr     r0, [r10, #-4]
        add     r5, r5, #4
        mov     r1, r0
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r10]
        mov     r7, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r10, #4]
        mov     r7, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r10, #8]
        mov     r7, r0
        add     r10, r10, #0x10
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        cmp     r5, #0x28
        mov     r7, r0
        blt     LDNL1
        ldr     r10, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        mov     r1, r7
        mov     r0, r9
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r9
        mov     r0, r7
        bl      sqrtf
        mov     r1, r0
        mov     r0, r8
        bl      __divsf3
        ldr     r12, [pc, #0xB58]
        mov     r3, #0
        ldr     r12, [r12]
        mov     r2, r3
        str     r0, [sp, #0x6C]
        mov     lr, r2
        str     r8, [sp, #0x70]
        str     r11, [sp, #0x68]
        mov     r0, r5
        mov     r1, r10
LDNL2:
        cmp     lr, #0x28
        mov     r5, r12
        mov     r7, lr
        bge     LDNL6
        add     r8, r4, r7, lsl #2
        add     r10, r0, r7, lsl #2
        add     r11, r1, r7, lsl #2
        add     r9, r6, r7, lsl #2
        str     r12, [sp, #0x74]
        str     lr, [sp, #0x7C]
        str     r2, [sp, #0x78]
        str     r3, [sp, #0x80]
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
LDNL3:
        ldr     r0, [sp, #0x20]
        ldr     r1, [r11], #0x14
        ldr     r4, [r10]
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x6C]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x68]
        mov     r6, r0
        bl      __gesf2
        cmp     r0, #0
        blt     LDNL4
        ldr     r2, [sp, #0x70]
        str     r2, [r9]
        ldr     r2, [sp, #0x74]
        str     r2, [r8]
        b       LDNL5
LDNL4:
        ldr     r2, [sp, #0x74]
        eor     r4, r4, #2, 2
        str     r2, [r9]
        ldr     r2, [sp, #0x70]
        str     r2, [r8]
LDNL5:
        bic     r6, r6, #2, 2
        str     r4, [r10], #0x14
        mov     r0, r6
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r5, r6
        strgt   r7, [sp, #0x78]
        add     r7, r7, #5
        cmp     r7, #0x28
        add     r8, r8, #0x14
        add     r9, r9, #0x14
        blt     LDNL3
        ldr     r12, [sp, #0x74]
        ldr     lr, [sp, #0x7C]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x80]
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x10]
LDNL6:
        add     r8, sp, #2, 22
        add     r7, sp, #2, 22
        add     r8, r8, #0xBE, 30
        str     r5, [r8, +lr, lsl #2]
        add     r7, r7, #0xB6, 30
        add     lr, lr, #1
        strh    r2, [r7, +r3]
        cmp     lr, #5
        add     r3, r3, #2
        blt     LDNL2
        mov     r5, r0
        ldr     r3, [sp, #0x98]
        mov     r1, r6
        mov     r2, r4
        str     r3, [sp, #8]
        ldr     r3, [sp, #0xA0]
        mov     r8, #0
        str     r3, [sp]
        add     r3, sp, #2, 22
        add     r3, r3, #0x89, 30
        str     r3, [sp, #4]
        ldr     r0, [sp, #0x84]
        ldr     r3, [sp, #0x9C]
        bl      _ippsToeplizMatrix_G729E_32f
        add     r12, sp, #2, 22
        add     r12, r12, #0xBE, 30
        ldr     r0, [r12, #0x10]
        str     r8, [sp, #0x20]
        add     r3, sp, #2, 22
        add     r3, r3, #0xBE, 30
        ldr     r1, [r3]
        bl      __addsf3
        add     r3, sp, #2, 22
        add     r10, sp, #2, 22
        add     r3, r3, #0xBE, 30
        ldr     r1, [r3, #4]
        add     r10, r10, #0xBE, 30
        mov     r9, r0
        ldr     r0, [r10]
        bl      __addsf3
        add     r3, sp, #2, 22
        add     r7, sp, #2, 22
        str     r0, [r10]
        add     r3, r3, #0xBE, 30
        ldr     r1, [r3, #8]
        add     r7, r7, #0xBE, 30
        ldr     r0, [r7, #4]
        bl      __addsf3
        str     r0, [sp, #0x28]
        add     r3, sp, #2, 22
        add     r10, sp, #2, 22
        str     r0, [r7, #4]
        add     r3, r3, #0xBE, 30
        ldr     r1, [r3, #0xC]
        add     r10, r10, #0xBE, 30
        ldr     r0, [r10, #8]
        bl      __addsf3
        add     r3, sp, #2, 22
        add     r11, sp, #2, 22
        mov     r7, r0
        add     r3, r3, #0xBE, 30
        ldr     r1, [r3, #0x10]
        add     r11, r11, #0xBE, 30
        ldr     r0, [r11, #0xC]
        str     r7, [r10, #8]
        bl      __addsf3
        ldr     r3, [pc, #0x930]
        str     r0, [r11, #0xC]
        ldr     r11, [r3]
        add     r3, sp, #2, 22
        add     r3, r3, #0xBE, 30
        str     r9, [r3, #0x10]
        str     r6, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r9, [sp, #0x28]
        add     r10, sp, #2, 22
        str     r5, [sp, #0x10]
        add     r10, r10, #0xBE, 30
        str     r4, [sp, #0x18]
        mov     r5, r0
LDNL7:
        add     r1, sp, #2, 22
        add     r1, r1, #0xBE, 30
        ldr     r4, [r1]
        mov     r0, r9
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movle   r9, #0
        movgt   r4, r9
        movgt   r9, #1
        mov     r0, r7
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r7
        movgt   r9, #2
        mov     r0, r5
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r5
        movgt   r9, #3
        ldr     r0, [r10, #0x10]
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r9, #4
        add     r0, sp, #2, 22
        mov     r8, r8, lsl #1
        add     r0, r0, #0xB9, 30
        add     r6, r6, #1
        add     r1, sp, #2, 22
        mov     r2, r6, lsl #16
        strh    r9, [r0, +r8]
        mov     r8, r2, asr #16
        add     r1, r1, #0xBE, 30
        cmp     r8, #3
        str     r11, [r1, +r9, lsl #2]
        bge     LDNL8
        add     r1, sp, #2, 22
        add     r1, r1, #0xBE, 30
        ldr     r7, [r1, #8]
        add     r0, sp, #2, 22
        add     r1, sp, #2, 22
        add     r0, r0, #0xBE, 30
        ldr     r9, [r0, #4]
        add     r1, r1, #0xBE, 30
        ldr     r5, [r1, #0xC]
        b       LDNL7
LDNL8:
        ldr     r12, [pc, #0x830]
        ldr     r6, [sp, #0x1C]
        ldr     r4, [sp, #0x18]
        ldr     r12, [r12]
        ldr     r5, [sp, #0x10]
        add     r3, sp, #2, 22
        add     r1, sp, #2, 22
        add     r0, sp, #2, 22
        add     r10, sp, #2, 22
        add     r9, sp, #2, 22
        add     r8, sp, #2, 22
        add     r7, sp, #2, 22
        mov     lr, #0
        mov     r2, #3
        add     r3, r3, #0xB1, 30
        add     r1, r1, #0xC3, 30
        add     r0, r0, #0xB1, 30
        add     r10, r10, #0xB1, 30
        add     r9, r9, #0xC3, 30
        add     r8, r8, #0xB1, 30
        add     r7, r7, #0xB1, 30
        str     r2, [sp, #0x74]
        str     lr, [sp, #0x70]
        str     r12, [sp, #0x6C]
        str     r11, [sp, #0x68]
        str     r6, [sp, #0x1C]
LDNL9:
        ldr     lr, [sp, #0x70]
        add     r6, sp, #2, 22
        add     r6, r6, #0xB9, 30
        ldrsh   lr, [r6, +lr]
        add     r12, sp, #2, 22
        add     r12, r12, #0xB6, 30
        add     r3, sp, #2, 22
        add     r3, r3, #0xB6, 30
        mov     r6, #2
        str     r6, [sp, #0x14]
        ldr     r6, [pc, #0x7A8]
        mov     r7, lr, lsl #1
        ldrsh   r7, [r6, +r7]
        add     lr, r6, lr, lsl #1
        str     lr, [sp, #0x28]
        ldrsh   r8, [lr, #2]
        mov     lr, r7, lsl #1
        ldrsh   r10, [r12, +lr]
        ldr     r12, [sp, #0x98]
        add     r11, r12, r7, lsl #8
        mov     r12, r8, lsl #1
        ldrsh   r9, [r3, +r12]
        ldr     r0, [r5, +r10, lsl #2]
        mov     r3, r10, lsl #2
        str     r3, [sp, #0x20]
        mov     r3, r10, asr #31
        str     r3, [sp, #0x80]
        ldr     r1, [r5, +r9, lsl #2]
        mov     r3, r9, lsl #2
        str     r3, [sp, #0x24]
        mov     r3, r9, asr #31
        str     r3, [sp, #0x7C]
        bl      __addsf3
        ldr     r3, [pc, #0x750]
        mov     r6, r0
        smull   lr, r12, r10, r3
        smull   lr, r3, r9, r3
        ldr     lr, [sp, #0x80]
        rsb     lr, lr, r12, asr #1
        ldr     r12, [sp, #0x7C]
        rsb     r12, r12, r3, asr #1
        mov     r3, lr, lsl #16
        add     lr, sp, #2, 22
        add     lr, lr, #0x89, 30
        add     r7, lr, r7, lsl #5
        mov     r12, r12, lsl #16
        add     lr, sp, #2, 22
        mov     r3, r3, asr #16
        ldr     r0, [r7, +r3, lsl #2]
        mov     r12, r12, asr #16
        add     lr, lr, #0x89, 30
        add     r8, lr, r8, lsl #5
        ldr     r1, [r8, +r12, lsl #2]
        add     r7, r12, r3, lsl #3
        mov     r7, r7, lsl #16
        bl      __addsf3
        mov     r7, r7, asr #16
        ldr     r1, [r11, +r7, lsl #2]
        bl      __addsf3
        add     r3, sp, #2, 22
        add     r12, sp, #2, 22
        add     r3, r3, #0xC3, 30
        add     r12, r12, #0xC3, 30
        strh    r9, [r12, #2]
        strh    r10, [r3]
        mov     r7, r0
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsZero_32f
        ldr     r3, [pc, #0x6AC]
        ldr     r8, [sp, #0x24]
        ldr     lr, [sp, #0x20]
        ldr     r11, [r3]
        str     r7, [sp, #0x44]
        ldr     r7, [sp, #0x1C]
LDNL10:
        ldr     r0, [lr, +r7]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LDNL11
        ldr     r12, [sp, #0xA0]
        sub     r12, r12, r10, lsl #2
        str     r12, [sp, #0x80]
        b       LDNL12
LDNL11:
        ldr     r12, [sp, #0x9C]
        sub     r12, r12, r10, lsl #2
        str     r12, [sp, #0x80]
LDNL12:
        ldr     r0, [r8, +r7]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        ldrge   r12, [sp, #0x9C]
        subge   r8, r12, r9, lsl #2
        ldrlt   r12, [sp, #0xA0]
        sublt   r8, r12, r9, lsl #2
        mov     r2, #0x28
        mov     r1, r4
        ldr     r0, [sp, #0x80]
        bl      _ippsAdd_32f_I
        mov     r0, r8
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsAdd_32f_I
        ldr     lr, [sp, #0x3C]
        add     r12, sp, #2, 22
        add     r12, r12, #0x89, 30
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x94]
        str     r12, [sp]
        mov     r3, r7
        str     lr, [sp, #4]
        ldr     r12, [sp, #0x14]
        ldr     r0, [sp, #0x9C]
        mov     r1, r4
        mov     r8, r12, lsl #1
        ldr     r12, [sp, #0x28]
        add     r11, r12, r8
        mov     r2, r11
        bl      LDNL_ownCorImpRespVec_G729E_32f
        ldr     r12, [sp, #0x28]
        ldrsh   lr, [r11, #2]
        ldr     r11, [pc, #0x5E8]
        ldrsh   r12, [r12, +r8]
        ldr     r0, [sp, #0x98]
        str     lr, [sp, #0x80]
        ldr     r11, [r11]
        mov     r1, #0
        add     r0, r0, r12, lsl #8
        add     r2, r5, r12, lsl #2
        str     r11, [sp, #0x78]
        ldr     r11, [pc, #0x5C0]
        add     r3, r5, lr, lsl #2
        ldr     lr, [sp, #0x94]
        ldr     r11, [r11]
        mov     r7, r2
        str     r11, [sp, #0x7C]
        ldr     r11, [pc, #0x5A0]
        ldr     r11, [r11]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x44]
        str     r12, [sp, #0x20]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x30]
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x10]
        mov     r8, r0
        mov     r4, r1
        mov     r9, r3
        mov     r5, lr
LDNL13:
        ldr     r1, [r7], #0x14
        mov     r0, r6
        bl      __addsf3
        ldr     r1, [r5], #4
        str     r0, [sp, #0x24]
        mov     r0, r10
        bl      __addsf3
        str     r5, [sp, #0x54]
        ldr     r10, [sp, #0x7C]
        ldr     r5, [sp, #0x78]
        mov     r1, r0
        mov     r12, r9
        mov     r2, r8
        mvn     lr, #0
        mov     r0, #0
        mov     r3, r11
        str     r7, [sp, #0x58]
        str     r8, [sp, #0x50]
        str     r9, [sp, #0x4C]
        str     r4, [sp, #0x48]
        str     lr, [sp, #0x5C]
        str     r1, [sp, #0x60]
        str     r6, [sp, #0x40]
        mov     r4, r0
        mov     r9, r2
        mov     r8, r3
        mov     r7, r12
LDNL14:
        ldr     r1, [r7], #0x14
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        ldr     r1, [r9], #4
        ldr     r2, [r8], #4
        mov     r11, r0
        mov     r0, r2
        bl      __addsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        str     r0, [sp, #0x64]
        mov     r1, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x38]
        bl      __gtsf2
        cmp     r0, #0
        ble     LDNL15
        ldr     r5, [sp, #0x64]
        mov     r10, r6
        str     r4, [sp, #0x5C]
LDNL15:
        add     r4, r4, #1
        cmp     r4, #8
        blt     LDNL14
        ldr     lr, [sp, #0x5C]
        str     r10, [sp, #0x7C]
        str     r5, [sp, #0x78]
        ldr     r7, [sp, #0x58]
        ldr     r5, [sp, #0x54]
        ldr     r8, [sp, #0x50]
        ldr     r9, [sp, #0x4C]
        ldr     r4, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        cmp     lr, #0
        blt     LDNL16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        str     r4, [sp, #0x2C]
        str     lr, [sp, #0x30]
LDNL16:
        add     r4, r4, #1
        cmp     r4, #8
        add     r8, r8, #0x20
        blt     LDNL13
        ldr     r10, [sp, #0x2C]
        ldr     r12, [sp, #0x20]
        ldr     r9, [sp, #0x30]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r5, [sp, #0x10]
        add     r10, r10, r10, lsl #2
        add     r9, r9, r9, lsl #2
        add     r10, r12, r10
        ldr     r12, [sp, #0x80]
        mov     r0, r6
        mov     r10, r10, lsl #16
        add     r9, r12, r9
        mov     r12, r9, lsl #16
        mov     r10, r10, asr #16
        ldr     r1, [r5, +r10, lsl #2]
        mov     r9, r12, asr #16
        ldr     r12, [r5, +r9, lsl #2]
        str     r12, [sp, #0x80]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        add     lr, sp, #2, 22
        add     lr, lr, #0xC3, 30
        add     r1, r2, #2
        mov     r2, r2, lsl #1
        strh    r10, [lr, +r2]
        ldr     lr, [sp, #0x7C]
        add     r12, sp, #2, 22
        mov     r1, r1, lsl #16
        add     r12, r12, #0xC3, 30
        mov     r1, r1, asr #16
        str     lr, [sp, #0x44]
        add     r12, r12, r8
        str     r1, [sp, #0x14]
        cmp     r1, #0xA
        mov     lr, r10, lsl #2
        mov     r8, r9, lsl #2
        mov     r6, r0
        strh    r9, [r12, #2]
        blt     LDNL10
        ldr     r7, [sp, #0x7C]
        mov     r0, r6
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        mov     r6, r0
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x68]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LDNL17
        add     r3, sp, #2, 22
        add     r12, sp, #2, 22
        add     lr, sp, #2, 22
        add     r8, sp, #2, 22
        add     r9, sp, #2, 22
        add     r10, sp, #2, 22
        add     r11, sp, #2, 22
        add     r0, sp, #2, 22
        add     r1, sp, #2, 22
        add     r2, sp, #2, 22
        add     r3, r3, #0xC3, 30
        ldrsh   r3, [r3]
        add     r12, r12, #0xC3, 30
        ldrsh   r12, [r12, #2]
        add     lr, lr, #0xC3, 30
        ldrsh   lr, [lr, #4]
        add     r8, r8, #0xC3, 30
        ldrsh   r8, [r8, #6]
        add     r9, r9, #0xC3, 30
        ldrsh   r9, [r9, #8]
        add     r10, r10, #0xC3, 30
        ldrsh   r10, [r10, #0xA]
        add     r11, r11, #0xC3, 30
        ldrsh   r11, [r11, #0xC]
        add     r0, r0, #0xC3, 30
        ldrsh   r0, [r0, #0xE]
        add     r1, r1, #0xC3, 30
        ldrsh   r1, [r1, #0x10]
        add     r2, r2, #0xC3, 30
        ldrsh   r2, [r2, #0x12]
        str     r6, [sp, #0x68]
        add     r6, sp, #2, 22
        str     r7, [sp, #0x6C]
        add     r6, r6, #0xB1, 30
        strh    r3, [r6]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r12, [r3, #2]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    lr, [r3, #4]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r8, [r3, #6]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r9, [r3, #8]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r10, [r3, #0xA]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r11, [r3, #0xC]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r0, [r3, #0xE]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r1, [r3, #0x10]
        add     r3, sp, #2, 22
        add     r3, r3, #0xB1, 30
        strh    r2, [r3, #0x12]
LDNL17:
        ldr     r3, [sp, #0x74]
        ldr     r12, [sp, #0x70]
        subs    r3, r3, #1
        str     r3, [sp, #0x74]
        add     r12, r12, #2
        str     r12, [sp, #0x70]
        bne     LDNL9
        ldr     r0, [sp, #0x88]
        ldr     r6, [sp, #0x1C]
        mov     r1, #0x28
        bl      _ippsZero_32f
        ldr     r0, [sp, #0x8C]
        mov     r1, #0x28
        mov     r5, #0
        bl      _ippsZero_32f
        add     r12, sp, #2, 22
        add     r12, r12, #0xBB, 30
        ldr     r2, [pc, #0x1E8]
        ldr     r0, [pc, #0x1EC]
        mvn     r3, #0
        strh    r3, [r12]
        strh    r3, [r12, #2]
        strh    r3, [r12, #4]
        strh    r3, [r12, #6]
        strh    r3, [r12, #8]
        ldr     r11, [sp, #0x88]
        mov     r4, #0xA
        str     r6, [sp, #0x1C]
LDNL18:
        add     r0, sp, #2, 22
        add     r0, r0, #0xB1, 30
        ldrsh   r9, [r0, +r5]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [pc, #0x1AC]
        ldr     r6, [pc, #0x1BC]
        rsb     r7, r9, #0x28
        ldr     r1, [r1]
        ldr     r0, [r0, +r9, lsl #2]
        bl      __gtsf2
        smull   r1, r2, r9, r6
        smull   r6, r3, r9, r6
        ldr     r1, [pc, #0x194]
        mov     lr, r9, asr #31
        rsb     r12, lr, r2, asr #1
        ldr     r1, [r1]
        rsb     r10, lr, r3, asr #1
        ldr     r3, [sp, #0x8C]
        ldr     r2, [r11, +r9, lsl #2]
        add     r12, r12, r12, lsl #2
        cmp     r0, #0
        sub     r8, r9, r12
        add     r6, r3, r9, lsl #2
        ble     LDNL19
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        str     r0, [r11, +r9, lsl #2]
        ldr     r0, [sp, #0x84]
        mov     r2, r7
        mov     r1, r6
        bl      _ippsAdd_32f_I
        b       LDNL20
LDNL19:
        mov     r0, r2
        bl      __subsf3
        str     r0, [r11, +r9, lsl #2]
        ldr     r0, [sp, #0x84]
        mov     r2, r7
        mov     r1, r6
        add     r10, r10, #8
        bl      _ippsSub_32f_I
LDNL20:
        add     r1, sp, #2, 22
        mov     r0, r8, lsl #1
        add     r1, r1, #0xBB, 30
        ldrsh   r0, [r1, +r0]
        cmp     r0, #0
        blt     LDNL25
        eor     r1, r10, r0
        tst     r1, #8
        bne     LDNL22
        add     r1, sp, #2, 22
        cmp     r0, r10
        mov     r8, r8, lsl #1
        add     r1, r1, #0xBB, 30
        bgt     LDNL21
        add     r0, r10, r0, lsl #4
        orr     r0, r0, #1, 24
        strh    r0, [r1, +r8]
        b       LDNL24
LDNL21:
        add     r10, r0, r10, lsl #4
        orr     r0, r10, #1, 24
        strh    r0, [r1, +r8]
        b       LDNL24
LDNL22:
        add     r1, sp, #2, 22
        and     r3, r0, #7
        and     r2, r10, #7
        cmp     r3, r2
        mov     r8, r8, lsl #1
        add     r1, r1, #0xBB, 30
        bgt     LDNL23
        add     r10, r0, r10, lsl #4
        orr     r0, r10, #1, 24
        strh    r0, [r1, +r8]
        b       LDNL24
LDNL23:
        add     r0, r10, r0, lsl #4
        orr     r0, r0, #1, 24
        strh    r0, [r1, +r8]
LDNL24:
        subs    r4, r4, #1
        add     r5, r5, #2
        bne     LDNL18
        add     r0, sp, #2, 22
        add     r1, sp, #2, 22
        add     r2, sp, #2, 22
        add     r3, sp, #2, 22
        add     r12, sp, #2, 22
        ldr     lr, [sp, #0x90]
        add     r0, r0, #0xBB, 30
        add     r1, r1, #0xBB, 30
        add     r2, r2, #0xBB, 30
        add     r3, r3, #0xBB, 30
        add     r12, r12, #0xBB, 30
        ldrsh   r0, [r0]
        ldrsh   r1, [r1, #2]
        ldrsh   r2, [r2, #4]
        ldrsh   r3, [r3, #6]
        ldrsh   r12, [r12, #8]
        and     r0, r0, #0x7F
        and     r1, r1, #0x7F
        and     r2, r2, #0x7F
        and     r3, r3, #0x7F
        and     r12, r12, #0x7F
        str     r0, [lr]
        str     r1, [lr, #4]
        str     r2, [lr, #8]
        str     r3, [lr, #0xC]
        str     r12, [lr, #0x10]
        add     sp, sp, #0xB2, 28
        ldmia   sp!, {r4 - r11, pc}
LDNL25:
        add     r0, sp, #2, 22
        add     r0, r0, #0xBB, 30
        mov     r8, r8, lsl #1
        strh    r10, [r0, +r8]
        b       LDNL24
        .long   LDNL__2il0floatpacket.1
        .long   LDNL__2il0floatpacket.2
        .long   LDNL__2il0floatpacket.3
        .long   LDNL__2il0floatpacket.4
        .long   LDNL_ipos
        .long   0x66666667
        .long   LDNL__2il0floatpacket.5
LDNL_ownCorImpRespVec_G729E_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r12, [pc, #-0x14]
        ldrsh   r8, [r2]
        ldr     r12, [r12]
        ldrsh   r10, [r2, #2]
        ldr     r6, [sp, #0x58]
        ldr     r7, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        str     r12, [sp, #0x30]
        add     r12, r1, r8, lsl #2
        cmp     r8, r10
        mov     r4, r3
        mov     r2, #0
        rsb     r5, r8, #0x28
        str     r12, [sp, #8]
        blt     LDNL36
        add     r11, r6, r10, lsl #5
        mov     r3, r7
        str     r6, [sp, #0x24]
        str     r10, [sp, #0x14]
        mov     r6, r3
        ldr     r10, [sp, #0x30]
        ldr     r3, [sp, #8]
        sub     r12, r5, #6
        str     r7, [sp, #0x20]
        str     r11, [sp, #0xC]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0x28]
        str     r1, [sp, #0x2C]
        mov     r7, r12
LDNL26:
        cmp     r5, #0
        mov     r4, r10
        ble     LDNL30
        cmp     r5, #6
        blt     LDNL48
        add     lr, r2, r2, lsl #2
        add     r1, r0, #4
        add     r8, r3, lr, lsl #2
        str     r5, [sp, #0x10]
        mov     r9, #0
        add     r11, r8, #4
        str     r0, [sp, #4]
        str     r2, [sp]
        mov     r5, r1
LDNL27:
        ldr     r1, [r11, #-4]
        ldr     r0, [r5, #-4]
        add     r9, r9, #5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5]
        ldr     r1, [r11]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5, #4]
        ldr     r1, [r11, #4]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r11, #8]
        ldr     r2, [r5, #8]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r11, #0xC]
        ldr     r2, [r5, #0xC]
        mov     r4, r0
        add     r5, r5, #0x14
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r7
        mov     r4, r0
        add     r11, r11, #0x14
        ble     LDNL27
        ldr     r3, [sp, #8]
        ldr     r5, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNL28:
        add     r11, r0, r9, lsl #2
        str     r0, [sp, #4]
        str     r2, [sp]
LDNL29:
        ldr     r1, [r8, +r9, lsl #2]
        ldr     r0, [r11], #4
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r5
        mov     r4, r0
        blt     LDNL29
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNL30:
        add     r2, r2, #1
        str     r4, [r6], #4
        cmp     r2, #8
        sub     r5, r5, #5
        sub     r7, r7, #5
        blt     LDNL26
        ldr     r10, [sp, #0x14]
        ldr     r6, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp, #0x20]
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #0x1C]
        ldr     r4, [sp, #0x28]
        rsb     r12, r10, #0x28
        add     r3, r1, r10, lsl #2
        mov     r2, r12
        str     r6, [sp, #0x24]
        sub     r1, r12, #6
        mov     r6, r12
        ldr     r12, [sp, #0x30]
        str     r8, [sp, #0x18]
        mov     lr, #0
        str     r7, [sp, #0x20]
        mov     r8, r2
        mov     r5, r9
        str     r11, [sp, #0xC]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0x28]
        mov     r7, r1
        mov     r2, lr
LDNL31:
        cmp     r6, #0
        mov     r4, r12
        ble     LDNL35
        cmp     r8, #6
        blt     LDNL47
        add     r9, r2, r2, lsl #2
        add     r1, r0, #4
        add     r9, r3, r9, lsl #2
        str     r6, [sp, #8]
        mov     r10, #0
        add     r11, r9, #4
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #4]
        mov     r6, r1
LDNL32:
        ldr     r1, [r11, #-4]
        ldr     r0, [r6, #-4]
        add     r10, r10, #5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r6]
        ldr     r1, [r11]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r6, #4]
        ldr     r1, [r11, #4]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r11, #8]
        ldr     r2, [r6, #8]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r11, #0xC]
        ldr     r2, [r6, #0xC]
        mov     r4, r0
        add     r6, r6, #0x14
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r7
        mov     r4, r0
        add     r11, r11, #0x14
        ble     LDNL32
        ldr     r2, [sp, #0x10]
        ldr     r6, [sp, #8]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNL33:
        add     r11, r0, r10, lsl #2
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #4]
LDNL34:
        ldr     r1, [r9, +r10, lsl #2]
        ldr     r0, [r11], #4
        add     r10, r10, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r6
        mov     r4, r0
        blt     LDNL34
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNL35:
        add     r2, r2, #1
        str     r4, [r5], #4
        cmp     r2, #8
        sub     r8, r8, #5
        sub     r6, r6, #5
        sub     r7, r7, #5
        blt     LDNL31
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        ldr     r11, [sp, #0xC]
        ldr     r4, [sp, #0x28]
        ldr     r0, [r9]
        ldr     r1, [r4, +r10, lsl #2]
        add     r5, r4, r8, lsl #2
        bl      __mulsf3
        ldr     r1, [r6, +r10, lsl #5]
        add     r10, r4, r10, lsl #2
        bl      __addsf3
        str     r0, [r9]
        ldr     r0, [r7]
        ldr     r1, [r4, +r8, lsl #2]
        bl      __mulsf3
        ldr     r1, [r11, #0x80]
        bl      __addsf3
        str     r0, [r7]
        ldr     r1, [r10, #0x14]
        ldr     r0, [r9, #4]
        bl      __mulsf3
        ldr     r1, [r11, #4]
        bl      __addsf3
        str     r0, [r9, #4]
        ldr     r0, [r7, #4]
        ldr     r1, [r5, #0x14]
        bl      __mulsf3
        ldr     r1, [r11, #0x84]
        bl      __addsf3
        str     r0, [r7, #4]
        ldr     r0, [r9, #8]
        ldr     r1, [r10, #0x28]
        bl      __mulsf3
        ldr     r1, [r11, #8]
        bl      __addsf3
        str     r0, [r9, #8]
        ldr     r1, [r5, #0x28]
        ldr     r0, [r7, #8]
        bl      __mulsf3
        ldr     r1, [r11, #0x88]
        bl      __addsf3
        str     r0, [r7, #8]
        ldr     r0, [r9, #0xC]
        ldr     r1, [r10, #0x3C]
        bl      __mulsf3
        ldr     r1, [r11, #0xC]
        bl      __addsf3
        str     r0, [r9, #0xC]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r5, #0x3C]
        bl      __mulsf3
        ldr     r1, [r11, #0x8C]
        bl      __addsf3
        str     r0, [r7, #0xC]
        ldr     r1, [r10, #0x50]
        ldr     r0, [r9, #0x10]
        bl      __mulsf3
        ldr     r1, [r11, #0x10]
        bl      __addsf3
        str     r0, [r9, #0x10]
        ldr     r0, [r7, #0x10]
        ldr     r1, [r5, #0x50]
        bl      __mulsf3
        ldr     r1, [r11, #0x90]
        bl      __addsf3
        str     r0, [r7, #0x10]
        ldr     r0, [r9, #0x14]
        ldr     r1, [r10, #0x64]
        bl      __mulsf3
        ldr     r1, [r11, #0x14]
        bl      __addsf3
        str     r0, [r9, #0x14]
        ldr     r1, [r5, #0x64]
        ldr     r0, [r7, #0x14]
        bl      __mulsf3
        ldr     r1, [r11, #0x94]
        bl      __addsf3
        str     r0, [r7, #0x14]
        ldr     r1, [r10, #0x78]
        ldr     r0, [r9, #0x18]
        bl      __mulsf3
        ldr     r1, [r11, #0x18]
        bl      __addsf3
        str     r0, [r9, #0x18]
        ldr     r1, [r5, #0x78]
        ldr     r0, [r7, #0x18]
        bl      __mulsf3
        ldr     r1, [r11, #0x98]
        bl      __addsf3
        str     r0, [r7, #0x18]
        ldr     r0, [r9, #0x1C]
        ldr     r1, [r10, #0x8C]
        bl      __mulsf3
        ldr     r1, [r11, #0x1C]
        bl      __addsf3
        str     r0, [r9, #0x1C]
        ldr     r0, [r7, #0x1C]
        ldr     r1, [r5, #0x8C]
        bl      __mulsf3
        ldr     r1, [r11, #0x9C]
        bl      __addsf3
        str     r0, [r7, #0x1C]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDNL36:
        mov     r12, r5
        sub     r3, r5, #6
        add     r10, r6, r8, lsl #5
        mov     r11, r7
        str     r7, [sp, #0x20]
        str     r6, [sp, #0x24]
        mov     r6, r3
        mov     r7, r12
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #8]
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0x28]
        str     r1, [sp, #0x2C]
LDNL37:
        cmp     r5, #0
        mov     r4, r3
        ble     LDNL41
        cmp     r7, #6
        blt     LDNL50
        add     lr, r2, r2, lsl #2
        add     r1, r0, #4
        add     r8, r12, lr, lsl #2
        str     r5, [sp, #0x10]
        mov     r9, #0
        add     r10, r8, #4
        str     r0, [sp, #4]
        str     r2, [sp]
        mov     r5, r1
LDNL38:
        ldr     r1, [r10, #-4]
        ldr     r0, [r5, #-4]
        add     r9, r9, #5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5]
        ldr     r1, [r10]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5, #4]
        ldr     r1, [r10, #4]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #8]
        ldr     r2, [r5, #8]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #0xC]
        ldr     r2, [r5, #0xC]
        mov     r4, r0
        add     r5, r5, #0x14
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r6
        mov     r4, r0
        add     r10, r10, #0x14
        ble     LDNL38
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #8]
        ldr     r5, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNL39:
        add     r10, r0, r9, lsl #2
        str     r0, [sp, #4]
        str     r2, [sp]
LDNL40:
        ldr     r1, [r8, +r9, lsl #2]
        ldr     r0, [r10], #4
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r5
        mov     r4, r0
        blt     LDNL40
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNL41:
        add     r2, r2, #1
        str     r4, [r11], #4
        cmp     r2, #8
        sub     r7, r7, #5
        sub     r5, r5, #5
        sub     r6, r6, #5
        blt     LDNL37
        ldr     r8, [sp, #0x18]
        ldr     r1, [sp, #0x2C]
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        mov     r2, r8, lsl #2
        add     r5, r2, #4
        rsb     r12, r8, #0x27
        add     r3, r1, r5
        mov     r2, r12
        str     r5, [sp, #8]
        sub     r1, r12, #6
        mov     r5, r12
        ldr     r12, [sp, #0x30]
        str     r7, [sp, #0x20]
        mov     lr, #0
        str     r6, [sp, #0x24]
        mov     r7, r2
        mov     r11, r9
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0x28]
        mov     r6, r1
        mov     r2, lr
LDNL42:
        cmp     r5, #0
        mov     r4, r12
        ble     LDNL46
        cmp     r7, #6
        blt     LDNL49
        add     r8, r2, r2, lsl #2
        add     r1, r0, #4
        add     r8, r3, r8, lsl #2
        str     r5, [sp, #0xC]
        mov     r9, #0
        add     r10, r8, #4
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #4]
        mov     r5, r1
LDNL43:
        ldr     r1, [r10, #-4]
        ldr     r0, [r5, #-4]
        add     r9, r9, #5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5]
        ldr     r1, [r10]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5, #4]
        ldr     r1, [r10, #4]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #8]
        ldr     r2, [r5, #8]
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, #0xC]
        ldr     r2, [r5, #0xC]
        mov     r4, r0
        add     r5, r5, #0x14
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r6
        mov     r4, r0
        add     r10, r10, #0x14
        ble     LDNL43
        ldr     r2, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNL44:
        add     r10, r0, r9, lsl #2
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #4]
LDNL45:
        ldr     r1, [r8, +r9, lsl #2]
        ldr     r0, [r10], #4
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r5
        mov     r4, r0
        blt     LDNL45
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNL46:
        add     r2, r2, #1
        str     r4, [r11], #4
        cmp     r2, #8
        sub     r7, r7, #5
        sub     r5, r5, #5
        sub     r6, r6, #5
        blt     LDNL42
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r5, [sp, #8]
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r10, [sp, #0x14]
        ldr     r4, [sp, #0x28]
        ldr     r0, [r7]
        ldr     r1, [r4, +r8, lsl #2]
        add     r11, r5, r4
        bl      __mulsf3
        ldr     r1, [r6, +r8, lsl #5]
        add     r8, r4, r8, lsl #2
        bl      __addsf3
        str     r0, [r7]
        ldr     r0, [r9]
        ldr     r1, [r4, +r5]
        bl      __mulsf3
        ldr     r1, [r10, #0x20]
        bl      __addsf3
        str     r0, [r9]
        ldr     r1, [r8, #0x14]
        ldr     r0, [r7, #4]
        bl      __mulsf3
        ldr     r1, [r10, #4]
        bl      __addsf3
        str     r0, [r7, #4]
        ldr     r0, [r9, #4]
        ldr     r1, [r11, #0x14]
        bl      __mulsf3
        ldr     r1, [r10, #0x24]
        bl      __addsf3
        str     r0, [r9, #4]
        ldr     r0, [r7, #8]
        ldr     r1, [r8, #0x28]
        bl      __mulsf3
        ldr     r1, [r10, #8]
        bl      __addsf3
        str     r0, [r7, #8]
        ldr     r1, [r11, #0x28]
        ldr     r0, [r9, #8]
        bl      __mulsf3
        ldr     r1, [r10, #0x28]
        bl      __addsf3
        str     r0, [r9, #8]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r8, #0x3C]
        bl      __mulsf3
        ldr     r1, [r10, #0xC]
        bl      __addsf3
        str     r0, [r7, #0xC]
        ldr     r0, [r9, #0xC]
        ldr     r1, [r11, #0x3C]
        bl      __mulsf3
        ldr     r1, [r10, #0x2C]
        bl      __addsf3
        str     r0, [r9, #0xC]
        ldr     r1, [r8, #0x50]
        ldr     r0, [r7, #0x10]
        bl      __mulsf3
        ldr     r1, [r10, #0x10]
        bl      __addsf3
        str     r0, [r7, #0x10]
        ldr     r0, [r9, #0x10]
        ldr     r1, [r11, #0x50]
        bl      __mulsf3
        ldr     r1, [r10, #0x30]
        bl      __addsf3
        str     r0, [r9, #0x10]
        ldr     r0, [r7, #0x14]
        ldr     r1, [r8, #0x64]
        bl      __mulsf3
        ldr     r1, [r10, #0x14]
        bl      __addsf3
        str     r0, [r7, #0x14]
        ldr     r1, [r11, #0x64]
        ldr     r0, [r9, #0x14]
        bl      __mulsf3
        ldr     r1, [r10, #0x34]
        bl      __addsf3
        str     r0, [r9, #0x14]
        ldr     r1, [r8, #0x78]
        ldr     r0, [r7, #0x18]
        bl      __mulsf3
        ldr     r1, [r10, #0x18]
        bl      __addsf3
        str     r0, [r7, #0x18]
        ldr     r1, [r11, #0x78]
        ldr     r0, [r9, #0x18]
        bl      __mulsf3
        ldr     r1, [r10, #0x38]
        bl      __addsf3
        str     r0, [r9, #0x18]
        ldr     r0, [r7, #0x1C]
        ldr     r1, [r8, #0x8C]
        bl      __mulsf3
        ldr     r1, [r10, #0x1C]
        bl      __addsf3
        str     r0, [r7, #0x1C]
        ldr     r0, [r9, #0x1C]
        ldr     r1, [r11, #0x8C]
        bl      __mulsf3
        ldr     r1, [r10, #0x3C]
        bl      __addsf3
        str     r0, [r9, #0x1C]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDNL47:
        add     r9, r2, r2, lsl #2
        mov     r10, #0
        add     r9, r3, r9, lsl #2
        b       LDNL33
LDNL48:
        add     lr, r2, r2, lsl #2
        mov     r9, #0
        add     r8, r3, lr, lsl #2
        b       LDNL28
LDNL49:
        add     r8, r2, r2, lsl #2
        mov     r9, #0
        add     r8, r3, r8, lsl #2
        b       LDNL44
LDNL50:
        add     lr, r2, r2, lsl #2
        mov     r9, #0
        add     r8, r12, lr, lsl #2
        b       LDNL39


        .data
        .align  4


LDNL__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDNL__2il0floatpacket.2:
        .byte   0x0A,0xD7,0x23,0x3C
LDNL__2il0floatpacket.3:
        .byte   0x00,0x00,0x80,0x3F
LDNL__2il0floatpacket.4:
        .byte   0x00,0x00,0x80,0xBF
LDNL__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x00


        .data
        .align  4


LDNL_ipos:
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00
        .byte   0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00


