        .text
        .align  4
        .globl  ownFixedCodebookCorrSign_32f


ownFixedCodebookCorrSign_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r4, r0
        add     r2, r1, #0x20
        add     r3, r1, #0x40
        add     r5, r1, #0x80
        add     r0, r1, #0x60
        mov     r12, r2
        mov     lr, r3
        mov     r11, #8
        str     r5, [sp]
        str     r4, [sp, #8]
LDLR0:
        ldr     r4, [r1], #4
        ldr     r5, [r12], #4
        ldr     r6, [lr], #4
        ldr     r7, [sp]
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #8]
        str     r2, [sp, #4]
        mov     r10, r3
        mov     r9, r0
        mov     r8, #8
        str     r1, [sp, #0x24]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x1C]
        str     r0, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0xC]
LDLR1:
        ldr     r2, [sp, #4]
        mov     r0, r4
        ldr     r1, [r2], #4
        str     r2, [sp, #4]
        bl      __mulsf3
        ldr     r1, [r10]
        str     r0, [sp, #0x28]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r9]
        str     r0, [sp, #0x2C]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r7]
        str     r0, [sp, #0x30]
        mov     r0, r4
        bl      __mulsf3
        ldr     r2, [r11]
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #0x100]
        str     r0, [r11]
        ldr     r1, [sp, #0x2C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r11, #0x200]
        str     r0, [r11, #0x100]
        mov     r0, r1
        ldr     r1, [sp, #0x30]
        bl      __mulsf3
        ldr     r1, [r11, #0x300]
        str     r0, [r11, #0x200]
        mov     r0, r1
        ldr     r1, [sp, #0x34]
        bl      __mulsf3
        str     r0, [r11, #0x300]
        ldr     r1, [r10], #4
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [r9]
        str     r0, [sp, #0x34]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [r7]
        str     r0, [sp, #0x30]
        mov     r0, r5
        bl      __mulsf3
        ldr     r2, [r11, #0x400]
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x2C]
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #0x500]
        str     r0, [r11, #0x400]
        ldr     r1, [sp, #0x30]
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #0x600]
        str     r0, [r11, #0x500]
        ldr     r1, [sp, #0x2C]
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r11, #0x600]
        ldr     r1, [r9], #4
        mov     r0, r6
        bl      __mulsf3
        str     r0, [sp, #0x34]
        ldr     r1, [r7], #4
        mov     r0, r6
        bl      __mulsf3
        str     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [r11, #0x700]
        bl      __mulsf3
        str     r0, [r11, #0x700]
        ldr     r1, [sp, #0x30]
        ldr     r0, [r11, #0x800]
        bl      __mulsf3
        str     r0, [r11, #0x800]
        subs    r8, r8, #1
        add     r11, r11, #4
        bne     LDLR1
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x18]
        ldr     r1, [sp, #0x24]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x1C]
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        subs    r11, r11, #1
        bne     LDLR0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


