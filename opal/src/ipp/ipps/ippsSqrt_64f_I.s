        .text
        .align  4
        .globl  _ippsSqrt_64f_I


_ippsSqrt_64f_I:
        stmdb   sp!, {r4 - r9, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r5, #0
        mov     r6, #0
        movle   r0, r6
        ldmleia sp!, {r4 - r9, pc}
        ldr     r7, [pc, #0x7C]
LAVS0:
        ldr     r8, [r4]
        ldr     r9, [r4, #4]
        mov     r2, #0
        mov     r0, r8
        mov     r3, #0
        mov     r1, r9
        bl      __gtdf2
        cmp     r0, #0
        ble     LAVS1
        mov     r0, r8
        mov     r1, r9
        bl      sqrt
        str     r0, [r4]
        str     r1, [r4, #4]
        b       LAVS2
LAVS1:
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LAVS2
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r6, #3
        str     r2, [r4]
        str     r3, [r4, #4]
LAVS2:
        subs    r5, r5, #1
        add     r4, r4, #8
        bne     LAVS0
        mov     r0, r6
        ldmia   sp!, {r4 - r9, pc}
        .long   ippConstantOfNAN_64f


