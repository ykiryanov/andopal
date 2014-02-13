        .text
        .align  4
        .globl  _ippsWTHaarInv_8s


_ippsWTHaarInv_8s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LAIZ2
        cmp     r1, #0
        beq     LAIZ2
        cmp     r2, #0
        beq     LAIZ2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        sub     r8, r3, #1
        cmp     r8, #0
        mov     r10, #0
        movle   r9, r10
        ble     LAIZ1
        mov     r9, r10
        mov     r7, #0x7F
        mvn     r6, #0x7F
        mov     r5, r0
        sub     r4, r2, #1
LAIZ0:
        ldrsb   r12, [r5], #1
        ldrsb   lr, [r1], #1
        add     r10, r10, #2
        sub     r11, r12, lr
        add     r12, r12, lr
        cmp     r11, r6
        mov     lr, r6
        movgt   lr, r11
        cmp     lr, #0x7F
        mov     r11, r7
        movlt   r11, lr
        cmp     r12, r6
        mov     lr, r6
        movgt   lr, r12
        cmp     lr, #0x7F
        mov     r12, r7
        movlt   r12, lr
        strb    r11, [r4, #1]
        strb    r12, [r4, #2]!
        cmp     r10, r8
        add     r9, r9, #1
        blt     LAIZ0
LAIZ1:
        tst     r3, #1
        ldrnesb r0, [r9, +r0]
        strneb  r0, [r10, +r2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAIZ2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


