        .text
        .align  4
        .globl  _ippsFlip_64f


_ippsFlip_64f:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBST3
        cmp     r1, #0
        beq     LBST3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r5, #0
        sub     r4, r2, #1
        blt     LBST1
        mov     r3, r4, lsl #3
        add     r3, r3, #0xC
        add     r3, r3, r1
        sub     lr, r2, #6
        sub     r12, r0, #4
LBST0:
        ldr     r6, [r12, #4]
        ldr     r7, [r12, #8]
        add     r5, r5, #5
        str     r6, [r3, #-0xC]
        cmp     r5, lr
        str     r7, [r3, #-8]
        ldr     r6, [r12, #0xC]
        ldr     r7, [r12, #0x10]
        sub     r4, r4, #5
        str     r6, [r3, #-0x14]
        str     r7, [r3, #-0x10]
        ldr     r6, [r12, #0x14]
        ldr     r7, [r12, #0x18]
        str     r6, [r3, #-0x1C]
        str     r7, [r3, #-0x18]
        ldr     r6, [r12, #0x1C]
        ldr     r7, [r12, #0x20]
        str     r6, [r3, #-0x24]
        str     r7, [r3, #-0x20]
        ldr     r6, [r12, #0x24]
        ldr     r7, [r12, #0x28]!
        str     r6, [r3, #-0x2C]
        str     r7, [r3, #-0x28]!
        ble     LBST0
LBST1:
        mov     r12, r5, lsl #3
        mov     r4, r4, lsl #3
        add     r3, r4, #0xC
        sub     r12, r12, #4
        add     r1, r3, r1
        add     r0, r12, r0
LBST2:
        ldr     r12, [r0, #4]
        ldr     r3, [r0, #8]!
        add     r5, r5, #1
        str     r12, [r1, #-0xC]
        cmp     r5, r2
        str     r3, [r1, #-8]!
        blt     LBST2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBST3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


