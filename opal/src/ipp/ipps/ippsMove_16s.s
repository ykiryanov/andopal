        .text
        .align  4
        .globl  _ippsMove_16s


_ippsMove_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LBNJ8
        cmp     r1, #0
        beq     LBNJ8
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r0, r1
        bls     LBNJ3
        mov     r2, r2, lsl #1
        cmp     r2, #0
        ble     LBNJ7
        cmp     r2, #6
        mov     r3, #0
        blt     LBNJ1
        sub     r12, r2, #6
        sub     lr, r1, #1
        sub     r4, r0, #1
LBNJ0:
        ldrb    r5, [r4, #1]
        add     r3, r3, #5
        cmp     r3, r12
        strb    r5, [lr, #1]
        ldrb    r5, [r4, #2]
        strb    r5, [lr, #2]
        ldrb    r5, [r4, #3]
        strb    r5, [lr, #3]
        ldrb    r5, [r4, #4]
        strb    r5, [lr, #4]
        ldrb    r5, [r4, #5]!
        strb    r5, [lr, #5]!
        ble     LBNJ0
LBNJ1:
        add     r0, r3, r0
        add     r1, r3, r1
LBNJ2:
        ldrb    r12, [r0], #1
        add     r3, r3, #1
        cmp     r3, r2
        strb    r12, [r1], #1
        blt     LBNJ2
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNJ3:
        cmp     r0, r1
        bcs     LBNJ7
        mov     r2, r2, lsl #1
        subs    r2, r2, #1
        bmi     LBNJ7
        cmp     r2, #6
        blt     LBNJ5
        add     r12, r2, #1
        add     r3, r12, r1
        add     r12, r12, r0
LBNJ4:
        ldrb    lr, [r12, #-1]
        sub     r2, r2, #5
        cmp     r2, #6
        strb    lr, [r3, #-1]
        ldrb    lr, [r12, #-2]
        strb    lr, [r3, #-2]
        ldrb    lr, [r12, #-3]
        strb    lr, [r3, #-3]
        ldrb    lr, [r12, #-4]
        strb    lr, [r3, #-4]
        ldrb    lr, [r12, #-5]!
        strb    lr, [r3, #-5]!
        bge     LBNJ4
LBNJ5:
        add     r0, r2, r0
        add     r1, r2, r1
LBNJ6:
        ldrb    r3, [r0], #-1
        subs    r2, r2, #1
        strb    r3, [r1], #-1
        bpl     LBNJ6
LBNJ7:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNJ8:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}

