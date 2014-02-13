        .text
        .align  4
        .globl  _ippsConjPack_32fc_I


_ippsConjPack_32fc_I:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        mov     r3, #0
        cmp     r1, #0
        mov     r2, #1
        movlt   r3, r2
        ldr     r2, [pc, #0x9C]
        add     r3, r1, r3
        tst     r1, #1
        mov     r1, r3, asr #1
        add     r12, r1, #1
        sub     r3, r0, #4
        ldrne   r2, [r2]
        bne     LCXU0
        ldr     r2, [r2]
        add     lr, r3, #8
        sub     r1, r1, #1
        ldr     lr, [lr, +r1, lsl #3]
        add     r4, r0, #8
        add     r5, r4, r1, lsl #3
        str     r2, [r5, #4]
        str     lr, [r4, +r1, lsl #3]
LCXU0:
        cmp     r1, #0
        ble     LCXU2
        mov     lr, r1, lsl #3
        mov     r12, r12, lsl #3
        add     lr, lr, #4
        add     r12, r12, #4
        add     r3, lr, r3
        add     r12, r12, r0
        add     lr, lr, r0
LCXU1:
        ldr     r5, [r3]
        ldr     r4, [r3, #-4]
        sub     r3, r3, #8
        str     r5, [lr]
        eor     r5, r5, #2, 2
        str     r4, [lr, #-4]
        sub     r1, r1, #1
        str     r5, [r12]
        str     r4, [r12, #-4]
        cmp     r1, #0
        add     r12, r12, #8
        sub     lr, lr, #8
        bgt     LCXU1
LCXU2:
        str     r2, [r0, #4]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
        .long   LCXU__2il0floatpacket.1


        .data
        .align  4


LCXU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


