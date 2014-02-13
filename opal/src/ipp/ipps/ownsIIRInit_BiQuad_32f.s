        .text
        .align  4
        .globl  ownsIIRInit_BiQuad_32f


LBPP_ownsIIRSetDlyLine_32f:
        stmdb   sp!, {lr}
        mov     r2, r0
        mov     r0, r1
        ldr     r1, [r2, #0xC]
        ldr     r3, [r2, #8]
        cmp     r0, #0
        beq     LBPP0
        mov     r2, r1
        mov     r1, r3
        bl      _ippsCopy_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LBPP0:
        mov     r0, r3
        bl      _ippsZero_32f
        mov     r0, #0
        ldr     pc, [sp], #4
ownsIIRInit_BiQuad_32f:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r12, [sp, #0x14]
        mov     r5, r0
        add     r12, r12, #0xF
        bic     r6, r12, #0xF
        ldr     r12, [sp, #0x18]
        add     r7, r2, r2, lsl #2
        str     r6, [r5]
        mov     r7, r7, lsl #2
        add     lr, r6, #0x30
        str     lr, [r6, #4]
        ldr     lr, [r5]
        add     r7, r7, #0xF
        bic     r7, r7, #0xF
        add     r7, r6, r7
        add     r6, r7, #0x30
        str     r6, [lr, #8]
        ldr     r6, [r5]
        mov     r4, r1
        mov     r1, r3
        str     r12, [r6]
        ldr     r6, [r5]
        mov     lr, r2, lsl #1
        str     lr, [r6, #0xC]
        ldr     lr, [r5]
        mov     r12, #0
        str     r2, [lr, #0x18]
        ldr     r2, [r5]
        str     r12, [r2, #0x28]
        ldr     r0, [r5]
        bl      LBPP_ownsIIRSetDlyLine_32f
        ldr     r1, [r5]
        mov     r0, r4
        ldmia   sp!, {r4 - r7, lr}
        b       ownsIIRSetTaps_BiQuad_32f


