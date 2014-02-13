        .text
        .align  4
        .globl  _ippsMulPack_32f_I


_ippsMulPack_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r5, r2
        beq     LBFE4
        cmp     r4, #0
        beq     LBFE4
        cmp     r5, #0
        ble     LBFE5
        ldr     r0, [r4]
        ldr     r1, [r8]
        bl      __mulsf3
        tst     r5, #1
        str     r0, [r4]
        subne   r7, r5, #1
        bne     LBFE0
        sub     r3, r8, #4
        ldr     r1, [r3, +r5, lsl #2]
        sub     r6, r4, #4
        ldr     r0, [r6, +r5, lsl #2]
        sub     r7, r5, #2
        bl      __mulsf3
        str     r0, [r6, +r5, lsl #2]
LBFE0:
        mov     r3, r7, asr #1
        bic     r12, r3, #1
        cmp     r12, #0
        add     r2, r8, #4
        add     r5, r4, #4
        ble     LBFE2
        add     r6, r8, #0x10
        add     lr, r4, #0x10
        add     r8, r8, #8
        mov     r7, #0
        str     r8, [sp, #0x10]
        str     lr, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r5, [sp, #8]
        str     r2, [sp, #4]
        str     r3, [sp]
LBFE1:
        ldr     r2, [sp, #0x10]
        ldr     r9, [r4, #4]
        add     r7, r7, #2
        ldr     r5, [r2, #-4]
        ldr     r10, [r2], #0x10
        str     r2, [sp, #0x10]
        ldr     r8, [r4, #8]
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r8
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r4, #8]
        str     r11, [r4, #4]
        ldr     r2, [sp, #0x14]
        ldr     r5, [r6, #-4]
        ldr     r9, [r2, #-4]
        ldr     r8, [r2], #0x10
        str     r2, [sp, #0x14]
        ldr     r10, [r6], #0x10
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r4, #0x10]
        str     r11, [r4, #0xC]
        ldr     r0, [sp, #0xC]
        add     r4, r4, #0x10
        cmp     r7, r0
        blt     LBFE1
        ldr     r5, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
LBFE2:
        tst     r3, #1
        beq     LBFE3
        mov     r3, r3, lsl #3
        sub     r9, r3, #8
        ldr     r6, [r2, +r9]
        ldr     r8, [r5, +r9]
        add     r2, r9, r2
        ldr     r4, [r2, #4]
        add     r10, r9, r5
        ldr     r7, [r10, #4]
        mov     r0, r6
        mov     r1, r8
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r6
        mov     r1, r7
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        str     r11, [r5, +r9]
        str     r0, [r10, #4]
LBFE3:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBFE4:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBFE5:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


