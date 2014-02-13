        .text
        .align  4
        .globl  _ipps_rbMpy1_64f


_ipps_rbMpy1_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r7, r3
        sub     r12, r7, #3
        cmp     r12, #0
        mov     r5, r0
        mov     r4, r1
        mov     r6, #0
        ble     LCDX1
        sub     r11, r2, #4
        sub     r10, r2, #0xC
        sub     r9, r2, #0x14
        sub     r8, r2, #0x1C
        str     r12, [sp]
        str     r7, [sp, #4]
        str     r2, [sp, #8]
LCDX0:
        ldr     r0, [r8, #0x1C]
        ldr     r1, [r8, #0x20]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        ldr     r0, [r9, #0x1C]
        ldr     r1, [r9, #0x20]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [r10, #0x1C]
        ldr     r2, [r10, #0x20]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [r11, #0x1C]
        ldr     r2, [r11, #0x20]
        str     r0, [sp, #0x1C]
        mov     r7, r1
        mov     r0, r3
        mov     r1, r2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [sp, #0xC]
        add     r6, r6, #4
        str     r12, [r8, #0x1C]
        ldr     r12, [sp, #0x10]
        str     r12, [r8, #0x20]!
        ldr     r12, [sp, #0x14]
        str     r12, [r9, #0x1C]
        ldr     r12, [sp, #0x18]
        str     r12, [r9, #0x20]!
        ldr     r12, [sp, #0x1C]
        str     r7, [r10, #0x20]
        str     r12, [r10, #0x1C]
        str     r0, [r11, #0x1C]
        str     r1, [r11, #0x20]!
        ldr     r12, [sp]
        add     r10, r10, #0x20
        cmp     r6, r12
        blt     LCDX0
        ldr     r7, [sp, #4]
        ldr     r2, [sp, #8]
LCDX1:
        cmp     r6, r7
        bge     LCDX5
        sub     r12, r7, r6
        cmp     r12, #6
        blt     LCDX3
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        mov     r10, r6
        add     r8, r12, r2
        sub     r9, r7, #6
        mov     r6, r2
LCDX2:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r8, #0xC]
        ldr     r3, [r8, #0x10]
        str     r0, [r8, #4]
        str     r1, [r8, #8]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r8, #0x14]
        ldr     r3, [r8, #0x18]
        str     r0, [r8, #0xC]
        str     r1, [r8, #0x10]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r8, #0x1C]
        ldr     r3, [r8, #0x20]
        str     r0, [r8, #0x14]
        str     r1, [r8, #0x18]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r8, #0x24]
        ldr     r3, [r8, #0x28]
        str     r0, [r8, #0x1C]
        str     r1, [r8, #0x20]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        add     r10, r10, #5
        str     r0, [r8, #0x24]
        str     r1, [r8, #0x28]!
        cmp     r10, r9
        ble     LCDX2
        mov     r2, r6
        mov     r6, r10
LCDX3:
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r2
LCDX4:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        add     r6, r6, #1
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        cmp     r6, r7
        blt     LCDX4
LCDX5:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


