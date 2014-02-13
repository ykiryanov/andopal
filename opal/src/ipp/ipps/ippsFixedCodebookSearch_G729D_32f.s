        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729D_32f


_ippsFixedCodebookSearch_G729D_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x46, 30
        ldr     r5, [sp, #0x13C]
        ldr     r11, [sp, #0x140]
        mov     r6, r2
        cmp     r6, #0
        mov     r4, r1
        mov     r7, r3
        beq     LDLX28
        cmp     r0, #0
        beq     LDLX28
        cmp     r4, #0
        beq     LDLX28
        cmp     r7, #0
        beq     LDLX28
        cmp     r5, #0
        beq     LDLX28
        cmp     r11, #0
        beq     LDLX28
        ldr     r12, [pc, #0x920]
        mov     r8, #0
        mov     r1, #1
        ldr     r12, [r12]
        str     r6, [sp, #8]
        mvn     r10, #0
        mov     r9, r0
        str     r12, [sp, #0x74]
        ldr     r6, [sp, #0x74]
        str     r4, [sp, #4]
        str     r5, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r0, [sp]
        mov     r4, r1
LDLX0:
        ldr     r5, [r9]
        mov     r1, r6
        add     r7, sp, #0x78
        mov     r0, r5
        bl      __gesf2
        cmp     r0, #0
        strge   r4, [r7, +r8, lsl #2]
        bge     LDLX1
        eor     r5, r5, #2, 2
        str     r10, [r7, +r8, lsl #2]
        str     r5, [r9]
LDLX1:
        add     r8, r8, #1
        cmp     r8, #0x28
        add     r9, r9, #4
        blt     LDLX0
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r0, [sp]
        add     r3, r4, #6, 24
        str     r3, [sp, #0x70]
        mov     r9, #0
        add     r2, r4, #1, 24
        add     r1, r4, #2, 24
        add     r10, r4, #3, 24
        add     lr, r4, #1, 22
        add     r12, r4, #5, 24
        add     r3, r4, #7, 24
        mov     r8, r9
        str     r3, [sp, #0x44]
        str     r12, [sp, #0x48]
        str     lr, [sp, #0x4C]
        str     r10, [sp, #0x50]
        str     r1, [sp, #0x54]
        str     r2, [sp, #0x58]
        str     r11, [sp, #0x64]
        str     r5, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
        str     r0, [sp]
LDLX2:
        mov     r0, #0
        str     r0, [sp, #0x40]
        add     r5, sp, #0x78
        add     r6, r5, r9
        ldr     r0, [r6, #8]
        add     r2, r8, #5
        mov     r10, #8
        mov     r11, r2, lsl #3
        add     r7, r4, r2, lsl #5
        bl      __floatsisf
        ldr     r1, [r6, #0xC]
        str     r0, [sp, #0x3C]
        mov     r0, r1
        bl      __floatsisf
        ldr     r1, [r6, #4]
        mov     r6, r0
        mov     r0, r1
        bl      __floatsisf
        ldr     r1, [r5, +r9]
        mov     r5, r0
        mov     r0, r1
        bl      __floatsisf
        str     r6, [sp, #0x68]
        ldr     r6, [sp, #0x48]
        str     r0, [sp, #0x6C]
        str     r8, [sp, #0x60]
        str     r9, [sp, #0x5C]
        str     r4, [sp, #4]
LDLX3:
        ldr     r2, [sp, #0x40]
        add     r3, sp, #0x78
        add     r4, r3, r2
        ldr     r0, [r4, #4]
        add     r2, r2, #0x14
        str     r2, [sp, #0x40]
        bl      __floatsisf
        ldr     r2, [r7]
        ldr     r1, [sp, #0x6C]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __mulsf3
        str     r0, [r7], #4
        ldr     r2, [sp, #0x58]
        mov     r1, r5
        ldr     r0, [r2, +r11, lsl #2]
        bl      __mulsf3
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [r4, #0xC]
        ldr     r2, [sp, #0x58]
        str     r0, [r2, +r11, lsl #2]
        mov     r0, r1
        bl      __floatsisf
        ldr     r2, [sp, #0x54]
        ldr     r1, [sp, #0x6C]
        mov     r8, r0
        ldr     r2, [r2, +r11, lsl #2]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __mulsf3
        ldr     r2, [sp, #0x54]
        ldr     r1, [r4, #0x10]
        str     r0, [r2, +r11, lsl #2]
        mov     r0, r1
        bl      __floatsisf
        ldr     r2, [sp, #0x50]
        ldr     r1, [sp, #0x68]
        mov     r9, r0
        ldr     r2, [r2, +r11, lsl #2]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [sp, #0x50]
        mov     r1, r5
        str     r0, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x4C]
        ldr     r0, [r2, +r11, lsl #2]
        bl      __mulsf3
        ldr     r4, [r4, #8]
        str     r0, [sp, #0x38]
        mov     r0, r4
        bl      __floatsisf
        ldr     r1, [sp, #0x38]
        bl      __mulsf3
        ldr     r2, [sp, #0x4C]
        mov     r1, r5
        str     r0, [r2, +r11, lsl #2]
        ldr     r0, [r6, +r11, lsl #2]
        bl      __mulsf3
        mov     r1, r8
        bl      __mulsf3
        str     r0, [r6, +r11, lsl #2]
        ldr     r2, [sp, #0x70]
        mov     r1, r5
        ldr     r0, [r2, +r11, lsl #2]
        bl      __mulsf3
        mov     r1, r9
        bl      __mulsf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [r2, +r11, lsl #2]
        bl      __mulsf3
        mov     r1, r8
        bl      __mulsf3
        ldr     r2, [sp, #0x44]
        subs    r10, r10, #1
        str     r0, [r2, +r11, lsl #2]
        add     r11, r11, #1
        bne     LDLX3
        ldr     r8, [sp, #0x60]
        ldr     r9, [sp, #0x5C]
        ldr     r4, [sp, #4]
        add     r8, r8, #1
        cmp     r8, #8
        add     r9, r9, #0x14
        blt     LDLX2
        ldr     r2, [pc, #0x664]
        ldr     r8, [pc, #0x664]
        ldr     r9, [pc, #0x664]
        ldr     r12, [r2, #-0x40]
        ldr     lr, [r2]
        ldr     r1, [r9]
        ldr     r8, [r8]
        ldr     r11, [sp, #0x64]
        ldr     r5, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r0, [sp]
        ldr     r9, [sp, #0x74]
        add     r3, r2, #0xBC
        str     r3, [sp, #0x60]
        add     r3, r2, #0xA8
        str     r3, [sp, #0x5C]
        add     r3, r2, #0x94
        str     r3, [sp, #0x58]
        add     r3, r2, #0x80
        str     r3, [sp, #0x54]
        add     r3, r2, #0xF8
        str     r3, [sp, #0x6C]
        str     r1, [sp, #0x14]
        str     r11, [sp, #0x64]
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
        ldr     r6, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r11, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        add     r3, r2, #0xE4
        str     r8, [sp, #0x70]
        add     r2, r2, #0xD0
        add     r8, r4, #0xA0
        mov     r10, #0
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x24]
        str     r9, [sp, #0x68]
        str     r2, [sp, #0x4C]
        str     r3, [sp, #0x50]
        str     r5, [sp, #0x10]
LDLX4:
        tst     r10, #1
        mov     r5, #0
        beq     LDLX8
        mov     r3, r10, lsl #1
        ldrsh   r12, [r11, +r3]
        ldrsh   r2, [r6, +r3]
        ldrsh   lr, [r7, +r3]
        ldrsh   r3, [r1, +r3]
        add     r12, r0, r12, lsl #2
        str     r12, [sp, #0x30]
        mov     r9, r5
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #0x68]
        ldr     r11, [sp, #0x30]
        add     r2, r4, r2, lsl #2
        add     lr, r4, lr, lsl #2
        add     r3, r0, r3, lsl #2
        mov     r12, r8
        str     r8, [sp, #0x44]
        str     r10, [sp, #0x48]
        str     r4, [sp, #4]
        str     r0, [sp]
LDLX5:
        ldr     r10, [r11], #0x14
        ldr     r0, [r2], #4
        mov     r4, #0
        mov     r6, r3
        mov     r7, lr
        mov     r8, r12
        str     r0, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x30]
        str     r2, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     r3, [sp, #0x3C]
        str     r9, [sp, #0x20]
        str     lr, [sp, #0x40]
LDLX6:
        ldr     r1, [sp, #0x1C]
        ldr     r0, [r6], #0x14
        bl      __addsf3
        mov     r1, r0
        bl      __mulsf3
        ldr     r2, [r7], #4
        ldr     r1, [sp, #0x18]
        mov     r9, r0
        mov     r0, r2
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r8], #4
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        mov     r10, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LDLX7
        ldr     r0, [sp, #0x20]
        str     r10, [sp, #0x14]
        mov     r5, r9
        str     r0, [sp, #0x24]
        mov     r0, #1
        str     r4, [sp, #0x28]
        str     r0, [sp, #0x2C]
LDLX7:
        add     r4, r4, #1
        cmp     r4, #8
        blt     LDLX6
        ldr     r9, [sp, #0x20]
        ldr     r12, [sp, #0x38]
        ldr     r11, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
        add     r9, r9, #1
        cmp     r9, #8
        add     r12, r12, #0x20
        blt     LDLX5
        str     r5, [sp, #0x68]
        ldr     r5, [sp, #0x2C]
        ldr     r8, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r6, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r11, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        ldr     r4, [sp, #4]
        ldr     r0, [sp]
        b       LDLX12
LDLX8:
        mov     r12, r10, lsl #1
        ldrsh   r2, [r11, +r12]
        ldrsh   r3, [r6, +r12]
        ldrsh   lr, [r7, +r12]
        ldrsh   r12, [r1, +r12]
        str     r8, [sp, #0x40]
        mov     r9, r5
        add     r2, r0, r2, lsl #2
        add     r12, r0, r12, lsl #2
        str     r5, [sp, #0x2C]
        str     r0, [sp]
        ldr     r0, [sp, #0x40]
        ldr     r5, [sp, #0x68]
        add     r3, r4, r3, lsl #2
        add     lr, r4, lr, lsl #2
        str     r8, [sp, #0x44]
        str     r10, [sp, #0x48]
        str     r4, [sp, #4]
LDLX9:
        ldr     r10, [r2], #0x14
        ldr     r11, [r3], #4
        mov     r4, #0
        mov     r6, r12
        mov     r7, lr
        mov     r8, r0
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r2, [sp, #0x30]
        str     r3, [sp, #0x34]
        str     r0, [sp, #0x40]
        str     r12, [sp, #0x38]
        str     r9, [sp, #0x20]
        str     lr, [sp, #0x3C]
LDLX10:
        ldr     r1, [sp, #0x18]
        ldr     r0, [r6], #0x14
        bl      __addsf3
        mov     r1, r0
        bl      __mulsf3
        ldr     r2, [r7], #4
        ldr     r1, [sp, #0x1C]
        mov     r9, r0
        mov     r0, r2
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r2, [r8], #4
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        mov     r10, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LDLX11
        ldr     r0, [sp, #0x20]
        str     r10, [sp, #0x14]
        mov     r5, r9
        str     r0, [sp, #0x28]
        mov     r0, #1
        str     r4, [sp, #0x24]
        str     r0, [sp, #0x2C]
LDLX11:
        add     r4, r4, #1
        cmp     r4, #8
        blt     LDLX10
        ldr     r9, [sp, #0x20]
        ldr     r0, [sp, #0x40]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        add     r9, r9, #1
        cmp     r9, #8
        add     r0, r0, #0x20
        blt     LDLX9
        str     r5, [sp, #0x68]
        ldr     r5, [sp, #0x2C]
        ldr     r8, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r6, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r11, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        ldr     r4, [sp, #4]
        ldr     r0, [sp]
LDLX12:
        cmp     r5, #0
        beq     LDLX13
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x6C]
        mov     r12, r10, lsl #1
        ldrsh   r2, [r2, +r12]
        ldr     lr, [sp, #0x4C]
        ldrsh   r3, [r3, +r12]
        ldrsh   r12, [lr, +r12]
        ldr     lr, [sp, #0x28]
        mla     r2, r3, lr, r2
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        add     r2, r12, r2, lsl #1
        str     r2, [sp, #0x24]
LDLX13:
        add     r10, r10, #1
        cmp     r10, #9
        add     r8, r8, #1, 24
        bge     LDLX14
        cmp     r10, #4
        addeq   r10, r10, #1
        b       LDLX4
LDLX14:
        ldr     r9, [pc, #0x278]
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x24]
        ldr     r11, [sp, #0x64]
        ldr     r5, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        sub     r4, r9, #0x40
        ldr     r8, [r9, +lr, lsl #2]
        ldr     r4, [r4, +r12, lsl #2]
        add     r1, sp, #0x78
        add     r9, r9, #0x43, 30
        ldr     r0, [r1, +r4, lsl #2]
        ldr     r12, [r9, +r12, lsl #2]
        ldr     lr, [r9, +lr, lsl #2]
        cmp     r0, #0
        movle   r10, #0
        movgt   r10, #1
        add     r1, sp, #0x78
        ldr     r1, [r1, +r8, lsl #2]
        cmp     r1, #0
        str     r1, [sp, #0x68]
        movle   r9, #0
        movgt   r9, #1
        ldr     r3, [sp, #0x74]
        mov     r2, #0
        add     r1, r7, #4
LDLX15:
        add     r2, r2, #5
        str     r3, [r1, #-4]
        str     r3, [r1]
        str     r3, [r1, #4]
        str     r3, [r1, #8]
        str     r3, [r1, #0xC]
        cmp     r2, #0x28
        add     r1, r1, #0x14
        blt     LDLX15
        add     lr, r12, lr, lsl #4
        str     lr, [sp, #0x74]
        bl      __floatsisf
        str     r0, [r7, +r4, lsl #2]
        ldr     r1, [r7, +r8, lsl #2]
        ldr     r0, [sp, #0x68]
        str     r1, [sp, #0x70]
        bl      __floatsisf
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        str     r0, [r7, +r8, lsl #2]
        ldr     r1, [sp, #0x74]
        mov     r0, r5
        str     r1, [r11]
        add     r1, r10, r9, lsl #1
        str     r1, [r11, #4]
        mov     r1, #0x28
        bl      _ippsZero_32f
        cmp     r10, #1
        mov     r12, #0
        beq     LDLX24
        cmp     r4, #0x28
        bge     LDLX19
        rsb     r1, r4, #0x28
        cmp     r1, #6
        blt     LDLX17
        mov     r1, r4, lsl #2
        add     r1, r1, #4
        add     r1, r1, r5
        add     r3, r6, #4
LDLX16:
        ldr     lr, [r3, #-4]
        add     r4, r4, #5
        add     r12, r12, #5
        eor     lr, lr, #2, 2
        str     lr, [r1, #-4]
        ldr     lr, [r3]
        cmp     r4, #0x22
        eor     lr, lr, #2, 2
        str     lr, [r1]
        ldr     lr, [r3, #4]
        eor     lr, lr, #2, 2
        str     lr, [r1, #4]
        ldr     lr, [r3, #8]
        eor     lr, lr, #2, 2
        str     lr, [r1, #8]
        ldr     lr, [r3, #0xC]
        add     r3, r3, #0x14
        eor     lr, lr, #2, 2
        str     lr, [r1, #0xC]
        add     r1, r1, #0x14
        blt     LDLX16
LDLX17:
        add     r12, r6, r12, lsl #2
        add     r1, r5, r4, lsl #2
LDLX18:
        ldr     r3, [r12], #4
        add     r4, r4, #1
        eor     r3, r3, #2, 2
        str     r3, [r1], #4
        cmp     r4, #0x28
        blt     LDLX18
LDLX19:
        cmp     r9, #1
        beq     LDLX22
        cmp     r8, #0x28
        bge     LDLX21
        add     r5, r5, r8, lsl #2
        rsb     r8, r8, #0x28
LDLX20:
        ldr     r0, [r5]
        ldr     r1, [r6], #4
        bl      __subsf3
        str     r0, [r5], #4
        subs    r8, r8, #1
        bne     LDLX20
LDLX21:
        mov     r0, #0
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LDLX22:
        cmp     r8, #0x28
        bge     LDLX21
        add     r5, r5, r8, lsl #2
        rsb     r8, r8, #0x28
LDLX23:
        ldr     r0, [r5]
        ldr     r1, [r6], #4
        bl      __addsf3
        str     r0, [r5], #4
        subs    r8, r8, #1
        bne     LDLX23
        mov     r0, #0
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LDLX24:
        cmp     r4, #0x28
        bge     LDLX19
        rsb     r1, r4, #0x28
        cmp     r1, #6
        blt     LDLX26
        mov     r1, r4, lsl #2
        add     r1, r1, #4
        add     r1, r1, r5
        add     r3, r6, #4
LDLX25:
        ldr     lr, [r3, #-4]
        add     r4, r4, #5
        add     r12, r12, #5
        str     lr, [r1, #-4]
        ldr     lr, [r3]
        cmp     r4, #0x22
        str     lr, [r1]
        ldr     lr, [r3, #4]
        str     lr, [r1, #4]
        ldr     lr, [r3, #8]
        str     lr, [r1, #8]
        ldr     lr, [r3, #0xC]
        add     r3, r3, #0x14
        str     lr, [r1, #0xC]
        add     r1, r1, #0x14
        blt     LDLX25
LDLX26:
        add     r12, r6, r12, lsl #2
        add     r3, r5, r4, lsl #2
LDLX27:
        ldr     r1, [r12], #4
        add     r4, r4, #1
        cmp     r4, #0x28
        str     r1, [r3], #4
        blt     LDLX27
        b       LDLX19
LDLX28:
        mvn     r0, #7
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLX__2il0floatpacket.1
        .long   LDLX_trackTable1
        .long   LDLX__2il0floatpacket.3
        .long   LDLX__2il0floatpacket.2


        .data
        .align  4


LDLX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLX__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F
LDLX__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x40


        .data
        .align  4


LDLX_trackTable0:
        .byte   0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x0B,0x00,0x00,0x00,0x0D,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x12,0x00,0x00,0x00
        .byte   0x15,0x00,0x00,0x00,0x17,0x00,0x00,0x00,0x1A,0x00,0x00,0x00,0x1C,0x00,0x00,0x00
        .byte   0x1F,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x24,0x00,0x00,0x00,0x26,0x00,0x00,0x00
LDLX_trackTable1:
        .byte   0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x05,0x00,0x00,0x00
        .byte   0x07,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x0E,0x00,0x00,0x00,0x0F,0x00,0x00,0x00,0x11,0x00,0x00,0x00,0x13,0x00,0x00,0x00
        .byte   0x14,0x00,0x00,0x00,0x16,0x00,0x00,0x00,0x18,0x00,0x00,0x00,0x19,0x00,0x00,0x00
        .byte   0x1B,0x00,0x00,0x00,0x1D,0x00,0x00,0x00,0x1E,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x22,0x00,0x00,0x00,0x23,0x00,0x00,0x00,0x25,0x00,0x00,0x00,0x27,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x10,0x00,0x00,0x00
        .byte   0x15,0x00,0x00,0x00,0x1A,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x24,0x00,0x00,0x00
LDLX_offset_i0i0:
        .byte   0x00,0x00,0x08,0x00,0x00,0x00,0x18,0x00,0x00,0x00,0x08,0x00,0x08,0x00,0x08,0x00
        .byte   0x10,0x00,0x00,0x00
LDLX_offset_outptr:
        .byte   0x08,0x00,0x08,0x00,0x18,0x00,0x20,0x00,0x00,0x00,0x10,0x00,0x18,0x00,0x20,0x00
        .byte   0x18,0x00,0x00,0x00
LDLX_startPos_p0:
        .byte   0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x01,0x00
        .byte   0x02,0x00,0x00,0x00
LDLX_startPos_p1:
        .byte   0x01,0x00,0x01,0x00,0x03,0x00,0x04,0x00,0x00,0x00,0x02,0x00,0x03,0x00,0x04,0x00
        .byte   0x03,0x00,0x00,0x00
LDLX_m0AddFactor:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00
LDLX_m1AddFactor:
        .byte   0x00,0x00,0x18,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x18,0x00,0x02,0x00
        .byte   0x01,0x00,0x00,0x00
LDLX_m1MulFactor:
        .byte   0x03,0x00,0x01,0x00,0x03,0x00,0x03,0x00,0x00,0x00,0x03,0x00,0x01,0x00,0x03,0x00
        .byte   0x03,0x00,0x00,0x00
LDLX_grayEncode:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x05,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x0C,0x00,0x00,0x00,0x0D,0x00,0x00,0x00,0x0F,0x00,0x00,0x00,0x0E,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x18,0x00,0x00,0x00,0x19,0x00,0x00,0x00,0x1B,0x00,0x00,0x00,0x1A,0x00,0x00,0x00
        .byte   0x1E,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x1D,0x00,0x00,0x00,0x1C,0x00,0x00,0x00
        .byte   0x14,0x00,0x00,0x00,0x15,0x00,0x00,0x00,0x17,0x00,0x00,0x00,0x16,0x00,0x00,0x00
        .byte   0x12,0x00,0x00,0x00,0x13,0x00,0x00,0x00,0x11,0x00,0x00,0x00,0x10,0x00,0x00,0x00


