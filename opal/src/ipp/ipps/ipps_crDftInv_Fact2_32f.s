        .text
        .align  4
        .globl  _ipps_crDftInv_Fact2_32f


_ipps_crDftInv_Fact2_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r10, r0
        mov     r8, r3
        ldr     r7, [r10]
        ldr     r6, [r10, +r8, lsl #3]
        ldr     r12, [sp, #0x38]
        mov     r5, r1
        mov     r4, r2
        str     r12, [sp, #8]
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        ldr     r7, [r10, #4]
        add     r12, r10, r8, lsl #3
        str     r12, [sp]
        ldr     r6, [r12, #4]
        add     r12, r5, r8, lsl #2
        str     r12, [sp, #4]
        add     r12, r4, r8, lsl #2
        str     r12, [sp, #0xC]
        mov     r9, r0
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        str     r0, [sp, #0x10]
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        str     r11, [r5]
        ldr     r12, [sp, #0x10]
        cmp     r8, #1
        str     r12, [r4]
        str     r9, [r5, +r8, lsl #2]
        str     r0, [r4, +r8, lsl #2]
        ble     LCJW1
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r12, [sp]
        add     r6, r5, #4
        add     r5, r4, #4
        add     r4, r1, #4
        ldr     r1, [sp, #0xC]
        add     r0, r0, #0xC
        add     r12, r12, #0xC
        sub     r8, r8, #1
        add     r1, r1, #4
        add     r7, r10, #4
        str     r8, [sp, #4]
        str     r1, [sp, #0xC]
        str     r12, [sp, #8]
        str     r0, [sp, #0x10]
LCJW0:
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x10]
        ldr     r11, [r2, #-4]
        ldr     r10, [r2], #8
        ldr     r9, [r1]
        str     r2, [sp, #8]
        ldr     r2, [r3, #-4]
        mov     r0, r11
        add     r3, r3, #8
        str     r2, [sp]
        ldr     r1, [sp]
        str     r3, [sp, #0x10]
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp]
        mov     r8, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r9
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r10, [r7, #4]
        mov     r9, r0
        mov     r1, r8
        mov     r0, r10
        bl      __addsf3
        str     r0, [sp]
        mov     r0, r10
        mov     r1, r8
        bl      __subsf3
        ldr     r11, [r7, #8]!
        mov     r10, r0
        mov     r1, r9
        mov     r0, r11
        bl      __addsf3
        mov     r8, r0
        mov     r0, r11
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp]
        str     r1, [r6], #4
        str     r8, [r5], #4
        str     r10, [r4], #4
        ldr     r1, [sp, #0xC]
        str     r0, [r1], #4
        ldr     r0, [sp, #4]
        subs    r0, r0, #1
        str     r0, [sp, #4]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0xC]
        bne     LCJW0
LCJW1:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


