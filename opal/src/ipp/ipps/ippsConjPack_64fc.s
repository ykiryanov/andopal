        .text
        .align  4
        .globl  _ippsConjPack_64fc


_ippsConjPack_64fc:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LCXT3
        cmp     r1, #0
        beq     LCXT3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r2, #0
        mov     r3, #0
        mov     r12, r3
        mov     lr, #1
        movlt   r12, lr
        add     r12, r2, r12
        tst     r2, #1
        mov     r2, r12, asr #1
        ldr     r12, [r0, #4]
        ldr     lr, [r0], #-8
        str     r12, [r1, #4]
        str     r3, [r1, #8]
        str     lr, [r1]
        str     r3, [r1, #0xC]
        add     r12, r2, #1
        bne     LCXT0
        add     r4, r0, #0x10
        sub     r2, r2, #1
        ldr     lr, [r4, +r2, lsl #4]
        add     r4, r4, r2, lsl #4
        ldr     r4, [r4, #4]
        add     r5, r1, #0x10
        str     lr, [r5, +r2, lsl #4]
        add     r5, r5, r2, lsl #4
        str     r4, [r5, #4]
        str     r3, [r5, #8]
        str     r3, [r5, #0xC]
LCXT0:
        cmp     r2, #0
        ble     LCXT2
        mov     r3, r12, lsl #4
        mov     r12, r2, lsl #4
        sub     r3, r3, #4
        add     r12, r12, #0x1C
        add     r3, r3, r1
        add     r1, r12, r1
        add     r0, r12, r0
LCXT1:
        ldr     r5, [r0, #-0x10]
        ldr     lr, [r0, #-0x1C]
        ldr     r4, [r0, #-0x18]
        ldr     r12, [r0, #-0x14]
        str     r5, [r1, #-0x10]
        str     lr, [r1, #-0x1C]
        str     r4, [r1, #-0x18]
        str     r12, [r1, #-0x14]
        eor     r5, r5, #2, 2
        sub     r2, r2, #1
        str     lr, [r3, #4]
        str     r4, [r3, #8]
        str     r12, [r3, #0xC]
        str     r5, [r3, #0x10]!
        cmp     r2, #0
        sub     r1, r1, #0x10
        sub     r0, r0, #0x10
        bgt     LCXT1
LCXT2:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LCXT3:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


