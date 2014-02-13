        .text
        .align  4
        .globl  _ippsXorC_16u


_ippsXorC_16u:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_16s
        cmp     r0, #0
        beq     LBJE3
        cmp     r1, #0
        beq     LBJE3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJE1
        sub     r5, r2, #6
        mov     lr, r0
        mov     r12, r1
LBJE0:
        ldrh    r7, [lr]
        add     r6, r6, #5
        cmp     r6, r5
        eor     r7, r4, r7
        strh    r7, [r12]
        ldrh    r7, [lr, #2]
        eor     r7, r4, r7
        strh    r7, [r12, #2]
        ldrh    r7, [lr, #4]
        eor     r7, r4, r7
        strh    r7, [r12, #4]
        ldrh    r7, [lr, #6]
        eor     r7, r4, r7
        strh    r7, [r12, #6]
        ldrh    r7, [lr, #8]
        add     lr, lr, #0xA
        eor     r7, r4, r7
        strh    r7, [r12, #8]
        add     r12, r12, #0xA
        ble     LBJE0
LBJE1:
        add     r0, r0, r6, lsl #1
        add     r1, r1, r6, lsl #1
LBJE2:
        ldrh    r12, [r0], #2
        add     r6, r6, #1
        eor     r12, r4, r12
        strh    r12, [r1], #2
        cmp     r6, r2
        blt     LBJE2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBJE3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


