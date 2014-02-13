        .text
        .align  4
        .globl  _ippsFlip_32fc


_ippsFlip_32fc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LBSZ3
        cmp     r1, #0
        beq     LBSZ3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #5
        mov     r5, #0
        sub     r4, r2, #1
        blt     LBSZ1
        mov     r3, r4, lsl #3
        add     r3, r3, #0xC
        add     r3, r3, r0
        sub     lr, r2, #5
        sub     r12, r1, #4
LBSZ0:
        ldr     r6, [r3, #-0xC]
        add     r5, r5, #4
        cmp     r5, lr
        str     r6, [r12, #4]
        ldr     r6, [r3, #-8]
        sub     r4, r4, #4
        str     r6, [r12, #8]
        ldr     r6, [r3, #-0x14]
        str     r6, [r12, #0xC]
        ldr     r6, [r3, #-0x10]
        str     r6, [r12, #0x10]
        ldr     r6, [r3, #-0x1C]
        str     r6, [r12, #0x14]
        ldr     r6, [r3, #-0x18]
        str     r6, [r12, #0x18]
        ldr     r6, [r3, #-0x24]
        str     r6, [r12, #0x1C]
        ldr     r6, [r3, #-0x20]!
        str     r6, [r12, #0x20]!
        ble     LBSZ0
LBSZ1:
        mov     r12, r5, lsl #3
        mov     r4, r4, lsl #3
        add     r3, r4, #0xC
        sub     r12, r12, #4
        add     r0, r3, r0
        add     r1, r12, r1
LBSZ2:
        ldr     r3, [r0, #-0xC]
        add     r5, r5, #1
        cmp     r5, r2
        str     r3, [r1, #4]
        ldr     r3, [r0, #-8]!
        str     r3, [r1, #8]!
        blt     LBSZ2
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBSZ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


