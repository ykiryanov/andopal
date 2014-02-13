        .text
        .align  4
        .globl  ownFixedCodebookACorrSign_32f


ownFixedCodebookACorrSign_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r3, [pc, #0x1BC]
        ldr     r4, [r3]
        add     r9, r1, #0x20
        add     r8, r1, #0x40
        mov     r10, r1
        mov     r11, #8
        str     r2, [sp]
        str     r1, [sp, #4]
        str     r0, [sp, #0x10]
LDLU0:
        ldr     r0, [r10], #4
        ldr     r5, [sp, #4]
        mov     r1, r4
        bl      __ltsf2
        mov     r6, r5
        cmp     r0, #0
        mov     r7, r6
        ldrlt   r5, [sp]
        ldr     r0, [r9], #4
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r6, [sp]
        ldr     r0, [r8], #4
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r7, [sp]
        add     r3, r6, #0x60
        add     r2, r5, #0x60
        str     r3, [sp, #0xC]
        add     r3, r7, #0x60
        add     r12, r7, #0x80
        str     r2, [sp, #8]
        add     r1, r5, #0x20
        add     r0, r5, #0x40
        add     r2, r6, #0x40
        mov     r7, #8
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x10]
        add     r5, r5, #0x80
        add     r6, r6, #0x80
        str     r9, [sp, #0x20]
        mov     r10, r7
        str     r8, [sp, #0x24]
        str     r4, [sp, #0x14]
        mov     r7, r5
        mov     r9, r6
        str     r12, [sp, #0x28]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
        mov     r8, r3
LDLU1:
        ldr     r0, [r11]
        ldr     r1, [r5], #4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [r11, #0x100]
        str     r1, [r11]
        ldr     r1, [r4], #4
        bl      __mulsf3
        str     r0, [r11, #0x100]
        ldr     r0, [r11, #0x200]
        ldr     r12, [sp, #8]
        ldr     r1, [r12], #4
        str     r12, [sp, #8]
        bl      __mulsf3
        ldr     r1, [r11, #0x300]
        str     r0, [r11, #0x200]
        ldr     r2, [r7], #4
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [r11, #0x400]
        str     r0, [r11, #0x300]
        ldr     r2, [r6], #4
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        str     r0, [r11, #0x400]
        ldr     r0, [r11, #0x500]
        ldr     r12, [sp, #0xC]
        ldr     r1, [r12], #4
        str     r12, [sp, #0xC]
        bl      __mulsf3
        str     r0, [r11, #0x500]
        ldr     r1, [r9], #4
        ldr     r0, [r11, #0x600]
        bl      __mulsf3
        str     r0, [r11, #0x600]
        ldr     r1, [r8], #4
        ldr     r0, [r11, #0x700]
        bl      __mulsf3
        str     r0, [r11, #0x700]
        ldr     r12, [sp, #0x28]
        ldr     r0, [r11, #0x800]
        ldr     r1, [r12], #4
        str     r12, [sp, #0x28]
        bl      __mulsf3
        str     r0, [r11, #0x800]
        subs    r10, r10, #1
        add     r11, r11, #4
        bne     LDLU1
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x1C]
        ldr     r4, [sp, #0x14]
        subs    r11, r11, #1
        bne     LDLU0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLU__2il0floatpacket.1


        .data
        .align  4


LDLU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


