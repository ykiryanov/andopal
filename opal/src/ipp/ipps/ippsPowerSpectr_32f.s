        .text
        .align  4
        .globl  _ippsPowerSpectr_32f


_ippsPowerSpectr_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        cmp     r0, #0
        mov     r4, r3
        beq     LBAG11
        cmp     r1, #0
        beq     LBAG11
        cmp     r2, #0
        beq     LBAG11
        cmp     r4, #1
        blt     LBAG10
        cmp     r4, #8
        ble     LBAG5
        mov     r8, r4, asr #3
        cmp     r8, #0
        and     r7, r4, #7
        ble     LBAG1
        add     r5, r0, #8
        str     r5, [sp, #0x44]
        add     r5, r1, #8
        str     r5, [sp, #0x40]
        add     r5, r2, #0xC
        str     r5, [sp, #0x3C]
        add     r5, r0, #0xC
        str     r5, [sp, #0x38]
        add     r5, r1, #0xC
        str     r5, [sp, #0x34]
        add     r5, r2, #0x10
        str     r5, [sp, #0x30]
        add     r5, r0, #0x10
        str     r5, [sp, #0x2C]
        add     r5, r1, #0x10
        str     r5, [sp, #0x28]
        add     r5, r2, #0x14
        str     r5, [sp, #0x24]
        add     r5, r0, #0x14
        str     r5, [sp, #0x20]
        add     r5, r1, #0x14
        str     r5, [sp, #0x1C]
        add     r5, r2, #0x18
        str     r5, [sp, #0x18]
        add     r5, r0, #0x18
        str     r5, [sp, #0x14]
        add     r5, r1, #0x18
        add     r6, r2, #4
        mov     r9, r2
        add     r12, r1, #4
        str     r5, [sp, #0x10]
        str     r9, [sp, #0x5C]
        str     r6, [sp, #0x6C]
        str     r7, [sp, #0x50]
        str     r8, [sp, #0x58]
        str     r4, [sp, #0x4C]
        ldr     r6, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
        ldr     r4, [sp, #0x24]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        add     r5, r2, #0x1C
        str     r12, [sp, #0x48]
        add     lr, r0, #4
        add     r12, r2, #8
        str     r5, [sp, #0xC]
        add     r10, r0, #0x1C
        add     r11, r1, #0x1C
        mov     r3, r0
        mov     r5, r1
        str     r3, [sp, #0x54]
        str     r11, [sp, #0x70]
        str     r10, [sp, #0x68]
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x60]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBAG0:
        ldr     r2, [sp, #0x54]
        ldr     r11, [r5], #0x20
        ldr     r0, [r2], #0x20
        str     r2, [sp, #0x54]
        mov     r1, r0
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [r1]
        ldr     r0, [sp, #0x60]
        ldr     r2, [sp, #0x48]
        ldr     r0, [r0]
        ldr     r10, [r2]
        mov     r1, r0
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        str     r0, [r1]
        ldr     r2, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        ldr     r10, [r2]
        ldr     r2, [sp, #0x5C]
        ldr     r1, [r0]
        add     r2, r2, #0x20
        str     r2, [sp, #0x5C]
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        str     r0, [r1]
        ldr     r2, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        ldr     r10, [r2]
        ldr     r2, [sp, #0x60]
        ldr     r1, [r0]
        mov     r0, r1
        add     r2, r2, #0x20
        str     r2, [sp, #0x60]
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1]
        ldr     r2, [sp, #0x28]
        ldr     r1, [r7], #0x20
        ldr     r10, [r2]
        ldr     r2, [sp, #0x48]
        mov     r0, r1
        add     r2, r2, #0x20
        str     r2, [sp, #0x48]
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8], #0x20
        ldr     r1, [r9], #0x20
        ldr     r11, [r6], #0x20
        ldr     r2, [sp, #0x6C]
        mov     r0, r1
        add     r2, r2, #0x20
        str     r2, [sp, #0x6C]
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4], #0x20
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r0, [r0]
        ldr     r10, [r2]
        ldr     r2, [sp, #0x44]
        mov     r1, r0
        add     r2, r2, #0x20
        str     r2, [sp, #0x44]
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [r1]
        ldr     r2, [sp, #0x70]
        ldr     r0, [sp, #0x68]
        ldr     r10, [r2]
        ldr     r2, [sp, #0x40]
        ldr     r1, [r0]
        add     r2, r2, #0x20
        str     r2, [sp, #0x40]
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #0x20
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0xC]
        subs    r0, r0, #1
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x20
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x20
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x20
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x20
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x20
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x20
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x20
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x58]
        bne     LBAG0
        ldr     r7, [sp, #0x50]
        ldr     r4, [sp, #0x4C]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBAG1:
        sub     r5, r4, r7
        cmp     r5, r4
        bge     LBAG9
        sub     r12, r4, r5
        cmp     r12, #5
        blt     LBAG3
        mov     r12, r5, lsl #2
        add     r12, r12, #4
        sub     r9, r4, #5
        add     r8, r12, r1
        add     r7, r12, r0
        add     r6, r12, r2
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBAG2:
        ldr     r1, [r7, #-4]
        ldr     r11, [r8, #-4]
        add     r5, r5, #4
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #-4]
        ldr     r11, [r8]
        ldr     r1, [r7]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6]
        ldr     r1, [r7, #4]
        ldr     r11, [r8, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r1, [r7, #8]
        ldr     r11, [r8, #8]
        add     r7, r7, #0x10
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r11
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #8]
        cmp     r5, r9
        add     r8, r8, #0x10
        add     r6, r6, #0x10
        ble     LBAG2
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBAG3:
        add     r6, r0, r5, lsl #2
        add     r7, r1, r5, lsl #2
        add     r8, r2, r5, lsl #2
LBAG4:
        ldr     r1, [r6], #4
        ldr     r10, [r7], #4
        mov     r0, r1
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        add     r5, r5, #1
        str     r0, [r8], #4
        cmp     r5, r4
        blt     LBAG4
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBAG5:
        cmp     r4, #5
        mov     r9, #0
        blt     LBAG7
        sub     r8, r4, #5
        add     r7, r1, #4
        add     r6, r0, #4
        add     r5, r2, #4
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBAG6:
        ldr     r1, [r6, #-4]
        ldr     r10, [r7, #-4]
        add     r9, r9, #4
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #-4]
        ldr     r10, [r7]
        ldr     r1, [r6]
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5]
        ldr     r1, [r6, #4]
        ldr     r10, [r7, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r1, [r6, #8]
        ldr     r10, [r7, #8]
        add     r6, r6, #0x10
        mov     r0, r1
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #8]
        cmp     r9, r8
        add     r7, r7, #0x10
        add     r5, r5, #0x10
        ble     LBAG6
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBAG7:
        add     r5, r0, r9, lsl #2
        add     r6, r1, r9, lsl #2
        add     r7, r2, r9, lsl #2
LBAG8:
        ldr     r1, [r5], #4
        ldr     r8, [r6], #4
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r8
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        add     r9, r9, #1
        str     r0, [r7], #4
        cmp     r9, r4
        blt     LBAG8
LBAG9:
        mov     r0, #0
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBAG10:
        mvn     r0, #5
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBAG11:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}


