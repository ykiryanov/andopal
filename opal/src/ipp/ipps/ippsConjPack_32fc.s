        .text
        .align  4
        .globl  _ippsConjPack_32fc


_ippsConjPack_32fc:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LCXV3
        cmp     r1, #0
        beq     LCXV3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        ldr     r3, [pc, #0xB0]
        mov     r12, #0
        cmp     r2, #0
        mov     lr, #1
        movlt   r12, lr
        ldr     lr, [r0], #-4
        ldr     r3, [r3]
        add     r12, r2, r12
        tst     r2, #1
        str     lr, [r1]
        mov     r2, r12, asr #1
        str     r3, [r1, #4]
        add     r12, r2, #1
        bne     LCXV0
        add     lr, r0, #8
        sub     r2, r2, #1
        ldr     lr, [lr, +r2, lsl #3]
        add     r5, r1, #8
        add     r4, r5, r2, lsl #3
        str     lr, [r5, +r2, lsl #3]
        str     r3, [r4, #4]
LCXV0:
        cmp     r2, #0
        ble     LCXV2
        mov     r3, r12, lsl #3
        mov     r12, r2, lsl #3
        sub     r3, r3, #4
        add     r12, r12, #0xC
        add     r3, r3, r1
        add     r1, r12, r1
        add     r0, r12, r0
LCXV1:
        ldr     lr, [r0, #-8]
        ldr     r12, [r0, #-0xC]
        sub     r0, r0, #8
        str     lr, [r1, #-8]
        eor     lr, lr, #2, 2
        str     r12, [r1, #-0xC]
        sub     r2, r2, #1
        str     r12, [r3, #4]
        str     lr, [r3, #8]!
        cmp     r2, #0
        sub     r1, r1, #8
        bgt     LCXV1
LCXV2:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LCXV3:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   LCXV__2il0floatpacket.1


        .data
        .align  4


LCXV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


