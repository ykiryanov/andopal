        .text
        .align  4
        .globl  _ipps_rDftFwd_Dir_32f


_ipps_rDftFwd_Dir_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r9, r0
        ldr     r4, [r9]
        ldr     r5, [sp, #0x58]
        mov     r7, r2
        tst     r7, #1
        mov     r6, r1
        str     r3, [sp, #0x30]
        beq     LCLR5
        add     r3, r7, #1
        mov     r8, r4
        mov     r2, r3, asr #1
        cmp     r2, #1
        ble     LCLR1
        mov     r1, r5
        mov     r0, #1
        add     r11, r5, #4
        add     r10, r9, r7, lsl #2
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x20]
        add     r9, r9, #4
        str     r2, [sp, #0x18]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x28]
        mov     r4, r0
        mov     r5, r1
LCLR0:
        ldr     r0, [r9]
        rsb     r6, r4, #0
        ldr     r1, [r10, +r6, lsl #2]
        add     r4, r4, #1
        bl      __addsf3
        mov     r7, r0
        mov     r1, r8
        bl      __addsf3
        str     r7, [r5], #8
        ldr     r1, [r10, +r6, lsl #2]
        mov     r8, r0
        ldr     r0, [r9], #4
        bl      __subsf3
        str     r0, [r11], #8
        ldr     r2, [sp, #0x18]
        cmp     r4, r2
        blt     LCLR0
        ldr     r2, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCLR1:
        cmp     r2, #1
        str     r8, [r6]
        ble     LCLR13
        ldr     r3, [pc, #0x33C]
        mov     lr, #1
        add     r0, r6, #8
        ldr     r12, [r3]
        sub     r3, r6, #4
        add     r6, r5, #4
        add     r3, r3, #8
        sub     r1, r7, #1
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x24]
LCLR2:
        cmp     r1, #0
        mov     r6, r12
        mov     r7, r4
        mov     r11, lr
        ble     LCLR4
        mov     r9, r5
        ldr     r8, [sp, #0x10]
        str     r5, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        mov     r10, #0
        str     r0, [sp, #8]
        str     r3, [sp, #0xC]
        str     r1, [sp]
        str     r12, [sp, #0x14]
        str     lr, [sp, #4]
        str     r2, [sp, #0x18]
        str     r4, [sp, #0x1C]
LCLR3:
        ldr     r2, [sp, #0x30]
        ldr     r0, [r9], #8
        ldr     r1, [r2, +r11, lsl #3]
        add     r4, r2, r11, lsl #3
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r8], #8
        ldr     r4, [r4, #4]
        mov     r7, r0
        mov     r0, r1
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r6, r0
        add     r11, r2, r11
        cmp     r11, r5
        subge   r11, r11, r5
        ldr     r2, [sp]
        add     r10, r10, #2
        cmp     r10, r2
        blt     LCLR3
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp]
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #4]
        ldr     r2, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
LCLR4:
        str     r7, [r3], #8
        add     lr, lr, #1
        str     r6, [r0], #8
        cmp     lr, r2
        blt     LCLR2
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCLR5:
        mov     r8, r7, asr #1
        ldr     r11, [r9, +r8, lsl #2]
        mov     r0, r4
        mov     r10, r4
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x2C]
        cmp     r8, #1
        ble     LCLR7
        add     r2, r9, r7, lsl #2
        add     r12, r5, #4
        mov     r1, r5
        mov     r3, #1
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x28]
        add     r9, r9, #4
        str     r12, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r8, [sp]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
        mov     r7, r3
LCLR6:
        ldr     r0, [r9]
        rsb     r8, r7, #0
        ldr     r1, [r6, +r8, lsl #2]
        add     r7, r7, #1
        bl      __addsf3
        mov     r11, r0
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        str     r11, [r5], #8
        ldr     r1, [r9], #4
        ldr     r8, [r6, +r8, lsl #2]
        mov     r10, r0
        mov     r0, r1
        mov     r1, r8
        bl      __subsf3
        ldr     r12, [sp, #0x14]
        str     r0, [r12]
        ldr     r12, [sp]
        cmp     r7, r12
        ldr     r12, [sp, #0x14]
        add     r12, r12, #8
        str     r12, [sp, #0x14]
        blt     LCLR6
        mov     r0, r4
        ldr     r11, [sp, #0x18]
        ldr     r8, [sp]
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LCLR7:
        tst     r8, #1
        str     r0, [r6]
        beq     LCLR8
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        b       LCLR9
LCLR8:
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
LCLR9:
        cmp     r8, #1
        str     r0, [r6, #4]
        ble     LCLR13
        ldr     r3, [pc, #0x114]
        mov     r0, r4
        mov     r1, r11
        ldr     r9, [r3]
        bl      __subsf3
        str     r0, [sp, #0xC]
        mov     r2, #1
        sub     lr, r7, #2
        add     r12, r5, #4
        add     r3, r6, #8
        add     r1, r6, #0xC
        str     r7, [sp, #0x24]
        mov     r0, r5
LCLR10:
        tst     r2, #1
        ldreq   r4, [sp, #0x2C]
        ldrne   r4, [sp, #0xC]
        cmp     lr, #0
        mov     r5, r9
        mov     r11, r2
        ble     LCLR12
        mov     r6, r0
        mov     r7, r12
        str     r9, [sp, #4]
        ldr     r9, [sp, #0x24]
        mov     r10, #0
        str     r1, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r12, [sp, #8]
        str     lr, [sp, #0x1C]
        str     r2, [sp, #0x18]
        str     r8, [sp]
        str     r0, [sp, #0x20]
LCLR11:
        ldr     r2, [sp, #0x30]
        ldr     r0, [r6], #8
        ldr     r1, [r2, +r11, lsl #3]
        add     r8, r2, r11, lsl #3
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r7], #8
        ldr     r8, [r8, #4]
        mov     r4, r0
        mov     r0, r1
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r5, r0
        add     r11, r2, r11
        cmp     r11, r9
        subge   r11, r11, r9
        ldr     r2, [sp, #0x1C]
        add     r10, r10, #2
        cmp     r10, r2
        blt     LCLR11
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0x1C]
        ldr     r9, [sp, #4]
        ldr     r2, [sp, #0x18]
        ldr     r8, [sp]
        ldr     r0, [sp, #0x20]
LCLR12:
        str     r4, [r3], #8
        add     r2, r2, #1
        str     r5, [r1], #8
        cmp     r2, r8
        blt     LCLR10
LCLR13:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLR__2il0floatpacket.1


        .data
        .align  4


LCLR__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


