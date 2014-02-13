        .text
        .align  4
        .globl  _ippsFlip_32f


_ippsFlip_32f:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LBSV3
        cmp     r1, #0
        beq     LBSV3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #6
        mov     r12, #0
        sub     r3, r2, #1
        blt     LBSV1
        mov     lr, r3, lsl #2
        sub     lr, lr, #4
        add     lr, lr, r1
        sub     r5, r2, #6
        add     r4, r0, #4
LBSV0:
        ldr     r6, [r4, #-4]
        add     r12, r12, #5
        cmp     r12, r5
        str     r6, [lr, #4]
        ldr     r6, [r4]
        sub     r3, r3, #5
        str     r6, [lr]
        ldr     r6, [r4, #4]
        str     r6, [lr, #-4]
        ldr     r6, [r4, #8]
        str     r6, [lr, #-8]
        ldr     r6, [r4, #0xC]
        add     r4, r4, #0x14
        str     r6, [lr, #-0xC]
        sub     lr, lr, #0x14
        ble     LBSV0
LBSV1:
        add     r3, r1, r3, lsl #2
        add     r0, r0, r12, lsl #2
LBSV2:
        ldr     r1, [r0], #4
        add     r12, r12, #1
        cmp     r12, r2
        str     r1, [r3], #-4
        blt     LBSV2
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBSV3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


