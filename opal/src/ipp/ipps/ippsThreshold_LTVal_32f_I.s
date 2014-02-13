        .text
        .align  4
        .globl  _ippsThreshold_LTVal_32f_I


_ippsThreshold_LTVal_32f_I:
        stmdb   sp!, {r4 - r7, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        mov     r4, r2
        mov     r6, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r7, #0
        ble     LAPE1
LAPE0:
        ldr     r0, [r5]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        strlt   r6, [r5]
        subs    r7, r7, #1
        add     r5, r5, #4
        bne     LAPE0
LAPE1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


