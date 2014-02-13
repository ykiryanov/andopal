        .text
        .align  4
        .globl  _ipps_rDftFwdRecombine_32f


_ipps_rDftFwdRecombine_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r4, r0
        ldr     r9, [r4]
        ldr     r8, [r4, #4]
        mov     r5, r1
        mov     r0, r9
        mov     r6, r2
        mov     r1, r8
        bl      __addsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        cmp     r5, #1
        str     r7, [r4]
        str     r0, [r4, #4]
        add     r3, r4, #4
        beq     LCIW2
        mov     r12, r5, lsl #1
        cmp     r5, #2
        sub     r12, r12, #2
        ble     LCIW1
        add     r3, r3, r12, lsl #2
        add     r8, r4, r12, lsl #2
        add     r9, r6, #8
        mov     r12, #2
        add     r6, r6, #0xC
        add     r11, r4, #8
        add     r10, r4, #0xC
        str     r6, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r12, [sp, #8]
        str     r5, [sp, #4]
        str     r4, [sp]
LCIW0:
        ldr     r0, [r11]
        ldr     r2, [sp, #8]
        str     r0, [sp, #0x14]
        ldr     r1, [r8]
        add     r2, r2, #2
        str     r2, [sp, #8]
        str     r1, [sp, #0x18]
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        mov     r4, r0
        ldr     r1, [r1]
        str     r1, [sp, #0x1C]
        ldr     r2, [r10]
        str     r2, [sp, #0x20]
        ldr     r0, [sp, #0x20]
        bl      __addsf3
        ldr     r2, [sp, #0xC]
        ldr     r7, [r9], #8
        ldr     r6, [r2]
        str     r0, [sp, #0x24]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r6
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x14]
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        mov     r6, r0
        mov     r0, r4
        add     r1, r1, #8
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x20]
        bl      __subsf3
        ldr     r1, [sp, #0x1C]
        mov     r5, r0
        mov     r0, r4
        bl      __subsf3
        str     r6, [r11], #8
        ldr     r1, [sp, #0x24]
        str     r1, [r8], #-8
        str     r0, [r10], #8
        ldr     r1, [sp, #0x10]
        str     r5, [r1], #-8
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        cmp     r0, r1
        blt     LCIW0
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
LCIW1:
        tst     r5, #1
        bne     LCIW2
        mov     r5, r5, lsl #2
        add     r1, r5, #4
        ldr     r2, [r1, +r4]
        eor     r2, r2, #2, 2
        str     r2, [r1, +r4]
LCIW2:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


