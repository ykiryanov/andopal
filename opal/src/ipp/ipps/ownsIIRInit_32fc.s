        .text
        .align  4
        .globl  ownsIIRInit_32fc


LBPQ_ownsIIRSetDlyLine_32fc:
        stmdb   sp!, {lr}
        mov     r2, r0
        mov     r0, r1
        ldr     r1, [r2, #0xC]
        ldr     r3, [r2, #8]
        cmp     r0, #0
        beq     LBPQ0
        mov     r2, r1
        mov     r1, r3
        bl      _ippsCopy_32fc
        mov     r0, #0
        ldr     pc, [sp], #4
LBPQ0:
        mov     r0, r3
        bl      _ippsZero_32fc
        mov     r0, #0
        ldr     pc, [sp], #4
ownsIIRInit_32fc:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r12, [sp, #0x18]
        mov     r5, r2
        mov     r6, r0
        add     r12, r12, #0xF
        mov     r7, r5, lsl #1
        add     r8, r7, #1
        bic     lr, r12, #0xF
        str     lr, [r6]
        ldr     r12, [sp, #0x1C]
        mov     r8, r8, lsl #3
        add     r7, lr, #0x30
        str     r7, [lr, #4]
        ldr     r7, [r6]
        add     r8, r8, #0xF
        bic     r8, r8, #0xF
        add     r8, lr, r8
        add     lr, r8, #0x30
        str     lr, [r7, #8]
        ldr     r7, [r6]
        mov     r4, r1
        mov     r1, r3
        str     r12, [r7]
        ldr     r12, [r6]
        cmp     r5, #0
        mov     lr, #0
        str     r5, [r12, #0xC]
        ldr     r12, [r6]
        str     lr, [r12, #0x18]
        ldr     r12, [r6]
        str     lr, [r12, #0x28]
        ble     LBPQ1
        ldr     r0, [r6]
        bl      LBPQ_ownsIIRSetDlyLine_32fc
        ldr     r12, [r6]
        ldr     r3, [pc, #0x28]
        ldr     r12, [r12, #8]
        ldr     r3, [r3]
        str     r3, [r12, +r5, lsl #3]
        ldr     r12, [r6]
        ldr     r12, [r12, #8]
        add     r5, r12, r5, lsl #3
        str     r3, [r5, #4]
LBPQ1:
        ldr     r1, [r6]
        mov     r0, r4
        ldmia   sp!, {r4 - r8, lr}
        b       ownsIIRSetTaps_32fc
        .long   LBPQ__2il0floatpacket.1


        .data
        .align  4


LBPQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


