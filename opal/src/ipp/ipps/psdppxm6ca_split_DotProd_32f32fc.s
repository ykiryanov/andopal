        .text
        .align  4
        .globl  DotProd_32f32fc


DotProd_32f32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [pc, #0x1BC]
        mov     r11, r2
        mov     r8, r0
        ldr     r5, [r12]
        cmp     r11, #0
        mov     r7, r1
        mov     r4, r3
        mov     r6, r5
        ble     LCFU3
        cmp     r11, #5
        mov     r10, #0
        blt     LCFU1
        sub     r12, r11, #5
        mov     lr, r8
        sub     r9, r7, #0x1C
        str     lr, [sp, #0xC]
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
LCFU0:
        ldr     r2, [sp, #0xC]
        add     r4, r10, #2
        ldr     r11, [r2], #0x10
        str     r2, [sp, #0xC]
        ldr     r1, [r9, #0x1C]
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x10]
        ldr     r1, [r9, #0x20]!
        mov     r0, r11
        add     r2, r7, r4, lsl #3
        str     r2, [sp, #0x14]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        str     r0, [sp, #0x18]
        add     r2, r10, #1
        ldr     r6, [r8, +r2, lsl #2]
        ldr     r1, [r7, +r2, lsl #3]
        add     r5, r7, r2, lsl #3
        mov     r0, r6
        add     r11, r10, #3
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        ldr     r1, [r5, #4]
        mov     r5, r0
        add     r2, r7, r11, lsl #3
        str     r2, [sp, #0x10]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [r7, +r4, lsl #3]
        ldr     r4, [r8, +r4, lsl #2]
        mov     r6, r0
        add     r10, r10, #4
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        mov     r5, r0
        mov     r0, r4
        ldr     r1, [r2, #4]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r7, +r11, lsl #3]
        ldr     r4, [r8, +r11, lsl #2]
        mov     r6, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x10]
        mov     r5, r0
        mov     r0, r4
        ldr     r1, [r2, #4]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #8]
        mov     r6, r0
        cmp     r10, r2
        ble     LCFU0
        ldr     r4, [sp, #4]
        ldr     r11, [sp]
LCFU1:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r7
        add     r9, r8, r10, lsl #2
LCFU2:
        ldr     r1, [r7, #4]
        ldr     r8, [r9], #4
        add     r10, r10, #1
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r7, #8]!
        mov     r5, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        cmp     r10, r11
        mov     r6, r0
        blt     LCFU2
LCFU3:
        str     r5, [r4]
        str     r6, [r4, #4]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCFU__2il0floatpacket.1


        .data
        .align  4


LCFU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


