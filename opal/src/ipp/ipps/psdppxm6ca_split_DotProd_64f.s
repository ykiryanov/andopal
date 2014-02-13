        .text
        .align  4
        .globl  DotProd_64f


DotProd_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r5, r2
        cmp     r5, #0
        mov     r4, r3
        mov     r9, #0
        movle   r11, r9
        movle   r10, r11
        ble     LCFS3
        cmp     r5, #6
        movlt   r11, r9
        movlt   r10, r11
        blt     LCFS1
        mov     r11, r9
        mov     r10, r11
        sub     r8, r5, #6
        sub     r7, r1, #4
        sub     r6, r0, #4
        str     r1, [sp, #4]
        str     r0, [sp]
LCFS0:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r2, [r7, #0x14]
        ldr     r0, [r6, #0x14]
        ldr     r1, [r6, #0x18]
        ldr     r3, [r7, #0x18]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [r6, #0x1C]
        ldr     r1, [r6, #0x20]
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [r6, #0x24]
        ldr     r1, [r6, #0x28]!
        ldr     r2, [r7, #0x24]
        ldr     r3, [r7, #0x28]!
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        add     r9, r9, #5
        cmp     r9, r8
        mov     r11, r0
        mov     r10, r1
        ble     LCFS0
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCFS1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r6, r12, r1
        add     r7, r12, r0
LCFS2:
        ldr     r0, [r7, #4]
        ldr     r1, [r7, #8]!
        ldr     r2, [r6, #4]
        ldr     r3, [r6, #8]!
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r9, r9, #1
        cmp     r9, r5
        mov     r11, r0
        mov     r10, r1
        blt     LCFS2
LCFS3:
        str     r11, [r4]
        str     r10, [r4, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


