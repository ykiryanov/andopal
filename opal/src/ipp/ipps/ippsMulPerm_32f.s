        .text
        .align  4
        .globl  _ippsMulPerm_32f


_ippsMulPerm_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mov     r6, r2
        mov     r7, r3
        beq     LBEZ4
        cmp     r5, #0
        beq     LBEZ4
        cmp     r6, #0
        beq     LBEZ4
        cmp     r7, #0
        ble     LBEZ5
        ldr     r0, [r4]
        ldr     r1, [r5]
        add     r10, r4, #4
        add     r9, r5, #4
        bl      __mulsf3
        tst     r7, #1
        str     r0, [r6]
        add     r11, r6, #4
        subne   r7, r7, #1
        bne     LBEZ0
        ldr     r0, [r4, #4]
        ldr     r1, [r5, #4]
        sub     r7, r7, #2
        add     r10, r4, #8
        bl      __mulsf3
        str     r0, [r6, #4]
        add     r9, r5, #8
        add     r11, r6, #8
LBEZ0:
        mov     r1, r7, asr #1
        bic     r3, r1, #1
        cmp     r3, #0
        ble     LBEZ2
        sub     r2, r11, #0xC
        mov     r0, #0
        sub     r8, r11, #4
        str     r11, [sp, #4]
        add     r7, r9, #0xC
        sub     r6, r10, #4
        sub     r5, r9, #0xC
        sub     r4, r10, #0xC
        str     r2, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp]
        mov     r11, r0
LBEZ1:
        ldr     r1, [r9, +r11, lsl #3]
        ldr     r0, [r10, +r11, lsl #3]
        bl      __mulsf3
        str     r0, [sp, #0x10]
        ldr     r1, [r5, #0x10]
        ldr     r0, [r4, #0x10]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x10]
        bl      __subsf3
        ldr     r1, [sp, #4]
        str     r0, [r1, +r11, lsl #3]
        ldr     r0, [r10, +r11, lsl #3]
        ldr     r1, [r5, #0x10]!
        bl      __mulsf3
        str     r0, [sp, #0x10]
        ldr     r1, [r9, +r11, lsl #3]
        ldr     r0, [r4, #0x10]!
        add     r11, r11, #2
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1, #0x10]!
        ldr     r0, [r6, #0xC]
        str     r1, [sp, #0xC]
        ldr     r1, [r7, #-4]
        bl      __mulsf3
        ldr     r1, [r6, #0x10]
        str     r0, [sp, #0x10]
        ldr     r2, [r7]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x10]
        bl      __subsf3
        str     r0, [r8, #0xC]
        ldr     r0, [r6, #0xC]
        ldr     r1, [r7]
        bl      __mulsf3
        ldr     r1, [r6, #0x10]!
        ldr     r2, [r7, #-4]
        str     r0, [sp, #0x10]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        str     r0, [r8, #0x10]!
        ldr     r1, [sp, #8]
        add     r7, r7, #0x10
        cmp     r11, r1
        blt     LBEZ1
        ldr     r1, [sp]
        ldr     r11, [sp, #4]
LBEZ2:
        tst     r1, #1
        beq     LBEZ3
        mov     r1, r1, lsl #3
        sub     r5, r1, #8
        ldr     r1, [r9, +r5]
        ldr     r0, [r10, +r5]
        add     r6, r5, r9
        add     r7, r5, r10
        bl      __mulsf3
        ldr     r2, [r7, #4]
        ldr     r1, [r6, #4]
        mov     r4, r0
        mov     r0, r2
        add     r8, r5, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r11, +r5]
        ldr     r0, [r10, +r5]
        ldr     r1, [r6, #4]
        bl      __mulsf3
        ldr     r1, [r9, +r5]
        ldr     r7, [r7, #4]
        mov     r4, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8, #4]
LBEZ3:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBEZ4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBEZ5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


