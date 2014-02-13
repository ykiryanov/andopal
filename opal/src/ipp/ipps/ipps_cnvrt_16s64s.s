        .text
        .align  4
        .globl  _ipps_cnvrt_16s64s


_ipps_cnvrt_16s64s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r6, r2
        cmp     r6, #0
        mov     r8, r0
        mov     r7, r1
        mov     r4, r3
        ble     LCAD3
        cmp     r6, #6
        mov     r10, #0
        movlt   r5, r4, asr #31
        blt     LCAD1
        sub     r12, r6, #6
        mov     lr, r8
        mov     r5, r4, asr #31
        sub     r9, r7, #0x24
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r6, [sp, #8]
LCAD0:
        ldr     r12, [sp]
        mov     r2, r4
        mov     r3, r5
        ldrsh   r0, [r12], #0xA
        str     r12, [sp]
        add     r6, r10, #1
        mov     r1, r0, asr #31
        bl      __ashldi3
        str     r1, [r9, #0x28]
        str     r0, [r9, #0x24]
        mov     r12, r6, lsl #1
        ldrsh   r0, [r8, +r12]
        add     r9, r9, #0x28
        mov     r2, r4
        mov     r1, r0, asr #31
        mov     r3, r5
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        add     r6, r7, r6, lsl #3
        str     r1, [r6, #4]
        add     r6, r10, #2
        mov     r2, r4
        mov     r12, r6, lsl #1
        ldrsh   r0, [r8, +r12]
        mov     r3, r5
        add     r11, r7, r6, lsl #3
        mov     r1, r0, asr #31
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        str     r1, [r11, #4]
        add     r6, r10, #3
        mov     r2, r4
        mov     r12, r6, lsl #1
        ldrsh   r0, [r8, +r12]
        mov     r3, r5
        add     r11, r7, r6, lsl #3
        mov     r1, r0, asr #31
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        str     r1, [r11, #4]
        add     r6, r10, #4
        add     r10, r10, #5
        mov     r12, r6, lsl #1
        ldrsh   r0, [r8, +r12]
        mov     r2, r4
        mov     r3, r5
        mov     r1, r0, asr #31
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        ldr     r12, [sp, #4]
        add     r6, r7, r6, lsl #3
        cmp     r10, r12
        str     r1, [r6, #4]
        ble     LCAD0
        ldr     r6, [sp, #8]
LCAD1:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r7
        add     r8, r8, r10, lsl #1
LCAD2:
        ldrsh   r0, [r8], #2
        add     r10, r10, #1
        mov     r1, r0, asr #31
        mov     r2, r4
        mov     r3, r5
        bl      __ashldi3
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        cmp     r10, r6
        blt     LCAD2
LCAD3:
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


