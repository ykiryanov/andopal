        .text
        .align  4
        .globl  _ipps_cDft_Dir_32f


_ipps_cDft_Dir_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r12, [sp, #0x7C]
        ldr     r10, [sp, #0x78]
        mov     r11, r0
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0x80]
        mov     r6, r1
        tst     r10, #1
        str     r12, [sp, #0x4C]
        ldr     r12, [sp, #0x84]
        mov     r8, r2
        mov     r7, r3
        str     r12, [sp, #0x50]
        ldr     r5, [r11]
        ldr     r4, [r6]
        beq     LCLV6
        add     r12, r10, #1
        mov     r1, r5
        mov     r12, r12, asr #1
        cmp     r12, #1
        mov     r0, r4
        ble     LCLV1
        ldr     r3, [sp, #0x50]
        add     r2, r6, r10, lsl #2
        str     r2, [sp, #0x20]
        sub     r2, r3, #4
        sub     r3, r3, #0xC
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     r7, [sp, #0x3C]
        str     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x24]
        add     lr, r11, r10, lsl #2
        mov     r9, #1
        add     r11, r11, #4
        add     r6, r6, #4
        str     lr, [sp, #0x18]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        str     r12, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r10, [sp, #0x38]
LCLV0:
        ldr     r0, [sp, #0x18]
        rsb     r10, r9, #0
        add     r9, r9, #1
        ldr     r1, [r0, +r10, lsl #2]
        ldr     r0, [r11]
        bl      __addsf3
        ldr     r2, [sp, #0x20]
        ldr     r1, [r6]
        mov     r5, r0
        ldr     r2, [r2, +r10, lsl #2]
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        mov     r1, r4
        bl      __addsf3
        str     r5, [r7, #0xC]
        str     r4, [r7, #0x10]!
        ldr     r2, [sp, #0x18]
        ldr     r1, [r11], #4
        ldr     r2, [r2, +r10, lsl #2]
        str     r0, [sp, #0x44]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r8, #0xC]
        ldr     r1, [sp, #0x20]
        ldr     r0, [r6], #4
        ldr     r1, [r1, +r10, lsl #2]
        bl      __subsf3
        str     r0, [r8, #0x10]!
        ldr     r0, [sp, #0x2C]
        cmp     r9, r0
        blt     LCLV0
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        ldr     r12, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r5, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r8, [sp, #0x1C]
LCLV1:
        str     r1, [r8]
        cmp     r12, #1
        str     r0, [r7]
        ble     LCLV15
        ldr     r1, [pc, #0x638]
        ldr     r2, [sp, #0x50]
        mov     r6, #1
        ldr     r1, [r1]
        add     lr, r8, r10, lsl #2
        add     r9, r7, r10, lsl #2
        add     r2, r2, #8
        sub     r3, r10, #1
        add     r8, r8, #4
        add     r7, r7, #4
        str     r3, [sp, #0x10]
        str     r2, [sp, #0x1C]
        str     lr, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r10, [sp, #0x38]
LCLV2:
        ldr     r10, [sp, #0x28]
        ldr     r0, [sp, #0x10]
        ldr     r11, [sp, #0x34]
        ldr     r5, [sp, #0x30]
        cmp     r0, #0
        mov     r4, r10
        mov     r0, r6
        ble     LCLV4
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x50]
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0x38]
        mov     r1, #0
        str     r7, [sp, #0x18]
        str     r5, [sp, #4]
        str     r11, [sp]
        str     r6, [sp, #0xC]
        str     r10, [sp, #8]
        str     r9, [sp, #0x20]
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
        mov     r11, r3
LCLV3:
        ldr     r12, [sp, #0x4C]
        ldr     r0, [r11]
        ldr     r9, [r12, +r7, lsl #3]
        add     r10, r12, r7, lsl #3
        ldr     r12, [sp, #0xC]
        mov     r1, r9
        add     r7, r12, r7
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r2, [r11, #4]
        str     r0, [sp]
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [r5, #4]
        ldr     r10, [r10, #4]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5], #0x10
        mov     r4, r0
        mov     r1, r10
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        cmp     r7, r8
        str     r0, [sp, #8]
        subge   r7, r7, r8
        ldr     r12, [sp, #0x10]
        add     r6, r6, #2
        add     r11, r11, #0x10
        cmp     r6, r12
        blt     LCLV3
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r11, [sp]
        ldr     r9, [sp, #0x20]
        ldr     r6, [sp, #0xC]
LCLV4:
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        ble     LCLV16
        mov     r0, r11
        mov     r1, r4
        bl      __subsf3
        str     r0, [r8]
        mov     r0, r5
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7]
        mov     r1, r4
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        rsb     r4, r6, #0
        str     r0, [r2, +r4, lsl #2]
        mov     r0, r5
        mov     r1, r10
        bl      __subsf3
LCLV5:
        ldr     r1, [sp, #0x2C]
        add     r6, r6, #1
        str     r0, [r9, +r4, lsl #2]
        cmp     r6, r1
        add     r8, r8, #4
        add     r7, r7, #4
        blt     LCLV2
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCLV6:
        mov     r9, r10, asr #1
        ldr     r1, [r11, +r9, lsl #2]
        mov     r0, r5
        str     r1, [sp, #0x18]
        ldr     r12, [r6, +r9, lsl #2]
        str     r12, [sp, #0x10]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x40]
        mov     r0, r4
        bl      __addsf3
        ldr     r12, [sp, #0x40]
        str     r0, [sp, #0x44]
        cmp     r9, #1
        mov     r1, r5
        str     r4, [sp, #0x14]
        ble     LCLV8
        add     lr, r11, r10, lsl #2
        ldr     r3, [sp, #0x50]
        str     lr, [sp, #0x20]
        add     lr, r6, r10, lsl #2
        str     lr, [sp, #0x24]
        sub     lr, r3, #4
        sub     r3, r3, #0xC
        str     lr, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     r9, [sp]
        str     r8, [sp, #0x1C]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        add     r6, r6, #4
        str     r7, [sp, #0x3C]
        mov     r2, #1
        mov     r7, r6
        add     r11, r11, #4
        str     r1, [sp, #8]
        str     r0, [sp, #4]
        str     r12, [sp, #0xC]
        str     r4, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r10, [sp, #0x38]
        mov     r6, r2
LCLV7:
        ldr     r0, [sp, #0x20]
        rsb     r10, r6, #0
        add     r6, r6, #1
        ldr     r1, [r0, +r10, lsl #2]
        ldr     r0, [r11]
        bl      __addsf3
        ldr     r2, [r7]
        ldr     r3, [sp, #0x24]
        mov     r5, r0
        mov     r0, r2
        ldr     r1, [r3, +r10, lsl #2]
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0xC]
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #4]
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #4]
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #8]
        mov     r0, r4
        bl      __subsf3
        str     r5, [r8, #0xC]
        str     r4, [r8, #0x10]!
        ldr     r3, [sp, #0x20]
        ldr     r1, [r11], #4
        ldr     r2, [r3, +r10, lsl #2]
        str     r0, [sp, #0x14]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r9, #0xC]
        ldr     r1, [sp, #0x24]
        ldr     r0, [r7], #4
        ldr     r1, [r1, +r10, lsl #2]
        bl      __subsf3
        str     r0, [r9, #0x10]!
        ldr     r0, [sp]
        cmp     r6, r0
        blt     LCLV7
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0xC]
        ldr     r9, [sp]
        ldr     r4, [sp, #0x30]
        ldr     r5, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r8, [sp, #0x1C]
LCLV8:
        str     r12, [r8]
        tst     r9, #1
        str     r0, [r7]
        beq     LCLV9
        mov     r0, r1
        ldr     r1, [sp, #0x18]
        bl      __subsf3
        str     r0, [r8, +r9, lsl #2]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        bl      __subsf3
        b       LCLV10
LCLV9:
        ldr     r0, [sp, #0x18]
        bl      __subsf3
        str     r0, [r8, +r9, lsl #2]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        bl      __subsf3
LCLV10:
        cmp     r9, #1
        str     r0, [r7, +r9, lsl #2]
        ble     LCLV15
        mov     r0, r5
        ldr     r12, [pc, #0x288]
        ldr     r1, [sp, #0x18]
        mov     r11, #1
        ldr     r12, [r12]
        sub     r6, r10, #2
        str     r12, [sp, #4]
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        mov     r5, r0
        mov     r0, r4
        bl      __subsf3
        ldr     lr, [sp, #0x50]
        str     r9, [sp]
        ldr     r9, [sp, #4]
        add     r12, r8, r10, lsl #2
        add     r1, r7, r10, lsl #2
        add     lr, lr, #8
        add     r8, r8, #4
        add     r7, r7, #4
        str     r0, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r12, [sp, #8]
        str     r6, [sp, #0x24]
        str     r10, [sp, #0x38]
LCLV11:
        tst     r11, #1
        ldreq   r10, [sp, #0x40]
        ldreq   r5, [sp, #0x44]
        ldrne   r10, [sp, #0x14]
        ldrne   r5, [sp, #0x18]
        mov     r6, r9
        ldr     r2, [sp, #0x24]
        mov     r4, r6
        mov     r0, r11
        cmp     r2, #0
        ble     LCLV13
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x50]
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x38]
        mov     r1, #0
        str     r7, [sp, #0x1C]
        str     r6, [sp, #0x2C]
        str     r5, [sp, #0x30]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x28]
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
        mov     r10, r3
LCLV12:
        ldr     r12, [sp, #0x4C]
        ldr     r0, [r10]
        ldr     r9, [r12, +r7, lsl #3]
        add     r11, r12, r7, lsl #3
        ldr     r12, [sp, #0x28]
        mov     r1, r9
        add     r7, r12, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r10, #4]
        str     r0, [sp, #0x34]
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r1, [r5, #4]
        ldr     r11, [r11, #4]
        str     r0, [sp, #0x30]
        mov     r0, r1
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r5], #0x10
        mov     r4, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        cmp     r7, r8
        str     r0, [sp, #0x2C]
        subge   r7, r7, r8
        ldr     r12, [sp, #0x24]
        add     r6, r6, #2
        add     r10, r10, #0x10
        cmp     r6, r12
        blt     LCLV12
        ldr     r8, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r6, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        ldr     r9, [sp, #4]
        ldr     r11, [sp, #0x28]
LCLV13:
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        ble     LCLV17
        mov     r0, r10
        mov     r1, r4
        bl      __subsf3
        str     r0, [r8]
        mov     r0, r5
        mov     r1, r6
        bl      __addsf3
        str     r0, [r7]
        mov     r1, r4
        mov     r0, r10
        bl      __addsf3
        ldr     r2, [sp, #8]
        rsb     r4, r11, #0
        str     r0, [r2, +r4, lsl #2]
        mov     r0, r5
        mov     r1, r6
        bl      __subsf3
LCLV14:
        ldr     r1, [sp]
        add     r11, r11, #1
        add     r8, r8, #4
        cmp     r11, r1
        ldr     r1, [sp, #0xC]
        add     r7, r7, #4
        str     r0, [r1, +r4, lsl #2]
        blt     LCLV11
LCLV15:
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCLV16:
        mov     r0, r11
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8]
        mov     r0, r5
        mov     r1, r10
        bl      __subsf3
        str     r0, [r7]
        mov     r1, r4
        mov     r0, r11
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        rsb     r4, r6, #0
        str     r0, [r2, +r4, lsl #2]
        mov     r0, r5
        mov     r1, r10
        bl      __addsf3
        b       LCLV5
LCLV17:
        mov     r0, r10
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8]
        mov     r0, r5
        mov     r1, r6
        bl      __subsf3
        str     r0, [r7]
        mov     r1, r4
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #8]
        rsb     r4, r11, #0
        str     r0, [r2, +r4, lsl #2]
        mov     r0, r5
        mov     r1, r6
        bl      __addsf3
        b       LCLV14
        .long   LCLV__2il0floatpacket.1


        .data
        .align  4


LCLV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


