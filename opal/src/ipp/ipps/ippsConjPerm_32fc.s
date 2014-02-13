        .text
        .align  4
        .globl  _ippsConjPerm_32fc


_ippsConjPerm_32fc:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LCXR4
        cmp     r1, #0
        beq     LCXR4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        ldr     r3, [pc, #0xB8]
        mov     r12, #0
        cmp     r2, #0
        mov     lr, #1
        ldr     r3, [r3]
        movlt   r12, lr
        add     r12, r2, r12
        tst     r2, #1
        str     r3, [r1, #4]
        mov     r2, r12, asr #1
        add     r12, r2, #1
        bne     LCXR0
        ldr     lr, [r0]
        sub     r2, r2, #1
        add     r4, r1, #8
        str     lr, [r1]
        ldr     r5, [r0, #4]
        add     lr, r4, r2, lsl #3
        str     r3, [lr, #4]
        str     r5, [r4, +r2, lsl #3]
        b       LCXR1
LCXR0:
        sub     r0, r0, #4
        ldr     r3, [r0, #4]
        str     r3, [r1]
LCXR1:
        cmp     r2, #0
        ble     LCXR3
        mov     r3, r12, lsl #3
        mov     r12, r2, lsl #3
        sub     r3, r3, #4
        add     r12, r12, #0xC
        add     r3, r3, r1
        add     r1, r12, r1
        add     r12, r12, r0
LCXR2:
        ldr     r4, [r12, #-8]!
        ldr     lr, [r0, +r2, lsl #3]
        str     r4, [r1, #-8]
        eor     r4, r4, #2, 2
        str     lr, [r1, #-0xC]
        sub     r2, r2, #1
        str     lr, [r3, #4]
        str     r4, [r3, #8]!
        cmp     r2, #0
        sub     r1, r1, #8
        bgt     LCXR2
LCXR3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LCXR4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   LCXR__2il0floatpacket.1


        .data
        .align  4


LCXR__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


