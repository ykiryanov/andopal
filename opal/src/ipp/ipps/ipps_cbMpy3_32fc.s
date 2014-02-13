        .text
        .align  4
        .globl  _ipps_cbMpy3_32fc


_ipps_cbMpy3_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        sub     r12, r3, #1
        cmp     r12, #0
        mov     r4, r2
        mov     r5, #0
        ble     LBYS1
        sub     lr, r4, #4
        sub     r10, r4, #0xC
        add     r9, r1, #0xC
        add     r8, r0, #0xC
        add     r7, r1, #4
        add     r6, r0, #4
        str     r10, [sp, #0x1C]
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r4, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        str     r5, [sp, #0x18]
LBYS0:
        ldr     r0, [sp, #0x18]
        add     r0, r0, #2
        str     r0, [sp, #0x18]
        ldr     r0, [r6, #-4]
        str     r0, [sp, #0x20]
        ldr     r5, [r7, #-4]
        ldr     r10, [r6], #0x10
        ldr     r11, [r7], #0x10
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        str     r0, [sp, #0x24]
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r4, r0
        ldr     r0, [sp, #0x20]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r5, [r9, #-4]
        ldr     r10, [r8, #-4]
        ldr     r4, [r8], #0x10
        ldr     r11, [r9], #0x10
        str     r0, [sp, #0x20]
        mov     r0, r10
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x28]
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x28]
        bl      __subsf3
        str     r0, [sp, #0x28]
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x1C]
        str     r2, [r1, #0xC]
        ldr     r2, [sp, #0x20]
        str     r2, [r1, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x28]
        str     r0, [r2, #0x10]
        str     r1, [r2, #0xC]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x10]
        cmp     r0, r1
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        blt     LBYS0
        ldr     r3, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
        ldr     r5, [sp, #0x18]
LBYS1:
        tst     r3, #1
        beq     LBYS2
        ldr     r6, [r0, +r5, lsl #3]
        ldr     r8, [r1, +r5, lsl #3]
        add     r0, r0, r5, lsl #3
        ldr     r7, [r0, #4]
        add     r1, r1, r5, lsl #3
        ldr     r9, [r1, #4]
        mov     r0, r6
        mov     r1, r8
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r6
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        add     r1, r4, r5, lsl #3
        str     r10, [r4, +r5, lsl #3]
        str     r0, [r1, #4]
LBYS2:
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


