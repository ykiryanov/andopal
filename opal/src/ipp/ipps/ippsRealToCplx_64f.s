        .text
        .align  4
        .globl  _ippsRealToCplx_64f


_ippsRealToCplx_64f:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r2, #0
        beq     LCUW11
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r1, #0
        mov     r6, #0
        beq     LCUW7
        cmp     r0, #0
        beq     LCUW3
        cmp     r3, #5
        blt     LCUW1
        sub     r5, r3, #5
        sub     r4, r2, #0x34
        sub     lr, r1, #0x1C
        sub     r12, r0, #0x1C
LCUW0:
        ldr     r8, [r12, #0x20]
        ldr     r7, [r12, #0x1C]
        add     r12, r12, #0x20
        str     r8, [r4, #0x38]
        str     r7, [r4, #0x34]
        ldr     r8, [lr, #0x20]
        ldr     r7, [lr, #0x1C]
        add     lr, lr, #0x20
        str     r8, [r4, #0x40]
        str     r7, [r4, #0x3C]
        add     r7, r6, #1
        ldr     r8, [r0, +r7, lsl #3]
        add     r9, r0, r7, lsl #3
        ldr     r9, [r9, #4]
        str     r8, [r2, +r7, lsl #4]
        add     r8, r2, r7, lsl #4
        str     r9, [r8, #4]
        add     r10, r1, r7, lsl #3
        ldr     r9, [r1, +r7, lsl #3]
        ldr     r10, [r10, #4]
        add     r7, r6, #2
        str     r9, [r8, #8]
        add     r9, r0, r7, lsl #3
        str     r10, [r8, #0xC]
        ldr     r8, [r0, +r7, lsl #3]
        ldr     r9, [r9, #4]
        add     r4, r4, #0x40
        str     r8, [r2, +r7, lsl #4]
        add     r8, r2, r7, lsl #4
        str     r9, [r8, #4]
        add     r10, r1, r7, lsl #3
        ldr     r9, [r1, +r7, lsl #3]
        ldr     r10, [r10, #4]
        add     r7, r6, #3
        str     r9, [r8, #8]
        add     r9, r0, r7, lsl #3
        str     r10, [r8, #0xC]
        ldr     r8, [r0, +r7, lsl #3]
        ldr     r9, [r9, #4]
        add     r6, r6, #4
        str     r8, [r2, +r7, lsl #4]
        add     r8, r2, r7, lsl #4
        str     r9, [r8, #4]
        add     r9, r1, r7, lsl #3
        ldr     r7, [r1, +r7, lsl #3]
        ldr     r9, [r9, #4]
        cmp     r6, r5
        str     r7, [r8, #8]
        str     r9, [r8, #0xC]
        ble     LCUW0
LCUW1:
        mov     r12, r6, lsl #3
        mov     lr, r6, lsl #4
        sub     r12, r12, #4
        sub     lr, lr, #4
        add     r2, lr, r2
        add     r1, r12, r1
        add     r0, r12, r0
LCUW2:
        ldr     lr, [r0, #4]
        ldr     r12, [r0, #8]!
        str     lr, [r2, #4]
        add     r6, r6, #1
        str     r12, [r2, #8]
        ldr     lr, [r1, #4]
        ldr     r12, [r1, #8]!
        cmp     r6, r3
        str     lr, [r2, #0xC]
        str     r12, [r2, #0x10]!
        blt     LCUW2
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUW3:
        cmp     r3, #6
        movlt   r5, r6
        blt     LCUW5
        mov     r5, r6
        sub     r4, r3, #6
        mov     lr, r5
        sub     r12, r2, #0x44
        sub     r0, r1, #0x24
LCUW4:
        str     lr, [r12, #0x44]
        str     lr, [r12, #0x48]
        ldr     r8, [r0, #0x24]
        ldr     r7, [r0, #0x28]!
        str     r8, [r12, #0x4C]
        add     r8, r5, #1
        str     r7, [r12, #0x50]!
        str     lr, [r2, +r8, lsl #4]
        add     r7, r2, r8, lsl #4
        str     lr, [r7, #4]
        add     r9, r1, r8, lsl #3
        ldr     r8, [r1, +r8, lsl #3]
        ldr     r9, [r9, #4]
        str     r8, [r7, #8]
        add     r8, r5, #2
        str     r9, [r7, #0xC]
        str     lr, [r2, +r8, lsl #4]
        add     r7, r2, r8, lsl #4
        str     lr, [r7, #4]
        add     r9, r1, r8, lsl #3
        ldr     r8, [r1, +r8, lsl #3]
        ldr     r9, [r9, #4]
        str     r8, [r7, #8]
        add     r8, r5, #3
        str     r9, [r7, #0xC]
        str     lr, [r2, +r8, lsl #4]
        add     r7, r2, r8, lsl #4
        str     lr, [r7, #4]
        add     r9, r1, r8, lsl #3
        ldr     r8, [r1, +r8, lsl #3]
        ldr     r9, [r9, #4]
        str     r8, [r7, #8]
        add     r8, r5, #4
        add     r5, r5, #5
        str     r9, [r7, #0xC]
        str     lr, [r2, +r8, lsl #4]
        add     r7, r2, r8, lsl #4
        str     lr, [r7, #4]
        add     r9, r1, r8, lsl #3
        ldr     r8, [r1, +r8, lsl #3]
        ldr     r9, [r9, #4]
        cmp     r5, r4
        str     r8, [r7, #8]
        str     r9, [r7, #0xC]
        ble     LCUW4
LCUW5:
        mov     r0, r5, lsl #4
        mov     r12, r5, lsl #3
        sub     r0, r0, #4
        sub     r12, r12, #4
        add     r2, r0, r2
        add     r1, r12, r1
LCUW6:
        str     r6, [r2, #4]
        str     r6, [r2, #8]
        ldr     r12, [r1, #4]
        ldr     r0, [r1, #8]!
        add     r5, r5, #1
        str     r12, [r2, #0xC]
        cmp     r5, r3
        str     r0, [r2, #0x10]!
        blt     LCUW6
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUW7:
        cmp     r0, #0
        beq     LCUW11
        cmp     r3, #6
        movlt   r5, r6
        blt     LCUW9
        mov     r5, r6
        sub     r4, r3, #6
        mov     lr, r5
        sub     r12, r2, #0x44
        sub     r1, r0, #0x24
LCUW8:
        ldr     r7, [r1, #0x24]
        ldr     r8, [r1, #0x28]!
        str     lr, [r12, #0x4C]
        str     r7, [r12, #0x44]
        str     lr, [r12, #0x50]
        str     r8, [r12, #0x48]
        add     r9, r5, #1
        ldr     r8, [r0, +r9, lsl #3]
        add     r7, r0, r9, lsl #3
        ldr     r7, [r7, #4]
        str     r8, [r2, +r9, lsl #4]
        add     r9, r2, r9, lsl #4
        str     r7, [r9, #4]
        str     lr, [r9, #8]
        str     lr, [r9, #0xC]
        add     r9, r5, #2
        ldr     r8, [r0, +r9, lsl #3]
        add     r7, r0, r9, lsl #3
        ldr     r7, [r7, #4]
        str     r8, [r2, +r9, lsl #4]
        add     r9, r2, r9, lsl #4
        str     r7, [r9, #4]
        str     lr, [r9, #8]
        str     lr, [r9, #0xC]
        add     r9, r5, #3
        ldr     r8, [r0, +r9, lsl #3]
        add     r7, r0, r9, lsl #3
        ldr     r7, [r7, #4]
        str     r8, [r2, +r9, lsl #4]
        add     r9, r2, r9, lsl #4
        str     r7, [r9, #4]
        str     lr, [r9, #8]
        str     lr, [r9, #0xC]
        add     r9, r5, #4
        ldr     r8, [r0, +r9, lsl #3]
        add     r7, r0, r9, lsl #3
        ldr     r7, [r7, #4]
        str     r8, [r2, +r9, lsl #4]
        add     r9, r2, r9, lsl #4
        add     r5, r5, #5
        cmp     r5, r4
        add     r12, r12, #0x50
        str     r7, [r9, #4]
        str     lr, [r9, #8]
        str     lr, [r9, #0xC]
        ble     LCUW8
LCUW9:
        mov     r1, r5, lsl #4
        mov     r12, r5, lsl #3
        sub     r1, r1, #4
        sub     r12, r12, #4
        add     r2, r1, r2
        add     r0, r12, r0
LCUW10:
        ldr     r1, [r0, #4]
        ldr     r12, [r0, #8]!
        add     r5, r5, #1
        str     r1, [r2, #4]
        str     r6, [r2, #0xC]
        str     r12, [r2, #8]
        str     r6, [r2, #0x10]!
        cmp     r5, r3
        blt     LCUW10
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCUW11:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


