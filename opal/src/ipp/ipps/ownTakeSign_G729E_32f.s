        .text
        .align  4
        .globl  ownTakeSign_G729E_32f


ownTakeSign_G729E_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r3, [pc, #0x168]
        mov     r4, r1
        ldr     r3, [r3]
        mov     r12, #0
        str     r2, [sp, #0x18]
        str     r3, [sp, #0xC]
LDGY0:
        ldr     lr, [pc, #0x154]
        add     r2, r12, #1
        add     r3, r0, r12, lsl #8
        smull   r5, lr, r2, lr
        mov     r5, r2, asr #31
        rsb     lr, r5, lr, asr #1
        mov     r6, r12, lsl #2
        add     lr, lr, lr, lsl #2
        sub     r7, r2, lr
        add     r5, r3, #4
        mov     r1, r7, lsl #2
        add     r3, r1, #0x3C
        add     r12, r1, #0x50
        add     lr, r1, #0x64
        add     r11, r1, #0x78
        add     r10, r1, #0x14
        add     r9, r1, #0x28
        add     r1, r1, #0x8C
        mov     r8, #8
        str     r1, [sp, #0x14]
        str     r11, [sp]
        str     lr, [sp, #8]
        str     r12, [sp, #4]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0x1C]
        str     r0, [sp, #0x20]
LDGY1:
        ldr     r1, [sp, #0xC]
        ldr     r0, [r4, +r6]
        mov     r11, r4
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r11, [sp, #0x18]
        ldr     r0, [r5, #-4]
        ldr     r1, [r11, +r7, lsl #2]
        add     r6, r6, #0x14
        bl      __mulsf3
        ldr     r1, [r5]
        str     r0, [r5, #-4]
        ldr     r2, [r10, +r11]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [r5, #4]
        str     r0, [r5]
        ldr     r2, [r9, +r11]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        ldr     r1, [r5, #8]
        str     r0, [r5, #4]
        ldr     r2, [sp, #0x10]
        mov     r0, r1
        ldr     r2, [r2, +r11]
        mov     r1, r2
        bl      __mulsf3
        str     r0, [r5, #8]
        ldr     r0, [sp, #4]
        ldr     r1, [r0, +r11]
        ldr     r0, [r5, #0xC]
        bl      __mulsf3
        str     r0, [r5, #0xC]
        ldr     r0, [sp, #8]
        ldr     r1, [r0, +r11]
        ldr     r0, [r5, #0x10]
        bl      __mulsf3
        str     r0, [r5, #0x10]
        ldr     r0, [sp]
        ldr     r1, [r0, +r11]
        ldr     r0, [r5, #0x14]
        bl      __mulsf3
        str     r0, [r5, #0x14]
        ldr     r0, [sp, #0x14]
        ldr     r1, [r0, +r11]
        ldr     r0, [r5, #0x18]
        bl      __mulsf3
        str     r0, [r5, #0x18]
        subs    r8, r8, #1
        add     r5, r5, #0x20
        bne     LDGY1
        ldr     r2, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        cmp     r2, #5
        mov     r12, r2
        blt     LDGY0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   LDGY__2il0floatpacket.1
        .long   0x66666667


        .data
        .align  4


LDGY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


