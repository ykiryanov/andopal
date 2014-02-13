        .text
        .align  4
        .globl  _ippsConjPerm_64fc


_ippsConjPerm_64fc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LCXP4
        cmp     r1, #0
        beq     LCXP4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #0
        mov     r3, #0
        mov     r12, r3
        mov     lr, #1
        movlt   r12, lr
        add     r12, r2, r12
        tst     r2, #1
        mov     r2, r12, asr #1
        str     r3, [r1, #8]
        str     r3, [r1, #0xC]
        add     r12, r2, #1
        bne     LCXP0
        ldr     lr, [r0]
        ldr     r4, [r0, #4]
        sub     r2, r2, #1
        str     lr, [r1]
        add     lr, r1, #0x10
        str     r4, [r1, #4]
        ldr     r6, [r0, #8]
        ldr     r5, [r0, #0xC]
        add     r4, lr, r2, lsl #4
        str     r6, [lr, +r2, lsl #4]
        str     r3, [r4, #8]
        str     r5, [r4, #4]
        str     r3, [r4, #0xC]
        b       LCXP1
LCXP0:
        sub     r0, r0, #8
        ldr     lr, [r0, #8]
        ldr     r3, [r0, #0xC]
        str     lr, [r1]
        str     r3, [r1, #4]
LCXP1:
        cmp     r2, #0
        ble     LCXP3
        mov     r3, r12, lsl #4
        mov     r12, r2, lsl #4
        sub     r3, r3, #4
        add     r12, r12, #0x1C
        add     r3, r3, r1
        add     r1, r12, r1
        add     r12, r12, r0
LCXP2:
        ldr     r6, [r12, #-0x10]
        ldr     r4, [r0, +r2, lsl #4]
        ldr     r5, [r12, #-0x18]
        ldr     lr, [r12, #-0x14]
        str     r6, [r1, #-0x10]
        str     r4, [r1, #-0x1C]
        str     r5, [r1, #-0x18]
        str     lr, [r1, #-0x14]
        eor     r6, r6, #2, 2
        sub     r2, r2, #1
        str     r4, [r3, #4]
        str     r5, [r3, #8]
        str     lr, [r3, #0xC]
        str     r6, [r3, #0x10]!
        cmp     r2, #0
        sub     r1, r1, #0x10
        sub     r12, r12, #0x10
        bgt     LCXP2
LCXP3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LCXP4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


