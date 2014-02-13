        .text
        .align  4
        .globl  _ippsMulPack_32f


_ippsMulPack_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r7, r2
        mov     r5, r3
        beq     LBFF4
        cmp     r4, #0
        beq     LBFF4
        cmp     r7, #0
        beq     LBFF4
        cmp     r5, #0
        ble     LBFF5
        ldr     r0, [r8]
        ldr     r1, [r4]
        bl      __mulsf3
        tst     r5, #1
        str     r0, [r7]
        subne   r5, r5, #1
        bne     LBFF0
        sub     r12, r8, #4
        ldr     r0, [r12, +r5, lsl #2]
        sub     r12, r4, #4
        ldr     r1, [r12, +r5, lsl #2]
        sub     r6, r7, #4
        bl      __mulsf3
        str     r0, [r6, +r5, lsl #2]
        sub     r5, r5, #2
LBFF0:
        mov     r3, r5, asr #1
        bic     r12, r3, #1
        cmp     r12, #0
        add     r10, r8, #4
        add     r11, r4, #4
        add     r9, r7, #4
        ble     LBFF2
        add     r0, r4, #0x10
        mov     r1, #0
        str     r9, [sp, #0xC]
        str     r10, [sp, #4]
        add     r4, r4, #8
        sub     r6, r8, #8
        sub     r5, r7, #8
        str     r12, [sp, #0x10]
        str     r11, [sp, #8]
        str     r3, [sp]
        mov     r9, r0
        mov     r10, r1
LBFF1:
        ldr     r1, [r4, #-4]
        ldr     r0, [r6, #0xC]
        add     r10, r10, #2
        bl      __mulsf3
        ldr     r1, [r4]
        mov     r11, r0
        ldr     r0, [r6, #0x10]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r5, #0xC]
        ldr     r0, [r6, #0xC]
        ldr     r1, [r4]
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [r6, #0x10]!
        ldr     r1, [r4, #-4]
        add     r4, r4, #0x10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #0x10]!
        ldr     r0, [r8, #0xC]
        ldr     r1, [r9, #-4]
        bl      __mulsf3
        ldr     r1, [r8, #0x10]
        ldr     r2, [r9]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r7, #0xC]
        ldr     r0, [r8, #0xC]
        ldr     r1, [r9]
        bl      __mulsf3
        ldr     r1, [r8, #0x10]!
        ldr     r2, [r9, #-4]
        mov     r11, r0
        mov     r0, r1
        add     r9, r9, #0x10
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r7, #0x10]!
        ldr     r3, [sp, #0x10]
        cmp     r10, r3
        blt     LBFF1
        ldr     r9, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r3, [sp]
LBFF2:
        tst     r3, #1
        beq     LBFF3
        mov     r3, r3, lsl #3
        sub     r5, r3, #8
        ldr     r1, [r11, +r5]
        ldr     r0, [r10, +r5]
        add     r6, r5, r11
        add     r7, r5, r10
        bl      __mulsf3
        ldr     r2, [r7, #4]
        ldr     r1, [r6, #4]
        mov     r4, r0
        mov     r0, r2
        add     r8, r5, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [r9, +r5]
        ldr     r0, [r10, +r5]
        ldr     r1, [r6, #4]
        bl      __mulsf3
        ldr     r1, [r11, +r5]
        ldr     r7, [r7, #4]
        mov     r4, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8, #4]
LBFF3:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBFF4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBFF5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


