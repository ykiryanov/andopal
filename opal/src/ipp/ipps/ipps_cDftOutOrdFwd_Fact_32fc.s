        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact_32fc


_ipps_cDftOutOrdFwd_Fact_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        ldr     r12, [sp, #0x94]
        ldr     r5, [sp, #0x90]
        mov     r6, r3
        mul     r7, r2, r6
        str     r12, [sp]
        mul     r12, r2, r5
        ldr     r8, [sp, #0x98]
        ldr     r4, [sp, #0x9C]
        mul     lr, r5, r7
        add     r8, r8, r12, lsl #3
        cmp     r6, #0
        add     r12, r0, lr, lsl #3
        add     lr, r1, lr, lsl #3
        add     r0, r2, #1
        mov     r1, r0, asr #1
        ble     LCKR9
        ldr     r0, [pc, #0x544]
        rsb     r7, r6, r7
        add     r10, r8, r2, lsl #3
        ldr     r0, [r0]
        add     r11, r4, #8
        sub     r3, r2, #1
        mov     r9, r6
        str     r9, [sp, #0x60]
        str     r3, [sp, #0x5C]
        str     r0, [sp, #0x58]
        str     r11, [sp, #0x54]
        str     r10, [sp, #0x50]
        str     r7, [sp, #0x4C]
        str     r8, [sp, #0x48]
        str     r4, [sp, #0x44]
        str     r5, [sp, #0x40]
        str     r2, [sp, #0x3C]
LCKR0:
        ldr     r0, [sp, #0x40]
        ldr     r10, [r12]
        ldr     r2, [r12, #4]
        cmp     r0, #0
        ldr     r0, [sp, #0x4C]
        add     r5, r12, r6, lsl #3
        add     r8, lr, r6, lsl #3
        mov     r9, r10
        add     r4, r12, r0, lsl #3
        add     r7, lr, r0, lsl #3
        mov     r11, r2
        bne     LCKR2
        cmp     r1, #1
        ble     LCKR4
        ldr     r0, [sp, #0x44]
        str     r11, [sp, #0xC]
        str     r2, [sp, #0x18]
        sub     r3, r0, #4
        sub     r0, r0, #0xC
        str     r0, [sp, #0x30]
        str     r3, [sp, #4]
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #4]
        sub     r0, r1, #1
        str     r0, [sp, #0x38]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x2C]
LCKR1:
        ldr     r0, [r5]
        ldr     r1, [r4]
        bl      __addsf3
        ldr     r1, [r5, #4]
        ldr     r2, [r4, #4]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0xC]
        mov     r1, r7
        bl      __addsf3
        str     r8, [r10, #0xC]
        str     r7, [r10, #0x10]!
        ldr     r1, [r5]
        ldr     r2, [r4]
        str     r0, [sp, #0xC]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r11, #0xC]
        ldr     r0, [r5, #4]
        ldr     r1, [r4, #4]
        add     r5, r5, r6, lsl #3
        bl      __subsf3
        str     r0, [r11, #0x10]!
        ldr     r1, [sp, #0x38]
        sub     r4, r4, r6, lsl #3
        subs    r1, r1, #1
        str     r1, [sp, #0x38]
        bne     LCKR1
        ldr     r11, [sp, #0xC]
        ldr     r2, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        b       LCKR4
LCKR2:
        cmp     r1, #1
        ble     LCKR4
        mov     r0, #1
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x44]
        str     r11, [sp, #0xC]
        str     r9, [sp, #8]
        sub     r3, r0, #4
        sub     r0, r0, #0xC
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x48]
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #0x30]
        add     r0, r0, #0xC
        str     r3, [sp, #0x34]
        str     r0, [sp, #4]
        str     r2, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     r6, [sp, #0x10]
LCKR3:
        ldr     r10, [r5]
        ldr     r2, [sp, #4]
        ldr     r9, [r5, #4]
        mov     r0, r10
        ldr     r11, [r2, #-4]
        ldr     r8, [r2]
        mov     r1, r11
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r11
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        ldr     r10, [r4, #4]
        ldr     r9, [r4]
        ldr     r2, [sp, #0x50]
        rsb     r11, r7, #0
        ldr     r8, [r1, +r11, lsl #3]
        str     r0, [sp, #0x64]
        add     r11, r2, r11, lsl #3
        ldr     r11, [r11, #4]
        mov     r0, r9
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x68]
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x68]
        add     r7, r7, #1
        bl      __subsf3
        str     r0, [sp, #0x68]
        mov     r0, r10
        mov     r1, r8
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r11
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x68]
        mov     r8, r0
        mov     r0, r6
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x64]
        mov     r1, r8
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #8]
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0xC]
        str     r10, [r2, #0xC]
        str     r9, [r2, #0x10]
        ldr     r1, [sp, #0x68]
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x34]
        mov     r1, r8
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        str     r0, [r1, #0x10]
        ldr     r0, [sp, #0x14]
        cmp     r7, r0
        ldr     r0, [sp, #0x10]
        add     r5, r5, r0, lsl #3
        sub     r4, r4, r0, lsl #3
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        blt     LCKR3
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r2, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        ldr     r6, [sp, #0x10]
LCKR4:
        cmp     r1, #1
        str     r9, [lr]
        str     r11, [lr, #4]
        ble     LCKR8
        mov     r5, #1
        str     r2, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r1, [sp, #0x14]
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x2C]
LCKR5:
        ldr     r9, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        cmp     r0, #0
        mov     r4, r9
        mov     r1, r5
        ble     LCKR7
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x44]
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x3C]
        mov     r0, #0
        str     r9, [sp, #0x34]
        str     r10, [sp, #0x30]
        str     r11, [sp, #0xC]
        str     r5, [sp, #0x38]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x24]
        mov     r11, r0
        mov     r5, r1
        mov     r10, r2
        mov     r9, r3
LCKR6:
        ldr     r12, [sp]
        ldr     r0, [r9]
        ldr     r7, [r12, +r5, lsl #3]
        add     r8, r12, r5, lsl #3
        ldr     r12, [sp, #0x38]
        mov     r1, r7
        add     r5, r12, r5
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r2, [r9, #4]
        str     r0, [sp, #0xC]
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r1, [r10, #4]
        ldr     r8, [r8, #4]
        str     r0, [sp, #0x30]
        mov     r0, r1
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r10], #0x10
        mov     r4, r0
        mov     r1, r8
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        cmp     r5, r6
        str     r0, [sp, #0x34]
        subge   r5, r5, r6
        ldr     r12, [sp, #0x5C]
        add     r11, r11, #2
        add     r9, r9, #0x10
        cmp     r11, r12
        blt     LCKR6
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0xC]
        ldr     r5, [sp, #0x38]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     r6, [sp, #0x10]
LCKR7:
        mov     r0, r11
        mov     r1, r4
        bl      __subsf3
        str     r0, [r8]
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        str     r0, [r8, #4]
        mov     r0, r11
        mov     r1, r4
        bl      __addsf3
        str     r0, [r7]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        str     r0, [r7, #4]
        ldr     r0, [sp, #0x14]
        add     r5, r5, #1
        add     r8, r8, r6, lsl #3
        cmp     r5, r0
        sub     r7, r7, r6, lsl #3
        blt     LCKR5
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
LCKR8:
        ldr     r0, [sp, #0x60]
        add     r12, r12, #8
        add     lr, lr, #8
        subs    r0, r0, #1
        str     r0, [sp, #0x60]
        bne     LCKR0
LCKR9:
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKR__2il0floatpacket.1


        .data
        .align  4


LCKR__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


