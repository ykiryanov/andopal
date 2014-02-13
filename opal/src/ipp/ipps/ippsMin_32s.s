        .text
        .align  4
        .globl  _ippsMin_32s


_ippsMin_32s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBGU3
        cmp     r2, #0
        beq     LBGU3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #6
        mvn     r12, #2, 2
        mov     r3, #0
        blt     LBGU1
        sub     r4, r1, #6
        add     lr, r0, #4
LBGU0:
        ldr     r7, [lr, #-4]
        ldr     r6, [lr]
        ldr     r5, [lr, #4]
        cmp     r7, r12
        movlt   r12, r7
        cmp     r6, r12
        movlt   r12, r6
        ldr     r6, [lr, #8]
        cmp     r5, r12
        movlt   r12, r5
        ldr     r5, [lr, #0xC]
        cmp     r6, r12
        movlt   r12, r6
        add     lr, lr, #0x14
        cmp     r5, r12
        movlt   r12, r5
        add     r3, r3, #5
        cmp     r3, r4
        ble     LBGU0
LBGU1:
        add     r0, r0, r3, lsl #2
LBGU2:
        ldr     lr, [r0], #4
        add     r3, r3, #1
        cmp     lr, r12
        movlt   r12, lr
        cmp     r3, r1
        blt     LBGU2
        mov     r0, #0
        str     r12, [r2]
        ldmia   sp!, {r4 - r7, pc}
LBGU3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


