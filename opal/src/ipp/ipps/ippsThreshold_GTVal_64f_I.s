        .text
        .align  4
        .globl  _ippsThreshold_GTVal_64f_I


_ippsThreshold_GTVal_64f_I:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r6, #0
        ble     LAQQ1
LAQQ0:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        strgt   r9, [r7]
        strgt   r8, [r7, #4]
        subs    r6, r6, #1
        add     r7, r7, #8
        bne     LAQQ0
LAQQ1:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}

