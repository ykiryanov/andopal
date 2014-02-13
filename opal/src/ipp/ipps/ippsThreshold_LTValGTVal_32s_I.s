        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_32s_I


_ippsThreshold_LTValGTVal_32s_I:
        stmdb   sp!, {r4, lr}
        ldr     lr, [sp, #8]
        ldr     r12, [sp, #0xC]
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        cmp     lr, r2
        mvnlt   r0, #0x11
        ldmltia sp!, {r4, pc}
        cmp     r1, #0
        ble     LAPM2
LAPM0:
        ldr     r4, [r0]
        cmp     r4, r2
        strlt   r3, [r0]
        blt     LAPM1
        cmp     r4, lr
        strgt   r12, [r0]
LAPM1:
        subs    r1, r1, #1
        add     r0, r0, #4
        bne     LAPM0
LAPM2:
        mov     r0, #0
        ldmia   sp!, {r4, pc}


