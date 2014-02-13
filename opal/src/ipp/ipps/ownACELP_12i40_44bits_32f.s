        .text
        .align  4
        .globl  ownACELP_12i40_44bits_32f


ownACELP_12i40_44bits_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xCA, 30
        sub     sp, sp, #2, 22
        add     r12, sp, #1, 22
        add     r12, r12, #0x71, 30
        and     r12, r12, #0x1F
        rsb     r4, r12, #0
        ldr     r12, [sp, #0xB4C]
        add     r8, sp, #2, 22
        str     r12, [sp, #0x90]
        ldr     r12, [sp, #0xB50]
        add     r8, r8, #0x45, 30
        str     r3, [sp, #0x8C]
        add     lr, sp, #1, 22
        str     r12, [sp, #0x94]
        str     r2, [sp, #0x88]
        add     lr, lr, #0x71, 30
        and     r4, r4, #0x1F
        and     r8, r8, #0xF
        add     r3, sp, #2, 22
        rsb     r2, r8, #0
        add     r12, sp, #2, 22
        add     r6, lr, r4
        add     r3, r3, #0x7D, 30
        and     r2, r2, #0xF
        add     r12, r12, #0x45, 30
        add     r4, sp, #2, 22
        and     r3, r3, #0xF
        add     r2, r12, r2
        add     r4, r4, #0x64
        str     r2, [sp, #0x60]
        rsb     r3, r3, #0
        add     r12, sp, #2, 22
        and     r4, r4, #0xF
        and     r3, r3, #0xF
        rsb     r2, r4, #0
        add     r12, r12, #0x7D, 30
        add     lr, sp, #2, 22
        add     r3, r12, r3
        str     r3, [sp, #0x98]
        add     lr, lr, #0x64
        and     r2, r2, #0xF
        mov     r7, r1
        mov     r5, r0
        mov     r0, r6
        add     r4, lr, r2
        mov     r1, #0xA0
        add     r8, sp, #0xA4
        add     r10, sp, #2, 22
        add     r9, sp, #0xA4
        bl      _ippsZero_32f
        ldr     r12, [pc, #0xCA0]
        and     r3, r8, #0x1F
        rsb     r3, r3, #0
        ldr     r8, [r12]
        add     r10, r10, #0x71, 30
        and     r3, r3, #0x1F
        and     r10, r10, #0xF
        add     r3, r9, r3
        rsb     r10, r10, #0
        add     lr, sp, #2, 22
        and     r12, r10, #0xF
        str     r3, [sp, #0x9C]
        add     lr, lr, #0x71, 30
        add     r3, r6, #0xA0
        add     r12, lr, r12
        add     r9, r6, #0x1E, 28
        str     r12, [sp, #0x5C]
        str     r3, [sp, #0xA0]
        mov     r6, r8
        mov     r11, r7
        mov     r10, #0x28
LDNK0:
        ldr     r1, [r11], #4
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        subs    r10, r10, #1
        mov     r6, r0
        bne     LDNK0
        ldr     r3, [pc, #0xC30]
        mov     r1, r6
        mov     r10, r8
        ldr     r11, [r3]
        mov     r3, #0x28
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0x18]
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r6, r11
        mov     r0, r6
        bl      sqrtf
        ldr     r3, [pc, #0xC00]
        mov     r1, r0
        ldr     r6, [r3]
        mov     r0, r6
        bl      __divsf3
        str     r7, [sp, #0x14]
        str     r5, [sp, #0x10]
        ldr     r7, [sp, #0x1C]
        ldr     r5, [sp, #0x18]
        str     r0, [sp, #0x20]
LDNK1:
        ldr     r1, [r5], #4
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        subs    r7, r7, #1
        mov     r10, r0
        bne     LDNK1
        ldr     r7, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        mov     r1, r10
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r10, r11
        mov     r0, r10
        bl      sqrtf
        mov     r1, r0
        mov     r0, r6
        bl      __divsf3
        ldr     r12, [pc, #0xB8C]
        ldr     r2, [sp, #0x60]
        mov     r3, #0
        ldr     r12, [r12]
        mov     r1, r3
        str     r0, [sp, #0x70]
        mov     lr, r1
        mov     r0, r1
        str     r6, [sp, #0x74]
        str     r8, [sp, #0x6C]
        str     r9, [sp, #0x24]
        mov     r1, r7
LDNK2:
        cmp     lr, #0x28
        mov     r7, r12
        mov     r6, lr
        bge     LDNK6
        add     r8, r4, r6, lsl #2
        add     r11, r5, r6, lsl #2
        add     r10, r1, r6, lsl #2
        add     r9, r2, r6, lsl #2
        str     r12, [sp, #0x78]
        str     lr, [sp, #0x80]
        str     r0, [sp, #0x7C]
        str     r3, [sp, #0x84]
        str     r4, [sp, #0x64]
        str     r1, [sp, #0x14]
        str     r5, [sp, #0x10]
LDNK3:
        ldr     r0, [sp, #0x20]
        ldr     r1, [r10], #0x14
        ldr     r4, [r11]
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x70]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        mov     r5, r0
        bl      __gesf2
        cmp     r0, #0
        blt     LDNK4
        ldr     r2, [sp, #0x74]
        str     r2, [r9]
        ldr     r2, [sp, #0x78]
        str     r2, [r8]
        b       LDNK5
LDNK4:
        ldr     r2, [sp, #0x78]
        eor     r4, r4, #2, 2
        str     r2, [r9]
        ldr     r2, [sp, #0x74]
        str     r2, [r8]
LDNK5:
        bic     r5, r5, #2, 2
        str     r4, [r11], #0x14
        mov     r0, r5
        mov     r1, r7
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r5
        strgt   r6, [sp, #0x7C]
        add     r6, r6, #5
        cmp     r6, #0x28
        add     r8, r8, #0x14
        add     r9, r9, #0x14
        blt     LDNK3
        ldr     r12, [sp, #0x78]
        ldr     lr, [sp, #0x80]
        ldr     r0, [sp, #0x7C]
        ldr     r3, [sp, #0x84]
        ldr     r4, [sp, #0x64]
        ldr     r2, [sp, #0x60]
        ldr     r1, [sp, #0x14]
        ldr     r5, [sp, #0x10]
LDNK6:
        add     r8, sp, #2, 22
        add     r6, sp, #2, 22
        add     r8, r8, #0xBF, 30
        str     r7, [r8, +lr, lsl #2]
        add     r6, r6, #0xB7, 30
        add     lr, lr, #1
        strh    r0, [r6, +r3]
        cmp     lr, #5
        add     r3, r3, #2
        blt     LDNK2
        ldr     r3, [sp, #0x9C]
        ldr     r9, [sp, #0x24]
        mov     r2, r4
        str     r3, [sp, #8]
        add     r3, sp, #2, 22
        add     r3, r3, #0x89, 30
        str     r3, [sp, #4]
        str     r9, [sp]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x60]
        ldr     r3, [sp, #0xA0]
        mov     r8, #0
        bl      _ippsToeplizMatrix_G729E_32f
        add     r12, sp, #2, 22
        add     r3, sp, #2, 22
        add     r12, r12, #0xBF, 30
        add     r3, r3, #0xBF, 30
        ldr     r0, [r12, #0x10]
        ldr     r1, [r3]
        mov     r7, r8
        bl      __addsf3
        mov     r6, r0
LDNK7:
        add     r3, sp, #2, 22
        add     r3, r3, #0xBF, 30
        add     r10, sp, #2, 22
        add     r3, r3, r8
        ldr     r1, [r3, #4]
        add     r10, r10, #0xBF, 30
        ldr     r0, [r10, +r7, lsl #2]
        add     r8, r8, #4
        bl      __addsf3
        str     r0, [r10, +r7, lsl #2]
        add     r7, r7, #1
        cmp     r7, #4
        blt     LDNK7
        ldr     r3, [pc, #0x9B4]
        add     r12, sp, #2, 22
        add     r12, r12, #0xBF, 30
        str     r6, [r12, #0x10]
        ldr     r6, [r3]
        mov     r8, #0
        mov     r7, #3
        str     r4, [sp, #0x64]
        str     r5, [sp, #0x10]
LDNK8:
        add     r0, sp, #2, 22
        add     r0, r0, #0xBF, 30
        ldr     r4, [r0]
        mov     r11, #0
        mov     r10, #1
LDNK9:
        add     r0, sp, #2, 22
        add     r0, r0, #0xBF, 30
        ldr     r5, [r0, +r10, lsl #2]
        mov     r1, r4
        mov     r0, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r5
        movgt   r11, r10
        add     r10, r10, #1
        cmp     r10, #5
        blt     LDNK9
        add     r1, sp, #2, 22
        add     r0, sp, #2, 22
        mov     r2, r11, lsl #16
        add     r1, r1, #0xBA, 30
        add     r0, r0, #0xBF, 30
        strh    r11, [r1, +r8]
        mov     r2, r2, asr #16
        subs    r7, r7, #1
        str     r6, [r0, +r2, lsl #2]
        add     r8, r8, #2
        bne     LDNK8
        ldr     r12, [pc, #0x91C]
        ldr     r4, [sp, #0x64]
        ldr     r5, [sp, #0x10]
        ldr     lr, [r12]
        ldr     r8, [pc, #0x904]
        ldr     r10, [pc, #0x910]
        ldr     r11, [pc, #0x908]
        mov     r0, #0
        mov     r3, #3
        add     r7, sp, #0xB1, 28
        str     r3, [sp, #0x28]
        str     r0, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     r9, [sp, #0x24]
LDNK10:
        ldr     r6, [sp, #0x2C]
        add     lr, sp, #2, 22
        add     lr, lr, #0xBA, 30
        ldrsh   lr, [lr, +r6]
        mov     r6, #2
        str     r6, [sp, #0x80]
        ldr     r6, [pc, #0x8D0]
        mov     r7, lr, lsl #1
        add     r3, sp, #2, 22
        ldrsh   r7, [r6, +r7]
        add     r3, r3, #0xB7, 30
        add     lr, r6, lr, lsl #1
        str     lr, [sp, #0x84]
        ldrsh   r8, [lr, #2]
        add     r12, sp, #2, 22
        mov     lr, r7, lsl #1
        add     r12, r12, #0xB7, 30
        ldrsh   r10, [r12, +lr]
        ldr     r12, [sp, #0x9C]
        add     r12, r12, r7, lsl #8
        str     r12, [sp, #0x6C]
        ldr     r0, [r5, +r10, lsl #2]
        mov     r12, r8, lsl #1
        ldrsh   r9, [r3, +r12]
        mov     r3, r10, lsl #2
        str     r3, [sp, #0x70]
        mov     r3, r10, asr #31
        str     r3, [sp, #0x68]
        ldr     r1, [r5, +r9, lsl #2]
        mov     r3, r9, lsl #2
        str     r3, [sp, #0x7C]
        bl      __addsf3
        ldr     r12, [pc, #0x86C]
        mov     r11, r9, asr #31
        mov     r6, r0
        smull   lr, r3, r10, r12
        smull   lr, r12, r9, r12
        ldr     lr, [sp, #0x68]
        rsb     r12, r11, r12, asr #1
        rsb     r3, lr, r3, asr #1
        add     lr, sp, #2, 22
        add     lr, lr, #0x89, 30
        add     r7, lr, r7, lsl #5
        mov     r3, r3, lsl #16
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
        ldr     r3, [sp, #0x6C]
        mov     r7, r7, asr #16
        ldr     r1, [r3, +r7, lsl #2]
        bl      __addsf3
        add     r3, sp, #0xB1, 28
        add     r12, sp, #0xB1, 28
        strh    r9, [r12, #2]
        strh    r10, [r3]
        mov     r7, r0
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsZero_32f
        ldr     r3, [pc, #0x7CC]
        ldr     r8, [sp, #0x7C]
        ldr     lr, [sp, #0x70]
        ldr     r11, [r3]
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #0x60]
LDNK11:
        ldr     r0, [lr, +r7]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LDNK12
        ldr     r12, [sp, #0x24]
        sub     r12, r12, r10, lsl #2
        str     r12, [sp, #0x20]
        b       LDNK13
LDNK12:
        ldr     r12, [sp, #0xA0]
        sub     r12, r12, r10, lsl #2
        str     r12, [sp, #0x20]
LDNK13:
        ldr     r0, [r8, +r7]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        ldrge   r12, [sp, #0xA0]
        subge   r8, r12, r9, lsl #2
        ldrlt   r12, [sp, #0x24]
        sublt   r8, r12, r9, lsl #2
        mov     r2, #0x28
        mov     r1, r4
        ldr     r0, [sp, #0x20]
        bl      _ippsAdd_32f_I
        mov     r0, r8
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsAdd_32f_I
        ldr     lr, [sp, #0x5C]
        add     r12, sp, #2, 22
        add     r12, r12, #0x89, 30
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x98]
        str     r12, [sp]
        mov     r3, r7
        str     lr, [sp, #4]
        ldr     r12, [sp, #0x80]
        ldr     r0, [sp, #0xA0]
        mov     r1, r4
        mov     r8, r12, lsl #1
        ldr     r12, [sp, #0x84]
        add     r11, r12, r8
        mov     r2, r11
        bl      LDNK_ownCorImpRespVec_G729E_32f
        ldr     r12, [sp, #0x84]
        ldrsh   lr, [r11, #2]
        ldr     r11, [pc, #0x708]
        ldrsh   r12, [r12, +r8]
        ldr     r0, [sp, #0x9C]
        str     lr, [sp, #0x20]
        ldr     r11, [r11]
        mov     r1, #0
        add     r0, r0, r12, lsl #8
        add     r2, r5, r12, lsl #2
        str     r11, [sp, #0x14]
        ldr     r11, [pc, #0x6E0]
        add     r3, r5, lr, lsl #2
        ldr     lr, [sp, #0x98]
        ldr     r11, [r11]
        mov     r7, r2
        str     r11, [sp, #0x18]
        ldr     r11, [pc, #0x6C0]
        ldr     r11, [r11]
        str     r10, [sp, #0x78]
        ldr     r10, [sp, #0x1C]
        str     r12, [sp, #0x70]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x5C]
        str     r8, [sp, #0x6C]
        str     r9, [sp, #0x74]
        str     r4, [sp, #0x64]
        str     r5, [sp, #0x10]
        mov     r8, r0
        mov     r4, r1
        mov     r9, r3
        mov     r5, lr
LDNK14:
        ldr     r1, [r7], #0x14
        mov     r0, r6
        bl      __addsf3
        ldr     r1, [r5], #4
        str     r0, [sp, #0x7C]
        mov     r0, r10
        bl      __addsf3
        str     r5, [sp, #0x48]
        ldr     r10, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        mov     r12, r0
        mov     r1, r9
        mov     r3, r8
        mvn     lr, #0
        mov     r0, #0
        mov     r2, r11
        str     r7, [sp, #0x44]
        str     r8, [sp, #0x4C]
        str     r9, [sp, #0x50]
        str     r4, [sp, #0x54]
        str     lr, [sp, #0x40]
        str     r12, [sp, #0x3C]
        str     r6, [sp, #0x58]
        mov     r4, r0
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
LDNK15:
        ldr     r1, [r7], #0x14
        ldr     r0, [sp, #0x7C]
        bl      __addsf3
        ldr     r1, [r9], #4
        ldr     r2, [r8], #4
        mov     r11, r0
        mov     r0, r2
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        str     r0, [sp, #0x38]
        mov     r1, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x68]
        bl      __gtsf2
        cmp     r0, #0
        ble     LDNK16
        ldr     r5, [sp, #0x38]
        mov     r10, r6
        str     r4, [sp, #0x40]
LDNK16:
        add     r4, r4, #1
        cmp     r4, #8
        blt     LDNK15
        ldr     lr, [sp, #0x40]
        str     r10, [sp, #0x18]
        str     r5, [sp, #0x14]
        ldr     r7, [sp, #0x44]
        ldr     r5, [sp, #0x48]
        ldr     r8, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r4, [sp, #0x54]
        ldr     r10, [sp, #0x1C]
        ldr     r6, [sp, #0x58]
        ldr     r11, [sp, #0x5C]
        cmp     lr, #0
        blt     LDNK17
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        str     r4, [sp, #0x78]
        str     lr, [sp, #0x74]
LDNK17:
        add     r4, r4, #1
        cmp     r4, #8
        add     r8, r8, #0x20
        blt     LDNK14
        ldr     r9, [sp, #0x74]
        ldr     r10, [sp, #0x78]
        ldr     r12, [sp, #0x70]
        ldr     lr, [sp, #0x20]
        ldr     r8, [sp, #0x6C]
        ldr     r11, [sp, #0x68]
        ldr     r4, [sp, #0x64]
        ldr     r7, [sp, #0x60]
        ldr     r5, [sp, #0x10]
        add     r9, r9, r9, lsl #2
        add     r10, r10, r10, lsl #2
        add     r9, lr, r9
        add     r12, r12, r10
        mov     r0, r6
        mov     lr, r12, lsl #16
        mov     r12, r9, lsl #16
        mov     r9, r12, asr #16
        ldr     r12, [r5, +r9, lsl #2]
        mov     r10, lr, asr #16
        ldr     r1, [r5, +r10, lsl #2]
        str     r12, [sp, #0x7C]
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        bl      __addsf3
        ldr     r2, [sp, #0x80]
        add     r1, sp, #0xB1, 28
        add     r12, sp, #0xB1, 28
        add     lr, r2, #2
        mov     r2, r2, lsl #1
        strh    r10, [r1, +r2]
        mov     lr, lr, lsl #16
        add     r12, r12, r8
        mov     lr, lr, asr #16
        str     lr, [sp, #0x80]
        cmp     lr, #0xC
        ldr     lr, [sp, #0x18]
        mov     r8, r9, lsl #2
        mov     r6, r0
        str     lr, [sp, #0x1C]
        mov     lr, r10, lsl #2
        strh    r9, [r12, #2]
        blt     LDNK11
        ldr     r7, [sp, #0x18]
        mov     r0, r6
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        mov     r6, r0
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        ble     LDNK19
        str     r6, [sp, #0x34]
        str     r7, [sp, #0x30]
        mov     r12, #0
        mov     r3, #0xC
LDNK18:
        add     r6, sp, #0xB1, 28
        ldrsh   r6, [r6, +r12]
        add     lr, sp, #2, 22
        add     lr, lr, #0xB1, 30
        strh    r6, [lr, +r12]
        subs    r3, r3, #1
        add     r12, r12, #2
        bne     LDNK18
LDNK19:
        ldr     r3, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        subs    r3, r3, #1
        str     r3, [sp, #0x28]
        add     r12, r12, #2
        str     r12, [sp, #0x2C]
        bne     LDNK10
        ldr     r0, [sp, #0x8C]
        mov     r1, #0x28
        mov     r9, #0
        bl      _ippsZero_32f
        ldr     r0, [sp, #0x90]
        mov     r1, #0x28
        bl      _ippsZero_32f
        mvn     r1, #0
        mov     r2, r9
        mov     r3, #5
LDNK20:
        add     r0, sp, #0xAF, 28
        strh    r1, [r0, +r2]
        subs    r3, r3, #1
        add     r2, r2, #2
        bne     LDNK20
        ldr     r0, [pc, #0x3C4]
        ldr     r1, [pc, #0x3C8]
        ldr     r11, [sp, #0x8C]
        mov     r10, #0xA
LDNK21:
        add     r0, sp, #2, 22
        add     r0, r0, #0xB1, 30
        ldr     r1, [pc, #0x3AC]
        ldr     r4, [pc, #0x3BC]
        add     r0, r0, r9
        ldrsh   r7, [r0, #4]
        ldr     r0, [sp, #0x60]
        ldr     r1, [r1]
        ldr     r0, [r0, +r7, lsl #2]
        rsb     r5, r7, #0x28
        bl      __gtsf2
        smull   r1, r2, r7, r4
        smull   r4, r3, r7, r4
        ldr     r1, [pc, #0x388]
        mov     lr, r7, asr #31
        rsb     r12, lr, r2, asr #1
        ldr     r1, [r1]
        rsb     r8, lr, r3, asr #1
        ldr     r3, [sp, #0x90]
        ldr     r2, [r11, +r7, lsl #2]
        add     r12, r12, r12, lsl #2
        cmp     r0, #0
        sub     r6, r7, r12
        add     r4, r3, r7, lsl #2
        ble     LDNK22
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        str     r0, [r11, +r7, lsl #2]
        ldr     r0, [sp, #0x88]
        mov     r2, r5
        mov     r1, r4
        bl      _ippsAdd_32f_I
        b       LDNK23
LDNK22:
        mov     r0, r2
        bl      __subsf3
        str     r0, [r11, +r7, lsl #2]
        ldr     r0, [sp, #0x88]
        mov     r2, r5
        mov     r1, r4
        add     r8, r8, #8
        bl      _ippsSub_32f_I
LDNK23:
        mov     r0, r6, lsl #1
        add     r1, sp, #0xAF, 28
        ldrsh   r0, [r1, +r0]
        cmp     r0, #0
        blt     LDNK34
        eor     r1, r8, r0
        tst     r1, #8
        bne     LDNK25
        cmp     r0, r8
        mov     r6, r6, lsl #1
        add     r1, sp, #0xAF, 28
        bgt     LDNK24
        add     r0, r8, r0, lsl #4
        orr     r0, r0, #1, 24
        strh    r0, [r1, +r6]
        b       LDNK27
LDNK24:
        add     r8, r0, r8, lsl #4
        orr     r0, r8, #1, 24
        strh    r0, [r1, +r6]
        b       LDNK27
LDNK25:
        and     r3, r0, #7
        and     r2, r8, #7
        cmp     r3, r2
        mov     r6, r6, lsl #1
        add     r1, sp, #0xAF, 28
        bgt     LDNK26
        add     r8, r0, r8, lsl #4
        orr     r0, r8, #1, 24
        strh    r0, [r1, +r6]
        b       LDNK27
LDNK26:
        add     r0, r8, r0, lsl #4
        orr     r0, r0, #1, 24
        strh    r0, [r1, +r6]
LDNK27:
        subs    r10, r10, #1
        add     r9, r9, #2
        bne     LDNK21
        ldr     r2, [sp, #0x94]
        ldr     r0, [pc, #0x278]
        ldr     r1, [pc, #0x27C]
        ldr     r11, [sp, #0x8C]
        mov     r10, #0
        mov     r9, r10
        str     r2, [sp, #0x20]
LDNK28:
        ldr     r0, [pc, #0x260]
        add     r2, sp, #2, 22
        add     r2, r2, #0xB1, 30
        ldr     r1, [r0]
        ldrsh   r7, [r2, +r10]
        ldr     r0, [pc, #0x260]
        smull   r3, r2, r7, r0
        smull   r0, r3, r7, r0
        ldr     r0, [sp, #0x60]
        mov     r12, r7, asr #31
        rsb     r4, r12, r2, asr #1
        ldr     r0, [r0, +r7, lsl #2]
        rsb     r5, r12, r3, asr #1
        add     r4, r4, r4, lsl #2
        mov     r5, r5, lsl #16
        bl      __gtsf2
        ldr     r1, [pc, #0x228]
        ldr     r12, [sp, #0x90]
        ldr     r2, [r11, +r7, lsl #2]
        ldr     r1, [r1]
        sub     r3, r7, r4
        mov     r8, r5, asr #16
        mov     r3, r3, lsl #16
        cmp     r0, #0
        rsb     r5, r7, #0x28
        add     r4, r12, r7, lsl #2
        mov     r6, r3, asr #16
        ble     LDNK29
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        str     r0, [r11, +r7, lsl #2]
        ldr     r0, [sp, #0x88]
        mov     r2, r5
        mov     r1, r4
        bl      _ippsAdd_32f_I
        b       LDNK30
LDNK29:
        mov     r0, r2
        bl      __subsf3
        str     r0, [r11, +r7, lsl #2]
        ldr     r0, [sp, #0x88]
        add     r8, r8, #8
        mov     r2, r5
        mov     r1, r4
        mov     r8, r8, lsl #16
        bl      _ippsSub_32f_I
        mov     r8, r8, asr #16
LDNK30:
        add     r0, sp, #0xAF, 28
        mov     r2, r6, lsl #1
        ldrsh   r0, [r0, +r2]
        mov     r1, r8
        mov     r2, r0, asr #4
        and     r3, r2, #0xF
        and     r0, r0, #0xF
        and     r12, r3, #7
        and     lr, r0, #7
        cmp     r12, lr
        mov     r2, r3
        movgt   r2, r0
        movgt   r0, r3
        and     r3, r2, #7
        and     r12, r8, #7
        cmp     r3, r12
        movgt   r1, r2
        movgt   r2, r8
        mov     r3, r0
        and     r12, r3, #7
        and     lr, r1, #7
        cmp     r12, lr
        movgt   r3, r1
        movgt   r1, r0
        mov     r12, r3, asr #2
        and     lr, r12, #2
        mov     r0, r2, asr #1
        mov     r12, r1, asr #3
        and     r0, r0, #4
        and     r12, r12, #1
        add     lr, r0, lr
        add     r12, lr, r12
        ldr     r0, [pc, #0x13C]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        sub     r12, r12, #8
        cmn     r12, #8
        ldrcsb  r12, [r0, +r12]
        addcs   pc, pc, r12
        mov     r0, #0
LDNK_.Lpc1:
        b       LDNK31
LDNK_bd.1.1:
        .long   0xe2033007
        .long   0xe2022007
        .long   0xe1a03203
        .long   0xe0832382
        .long   0xe0821001
        .long   0xe1a00801
        .long   0xe1a00840
        .long   0xea000014
LDNK_bd.1.2:
        .long   0xe2022007
        .long   0xe2011007
        .long   0xe0832202
        .long   0xe0821381
        .long   0xe1a00801
        .long   0xe1a00840
        .long   0xea00000d
LDNK_bd.1.3:
        .long   0xe2033007
        .long   0xe2022007
        .long   0xe1a03383
        .long   0xe0832202
        .long   0xe0821001
        .long   0xe1a00801
        .long   0xe1a00840
        .long   0xea000005
LDNK_bd.1.4:
        .long   0xe2033007
        .long   0xe2011007
        .long   0xe0823383
        .long   0xe0831201
        .long   0xe1a00801
        .long   0xe1a00840
LDNK31:
        cmp     r9, #0
        bne     LDNK32
        add     r0, r0, r6, lsl #10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDNK32:
        ldr     r1, [sp, #0x20]
        add     r9, r9, #1
        cmp     r9, #2
        str     r0, [r1], #4
        str     r1, [sp, #0x20]
        add     r10, r10, #2
        blt     LDNK28
        ldr     r0, [sp, #0x94]
        mov     r1, #3
        add     r0, r0, #8
LDNK33:
        add     r6, r6, #1
        mov     r2, r6, lsl #16
        mov     r3, r2, asr #16
        cmp     r3, #5
        movge   r6, #0
        movge   r3, r6
        mov     r3, r3, lsl #1
        add     r2, sp, #0xAF, 28
        ldrsh   r3, [r2, +r3]
        subs    r1, r1, #1
        and     r2, r3, #0x7F
        str     r2, [r0], #4
        bne     LDNK33
        add     sp, sp, #0xCA, 30
        add     sp, sp, #2, 22
        ldmia   sp!, {r4 - r11, pc}
LDNK34:
        add     r0, sp, #0xAF, 28
        mov     r6, r6, lsl #1
        strh    r8, [r0, +r6]
        b       LDNK27
LDNK_bt.1:
        .long   0x60402404
        .long   0x04244060
        .long   LDNK__2il0floatpacket.1
        .long   LDNK__2il0floatpacket.2
        .long   LDNK__2il0floatpacket.3
        .long   LDNK__2il0floatpacket.4
        .long   LDNK_ipos
        .long   0x66666667
        .long   LDNK_bt.1
        .long   LDNK__2il0floatpacket.5
LDNK_ownCorImpRespVec_G729E_32f:
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
        blt     LDNK45
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
LDNK35:
        cmp     r5, #0
        mov     r4, r10
        ble     LDNK39
        cmp     r5, #6
        blt     LDNK57
        add     lr, r2, r2, lsl #2
        add     r1, r0, #4
        add     r8, r3, lr, lsl #2
        str     r5, [sp, #0x10]
        mov     r9, #0
        add     r11, r8, #4
        str     r0, [sp, #4]
        str     r2, [sp]
        mov     r5, r1
LDNK36:
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
        ble     LDNK36
        ldr     r3, [sp, #8]
        ldr     r5, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNK37:
        add     r11, r0, r9, lsl #2
        str     r0, [sp, #4]
        str     r2, [sp]
LDNK38:
        ldr     r1, [r8, +r9, lsl #2]
        ldr     r0, [r11], #4
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r5
        mov     r4, r0
        blt     LDNK38
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNK39:
        add     r2, r2, #1
        str     r4, [r6], #4
        cmp     r2, #8
        sub     r5, r5, #5
        sub     r7, r7, #5
        blt     LDNK35
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
LDNK40:
        cmp     r6, #0
        mov     r4, r12
        ble     LDNK44
        cmp     r8, #6
        blt     LDNK56
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
LDNK41:
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
        ble     LDNK41
        ldr     r2, [sp, #0x10]
        ldr     r6, [sp, #8]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNK42:
        add     r11, r0, r10, lsl #2
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #4]
LDNK43:
        ldr     r1, [r9, +r10, lsl #2]
        ldr     r0, [r11], #4
        add     r10, r10, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r6
        mov     r4, r0
        blt     LDNK43
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNK44:
        add     r2, r2, #1
        str     r4, [r5], #4
        cmp     r2, #8
        sub     r8, r8, #5
        sub     r6, r6, #5
        sub     r7, r7, #5
        blt     LDNK40
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
LDNK45:
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
LDNK46:
        cmp     r5, #0
        mov     r4, r3
        ble     LDNK50
        cmp     r7, #6
        blt     LDNK59
        add     lr, r2, r2, lsl #2
        add     r1, r0, #4
        add     r8, r12, lr, lsl #2
        str     r5, [sp, #0x10]
        mov     r9, #0
        add     r10, r8, #4
        str     r0, [sp, #4]
        str     r2, [sp]
        mov     r5, r1
LDNK47:
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
        ble     LDNK47
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #8]
        ldr     r5, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNK48:
        add     r10, r0, r9, lsl #2
        str     r0, [sp, #4]
        str     r2, [sp]
LDNK49:
        ldr     r1, [r8, +r9, lsl #2]
        ldr     r0, [r10], #4
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r5
        mov     r4, r0
        blt     LDNK49
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
LDNK50:
        add     r2, r2, #1
        str     r4, [r11], #4
        cmp     r2, #8
        sub     r7, r7, #5
        sub     r5, r5, #5
        sub     r6, r6, #5
        blt     LDNK46
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
LDNK51:
        cmp     r5, #0
        mov     r4, r12
        ble     LDNK55
        cmp     r7, #6
        blt     LDNK58
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
LDNK52:
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
        ble     LDNK52
        ldr     r2, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNK53:
        add     r10, r0, r9, lsl #2
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #4]
LDNK54:
        ldr     r1, [r8, +r9, lsl #2]
        ldr     r0, [r10], #4
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r5
        mov     r4, r0
        blt     LDNK54
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #4]
LDNK55:
        add     r2, r2, #1
        str     r4, [r11], #4
        cmp     r2, #8
        sub     r7, r7, #5
        sub     r5, r5, #5
        sub     r6, r6, #5
        blt     LDNK51
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
LDNK56:
        add     r9, r2, r2, lsl #2
        mov     r10, #0
        add     r9, r3, r9, lsl #2
        b       LDNK42
LDNK57:
        add     lr, r2, r2, lsl #2
        mov     r9, #0
        add     r8, r3, lr, lsl #2
        b       LDNK37
LDNK58:
        add     r8, r2, r2, lsl #2
        mov     r9, #0
        add     r8, r3, r8, lsl #2
        b       LDNK53
LDNK59:
        add     lr, r2, r2, lsl #2
        mov     r9, #0
        add     r8, r12, lr, lsl #2
        b       LDNK48


        .data
        .align  4


LDNK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDNK__2il0floatpacket.2:
        .byte   0x0A,0xD7,0x23,0x3C
LDNK__2il0floatpacket.3:
        .byte   0x00,0x00,0x80,0x3F
LDNK__2il0floatpacket.4:
        .byte   0x00,0x00,0x80,0xBF
LDNK__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x00


        .data
        .align  4


LDNK_ipos:
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00
        .byte   0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00


