        .text
        .align  4
        .globl  _ippsThreshold_64f_I


_ippsThreshold_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x30]
        cmp     r0, #0
        mov     r7, r1
        mov     r5, r2
        mov     r4, r3
        beq     LARK7
        cmp     r7, #0
        ble     LARK8
        cmp     r12, #4
        mov     r6, #0
        beq     LARK3
        cmp     r7, #6
        blt     LARK1
        sub     r12, r7, #6
        sub     r9, r0, #4
        str     r12, [sp]
        str     r7, [sp, #4]
        str     r0, [sp, #8]
LARK0:
        ldr     r7, [r9, #4]
        ldr     r8, [r9, #8]
        mov     r0, r5
        mov     r1, r4
        mov     r2, r7
        mov     r3, r8
        bl      __gtdf2
        ldr     r10, [r9, #0xC]
        ldr     r11, [r9, #0x10]
        cmp     r0, #0
        movgt   r7, r5
        movgt   r8, r4
        str     r8, [r9, #8]
        str     r7, [r9, #4]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r4
        mov     r0, r5
        bl      __gtdf2
        ldr     r8, [r9, #0x18]
        ldr     r7, [r9, #0x14]
        cmp     r0, #0
        movgt   r11, r4
        movgt   r10, r5
        str     r11, [r9, #0x10]
        str     r10, [r9, #0xC]
        mov     r3, r8
        mov     r2, r7
        mov     r0, r5
        mov     r1, r4
        bl      __gtdf2
        ldr     r11, [r9, #0x20]
        ldr     r10, [r9, #0x1C]
        cmp     r0, #0
        movgt   r8, r4
        movgt   r7, r5
        str     r7, [r9, #0x14]
        str     r8, [r9, #0x18]
        mov     r3, r11
        mov     r2, r10
        mov     r0, r5
        mov     r1, r4
        bl      __gtdf2
        ldr     r7, [r9, #0x24]
        ldr     r8, [r9, #0x28]
        cmp     r0, #0
        movgt   r11, r4
        movgt   r10, r5
        str     r10, [r9, #0x1C]
        str     r11, [r9, #0x20]
        mov     r2, r7
        mov     r3, r8
        mov     r0, r5
        mov     r1, r4
        bl      __gtdf2
        cmp     r0, #0
        movgt   r7, r5
        movgt   r8, r4
        str     r7, [r9, #0x24]
        str     r8, [r9, #0x28]!
        ldr     r12, [sp]
        add     r6, r6, #5
        cmp     r6, r12
        ble     LARK0
        ldr     r7, [sp, #4]
        ldr     r0, [sp, #8]
LARK1:
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r0
LARK2:
        ldr     r9, [r10, #4]
        ldr     r8, [r10, #8]
        mov     r0, r5
        mov     r2, r9
        mov     r1, r4
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        movgt   r9, r5
        movgt   r8, r4
        add     r6, r6, #1
        str     r9, [r10, #4]
        str     r8, [r10, #8]!
        cmp     r6, r7
        blt     LARK2
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARK3:
        cmp     r7, #6
        blt     LARK5
        sub     r12, r7, #6
        sub     r9, r0, #4
        str     r12, [sp]
        str     r7, [sp, #4]
        str     r0, [sp, #8]
LARK4:
        ldr     r7, [r9, #4]
        ldr     r8, [r9, #8]
        mov     r0, r5
        mov     r1, r4
        mov     r2, r7
        mov     r3, r8
        bl      __ltdf2
        ldr     r10, [r9, #0xC]
        ldr     r11, [r9, #0x10]
        cmp     r0, #0
        movlt   r7, r5
        movlt   r8, r4
        str     r8, [r9, #8]
        str     r7, [r9, #4]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r4
        mov     r0, r5
        bl      __ltdf2
        ldr     r8, [r9, #0x18]
        ldr     r7, [r9, #0x14]
        cmp     r0, #0
        movlt   r11, r4
        movlt   r10, r5
        str     r11, [r9, #0x10]
        str     r10, [r9, #0xC]
        mov     r3, r8
        mov     r2, r7
        mov     r0, r5
        mov     r1, r4
        bl      __ltdf2
        ldr     r11, [r9, #0x20]
        ldr     r10, [r9, #0x1C]
        cmp     r0, #0
        movlt   r8, r4
        movlt   r7, r5
        str     r7, [r9, #0x14]
        str     r8, [r9, #0x18]
        mov     r3, r11
        mov     r2, r10
        mov     r0, r5
        mov     r1, r4
        bl      __ltdf2
        ldr     r7, [r9, #0x24]
        ldr     r8, [r9, #0x28]
        cmp     r0, #0
        movlt   r11, r4
        movlt   r10, r5
        str     r10, [r9, #0x1C]
        str     r11, [r9, #0x20]
        mov     r2, r7
        mov     r3, r8
        mov     r0, r5
        mov     r1, r4
        bl      __ltdf2
        cmp     r0, #0
        movlt   r7, r5
        movlt   r8, r4
        str     r7, [r9, #0x24]
        str     r8, [r9, #0x28]!
        ldr     r12, [sp]
        add     r6, r6, #5
        cmp     r6, r12
        ble     LARK4
        ldr     r7, [sp, #4]
        ldr     r0, [sp, #8]
LARK5:
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r0
LARK6:
        ldr     r8, [r10, #4]
        ldr     r9, [r10, #8]
        mov     r0, r5
        mov     r2, r8
        mov     r1, r4
        mov     r3, r9
        bl      __ltdf2
        cmp     r0, #0
        movlt   r8, r5
        movlt   r9, r4
        add     r6, r6, #1
        str     r8, [r10, #4]
        str     r9, [r10, #8]!
        cmp     r6, r7
        blt     LARK6
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARK7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LARK8:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


