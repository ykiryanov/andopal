        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_64f_I


_ippsThreshold_GTAbs_64f_I:
        stmdb   sp!, {r4 - r9, lr}
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
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        mvnlt   r0, #0x12
        ldmltia sp!, {r4 - r9, pc}
        cmp     r6, #0
        ble     LARA2
LARA0:
        ldr     r9, [r7, #4]
        ldr     r8, [r7]
        mov     r2, r5
        bic     r1, r9, #2, 2
        mov     r3, r4
        mov     r0, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LARA1
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        eorlt   r12, r4, #2, 2
        movge   r12, r4
        str     r12, [r7, #4]
        str     r5, [r7]
LARA1:
        subs    r6, r6, #1
        add     r7, r7, #8
        bne     LARA0
LARA2:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


