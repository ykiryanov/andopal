        .text
        .align  4
        .globl  _ippsAbs_32f_I


_ippsAbs_32f_I:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        subs    r8, r1, #4
        mov     r2, #0
        bmi     LDDO1
        add     r7, r0, #4
        add     r5, r0, #8
        add     lr, r0, #0xC
        mov     r6, r7
        mov     r4, r5
        mov     r12, lr
        mov     r3, r0
LDDO0:
        ldr     r9, [r3]
        add     r2, r2, #4
        cmp     r2, r8
        bic     r9, r9, #2, 2
        str     r9, [r3], #0x10
        ldr     r9, [r6], #0x10
        bic     r9, r9, #2, 2
        str     r9, [r7], #0x10
        ldr     r9, [r4], #0x10
        bic     r9, r9, #2, 2
        str     r9, [r5], #0x10
        ldr     r9, [r12], #0x10
        bic     r9, r9, #2, 2
        str     r9, [lr], #0x10
        ble     LDDO0
LDDO1:
        cmp     r2, r1
        bge     LDDO5
        sub     r3, r1, r2
        cmp     r3, #6
        blt     LDDO3
        mov     r3, r2, lsl #2
        add     r3, r3, #4
        add     r3, r3, r0
        sub     r12, r1, #6
LDDO2:
        ldr     r7, [r3, #-4]
        ldr     r6, [r3]
        ldr     r5, [r3, #4]
        ldr     r4, [r3, #8]
        ldr     lr, [r3, #0xC]
        bic     r7, r7, #2, 2
        bic     r6, r6, #2, 2
        bic     r5, r5, #2, 2
        bic     r4, r4, #2, 2
        bic     lr, lr, #2, 2
        add     r2, r2, #5
        str     r7, [r3, #-4]
        str     r6, [r3]
        str     r5, [r3, #4]
        str     r4, [r3, #8]
        str     lr, [r3, #0xC]
        cmp     r2, r12
        add     r3, r3, #0x14
        ble     LDDO2
LDDO3:
        add     r0, r0, r2, lsl #2
LDDO4:
        ldr     r3, [r0]
        add     r2, r2, #1
        cmp     r2, r1
        bic     r3, r3, #2, 2
        str     r3, [r0], #4
        blt     LDDO4
LDDO5:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


