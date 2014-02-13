        .text
        .align  4
        .globl  _ippsFlip_16u


_ippsFlip_16u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LASF3
        cmp     r1, #0
        beq     LASF3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #6
        mov     r3, #0
        sub     r5, r2, #1
        blt     LASF1
        sub     r4, r2, #6
        add     lr, r1, r5, lsl #1
        mov     r12, r0
LASF0:
        ldrh    r6, [r12]
        add     r3, r3, #5
        cmp     r3, r4
        strh    r6, [lr]
        ldrh    r6, [r12, #2]
        sub     r5, r5, #5
        strh    r6, [lr, #-2]
        ldrh    r6, [r12, #4]
        strh    r6, [lr, #-4]
        ldrh    r6, [r12, #6]
        strh    r6, [lr, #-6]
        ldrh    r6, [r12, #8]
        add     r12, r12, #0xA
        strh    r6, [lr, #-8]
        sub     lr, lr, #0xA
        ble     LASF0
LASF1:
        add     r5, r1, r5, lsl #1
        add     r0, r0, r3, lsl #1
LASF2:
        ldrh    r1, [r0], #2
        add     r3, r3, #1
        cmp     r3, r2
        strh    r1, [r5], #-2
        blt     LASF2
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LASF3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


