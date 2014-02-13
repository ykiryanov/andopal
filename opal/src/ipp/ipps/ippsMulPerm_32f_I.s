        .text
        .align  4
        .globl  _ippsMulPerm_32f_I


_ippsMulPerm_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r4, r2
        beq     LBEY4
        cmp     r6, #0
        beq     LBEY4
        cmp     r4, #0
        ble     LBEY5
        ldr     r0, [r6]
        ldr     r1, [r5]
        add     r8, r5, #4
        add     r7, r6, #4
        bl      __mulsf3
        tst     r4, #1
        str     r0, [r6]
        subne   r4, r4, #1
        bne     LBEY0
        ldr     r0, [r6, #4]
        ldr     r1, [r5, #4]
        sub     r4, r4, #2
        add     r8, r5, #8
        bl      __mulsf3
        str     r0, [r6, #4]
        add     r7, r6, #8
LBEY0:
        mov     r0, r4, asr #1
        bic     r2, r0, #1
        cmp     r2, #0
        ble     LBEY2
        add     r3, r7, #0xC
        add     r12, r8, #0xC
        sub     lr, r8, #0xC
        sub     r1, r7, #4
        mov     r6, #0
        sub     r5, r7, #0xC
        mov     r4, #8
        str     r1, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r2, [sp, #4]
        str     r0, [sp]
        str     r8, [sp, #8]
LBEY1:
        ldr     r1, [sp, #0x10]
        ldr     r9, [r1, #0x10]!
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #8]
        ldr     r8, [r1, +r6, lsl #3]
        ldr     r1, [r7, +r6, lsl #3]
        str     r1, [sp, #0x1C]
        ldr     r10, [r5, #0x10]
        mov     r0, r8
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r10
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        mov     r8, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r11, [r7, +r6, lsl #3]
        str     r0, [r5, #0x10]!
        ldr     r2, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r6, r6, #2
        ldr     r2, [r2, #-4]
        ldr     r10, [r0, #-4]
        str     r2, [sp, #0x1C]
        ldr     r8, [r0], #0x10
        ldr     r2, [sp, #0x18]
        str     r0, [sp, #0x14]
        ldr     r9, [r2], #0x10
        ldr     r0, [sp, #0x1C]
        str     r2, [sp, #0x18]
        mov     r1, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x1C]
        mov     r1, r8
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r11, [r7, +r4]
        ldr     r1, [sp, #0xC]
        add     r4, r4, #0x10
        str     r0, [r1, #0x10]
        ldr     r0, [sp, #4]
        cmp     r6, r0
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        blt     LBEY1
        ldr     r0, [sp]
        ldr     r8, [sp, #8]
LBEY2:
        tst     r0, #1
        beq     LBEY3
        mov     r0, r0, lsl #3
        sub     r6, r0, #8
        ldr     r5, [r8, +r6]
        ldr     r4, [r7, +r6]
        add     r8, r6, r8
        ldr     r8, [r8, #4]
        add     r10, r6, r7
        ldr     r9, [r10, #4]
        mov     r0, r5
        mov     r1, r4
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r8
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r11, [r7, +r6]
        str     r0, [r10, #4]
LBEY3:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBEY4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBEY5:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


