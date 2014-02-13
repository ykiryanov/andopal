        .text
        .align  4
        .globl  _ipps_initTabTwd_R4_32s


_ipps_initTabTwd_R4_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     lr, #1
        mov     r12, lr, lsl r0
        sub     r2, r2, r0
        add     r4, r3, r12, lsl #3
        and     r0, r4, #0x1F
        mov     r5, r12, asr #1
        rsb     r0, r0, #0
        mov     lr, lr, lsl r2
        add     r5, r12, r5, lsr #30
        and     r0, r0, #0x1F
        mov     r2, r5, asr #2
        cmp     r2, #0
        add     r0, r4, r0
        ble     LCAH3
        cmp     r2, #4
        mov     r10, #0
        mullt   r4, lr, r2
        movlt   r5, r10
        blt     LCAH1
        mul     r4, lr, r2
        mov     r6, lr, lsl #1
        str     r6, [sp, #0x14]
        sub     r8, r3, #4
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        sub     r6, r4, lr, lsl #1
        sub     r11, r2, #4
        str     r6, [sp, #0x18]
        mov     r5, r10
        rsb     r9, lr, r4
        add     r7, lr, lr, lsl #1
        mov     r6, lr
        str     r11, [sp]
        str     r2, [sp, #4]
        str     r0, [sp, #8]
        str     r12, [sp, #0xC]
LCAH0:
        rsb     r0, r5, #0
        mul     r12, lr, r0
        ldr     r0, [sp]
        add     r5, r5, #3
        ldr     r11, [sp, #0x18]
        cmp     r5, r0
        add     r0, r4, r12
        ldr     r0, [r1, +r0, lsl #2]
        add     r2, r12, r9
        add     r12, r12, r11
        str     r0, [r8, #4]
        ldr     r0, [r1, +r10, lsl #2]
        add     r10, r10, r7
        str     r0, [r8, #8]
        ldr     r2, [r1, +r2, lsl #2]
        str     r2, [r8, #0xC]
        ldr     r0, [r1, +r6, lsl #2]
        add     r6, r6, r7
        str     r0, [r8, #0x10]
        ldr     r12, [r1, +r12, lsl #2]
        str     r12, [r8, #0x14]
        ldr     r0, [r1, +r3, lsl #2]
        add     r3, r3, r7
        str     r0, [r8, #0x18]!
        ble     LCAH0
        ldr     r2, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #0x10]
LCAH1:
        mul     r6, r5, lr
        mov     r7, r5, lsl #3
        sub     r7, r7, #4
        add     r7, r7, r3
LCAH2:
        rsb     r8, r5, #0
        mla     r8, lr, r8, r4
        add     r5, r5, #1
        cmp     r5, r2
        ldr     r8, [r1, +r8, lsl #2]
        str     r8, [r7, #4]
        ldr     r8, [r1, +r6, lsl #2]
        add     r6, r6, lr
        str     r8, [r7, #8]!
        blt     LCAH2
LCAH3:
        mov     lr, #0
        cmp     r12, #0
        mov     r1, #1
        movlt   lr, r1
        add     lr, r12, lr
        mov     r1, lr, asr #1
        cmp     r2, r1
        bge     LCAH7
        sub     lr, r1, r2
        cmp     lr, #4
        rsb     r4, r2, #0
        addlt   r5, r3, r4, lsl #3
        blt     LCAH5
        mov     lr, r2, lsl #3
        add     r5, r3, r4, lsl #3
        sub     r4, lr, #4
        add     lr, lr, #4
        add     r4, r4, r3
        add     lr, lr, r5
        sub     r6, r1, #4
LCAH4:
        ldr     r7, [lr]
        add     r2, r2, #3
        cmp     r2, r6
        rsb     r7, r7, #0
        str     r7, [r4, #4]
        ldr     r7, [lr, #-4]
        str     r7, [r4, #8]
        ldr     r7, [lr, #8]
        rsb     r7, r7, #0
        str     r7, [r4, #0xC]
        ldr     r7, [lr, #4]
        str     r7, [r4, #0x10]
        ldr     r7, [lr, #0x10]
        rsb     r7, r7, #0
        str     r7, [r4, #0x14]
        ldr     r7, [lr, #0xC]
        add     lr, lr, #0x18
        str     r7, [r4, #0x18]!
        ble     LCAH4
LCAH5:
        mov     lr, r2, lsl #3
        sub     r4, lr, #4
        add     lr, r4, r3
        add     r4, r4, r5
LCAH6:
        ldr     r6, [r4, #8]!
        rsb     r6, r6, #0
        str     r6, [lr, #4]
        ldr     r6, [r5, +r2, lsl #3]
        add     r2, r2, #1
        cmp     r2, r1
        str     r6, [lr, #8]!
        blt     LCAH6
LCAH7:
        cmp     r1, r12
        bge     LCAH11
        sub     r2, r12, r1
        cmp     r2, #4
        rsb     lr, r1, #0
        addlt   lr, r3, lr, lsl #3
        blt     LCAH9
        mov     r2, r1, lsl #3
        sub     r2, r2, #4
        add     lr, r3, lr, lsl #3
        add     r4, r2, r3
        sub     r5, r12, #4
        add     r2, r2, lr
LCAH8:
        ldr     r6, [r2, #4]
        add     r1, r1, #3
        cmp     r1, r5
        rsb     r6, r6, #0
        str     r6, [r4, #4]
        ldr     r6, [r2, #8]
        rsb     r6, r6, #0
        str     r6, [r4, #8]
        ldr     r6, [r2, #0xC]
        rsb     r6, r6, #0
        str     r6, [r4, #0xC]
        ldr     r6, [r2, #0x10]
        rsb     r6, r6, #0
        str     r6, [r4, #0x10]
        ldr     r6, [r2, #0x14]
        rsb     r6, r6, #0
        str     r6, [r4, #0x14]
        ldr     r6, [r2, #0x18]!
        rsb     r6, r6, #0
        str     r6, [r4, #0x18]!
        ble     LCAH8
LCAH9:
        mov     r2, r1, lsl #3
        sub     r2, r2, #4
        add     r3, r2, r3
        add     r2, r2, lr
LCAH10:
        ldr     r4, [lr, +r1, lsl #3]
        add     r1, r1, #1
        cmp     r1, r12
        rsb     r4, r4, #0
        str     r4, [r3, #4]
        ldr     r4, [r2, #8]!
        rsb     r4, r4, #0
        str     r4, [r3, #8]!
        blt     LCAH10
LCAH11:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


