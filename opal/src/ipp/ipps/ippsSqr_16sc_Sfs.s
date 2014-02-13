        .text
        .align  4
        .globl  _ippsSqr_16sc_Sfs


_ippsSqr_16sc_Sfs:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r0, #0
        mov     r2, r3
        beq     LAWT3
        cmp     r4, #0
        beq     LAWT3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #5
        mov     r6, #0
        blt     LAWT1
        sub     r5, r1, #5
        sub     lr, r0, #2
        sub     r12, r4, #2
LAWT0:
        ldrsh   r7, [lr, #2]
        add     r6, r6, #4
        cmp     r6, r5
        strh    r7, [r12, #2]
        ldrsh   r7, [lr, #4]
        strh    r7, [r12, #4]
        ldrsh   r7, [lr, #6]
        strh    r7, [r12, #6]
        ldrsh   r7, [lr, #8]
        strh    r7, [r12, #8]
        ldrsh   r7, [lr, #0xA]
        strh    r7, [r12, #0xA]
        ldrsh   r7, [lr, #0xC]
        strh    r7, [r12, #0xC]
        ldrsh   r7, [lr, #0xE]
        strh    r7, [r12, #0xE]
        ldrsh   r7, [lr, #0x10]!
        strh    r7, [r12, #0x10]!
        ble     LAWT0
LAWT1:
        mov     r12, r6, lsl #2
        sub     r12, r12, #2
        add     r0, r12, r0
        add     r12, r12, r4
LAWT2:
        ldrsh   lr, [r0, #2]
        add     r6, r6, #1
        cmp     r6, r1
        strh    lr, [r12, #2]
        ldrsh   lr, [r0, #4]!
        strh    lr, [r12, #4]!
        blt     LAWT2
        mov     r0, r4
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsSqr_16sc_ISfs
LAWT3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


