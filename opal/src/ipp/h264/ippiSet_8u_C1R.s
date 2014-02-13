        .text
        .align  4
        .globl  _ippiSet_8u_C1R


_ippiSet_8u_C1R:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4, r5, r11, r12, lr}
        sub     r11, r12, #4
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqdb r11, {r4, r5, r11, sp, pc}
        ldr     lr, [r11]
        cmp     lr, #0
        ble     LPYV5
        ldr     r12, [r11, #4]
        cmp     r12, #0
        ble     LPYV5
        cmp     r12, #0
        ble     LPYV4
        sub     r3, lr, #6
LPYV0:
        cmp     lr, #0
        ble     LPYV3
        cmp     lr, #6
        movlt   r4, #0
        blt     LPYV2
        mov     r4, #0
        sub     r5, r1, #1
LPYV1:
        strb    r0, [r4, +r1]
        add     r4, r4, #5
        strb    r0, [r5, #2]
        strb    r0, [r5, #3]
        strb    r0, [r5, #4]
        strb    r0, [r5, #5]!
        cmp     r4, r3
        ble     LPYV1
LPYV2:
        strb    r0, [r4, +r1]
        add     r4, r4, #1
        cmp     r4, lr
        blt     LPYV2
LPYV3:
        sub     r12, r12, #1
        cmp     r12, #0
        add     r1, r2, r1
        bgt     LPYV0
LPYV4:
        mov     r0, #0
        ldmdb   r11, {r4, r5, r11, sp, pc}
LPYV5:
        mvn     r0, #5
        ldmdb   r11, {r4, r5, r11, sp, pc}


