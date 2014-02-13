        .text
        .align  4
        .globl  _ipps_cnvrt_32s64s


_ipps_cnvrt_32s64s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r6, r2
        cmp     r6, #0
        mov     r8, r0
        mov     r7, r1
        mov     r4, r3
        ble     LCAC3
        cmp     r6, #6
        mov     r11, #0
        movlt   r5, r4, asr #31
        blt     LCAC1
        sub     r12, r6, #6
        mov     r5, r4, asr #31
        sub     r10, r7, #0x24
        mov     r9, r8
        str     r12, [sp]
        str     r6, [sp, #4]
LCAC0:
        ldr     r0, [r9], #0x14
        add     r6, r11, #1
        mov     r1, r0, asr #31
        mov     r2, r4
        mov     r3, r5
        bl      __ashldi3
        str     r1, [r10, #0x28]
        str     r0, [r10, #0x24]
        ldr     r0, [r8, +r6, lsl #2]
        mov     r2, r4
        mov     r3, r5
        mov     r1, r0, asr #31
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        add     r6, r7, r6, lsl #3
        str     r1, [r6, #4]
        add     r6, r11, #2
        ldr     r0, [r8, +r6, lsl #2]
        add     r10, r10, #0x28
        mov     r2, r4
        mov     r1, r0, asr #31
        mov     r3, r5
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        add     r6, r7, r6, lsl #3
        str     r1, [r6, #4]
        add     r6, r11, #3
        ldr     r0, [r8, +r6, lsl #2]
        mov     r2, r4
        mov     r3, r5
        mov     r1, r0, asr #31
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        add     r6, r7, r6, lsl #3
        str     r1, [r6, #4]
        add     r6, r11, #4
        ldr     r0, [r8, +r6, lsl #2]
        add     r11, r11, #5
        mov     r2, r4
        mov     r1, r0, asr #31
        mov     r3, r5
        bl      __ashldi3
        str     r0, [r7, +r6, lsl #3]
        ldr     r12, [sp]
        add     r6, r7, r6, lsl #3
        cmp     r11, r12
        str     r1, [r6, #4]
        ble     LCAC0
        ldr     r6, [sp, #4]
LCAC1:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r7
        add     r8, r8, r11, lsl #2
LCAC2:
        ldr     r0, [r8], #4
        add     r11, r11, #1
        mov     r1, r0, asr #31
        mov     r2, r4
        mov     r3, r5
        bl      __ashldi3
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        cmp     r11, r6
        blt     LCAC2
LCAC3:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


