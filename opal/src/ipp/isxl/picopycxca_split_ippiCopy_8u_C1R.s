        .text
        .align  4
        .globl  _ippiCopy_8u_C1R


_ippiCopy_8u_C1R:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LKNI6
        cmp     r2, #0
        beq     LKNI6
        ldr     r4, [sp, #0x18]
        cmp     r4, #0
        ble     LKNI5
        ldr     lr, [sp, #0x1C]
        cmp     lr, #0
        ble     LKNI5
        cmp     lr, #0
        ble     LKNI4
        sub     r12, r4, #6
LKNI0:
        cmp     r4, #0
        ble     LKNI3
        cmp     r4, #6
        movlt   r5, #0
        blt     LKNI2
        mov     r5, #0
        sub     r7, r2, #1
        sub     r6, r0, #1
LKNI1:
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
        ble     LKNI1
LKNI2:
        ldrb    r6, [r5, +r0]
        strb    r6, [r5, +r2]
        add     r5, r5, #1
        cmp     r5, r4
        blt     LKNI2
LKNI3:
        sub     lr, lr, #1
        cmp     lr, #0
        add     r0, r1, r0
        add     r2, r3, r2
        bgt     LKNI0
LKNI4:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LKNI5:
        mvn     r0, #5
        ldmia   sp!, {r4 - r8, pc}
LKNI6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


