        .text
        .align  4
        .globl  _ippsSet_16sc


_ippsSet_16sc:
        stmdb   sp!, {r1, r4, lr}
        cmp     r1, #0
        str     r0, [sp]
        beq     LBNB3
        cmp     r2, #0
        ble     LBNB4
        cmp     r2, #6
        mov     r12, #0
        ldrltsh r0, [sp]
        ldrltsh r3, [sp, #2]
        blt     LBNB1
        ldrsh   r0, [sp]
        ldrsh   r3, [sp, #2]
        sub     r4, r2, #6
        sub     lr, r1, #2
LBNB0:
        add     r12, r12, #5
        strh    r0, [lr, #2]
        strh    r3, [lr, #4]
        strh    r0, [lr, #6]
        strh    r3, [lr, #8]
        strh    r0, [lr, #0xA]
        strh    r3, [lr, #0xC]
        strh    r0, [lr, #0xE]
        strh    r3, [lr, #0x10]
        strh    r0, [lr, #0x12]
        strh    r3, [lr, #0x14]!
        cmp     r12, r4
        ble     LBNB0
LBNB1:
        mov     lr, r12, lsl #2
        sub     lr, lr, #2
        add     r1, lr, r1
LBNB2:
        add     r12, r12, #1
        strh    r0, [r1, #2]
        strh    r3, [r1, #4]!
        cmp     r12, r2
        blt     LBNB2
        mov     r0, #0
        ldmia   sp!, {r1, r4, pc}
LBNB3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4, pc}
LBNB4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4, pc}


