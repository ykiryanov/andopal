        .text
        .align  4
        .globl  _ippsConjPerm_32fc_I


_ippsConjPerm_32fc_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        mov     r3, #0
        cmp     r1, #0
        mov     r2, #1
        movlt   r3, r2
        ldr     r2, [pc, #0x9C]
        add     r3, r1, r3
        tst     r1, #1
        mov     r1, r3, asr #1
        add     r12, r1, #1
        ldrne   r2, [r2]
        subne   r3, r0, #4
        bne     LCXQ0
        ldr     r3, [r0, #4]
        ldr     r2, [r2]
        sub     r1, r1, #1
        add     r4, r0, #8
        add     lr, r4, r1, lsl #3
        str     r3, [r4, +r1, lsl #3]
        str     r2, [lr, #4]
        mov     r3, r0
LCXQ0:
        cmp     r1, #0
        ble     LCXQ2
        mov     r4, r1, lsl #3
        mov     r12, r12, lsl #3
        add     lr, r4, #4
        add     r12, r12, #4
        add     r4, r4, #0xC
        add     r12, r12, r0
        add     lr, lr, r0
        add     r4, r4, r3
LCXQ1:
        ldr     r6, [r4, #-8]!
        ldr     r5, [r3, +r1, lsl #3]
        str     r6, [lr]
        eor     r6, r6, #2, 2
        str     r5, [lr, #-4]
        sub     r1, r1, #1
        str     r6, [r12]
        str     r5, [r12, #-4]
        cmp     r1, #0
        add     r12, r12, #8
        sub     lr, lr, #8
        bgt     LCXQ1
LCXQ2:
        str     r2, [r0, #4]
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
        .long   LCXQ__2il0floatpacket.1


        .data
        .align  4


LCXQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


