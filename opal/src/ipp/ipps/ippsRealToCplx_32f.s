        .text
        .align  4
        .globl  _ippsRealToCplx_32f


_ippsRealToCplx_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        cmp     r2, #0
        beq     LCUX21
        cmp     r3, #0
        ble     LCUX20
        cmp     r1, #0
        mov     r12, #0
        beq     LCUX13
        and     r10, r3, #3
        cmp     r0, #0
        sub     r3, r3, r10
        beq     LCUX6
        cmp     r3, #0
        ble     LCUX1
        add     lr, r0, #8
        str     lr, [sp, #0x24]
        add     lr, r1, #8
        str     lr, [sp, #0x20]
        add     lr, r0, #0xC
        str     lr, [sp, #0x1C]
        sub     r11, r2, #0xC
        add     lr, r1, #0xC
        str     lr, [sp, #0x18]
        sub     r7, r2, #4
        sub     r6, r2, #0x14
        sub     r5, r2, #0x1C
        str     r11, [sp, #4]
        str     r3, [sp, #8]
        str     r10, [sp, #0xC]
        str     r2, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        add     r9, r0, #4
        add     r8, r1, #4
        mov     r4, r0
        mov     lr, r1
        str     r1, [sp]
        str     r0, [sp, #0x14]
LCUX0:
        ldr     r1, [r4], #0x10
        ldr     r0, [lr], #0x10
        str     r1, [r5, #0x1C]
        str     r0, [r5, #0x20]!
        ldr     r1, [r9], #0x10
        ldr     r0, [r8], #0x10
        str     r1, [r6, #0x1C]
        str     r0, [r6, #0x20]!
        ldr     r1, [r3], #0x10
        ldr     r0, [r10], #0x10
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #4]
        str     r0, [r1, #0x1C]
        ldr     r0, [sp, #0x28]
        add     r12, r12, #4
        str     r0, [r1, #0x20]!
        str     r1, [sp, #4]
        ldr     r0, [r11], #0x10
        ldr     r1, [r2], #0x10
        str     r0, [r7, #0x20]
        str     r1, [r7, #0x1C]
        ldr     r0, [sp, #8]
        add     r7, r7, #0x20
        cmp     r12, r0
        blt     LCUX0
        ldr     r3, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp]
        ldr     r0, [sp, #0x14]
LCUX1:
        cmp     r10, #0
        beq     LCUX5
        add     r0, r0, r3, lsl #2
        add     r1, r1, r3, lsl #2
        cmp     r10, #0
        add     r3, r2, r3, lsl #3
        ble     LCUX5
        cmp     r10, #5
        mov     r5, #0
        blt     LCUX3
        sub     r4, r10, #5
        sub     lr, r3, #0x1C
        mov     r12, r0
        mov     r2, r1
LCUX2:
        ldr     r6, [r12], #0x10
        add     r8, r5, #2
        str     r6, [lr, #0x1C]
        ldr     r6, [r2], #0x10
        str     r6, [lr, #0x20]!
        add     r6, r5, #1
        ldr     r7, [r0, +r6, lsl #2]
        str     r7, [r3, +r6, lsl #3]
        ldr     r7, [r1, +r6, lsl #2]
        add     r6, r3, r6, lsl #3
        str     r7, [r6, #4]
        ldr     r7, [r0, +r8, lsl #2]
        add     r6, r3, r8, lsl #3
        str     r7, [r3, +r8, lsl #3]
        ldr     r8, [r1, +r8, lsl #2]
        add     r7, r5, #3
        add     r5, r5, #4
        str     r8, [r6, #4]
        ldr     r6, [r0, +r7, lsl #2]
        cmp     r5, r4
        str     r6, [r3, +r7, lsl #3]
        ldr     r6, [r1, +r7, lsl #2]
        add     r7, r3, r7, lsl #3
        str     r6, [r7, #4]
        ble     LCUX2
LCUX3:
        mov     r2, r5, lsl #3
        sub     r2, r2, #4
        add     r3, r2, r3
        add     r0, r0, r5, lsl #2
        add     r1, r1, r5, lsl #2
LCUX4:
        ldr     r2, [r0], #4
        add     r5, r5, #1
        str     r2, [r3, #4]
        ldr     r2, [r1], #4
        cmp     r5, r10
        str     r2, [r3, #8]!
        blt     LCUX4
LCUX5:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCUX6:
        cmp     r3, #0
        ble     LCUX8
        ldr     r0, [pc, #0x2C8]
        add     r11, r1, #4
        add     r9, r1, #8
        ldr     r0, [r0]
        add     r8, r1, #0xC
        sub     r7, r2, #4
        sub     r6, r2, #0xC
        sub     r5, r2, #0x14
        sub     r4, r2, #0x1C
        mov     lr, r1
        str     r1, [sp]
LCUX7:
        str     r0, [r4, #0x1C]
        ldr     r1, [lr], #0x10
        add     r12, r12, #4
        str     r1, [r4, #0x20]!
        str     r0, [r5, #0x1C]
        ldr     r1, [r11], #0x10
        str     r1, [r5, #0x20]!
        str     r0, [r6, #0x1C]
        ldr     r1, [r9], #0x10
        str     r1, [r6, #0x20]!
        str     r0, [r7, #0x1C]
        ldr     r1, [r8], #0x10
        cmp     r12, r3
        str     r1, [r7, #0x20]!
        blt     LCUX7
        ldr     r1, [sp]
LCUX8:
        cmp     r10, #0
        beq     LCUX12
        add     r1, r1, r3, lsl #2
        cmp     r10, #0
        add     r3, r2, r3, lsl #3
        ble     LCUX12
        ldr     r0, [pc, #0x244]
        cmp     r10, #6
        mov     r4, #0
        ldrlt   r0, [r0]
        blt     LCUX10
        ldr     r0, [r0]
        sub     lr, r10, #6
        sub     r12, r3, #0x24
        mov     r2, r1
LCUX9:
        str     r0, [r12, #0x24]
        ldr     r5, [r2], #0x14
        add     r6, r4, #1
        str     r5, [r12, #0x28]!
        str     r0, [r3, +r6, lsl #3]
        ldr     r5, [r1, +r6, lsl #2]
        add     r6, r3, r6, lsl #3
        str     r5, [r6, #4]
        add     r6, r4, #2
        str     r0, [r3, +r6, lsl #3]
        ldr     r5, [r1, +r6, lsl #2]
        add     r6, r3, r6, lsl #3
        str     r5, [r6, #4]
        add     r5, r4, #3
        str     r0, [r3, +r5, lsl #3]
        ldr     r6, [r1, +r5, lsl #2]
        add     r7, r3, r5, lsl #3
        add     r5, r4, #4
        str     r6, [r7, #4]
        str     r0, [r3, +r5, lsl #3]
        ldr     r6, [r1, +r5, lsl #2]
        add     r4, r4, #5
        add     r5, r3, r5, lsl #3
        cmp     r4, lr
        str     r6, [r5, #4]
        ble     LCUX9
LCUX10:
        mov     r2, r4, lsl #3
        sub     r2, r2, #4
        add     r3, r2, r3
        add     r1, r1, r4, lsl #2
LCUX11:
        str     r0, [r3, #4]
        ldr     r2, [r1], #4
        add     r4, r4, #1
        cmp     r4, r10
        str     r2, [r3, #8]!
        blt     LCUX11
LCUX12:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCUX13:
        cmp     r0, #0
        beq     LCUX21
        and     lr, r3, #3
        sub     r1, r3, lr
        cmp     r1, #0
        ble     LCUX15
        ldr     r3, [pc, #0x16C]
        add     r11, r0, #4
        add     r10, r0, #8
        ldr     r3, [r3]
        add     r9, r0, #0xC
        sub     r8, r2, #4
        sub     r7, r2, #0xC
        sub     r6, r2, #0x14
        sub     r5, r2, #0x1C
        mov     r4, r0
        str     r0, [sp, #0x14]
LCUX14:
        ldr     r0, [r4], #0x10
        str     r3, [r5, #0x20]
        str     r0, [r5, #0x1C]
        ldr     r0, [r11], #0x10
        str     r3, [r6, #0x20]
        add     r5, r5, #0x20
        str     r0, [r6, #0x1C]
        ldr     r0, [r10], #0x10
        str     r3, [r7, #0x20]
        str     r0, [r7, #0x1C]
        ldr     r0, [r9], #0x10
        add     r12, r12, #4
        str     r3, [r8, #0x20]
        str     r0, [r8, #0x1C]
        cmp     r12, r1
        add     r6, r6, #0x20
        add     r8, r8, #0x20
        add     r7, r7, #0x20
        blt     LCUX14
        ldr     r0, [sp, #0x14]
LCUX15:
        cmp     lr, #0
        beq     LCUX19
        cmp     lr, #0
        add     r0, r0, r1, lsl #2
        add     r2, r2, r1, lsl #3
        ble     LCUX19
        ldr     r1, [pc, #0xD8]
        cmp     lr, #6
        mov     r5, #0
        ldrlt   r1, [r1]
        blt     LCUX17
        ldr     r1, [r1]
        sub     r4, lr, #6
        sub     r12, r2, #0x24
        mov     r3, r0
LCUX16:
        ldr     r6, [r3], #0x14
        str     r1, [r12, #0x28]
        add     r8, r5, #1
        str     r6, [r12, #0x24]
        ldr     r7, [r0, +r8, lsl #2]
        add     r6, r2, r8, lsl #3
        str     r1, [r6, #4]
        str     r7, [r2, +r8, lsl #3]
        add     r8, r5, #2
        ldr     r7, [r0, +r8, lsl #2]
        add     r6, r2, r8, lsl #3
        str     r1, [r6, #4]
        str     r7, [r2, +r8, lsl #3]
        add     r8, r5, #3
        ldr     r7, [r0, +r8, lsl #2]
        add     r6, r2, r8, lsl #3
        str     r1, [r6, #4]
        str     r7, [r2, +r8, lsl #3]
        add     r7, r5, #4
        ldr     r6, [r0, +r7, lsl #2]
        add     r5, r5, #5
        add     r8, r2, r7, lsl #3
        cmp     r5, r4
        str     r6, [r2, +r7, lsl #3]
        str     r1, [r8, #4]
        add     r12, r12, #0x28
        ble     LCUX16
LCUX17:
        mov     r3, r5, lsl #3
        sub     r3, r3, #4
        add     r2, r3, r2
        add     r0, r0, r5, lsl #2
LCUX18:
        ldr     r3, [r0], #4
        add     r5, r5, #1
        str     r1, [r2, #8]
        str     r3, [r2, #4]
        cmp     r5, lr
        add     r2, r2, #8
        blt     LCUX18
LCUX19:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCUX20:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCUX21:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCUX__2il0floatpacket.1


        .data
        .align  4


LCUX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


