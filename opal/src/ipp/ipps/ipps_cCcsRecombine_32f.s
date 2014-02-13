        .text
        .align  4
        .globl  _ipps_cCcsRecombine_32f


_ipps_cCcsRecombine_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [sp, #0x5C]
        mov     r4, r2
        cmp     r4, #1
        mov     r6, r0
        mov     r5, r1
        beq     LBYP2
        cmp     r3, #0
        mov     r3, r4, lsl #1
        sub     r7, r3, #2
        mov     r3, #2
        ble     LBYP3
        cmp     r4, #2
        ble     LBYP1
        add     lr, r5, #4
        add     r8, r6, #4
        add     r11, r12, #8
        add     r9, r8, r7, lsl #2
        add     lr, lr, r7, lsl #2
        add     r10, r6, r7, lsl #2
        add     r1, r6, #8
        add     r0, r6, #0xC
        add     r12, r12, #0xC
        add     r2, r5, #0xC
        add     r7, r5, r7, lsl #2
        add     r8, r5, #8
        str     r2, [sp, #0x10]
        str     r12, [sp, #8]
        str     r11, [sp, #4]
        str     r0, [sp]
        str     r1, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r6, [sp, #0x2C]
LBYP0:
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     r4, [r0]
        ldr     r11, [r2], #8
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x18]
        mov     r1, r4
        mov     r0, r11
        sub     r2, r2, #8
        str     r2, [sp, #0x18]
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        mov     r5, r0
        ldr     r9, [r2]
        ldr     r2, [sp]
        ldr     r10, [r2]
        ldr     r2, [sp]
        mov     r1, r9
        add     r2, r2, #8
        str     r2, [sp]
        mov     r0, r10
        bl      __addsf3
        mov     r6, r0
        mov     r1, r4
        mov     r0, r11
        bl      __addsf3
        mov     r4, r0
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r10, [r1]
        ldr     r11, [r2]
        str     r0, [sp, #0x30]
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        str     r0, [sp, #0x34]
        mov     r0, r6
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r9
        bl      __subsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r9
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r9, r0
        mov     r0, r5
        bl      __subsf3
        str     r6, [r8], #8
        ldr     r1, [sp, #0x10]
        str     r9, [r1]
        str     r4, [r7], #-8
        ldr     r1, [sp, #0xC]
        sub     r1, r1, #8
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #4]
        add     r1, r1, #8
        str     r1, [sp, #4]
        ldr     r1, [sp, #8]
        add     r1, r1, #8
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x20]
        str     r0, [r1], #-8
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x20]
        add     r0, r0, #2
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x24]
        cmp     r1, r0
        blt     LBYP0
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
LBYP1:
        ldr     r12, [pc, #0x260]
        ldr     r0, [r6, +r4, lsl #2]
        mov     r3, r4, lsl #2
        ldr     r7, [r12]
        add     r8, r3, #4
        mov     r1, r7
        bl      __mulsf3
        str     r0, [r5, +r4, lsl #2]
        ldr     r0, [r8, +r6]
        mov     r1, r7
        bl      __mulsf3
        str     r0, [r8, +r5]
LBYP2:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBYP3:
        cmp     r4, #2
        ble     LBYP5
        add     lr, r5, #4
        add     r8, r6, #4
        add     lr, lr, r7, lsl #2
        add     r9, r6, r7, lsl #2
        add     r10, r5, r7, lsl #2
        add     r8, r8, r7, lsl #2
        add     r11, r12, #8
        add     r7, r12, #0xC
        add     r1, r6, #8
        add     r0, r6, #0xC
        add     r12, r5, #8
        add     r2, r5, #0xC
        str     r2, [sp, #0x10]
        str     r12, [sp, #4]
        str     r11, [sp, #8]
        str     r0, [sp]
        str     r1, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r10, [sp, #0xC]
        str     r9, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r6, [sp, #0x2C]
LBYP4:
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        ldr     r11, [r2], #8
        ldr     r6, [r1]
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x18]
        mov     r0, r11
        mov     r1, r6
        sub     r2, r2, #8
        str     r2, [sp, #0x18]
        bl      __subsf3
        ldr     r2, [sp]
        ldr     r10, [r8], #-8
        mov     r4, r0
        ldr     r9, [r2]
        ldr     r2, [sp]
        mov     r1, r10
        add     r2, r2, #8
        str     r2, [sp]
        mov     r0, r9
        bl      __addsf3
        mov     r5, r0
        mov     r1, r6
        mov     r0, r11
        bl      __addsf3
        mov     r6, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #8]
        ldr     r11, [r7], #8
        ldr     r10, [r1]
        str     r0, [sp, #0x34]
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        str     r0, [sp, #0x30]
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        mov     r1, r9
        mov     r0, r6
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r9
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r6, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #4]
        str     r5, [r1]
        ldr     r1, [sp, #0x10]
        str     r6, [r1]
        ldr     r1, [sp, #0xC]
        str     r9, [r1]
        ldr     r1, [sp, #8]
        add     r1, r1, #8
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x20]
        str     r0, [r1], #-8
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x20]
        add     r0, r0, #2
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        sub     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x14]
        cmp     r0, r1
        blt     LBYP4
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
LBYP5:
        ldr     r12, [pc, #0x30]
        ldr     r0, [r6, +r4, lsl #2]
        mov     r3, r4, lsl #2
        ldr     r1, [r12]
        add     r7, r3, #4
        bl      __mulsf3
        ldr     r3, [pc, #0x1C]
        str     r0, [r5, +r4, lsl #2]
        ldr     r0, [r7, +r6]
        ldr     r1, [r3]
        bl      __mulsf3
        str     r0, [r7, +r5]
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LBYP__2il0floatpacket.1
        .long   LBYP__2il0floatpacket.2


        .data
        .align  4


LBYP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x40
LBYP__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC0


