        .text
        .align  4
        .globl  _ippsConvert_16f32f


_ippsConvert_16f32f:
        stmdb   sp!, {r1, r4 - r8, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LCWT5
        cmp     r6, #0
        beq     LCWT5
        cmp     r5, #0
        ble     LCWT4
        cmp     r5, #0
        ble     LCWT3
        mvn     r3, #0xFE, 10
        bic     r7, r3, #3, 2
        mvn     r8, #2, 2
LCWT0:
        ldrsh   r3, [r4], #2
        mov     r3, r3, lsl #13
        ands    r12, r3, #0x3E, 10
        bic     r3, r3, #7, 4
        beq     LCWT1
        cmp     r12, #0x3E, 10
        moveq   r12, #7, 4
        movne   r12, #0xE, 6
        add     r0, r3, r12
        b       LCWT2
LCWT1:
        and     r0, r3, r7
        bic     r3, r3, r8
        orr     r3, r3, #0x2D, 8
        str     r3, [sp]
        bl      __floatsisf
        ldr     r1, [sp]
        bl      __mulsf3
LCWT2:
        str     r0, [r6], #4
        subs    r5, r5, #1
        bne     LCWT0
LCWT3:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r8, pc}
LCWT4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r8, pc}
LCWT5:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r8, pc}


