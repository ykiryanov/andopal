        .text
        .align  4
        .globl  _ippiCopy_8u_C1R


_ippiCopy_8u_C1R:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LPYX6
        cmp     r2, #0
        beq     LPYX6
        ldr     r4, [sp, #0x18]
        cmp     r4, #0
        ble     LPYX5
        ldr     lr, [sp, #0x1C]
        cmp     lr, #0
        ble     LPYX5
        cmp     lr, #0
        ble     LPYX4
        sub     r12, r4, #6
LPYX0:
        cmp     r4, #0
        ble     LPYX3
        cmp     r4, #6
        movlt   r5, #0
        blt     LPYX2
        mov     r5, #0
        sub     r7, r2, #1
        sub     r6, r0, #1
LPYX1:
        ldrb    r8, [r5, +r0]
        strb    r8, [r5, +r2]
        ldrb    r8, [r6, #2]
        add     r5, r5, #5
        cmp     r5, r12
        strb    r8, [r7, #2]
        ldrb    r8, [r6, #3]
        strb    r8, [r7, #3]
        ldrb    r8, [r6, #4]
        strb    r8, [r7, #4]
        ldrb    r8, [r6, #5]!
        strb    r8, [r7, #5]!
        ble     LPYX1
LPYX2:
        ldrb    r6, [r5, +r0]
        strb    r6, [r5, +r2]
        add     r5, r5, #1
        cmp     r5, r4
        blt     LPYX2
LPYX3:
        sub     lr, lr, #1
        cmp     lr, #0
        add     r0, r1, r0
        add     r2, r3, r2
        bgt     LPYX0
LPYX4:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LPYX5:
        mvn     r0, #5
        ldmia   sp!, {r4 - r8, pc}
LPYX6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


