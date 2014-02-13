        .text
        .align  4
        .globl  _ipps_sDctFwd_Dir_32f


_ipps_sDctFwd_Dir_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     lr, [sp, #0x5C]
        tst     r2, #1
        mov     r8, r1
        mov     r9, r3
        mov     r10, #0
        mov     r11, r2, asr #1
        beq     LCSD5
        ldr     r6, [r0, +r11, lsl #2]
        cmp     r11, #0
        mov     r4, r6
        ble     LCSD1
        add     r1, lr, #4
        str     r6, [sp, #0x28]
        str     r8, [sp, #4]
        sub     r7, r0, #4
        mov     r5, lr
        str     r11, [sp, #0x24]
        str     lr, [sp, #0x2C]
        str     r9, [sp, #0x34]
        str     r2, [sp, #0x30]
        mov     r8, r0
        mov     r6, r1
LCSD0:
        ldr     r2, [sp, #0x30]
        ldr     r0, [r8]
        sub     r9, r2, r10
        ldr     r1, [r7, +r9, lsl #2]
        add     r10, r10, #1
        bl      __addsf3
        mov     r11, r0
        mov     r1, r4
        bl      __addsf3
        str     r11, [r5], #8
        ldr     r1, [r8], #4
        ldr     r9, [r7, +r9, lsl #2]
        mov     r4, r0
        mov     r0, r1
        mov     r1, r9
        bl      __subsf3
        str     r0, [r6], #8
        ldr     r2, [sp, #0x24]
        cmp     r10, r2
        blt     LCSD0
        ldr     r6, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r9, [sp, #0x34]
        ldr     r2, [sp, #0x30]
        ldr     r8, [sp, #4]
LCSD1:
        sub     r3, r2, #1
        cmp     r3, #1
        str     r4, [r8]
        ble     LCSD11
        ldr     r0, [pc, #0x328]
        mov     r11, #1
        add     r5, lr, #4
        ldr     r12, [r0]
        eor     r4, r6, #2, 2
        mov     r0, #2
        add     r10, r8, #4
        add     r1, r8, #8
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r9, [sp, #0x34]
        str     r2, [sp, #0x30]
LCSD2:
        tst     r11, #2
        ldreq   r4, [sp, #0x18]
        ldrne   r4, [sp, #0x28]
        cmp     r3, #0
        mov     lr, r12
        add     r9, r11, #1
        mov     r8, r11
        ble     LCSD4
        ldr     r5, [sp, #0x2C]
        ldr     r6, [sp, #0x1C]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x24]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        mov     r2, r9, lsl #1
        mov     r7, #0
        str     r2, [sp, #4]
        str     lr, [sp]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
        str     r12, [sp, #0x20]
        str     r3, [sp, #8]
LCSD3:
        ldr     r1, [r10, +r9, lsl #2]
        ldr     r0, [r5], #8
        ldr     r2, [sp, #4]
        add     r9, r2, r9
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, +r8, lsl #2]
        ldr     r2, [r6], #8
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r2, [sp, #0xC]
        cmp     r9, r11, lsl #2
        str     r0, [sp]
        add     r8, r8, r2
        subge   r9, r9, r11, lsl #2
        cmp     r8, r11, lsl #2
        subge   r8, r8, r11, lsl #2
        ldr     r2, [sp, #8]
        add     r7, r7, #2
        cmp     r7, r2
        blt     LCSD3
        ldr     lr, [sp]
        ldr     r1, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r0, [sp, #0xC]
        ldr     r12, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        ldr     r3, [sp, #8]
LCSD4:
        str     lr, [r10], #8
        add     r11, r11, #2
        str     r4, [r1], #8
        cmp     r11, r3
        add     r0, r0, #4
        blt     LCSD2
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCSD5:
        ldr     r12, [pc, #0x1F8]
        cmp     r11, #0
        ldr     r12, [r12]
        mov     r3, r12
        mov     r4, r3
        ble     LCSD7
        sub     r1, r0, #4
        str     r8, [sp, #4]
        add     r7, lr, #4
        add     r6, r9, #4
        mov     r5, lr
        str     r1, [sp, #0x28]
        str     r3, [sp, #0x20]
        str     r12, [sp, #8]
        str     r11, [sp, #0x24]
        str     lr, [sp, #0x2C]
        str     r9, [sp, #0x34]
        str     r2, [sp, #0x30]
        mov     r8, r0
LCSD6:
        ldr     r2, [sp, #0x30]
        ldr     r11, [r8], #4
        ldr     r3, [sp, #0x28]
        sub     r2, r2, r10
        ldr     r1, [r3, +r2, lsl #2]
        mov     r0, r11
        add     r10, r10, #1
        str     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        mov     r9, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x20]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r6], #8
        str     r0, [sp, #0x20]
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r9, [r5], #8
        str     r11, [r7], #8
        ldr     r2, [sp, #0x24]
        mov     r4, r0
        cmp     r10, r2
        blt     LCSD6
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0x2C]
        ldr     r9, [sp, #0x34]
        ldr     r2, [sp, #0x30]
        ldr     r8, [sp, #4]
LCSD7:
        str     r3, [r8]
        sub     r3, r2, #1
        cmp     r3, #2
        str     r4, [r8, #4]
        ble     LCSD11
        add     r4, lr, #4
        mov     r1, #2
        mov     r0, #4
        add     r11, r8, #8
        add     r10, r8, #0xC
        str     r4, [sp, #0x10]
        str     lr, [sp, #0x2C]
        str     r9, [sp, #0x34]
        str     r2, [sp, #0x30]
LCSD8:
        mov     r4, r12
        cmp     r3, #0
        mov     lr, r4
        mov     r9, r1
        add     r8, r1, #1
        ble     LCSD10
        ldr     r5, [sp, #0x2C]
        ldr     r6, [sp, #0x10]
        str     r10, [sp, #0x18]
        str     r11, [sp, #0x14]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        mov     r2, r8, lsl #1
        mov     r7, #0
        str     r2, [sp, #0x24]
        str     lr, [sp, #0x28]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0xC]
        str     r3, [sp, #0x20]
        str     r12, [sp, #8]
LCSD9:
        ldr     r1, [r10, +r9, lsl #2]
        ldr     r0, [r5], #8
        ldr     r2, [sp, #0x1C]
        add     r9, r9, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [r10, +r8, lsl #2]
        ldr     r2, [r6], #8
        mov     r4, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        cmp     r9, r11, lsl #2
        str     r0, [sp, #0x28]
        add     r8, r2, r8
        subge   r9, r9, r11, lsl #2
        cmp     r8, r11, lsl #2
        subge   r8, r8, r11, lsl #2
        ldr     r2, [sp, #0x20]
        add     r7, r7, #2
        cmp     r7, r2
        blt     LCSD9
        ldr     lr, [sp, #0x28]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #8]
LCSD10:
        str     r4, [r11], #8
        add     r1, r1, #2
        str     lr, [r10], #8
        cmp     r1, r3
        add     r0, r0, #4
        blt     LCSD8
LCSD11:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LCSD__2il0floatpacket.1


        .data
        .align  4


LCSD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


