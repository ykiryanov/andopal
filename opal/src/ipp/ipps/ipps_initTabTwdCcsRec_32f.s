        .text
        .align  4
        .globl  _ipps_initTabTwdCcsRec_32f


_ipps_initTabTwdCcsRec_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     lr, #1
        mov     r12, lr, lsl r0
        sub     r0, r2, r0
        mov     r2, r12, asr #1
        cmp     r12, #4
        add     r12, r12, r2, lsr #30
        mov     r2, lr, lsl r0
        mov     r12, r12, asr #2
        movgt   lr, r12
        add     lr, r3, lr, lsl #3
        and     r0, lr, #0x1F
        rsb     r0, r0, #0
        and     r0, r0, #0x1F
        cmp     r12, #0
        add     r0, lr, r0
        ble     LBYN3
        cmp     r12, #4
        mov     r7, #0
        mullt   r8, r2, r12
        movlt   r9, r7
        blt     LBYN1
        mul     r8, r2, r12
        mov     r5, r2, lsl #1
        add     lr, r2, r2, lsl #1
        mov     r9, r7
        rsb     r11, r2, r8
        sub     r10, r8, r2, lsl #1
        str     r2, [sp]
        sub     r6, r12, #4
        str     r12, [sp, #8]
        ldr     r12, [sp]
        sub     r4, r3, #4
        str     r10, [sp, #0x10]
        str     r11, [sp, #0x14]
        str     r0, [sp, #0xC]
        str     r3, [sp, #4]
LBYN0:
        rsb     r0, r9, #0
        mul     r10, r2, r0
        ldr     r11, [sp, #0x10]
        add     r9, r9, #3
        cmp     r9, r6
        add     r0, r8, r10
        ldr     r3, [r1, +r0, lsl #2]
        ldr     r0, [sp, #0x14]
        str     r3, [r4, #4]
        ldr     r3, [r1, +r7, lsl #2]
        add     r7, r7, lr
        add     r0, r10, r0
        add     r10, r10, r11
        eor     r3, r3, #2, 2
        str     r3, [r4, #8]
        ldr     r0, [r1, +r0, lsl #2]
        str     r0, [r4, #0xC]
        ldr     r0, [r1, +r12, lsl #2]
        add     r12, r12, lr
        eor     r0, r0, #2, 2
        str     r0, [r4, #0x10]
        ldr     r10, [r1, +r10, lsl #2]
        str     r10, [r4, #0x14]
        ldr     r0, [r1, +r5, lsl #2]
        add     r5, r5, lr
        eor     r0, r0, #2, 2
        str     r0, [r4, #0x18]!
        ble     LBYN0
        ldr     r0, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #4]
LBYN1:
        mul     lr, r9, r2
        mov     r4, r9, lsl #3
        sub     r4, r4, #4
        add     r3, r4, r3
LBYN2:
        rsb     r4, r9, #0
        mla     r4, r2, r4, r8
        add     r9, r9, #1
        cmp     r9, r12
        ldr     r4, [r1, +r4, lsl #2]
        str     r4, [r3, #4]
        ldr     r4, [r1, +lr, lsl #2]
        add     lr, lr, r2
        eor     r4, r4, #2, 2
        str     r4, [r3, #8]!
        blt     LBYN2
LBYN3:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


