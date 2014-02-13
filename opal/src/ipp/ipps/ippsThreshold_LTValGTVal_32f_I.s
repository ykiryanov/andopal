        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_32f_I


_ippsThreshold_LTValGTVal_32f_I:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        mov     r6, r0
        cmp     r6, #0
        mov     r8, r1
        mov     r4, r2
        mov     r7, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r8, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mov     r0, r5
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r0, #0x11
        ldmltia sp!, {r4 - r10, pc}
        cmp     r8, #0
        ble     LAPO2
LAPO0:
        ldr     r10, [r6]
        mov     r1, r4
        mov     r0, r10
        bl      __ltsf2
        cmp     r0, #0
        strlt   r7, [r6]
        blt     LAPO1
        mov     r0, r10
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        strgt   r9, [r6]
LAPO1:
        subs    r8, r8, #1
        add     r6, r6, #4
        bne     LAPO0
LAPO2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


