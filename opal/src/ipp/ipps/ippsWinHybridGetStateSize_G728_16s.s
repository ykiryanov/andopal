        .text
        .align  4
        .globl  _ippsWinHybridGetStateSize_G728_16s


_ippsWinHybridGetStateSize_G728_16s:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r5, [sp, #0x10]
        mov     r6, r1
        cmp     r5, #0
        mov     r1, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r0, #0
        ble     LDEO1
        cmp     r6, #0
        ble     LDEO1
        cmp     r2, #0
        ble     LDEO1
        add     lr, r2, #2
        add     r12, r6, r0, lsl #1
        add     lr, r12, lr
        cmp     r1, #0
        mov     r12, lr, lsl #1
        add     r4, r12, #0x18
        ble     LDEO0
        add     r6, r0, r6
        add     r0, r6, r2
        bl      __intel_idiv
        add     r4, r4, r0, lsl #1
LDEO0:
        add     r4, r4, #0x10
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r4 - r6, pc}
LDEO1:
        mvn     r0, #5
        ldmia   sp!, {r4 - r6, pc}


