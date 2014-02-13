        .text
        .align  4
        .globl  _ipps_cRealRecombine_32f


_ipps_cRealRecombine_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        cmp     r1, #1
        beq     LBYO2
        cmp     r2, #0
        mov     r2, r1, lsl #1
        sub     r12, r2, #2
        mov     r4, #2
        ble     LBYO3
        cmp     r1, #2
        ble     LBYO1
        add     r2, r0, #4
        add     r6, r3, #8
        add     r2, r2, r12, lsl #2
        add     r3, r3, #0xC
        add     r5, r0, r12, lsl #2
        add     r8, r0, #8
        add     r7, r0, #0xC
        str     r3, [sp, #4]
        str     r2, [sp]
        str     r4, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LBYO0:
        ldr     r0, [r8]
        ldr     r2, [sp, #8]
        str     r0, [sp, #0x14]
        ldr     r1, [r5]
        add     r2, r2, #2
        str     r2, [sp, #8]
        str     r1, [sp, #0x18]
        bl      __subsf3
        ldr     r1, [sp]
        mov     r4, r0
        ldr     r1, [r1]
        str     r1, [sp, #0x1C]
        ldr     r2, [r7]
        str     r2, [sp, #0x20]
        ldr     r0, [sp, #0x20]
        bl      __addsf3
        ldr     r2, [sp, #4]
        ldr     r11, [r6], #8
        ldr     r10, [r2]
        str     r0, [sp, #0x24]
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r10
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x14]
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        mov     r10, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x1C]
        mov     r9, r0
        mov     r0, r4
        bl      __subsf3
        str     r10, [r8], #8
        ldr     r1, [sp, #0x24]
        str     r1, [r5], #-8
        ldr     r1, [sp, #4]
        add     r1, r1, #8
        str     r1, [sp, #4]
        str     r0, [r7], #8
        ldr     r1, [sp]
        str     r9, [r1], #-8
        str     r1, [sp]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        cmp     r1, r0
        blt     LBYO0
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LBYO1:
        mov     r1, r1, lsl #2
        add     r1, r1, #4
        ldr     r2, [r1, +r0]
        eor     r2, r2, #2, 2
        str     r2, [r1, +r0]
LBYO2:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBYO3:
        cmp     r1, #2
        ble     LBYO2
        add     r2, r0, #4
        add     r9, r0, r12, lsl #2
        add     r10, r0, #8
        add     r7, r0, #0xC
        add     r0, r3, #8
        add     r3, r3, #0xC
        add     r8, r2, r12, lsl #2
        str     r3, [sp, #4]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
LBYO4:
        ldr     r0, [r10]
        add     r4, r4, #2
        str     r0, [sp, #0x24]
        ldr     r1, [r9]
        str     r1, [sp, #0x20]
        bl      __subsf3
        ldr     r6, [r7]
        str     r0, [sp, #0x1C]
        ldr     r1, [r8]
        mov     r0, r6
        str     r1, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        ldr     r1, [r1]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #4]
        ldr     r11, [r1]
        ldr     r1, [sp, #0x14]
        str     r0, [sp]
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x1C]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        mov     r5, r0
        ldr     r0, [sp, #0x1C]
        bl      __mulsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [sp]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r0, r6
        mov     r1, r11
        bl      __subsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        mov     r1, r5
        bl      __subsf3
        ldr     r2, [sp, #0x10]
        mov     r5, r0
        ldr     r0, [sp, #0x18]
        add     r2, r2, #8
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #4]
        mov     r1, r11
        add     r2, r2, #8
        str     r2, [sp, #4]
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        str     r1, [r10], #8
        ldr     r1, [sp, #0x1C]
        str     r1, [r7], #8
        str     r5, [r9], #-8
        str     r0, [r8], #-8
        ldr     r0, [sp, #0xC]
        cmp     r4, r0
        blt     LBYO4
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


