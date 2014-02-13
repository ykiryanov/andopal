        .text
        .align  4
        .globl  _ippsAbs_64f_I


_ippsAbs_64f_I:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        subs    r8, r1, #4
        mov     r2, #0
        bmi     LDDK1
        sub     r7, r0, #4
        sub     r5, r0, #0xC
        sub     lr, r0, #0x14
        mov     r6, r7
        mov     r4, r5
        mov     r12, lr
        sub     r3, r0, #0x1C
LDDK0:
        ldr     r10, [r3, #0x20]
        ldr     r9, [r3, #0x1C]
        add     r2, r2, #4
        bic     r10, r10, #2, 2
        str     r10, [r3, #0x20]
        str     r9, [r3, #0x1C]
        ldr     r10, [r12, #0x20]
        ldr     r9, [r12, #0x1C]
        cmp     r2, r8
        bic     r10, r10, #2, 2
        str     r10, [lr, #0x20]
        str     r9, [lr, #0x1C]
        ldr     r10, [r4, #0x20]
        ldr     r9, [r4, #0x1C]
        add     r3, r3, #0x20
        bic     r10, r10, #2, 2
        str     r10, [r5, #0x20]
        str     r9, [r5, #0x1C]
        ldr     r10, [r6, #0x20]
        ldr     r9, [r6, #0x1C]
        add     r12, r12, #0x20
        bic     r10, r10, #2, 2
        str     r10, [r7, #0x20]
        str     r9, [r7, #0x1C]
        add     r4, r4, #0x20
        add     r6, r6, #0x20
        add     r7, r7, #0x20
        add     r5, r5, #0x20
        add     lr, lr, #0x20
        ble     LDDK0
LDDK1:
        cmp     r2, r1
        bge     LDDK5
        sub     r3, r1, r2
        cmp     r3, #6
        blt     LDDK3
        mov     r3, r2, lsl #3
        sub     r3, r3, #4
        add     r3, r3, r0
        sub     lr, r1, #6
LDDK2:
        ldr     r9, [r3, #8]
        ldr     r12, [r3, #4]
        ldr     r8, [r3, #0xC]
        ldr     r4, [r3, #0x10]
        ldr     r5, [r3, #0x18]
        ldr     r6, [r3, #0x20]
        ldr     r7, [r3, #0x28]
        bic     r9, r9, #2, 2
        str     r9, [r3, #8]
        str     r12, [r3, #4]
        str     r8, [r3, #0xC]
        ldr     r9, [r3, #0x14]
        ldr     r8, [r3, #0x1C]
        ldr     r12, [r3, #0x24]
        bic     r4, r4, #2, 2
        bic     r5, r5, #2, 2
        bic     r6, r6, #2, 2
        bic     r7, r7, #2, 2
        add     r2, r2, #5
        str     r9, [r3, #0x14]
        str     r4, [r3, #0x10]
        str     r8, [r3, #0x1C]
        str     r5, [r3, #0x18]
        str     r6, [r3, #0x20]
        str     r12, [r3, #0x24]
        str     r7, [r3, #0x28]!
        cmp     r2, lr
        ble     LDDK2
LDDK3:
        mov     r3, r2, lsl #3
        sub     r3, r3, #4
        add     r0, r3, r0
LDDK4:
        ldr     r12, [r0, #8]
        ldr     r3, [r0, #4]
        add     r2, r2, #1
        bic     r12, r12, #2, 2
        str     r12, [r0, #8]
        str     r3, [r0, #4]
        cmp     r2, r1
        add     r0, r0, #8
        blt     LDDK4
LDDK5:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


