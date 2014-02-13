        .text
        .align  4
        .globl  _ippsSubC_64f_I


_ippsSubC_64f_I:
        stmdb   sp!, {r4 - r10, lr}
        mov     r8, r2
        cmp     r8, #0
        mov     r5, r0
        mov     r4, r1
        mov     r6, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r6, #6
        mov     r7, #0
        blt     LAUK1
        sub     r10, r6, #6
        sub     r9, r8, #4
LAUK0:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        ldr     r2, [r9, #0xC]
        ldr     r3, [r9, #0x10]
        str     r0, [r9, #4]
        str     r1, [r9, #8]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        ldr     r2, [r9, #0x14]
        ldr     r3, [r9, #0x18]
        str     r0, [r9, #0xC]
        str     r1, [r9, #0x10]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        ldr     r2, [r9, #0x1C]
        ldr     r3, [r9, #0x20]
        str     r0, [r9, #0x14]
        str     r1, [r9, #0x18]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        ldr     r2, [r9, #0x24]
        ldr     r3, [r9, #0x28]
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        add     r7, r7, #5
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        cmp     r7, r10
        ble     LAUK0
LAUK1:
        mov     r12, r7, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
LAUK2:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        add     r7, r7, #1
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        cmp     r7, r6
        blt     LAUK2
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}

