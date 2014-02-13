        .text
        .align  4
        .globl  _ippsMulPackConj_32f_I


_ippsMulPackConj_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LBFJ4
        cmp     r4, #0
        beq     LBFJ4
        cmp     r6, #0
        ble     LBFJ5
        ldr     r0, [r4]
        ldr     r1, [r5]
        bl      __mulsf3
        tst     r6, #1
        str     r0, [r4]
        subne   r8, r6, #1
        bne     LBFJ0
        sub     r3, r5, #4
        ldr     r1, [r3, +r6, lsl #2]
        sub     r7, r4, #4
        ldr     r0, [r7, +r6, lsl #2]
        sub     r8, r6, #2
        bl      __mulsf3
        str     r0, [r7, +r6, lsl #2]
LBFJ0:
        mov     r8, r8, asr #1
        bic     r3, r8, #1
        cmp     r3, #0
        add     r2, r5, #4
        add     r6, r4, #4
        ble     LBFJ2
        add     lr, r5, #0x10
        add     r12, r4, #0x10
        mov     r7, #0
        add     r5, r5, #8
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r6, [sp, #8]
        str     r2, [sp, #4]
        str     r8, [sp]
LBFJ1:
        ldr     r6, [r4, #4]
        ldr     r10, [r5, #-4]
        ldr     r8, [r5], #0x10
        ldr     r9, [r4, #8]
        mov     r1, r6
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        mov     r1, r6
        mov     r0, r8
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        str     r0, [r4, #8]
        str     r11, [r4, #4]
        ldr     r2, [sp, #0x14]
        add     r7, r7, #2
        ldr     r8, [r2]
        ldr     r6, [r2, #-4]
        ldr     r2, [sp, #0x10]
        mov     r0, r6
        ldr     r10, [r2]
        ldr     r9, [r2, #-4]
        add     r2, r2, #0x10
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        mov     r1, r9
        add     r2, r2, #0x10
        str     r2, [sp, #0x14]
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r6
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r4, #0x10]
        str     r11, [r4, #0xC]
        ldr     r0, [sp, #0xC]
        add     r4, r4, #0x10
        cmp     r7, r0
        blt     LBFJ1
        ldr     r6, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r8, [sp]
LBFJ2:
        tst     r8, #1
        beq     LBFJ3
        mov     r8, r8, lsl #3
        sub     r9, r8, #8
        ldr     r8, [r2, +r9]
        ldr     r5, [r6, +r9]
        add     r2, r9, r2
        ldr     r4, [r2, #4]
        add     r10, r9, r6
        ldr     r7, [r10, #4]
        mov     r1, r5
        mov     r0, r8
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r8
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r11, [r6, +r9]
        str     r0, [r10, #4]
LBFJ3:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBFJ4:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBFJ5:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


