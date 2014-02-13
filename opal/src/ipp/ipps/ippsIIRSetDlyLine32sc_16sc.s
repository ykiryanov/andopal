        .text
        .align  4
        .globl  _ippsIIRSetDlyLine32sc_16sc


_ippsIIRSetDlyLine32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LBNX10
        ldr     r2, [pc, #0x2E8]
        ldr     r3, [r5]
        sub     r12, r2, #1
        cmp     r12, r3
        beq     LBNX0
        cmp     r2, r3
        beq     LBNX0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBNX0:
        sub     r12, r2, #1
        cmp     r12, r3
        mov     r7, #0
        ldreq   r9, [r5, #0x2C]
        movne   r9, r7
        cmp     r2, r3
        ldreq   r2, [r5, #0x2C]
        moveq   r9, r2, lsl #1
        cmp     r4, #0
        beq     LBNX9
        cmp     r9, #0
        ble     LBNX4
        cmp     r9, #5
        movlt   r10, r7
        blt     LBNX2
        mov     r10, r7
        sub     r8, r9, #5
        mov     r6, r10
        sub     lr, r4, #4
        mov     r12, #8
        mov     r3, #0x10
        mov     r2, #0x18
LBNX1:
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #4]
        str     r11, [r0, +r10, lsl #3]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #8]
        add     r10, r10, #4
        cmp     r10, r8
        add     r0, r0, r6
        str     r11, [r0, #4]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #0xC]
        add     r6, r6, #0x20
        str     r11, [r12, +r0]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #0x10]
        add     r0, r0, r12
        add     r12, r12, #0x20
        str     r11, [r0, #4]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #0x14]
        str     r11, [r3, +r0]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #0x18]
        add     r0, r0, r3
        add     r3, r3, #0x20
        str     r11, [r0, #4]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #0x1C]
        str     r11, [r2, +r0]
        ldr     r0, [r5, #8]
        ldr     r11, [lr, #0x20]!
        add     r0, r0, r2
        str     r11, [r0, #4]
        add     r2, r2, #0x20
        ble     LBNX1
LBNX2:
        mov     r2, r10, lsl #3
        sub     r3, r2, #4
        add     r3, r3, r4
LBNX3:
        ldr     lr, [r5, #8]
        ldr     r12, [r3, #4]
        str     r12, [lr, +r10, lsl #3]
        ldr     lr, [r5, #8]
        ldr     r12, [r3, #8]!
        add     r10, r10, #1
        add     lr, lr, r2
        cmp     r10, r9
        str     r12, [lr, #4]
        add     r2, r2, #8
        blt     LBNX3
LBNX4:
        cmp     r9, #0
        ble     LBNX8
        cmp     r9, #5
        movlt   r8, r7
        blt     LBNX6
        mov     r8, r7
        sub     r2, r9, #5
        sub     r6, r4, #0x1C
        str     r2, [sp]
        str     r9, [sp, #4]
LBNX5:
        ldr     r0, [r6, #0x1C]
        add     r10, r8, #2
        add     r11, r8, #1
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r8, lsl #4]
        add     r2, r2, r7
        str     r1, [r2, #4]
        ldr     r0, [r6, #0x20]!
        add     r9, r4, r11, lsl #3
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r2, r2, r7
        str     r1, [r2, #0xC]
        str     r0, [r2, #8]
        ldr     r0, [r4, +r11, lsl #3]
        add     r7, r7, #0x40
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r11, lsl #4]
        add     r3, r4, r10, lsl #3
        str     r3, [sp, #8]
        add     r2, r2, r11, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [r9, #4]
        add     r9, r8, #3
        add     r8, r8, #4
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r11, r2, r11, lsl #4
        str     r1, [r11, #0xC]
        str     r0, [r11, #8]
        ldr     r0, [r4, +r10, lsl #3]
        add     r11, r4, r9, lsl #3
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r10, lsl #4]
        add     r2, r2, r10, lsl #4
        str     r1, [r2, #4]
        ldr     r2, [sp, #8]
        ldr     r0, [r2, #4]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r10, r2, r10, lsl #4
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [r4, +r9, lsl #3]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r9, lsl #4]
        add     r2, r2, r9, lsl #4
        str     r1, [r2, #4]
        ldr     r0, [r11, #4]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        ldr     r3, [sp]
        add     r9, r2, r9, lsl #4
        cmp     r8, r3
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ble     LBNX5
        ldr     r9, [sp, #4]
LBNX6:
        mov     r2, r8, lsl #3
        sub     r2, r2, #4
        add     r4, r2, r4
        mov     r6, r8, lsl #4
LBNX7:
        ldr     r0, [r4, #4]
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        str     r0, [r2, +r8, lsl #4]
        add     r2, r2, r6
        str     r1, [r2, #4]
        ldr     r0, [r4, #8]!
        add     r8, r8, #1
        bl      __fixsfdi
        ldr     r2, [r5, #0x10]
        add     r2, r2, r6
        cmp     r8, r9
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        add     r6, r6, #0x10
        blt     LBNX7
LBNX8:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBNX9:
        ldr     r0, [r5, #8]
        mov     r1, r9
        bl      _ippsZero_32fc
        ldr     r0, [r5, #0x10]
        mov     r1, r9
        bl      _ippsZero_64sc
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBNX10:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493132


