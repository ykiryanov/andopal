        .text
        .align  4
        .globl  _ipps_sDctInv_Dir_32f


_ipps_sDctInv_Dir_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r5, r2
        tst     r5, #1
        mov     r6, r0
        mov     r8, r1
        mov     r10, r3
        mov     r11, #0
        mov     r9, r5, asr #1
        beq     LCSC9
        ldr     r12, [pc, #0x418]
        cmp     r9, #0
        ldrle   r4, [r12]
        ble     LCSC3
        ldr     r4, [r12]
        mov     r0, r11
        sub     lr, r5, #1
        sub     r12, r8, #4
        str     r10, [sp, #0x2C]
        mov     r7, r8
        str     r12, [sp, #0x24]
        str     lr, [sp, #0x18]
        str     r9, [sp, #0xC]
        str     r8, [sp, #4]
        mov     r10, r0
LCSC0:
        ldr     r1, [sp, #0x18]
        ldr     r9, [r6]
        mov     r8, r4
        cmp     r1, #1
        mov     r1, r10, lsl #1
        add     r0, r1, #1
        add     r3, r11, #2
        ble     LCSC2
        str     r9, [sp, #0x10]
        ldr     r9, [sp, #0x2C]
        add     r12, r6, #8
        add     r2, r6, #4
        mov     r1, #1
        str     r4, [sp, #0x1C]
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x20]
        str     r6, [sp]
        str     r10, [sp, #0x28]
        mov     r4, r0
        mov     r8, r1
        mov     r7, r2
        mov     r6, r12
LCSC1:
        ldr     r1, [r9, +r3, lsl #2]
        ldr     r0, [r6], #8
        add     r10, r11, r3
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        ldr     r1, [r9, +r4, lsl #2]
        ldr     r2, [r7], #8
        str     r0, [sp, #0x10]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        add     r3, r10, #2
        add     r4, r11, r4
        cmp     r3, r5, lsl #2
        str     r0, [sp, #0x14]
        add     r4, r4, #2
        subge   r3, r3, r5, lsl #2
        cmp     r4, r5, lsl #2
        subge   r4, r4, r5, lsl #2
        ldr     lr, [sp, #0x18]
        add     r8, r8, #2
        cmp     r8, lr
        blt     LCSC1
        ldr     r4, [sp, #0x1C]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        ldr     r7, [sp, #0x20]
        ldr     r10, [sp, #0x28]
        ldr     r6, [sp]
LCSC2:
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        str     r0, [r7], #4
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        sub     r3, r5, r10
        str     r0, [r1, +r3, lsl #2]
        ldr     r1, [sp, #0xC]
        add     r10, r10, #1
        add     r11, r11, #4
        cmp     r10, r1
        blt     LCSC0
        ldr     r9, [sp, #0xC]
        ldr     r8, [sp, #4]
LCSC3:
        sub     r0, r5, #2
        cmp     r0, #0
        mov     r11, #0
        mov     r7, r4
        ble     LCSC7
        sub     r3, r5, #2
        cmp     r3, #0x18
        addlt   r10, r6, #8
        blt     LCSC5
        sub     r3, r5, #0x1A
        add     r2, r6, #0x10
        add     r1, r6, #0x18
        add     r10, r6, #8
        str     r5, [sp, #8]
        str     r8, [sp, #4]
        str     r6, [sp]
        str     r0, [sp, #0x10]
        str     r9, [sp, #0xC]
        mov     r5, r1
        mov     r6, r2
        mov     r8, r3
LCSC4:
        ldr     r1, [r6, #-0x10]
        mov     r0, r4
        add     r11, r11, #0x14
        bl      __addsf3
        ldr     r1, [r5, #-0x10]
        mov     r4, r0
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [r6]
        mov     r7, r0
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r5]
        mov     r4, r0
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [r6, #0x10]
        mov     r7, r0
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r5, #0x10]
        mov     r4, r0
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [r6, #0x20]
        mov     r7, r0
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r5, #0x20]
        mov     r4, r0
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [r6, #0x30]
        mov     r7, r0
        mov     r0, r4
        add     r6, r6, #0x50
        bl      __addsf3
        ldr     r1, [r5, #0x30]
        mov     r4, r0
        mov     r0, r7
        add     r5, r5, #0x50
        bl      __addsf3
        cmp     r11, r8
        mov     r7, r0
        ble     LCSC4
        ldr     r0, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r6, [sp]
LCSC5:
        add     r1, r6, r11, lsl #2
        str     r8, [sp, #4]
        str     r6, [sp]
        mov     r8, r0
        mov     r6, r1
LCSC6:
        ldr     r1, [r6], #0x10
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r10, +r11, lsl #2]
        mov     r4, r0
        mov     r0, r7
        add     r11, r11, #4
        bl      __addsf3
        cmp     r11, r8
        mov     r7, r0
        blt     LCSC6
        ldr     r8, [sp, #4]
        ldr     r6, [sp]
LCSC7:
        cmp     r11, r5
        bge     LCSC8
        ldr     r1, [r6, +r11, lsl #2]
        mov     r0, r4
        bl      __addsf3
        mov     r4, r0
LCSC8:
        mov     r0, r4
        mov     r1, r7
        bl      __subsf3
        str     r0, [r8, +r9, lsl #2]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCSC9:
        cmp     r9, #0
        ble     LCSC13
        sub     r12, r5, #1
        sub     lr, r8, #4
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r9, [sp, #0xC]
        str     r8, [sp, #4]
LCSC10:
        ldr     r0, [r6, #4]
        mov     r1, r11, lsl #1
        add     r9, r1, #1
        ldr     r1, [r10, +r9, lsl #2]
        ldr     r8, [r6]
        bl      __mulsf3
        ldr     r12, [sp, #0x20]
        mov     r7, r0
        cmp     r12, #2
        movle   r4, r11, lsl #2
        ble     LCSC12
        add     r2, r6, #8
        add     r3, r6, #0xC
        mov     r0, #0
        mov     r1, #2
        mov     r4, r11, lsl #2
        str     r7, [sp, #0x24]
        str     r8, [sp, #0x28]
        str     r6, [sp]
        str     r11, [sp, #0x30]
        mov     r6, r0
        mov     r11, r1
        mov     r8, r2
        mov     r7, r3
LCSC11:
        add     r6, r4, r6
        add     r6, r6, #2
        add     r9, r4, r9
        cmp     r6, r5, lsl #2
        add     r9, r9, #2
        subge   r6, r6, r5, lsl #2
        cmp     r9, r5, lsl #2
        subge   r9, r9, r5, lsl #2
        ldr     r0, [r8], #8
        ldr     r1, [r10, +r6, lsl #2]
        add     r11, r11, #2
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [r10, +r9, lsl #2]
        ldr     r2, [r7], #8
        str     r0, [sp, #0x28]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        ldr     r12, [sp, #0x20]
        cmp     r11, r12
        str     r0, [sp, #0x24]
        blt     LCSC11
        ldr     r7, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r6, [sp]
        ldr     r11, [sp, #0x30]
LCSC12:
        mov     r0, r8
        mov     r1, r7
        bl      __addsf3
        ldr     r12, [sp, #4]
        mov     r1, r7
        str     r0, [r12, +r4]
        mov     r0, r8
        bl      __subsf3
        ldr     r12, [sp, #0x1C]
        sub     r1, r5, r11
        str     r0, [r12, +r1, lsl #2]
        ldr     r1, [sp, #0xC]
        add     r11, r11, #1
        cmp     r11, r1
        blt     LCSC10
LCSC13:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LCSC__2il0floatpacket.1


        .data
        .align  4


LCSC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


