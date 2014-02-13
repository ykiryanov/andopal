        .text
        .align  4
        .globl  _ippsReal_32fc


_ippsReal_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        cmp     r0, #0
        beq     LCUV7
        cmp     r1, #0
        beq     LCUV7
        cmp     r2, #0
        ble     LCUV6
        and     r7, r2, #7
        sub     r2, r2, r7
        cmp     r2, #0
        str     r2, [sp, #0x10]
        ble     LCUV1
        add     r2, r1, #0xC
        str     r2, [sp, #0x20]
        add     r2, r0, #0x20
        str     r2, [sp, #0x24]
        add     r2, r0, #0x28
        str     r2, [sp, #0x28]
        add     r2, r1, #0x10
        str     r2, [sp, #0x2C]
        add     r2, r1, #0x14
        str     r2, [sp, #0x30]
        add     r2, r0, #0x30
        add     r9, r0, #8
        add     r8, r1, #8
        str     r2, [sp, #0x34]
        add     r11, r1, #0x1C
        mov     r10, r0
        add     r5, r1, #4
        add     r4, r0, #0x10
        add     lr, r0, #0x18
        add     r12, r0, #0x38
        add     r3, r1, #0x18
        mov     r2, r1
        str     r8, [sp]
        str     r9, [sp, #4]
        str     r7, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        ldr     r0, [sp, #0x24]
        mov     r6, #0
        str     r10, [sp, #8]
        str     r11, [sp, #0xC]
LCUV0:
        ldr     r10, [sp, #8]
        add     r6, r6, #8
        ldr     r11, [r10], #0x40
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #4]
        ldr     r11, [r11]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x38]
        str     r11, [sp, #0x3C]
        str     r10, [r2], #0x20
        ldr     r10, [sp, #4]
        add     r10, r10, #0x40
        str     r10, [sp, #4]
        ldr     r10, [sp, #0x3C]
        str     r10, [r5], #0x20
        ldr     r11, [lr], #0x40
        ldr     r10, [r4], #0x40
        str     r11, [sp, #0x3C]
        ldr     r11, [sp]
        str     r10, [r11]
        ldr     r11, [sp, #0x3C]
        ldr     r10, [sp, #0x20]
        str     r11, [r10]
        ldr     r11, [r9], #0x40
        ldr     r10, [r0], #0x40
        str     r11, [sp, #0x3C]
        str     r10, [r8], #0x20
        ldr     r10, [sp, #0x3C]
        str     r10, [r7], #0x20
        ldr     r11, [r12], #0x40
        ldr     r10, [r1], #0x40
        str     r11, [sp, #0x3C]
        ldr     r11, [sp]
        add     r11, r11, #0x20
        str     r11, [sp]
        str     r10, [r3], #0x20
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #0x3C]
        str     r11, [r10], #0x20
        ldr     r11, [sp, #0x20]
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        add     r11, r11, #0x20
        str     r11, [sp, #0x20]
        cmp     r6, r10
        blt     LCUV0
        ldr     r7, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
LCUV1:
        cmp     r7, #0
        beq     LCUV5
        ldr     r2, [sp, #0x10]
        cmp     r7, #0
        add     r0, r0, r2, lsl #3
        add     r1, r1, r2, lsl #2
        ble     LCUV5
        cmp     r7, #6
        mov     lr, #0
        blt     LCUV3
        sub     r12, r7, #6
        mov     r3, r0
        mov     r2, r1
LCUV2:
        ldr     r4, [r3], #0x28
        add     r6, lr, #1
        str     r4, [r2], #0x14
        ldr     r5, [r0, +r6, lsl #3]
        add     r4, lr, #2
        str     r5, [r1, +r6, lsl #2]
        ldr     r6, [r0, +r4, lsl #3]
        add     r5, lr, #3
        str     r6, [r1, +r4, lsl #2]
        ldr     r6, [r0, +r5, lsl #3]
        add     r4, lr, #4
        add     lr, lr, #5
        str     r6, [r1, +r5, lsl #2]
        ldr     r5, [r0, +r4, lsl #3]
        cmp     lr, r12
        str     r5, [r1, +r4, lsl #2]
        ble     LCUV2
LCUV3:
        add     r0, r0, lr, lsl #3
        add     r1, r1, lr, lsl #2
LCUV4:
        ldr     r2, [r0], #8
        add     lr, lr, #1
        cmp     lr, r7
        str     r2, [r1], #4
        blt     LCUV4
LCUV5:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCUV6:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LCUV7:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


