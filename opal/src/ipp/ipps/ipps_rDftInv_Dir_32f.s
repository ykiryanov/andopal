        .text
        .align  4
        .globl  _ipps_rDftInv_Dir_32f


_ipps_rDftInv_Dir_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r10, r0
        ldr     r11, [r10]
        ldr     r7, [sp, #0x6C]
        mov     r5, r2
        tst     r5, #1
        mov     r4, r1
        str     r3, [sp, #0x40]
        beq     LCLQ7
        add     r3, r5, #1
        mov     r1, r11
        mov     r0, r3, asr #1
        cmp     r0, #1
        ble     LCLQ3
        ldr     r12, [pc, #0x780]
        sub     r3, r0, #1
        cmp     r3, #4
        mov     r3, #0
        mov     r8, #1
        blt     LCLQ18
        ldr     r6, [r12]
        add     lr, r7, #8
        str     lr, [sp, #8]
        add     lr, r7, #0xC
        add     r9, r7, #4
        str     lr, [sp, #0xC]
        sub     r2, r10, #4
        add     lr, r2, #8
        str     r9, [sp, #0x3C]
        str     r7, [sp, #0x20]
        ldr     r9, [sp, #0xC]
        ldr     r7, [sp, #8]
        str     lr, [sp, #0x10]
        sub     r12, r0, #4
        add     lr, r10, #8
        str     r11, [sp, #0x1C]
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     r12, [sp, #0x38]
        str     r3, [sp, #0x34]
        str     r0, [sp, #0x14]
        mov     r11, r1
        mov     r4, r2
        mov     r5, lr
LCLQ0:
        ldr     r3, [sp, #0x10]
        mov     r1, r6
        ldr     r0, [r3], #0x18
        str     r3, [sp, #0x10]
        bl      __mulsf3
        str     r0, [sp, #0x30]
        mov     r1, r11
        bl      __addsf3
        ldr     r3, [sp, #0x30]
        add     r11, r8, #1
        str     r3, [r7, #-8]
        ldr     r2, [r5], #0x18
        str     r0, [sp, #0x30]
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, #-8]
        ldr     r0, [r4, +r11, lsl #3]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x2C]
        bl      __addsf3
        ldr     r3, [sp, #0x2C]
        mov     r1, r6
        str     r3, [r7]
        ldr     r11, [r10, +r11, lsl #3]
        str     r0, [sp, #0x30]
        mov     r0, r11
        bl      __mulsf3
        str     r0, [r9]
        add     r3, r8, #2
        str     r3, [sp, #0x2C]
        ldr     r0, [r4, +r3, lsl #3]
        mov     r1, r6
        add     r8, r8, #3
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        mov     r11, r0
        bl      __addsf3
        str     r11, [r7, #8]
        ldr     r3, [sp, #0x2C]
        mov     r11, r0
        mov     r1, r6
        ldr     r2, [r10, +r3, lsl #3]
        add     r7, r7, #0x18
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, #8]
        ldr     r3, [sp, #0x38]
        add     r9, r9, #0x18
        cmp     r8, r3
        ldr     r3, [sp, #0x34]
        add     r3, r3, #6
        str     r3, [sp, #0x34]
        ble     LCLQ0
        mov     r2, r4
        mov     r1, r11
        ldr     r9, [sp, #0x3C]
        ldr     r3, [sp, #0x34]
        ldr     r0, [sp, #0x14]
        ldr     r11, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r4, [sp, #0x28]
LCLQ1:
        add     r12, r7, r3, lsl #2
        str     r11, [sp, #0x1C]
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x28]
        add     r10, r10, r8, lsl #3
        str     r2, [sp, #0x18]
        str     r0, [sp, #0x14]
        str     r7, [sp, #0x20]
        mov     r11, r1
        mov     r4, r3
        mov     r5, r12
LCLQ2:
        ldr     r2, [sp, #0x18]
        mov     r1, r6
        ldr     r0, [r2, +r8, lsl #3]
        add     r8, r8, #1
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r11
        bl      __addsf3
        str     r7, [r5], #8
        ldr     r2, [r10], #8
        mov     r11, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, +r4, lsl #2]
        ldr     r2, [sp, #0x14]
        cmp     r8, r2
        add     r4, r4, #2
        blt     LCLQ2
        mov     r1, r11
        ldr     r0, [sp, #0x14]
        ldr     r11, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r4, [sp, #0x28]
LCLQ3:
        cmp     r0, #1
        str     r1, [r4]
        ble     LCLQ17
        ldr     r3, [pc, #0x56C]
        mov     r8, #1
        add     r9, r4, r5, lsl #2
        ldr     r6, [r3]
        add     r1, r7, #4
        sub     r3, r5, #1
        add     r4, r4, #4
        str     r3, [sp, #0x28]
        str     r1, [sp, #0x34]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        mov     r10, r0
LCLQ4:
        ldr     r1, [sp, #0x28]
        mov     r5, r6
        mov     r7, r11
        cmp     r1, #0
        mov     r1, r8
        ble     LCLQ6
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x34]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x24]
        mov     r0, #0
        str     r4, [sp, #0x30]
        str     r6, [sp, #0x3C]
        str     r8, [sp, #0x2C]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x38]
        mov     r6, r0
        mov     r8, r1
        mov     r10, r2
        mov     r4, r3
LCLQ5:
        ldr     r12, [sp, #0x40]
        ldr     r0, [r10], #8
        ldr     r1, [r12, +r8, lsl #3]
        add     r9, r12, r8, lsl #3
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r4], #8
        ldr     r9, [r9, #4]
        mov     r7, r0
        mov     r0, r1
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r12, [sp, #0x2C]
        mov     r5, r0
        add     r8, r12, r8
        cmp     r8, r11
        subge   r8, r8, r11
        ldr     r12, [sp, #0x28]
        add     r6, r6, #2
        cmp     r6, r12
        blt     LCLQ5
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r8, [sp, #0x2C]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x1C]
LCLQ6:
        mov     r0, r7
        mov     r1, r5
        bl      __addsf3
        str     r0, [r4], #4
        mov     r0, r7
        mov     r1, r5
        bl      __subsf3
        rsb     r1, r8, #0
        add     r8, r8, #1
        cmp     r8, r10
        str     r0, [r9, +r1, lsl #2]
        blt     LCLQ4
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCLQ7:
        ldr     r9, [r10, #4]
        mov     r0, r11
        mov     r6, r5, asr #1
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x10]
        cmp     r6, #1
        add     r3, r10, #4
        mov     r1, r11
        ble     LCLQ11
        ldr     lr, [pc, #0x410]
        sub     r12, r6, #1
        cmp     r12, #4
        blt     LCLQ19
        ldr     r8, [lr]
        add     r12, r7, #4
        str     r12, [sp, #0xC]
        sub     r12, r6, #4
        str     r12, [sp, #0x34]
        add     r12, r7, #8
        str     r12, [sp, #0x2C]
        add     r12, r7, #0xC
        str     r12, [sp, #0x3C]
        add     r12, r10, #8
        str     r12, [sp, #0x30]
        add     r12, r10, #0xC
        str     r12, [sp, #0x38]
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #0x38]
        ldr     r9, [sp, #0x3C]
        ldr     r6, [sp, #0x2C]
        mov     r2, #1
        mov     lr, #0
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     lr, [sp, #8]
        str     r1, [sp]
        str     r0, [sp, #4]
        str     r11, [sp, #0x1C]
        mov     r4, r2
        mov     r5, r3
LCLQ8:
        ldr     r12, [sp, #0x30]
        mov     r1, r8
        ldr     r0, [r12], #0x18
        str     r12, [sp, #0x30]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        bl      __addsf3
        ldr     r1, [sp]
        str     r0, [sp, #4]
        mov     r0, r11
        bl      __subsf3
        str     r11, [r6, #-8]
        ldr     r2, [r7], #0x18
        str     r0, [sp]
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, #-8]
        add     r12, r4, #1
        str     r12, [sp, #0x44]
        ldr     r0, [r10, +r12, lsl #3]
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        bl      __addsf3
        ldr     r1, [sp]
        str     r0, [sp, #4]
        mov     r0, r11
        bl      __subsf3
        str     r11, [r6]
        ldr     r12, [sp, #0x44]
        mov     r1, r8
        ldr     r2, [r5, +r12, lsl #3]
        str     r0, [sp, #0x44]
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9]
        add     r12, r4, #2
        str     r12, [sp]
        ldr     r0, [r10, +r12, lsl #3]
        mov     r1, r8
        add     r4, r4, #3
        bl      __mulsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        str     r0, [sp, #4]
        mov     r0, r11
        bl      __subsf3
        str     r11, [r6, #8]
        ldr     r12, [sp]
        mov     r1, r8
        ldr     r2, [r5, +r12, lsl #3]
        str     r0, [sp]
        add     r6, r6, #0x18
        mov     r0, r2
        bl      __mulsf3
        str     r0, [r9, #8]
        ldr     r12, [sp, #0x34]
        add     r9, r9, #0x18
        cmp     r4, r12
        ldr     r12, [sp, #8]
        add     r12, r12, #6
        str     r12, [sp, #8]
        ble     LCLQ8
        mov     r2, r4
        mov     r3, r5
        ldr     lr, [sp, #8]
        ldr     r1, [sp]
        ldr     r0, [sp, #4]
        ldr     r9, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r4, [sp, #0x28]
LCLQ9:
        add     r12, r7, lr, lsl #2
        add     r3, r3, r2, lsl #3
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x28]
        add     r10, r10, r2, lsl #3
        str     lr, [sp, #8]
        str     r11, [sp, #0x1C]
        mov     r5, r0
        mov     r4, r1
        mov     r6, r2
        mov     r9, r3
        mov     r7, r12
LCLQ10:
        ldr     r0, [r10], #8
        mov     r1, r8
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r4
        mov     r0, r11
        bl      __subsf3
        str     r11, [r7], #8
        ldr     r2, [r9], #8
        mov     r4, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        ldr     lr, [sp, #8]
        ldr     r11, [sp, #0xC]
        add     r6, r6, #1
        str     r0, [r11, +lr, lsl #2]
        ldr     lr, [sp, #0x18]
        cmp     r6, lr
        ldr     lr, [sp, #8]
        add     lr, lr, #2
        str     lr, [sp, #8]
        blt     LCLQ10
        mov     r1, r4
        mov     r0, r5
        ldr     r9, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r4, [sp, #0x28]
LCLQ11:
        tst     r6, #1
        str     r0, [r4]
        beq     LCLQ12
        mov     r0, r1
        mov     r1, r9
        bl      __subsf3
        b       LCLQ13
LCLQ12:
        mov     r0, r9
        bl      __subsf3
LCLQ13:
        cmp     r6, #1
        str     r0, [r4, +r6, lsl #2]
        ble     LCLQ17
        ldr     r3, [pc, #0x160]
        mov     r0, r11
        mov     r1, r9
        ldr     r8, [r3]
        bl      __subsf3
        add     r9, r4, r5, lsl #2
        add     r1, r7, #4
        mov     r11, #1
        sub     r10, r5, #2
        add     r4, r4, #4
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
LCLQ14:
        tst     r11, #1
        ldreq   r5, [sp, #0x10]
        ldrne   r5, [sp, #0xC]
        cmp     r10, #0
        mov     r7, r8
        mov     r0, r11
        ble     LCLQ16
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #8]
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        mov     r1, #0
        str     r4, [sp, #0x28]
        str     r9, [sp, #4]
        str     r8, [sp]
        str     r6, [sp, #0x18]
        str     r10, [sp, #0x1C]
        mov     r9, r0
        mov     r8, r1
        mov     r4, r2
        mov     r6, r3
LCLQ15:
        ldr     r12, [sp, #0x40]
        ldr     r0, [r4], #8
        ldr     r1, [r12, +r9, lsl #3]
        add     r10, r12, r9, lsl #3
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r6], #8
        ldr     r10, [r10, #4]
        mov     r5, r0
        mov     r0, r1
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r12, [sp, #0x14]
        mov     r7, r0
        add     r9, r12, r9
        cmp     r9, r11
        subge   r9, r9, r11
        ldr     r12, [sp, #0x1C]
        add     r8, r8, #2
        cmp     r8, r12
        blt     LCLQ15
        ldr     r4, [sp, #0x28]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LCLQ16:
        mov     r0, r5
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4], #4
        mov     r0, r5
        mov     r1, r7
        bl      __subsf3
        rsb     r1, r11, #0
        add     r11, r11, #1
        cmp     r11, r6
        str     r0, [r9, +r1, lsl #2]
        blt     LCLQ14
LCLQ17:
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCLQ18:
        ldr     r6, [r12]
        add     r9, r7, #4
        sub     r2, r10, #4
        b       LCLQ1
LCLQ19:
        ldr     r8, [lr]
        add     r12, r7, #4
        mov     r2, #1
        mov     lr, #0
        str     r12, [sp, #0xC]
        b       LCLQ9
        .long   LCLQ__2il0floatpacket.1
        .long   LCLQ__2il0floatpacket.2


        .data
        .align  4


LCLQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x40
LCLQ__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


