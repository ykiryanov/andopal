        .text
        .align  4
        .globl  _ippsFIRSetDlyLine32sc_16sc


_ippsFIRSetDlyLine32sc_16sc:
        stmdb   sp!, {lr}
        mov     r2, r0
        cmp     r2, #0
        mov     r0, r1
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r12, [r2, #0x58]
        ldr     r3, [pc, #0x248]
        subs    r12, r12, r3
        beq     LBTO0
        adds    r3, r12, #2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        mov     r1, r2
        bl      LBTO_ownsSRSetDlyLine32sc_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBTO0:
        mov     r1, r2
        bl      LBTO_ownsMRSetDlyLine32sc_16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LBTO_ownsMRSetDlyLine32sc_16sc:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r2, [r1, #4]
        ldr     r1, [r1, #0x48]
        cmp     r0, #0
        beq     LBTO5
        cmp     r1, #0
        ble     LBTO4
        cmp     r1, #5
        mov     r7, #0
        sub     r3, r1, #1
        addlt   r3, r0, r3, lsl #2
        blt     LBTO2
        add     r3, r0, r3, lsl #2
        mvn     r6, #0
        mvn     r5, #1
        mvn     r4, #2
        sub     lr, r1, #5
        sub     r12, r2, #2
LBTO1:
        rsb     r9, r7, #0
        rsb     r8, r7, r6
        mov     r10, r9, lsl #2
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        mov     r8, r8, lsl #2
        strh    r9, [r12, #2]
        ldrsh   r10, [r10, #2]
        strh    r10, [r12, #4]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        strh    r9, [r12, #6]
        ldrsh   r8, [r8, #2]
        rsb     r9, r7, r5
        mov     r10, r9, lsl #2
        strh    r8, [r12, #8]
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        rsb     r8, r7, r4
        strh    r9, [r12, #0xA]
        ldrsh   r10, [r10, #2]
        mov     r8, r8, lsl #2
        add     r7, r7, #4
        strh    r10, [r12, #0xC]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        cmp     r7, lr
        strh    r9, [r12, #0xE]
        ldrsh   r8, [r8, #2]
        strh    r8, [r12, #0x10]!
        ble     LBTO1
LBTO2:
        mov     r12, r7, lsl #2
        sub     r12, r12, #2
        add     r2, r12, r2
LBTO3:
        rsb     r0, r7, #0
        add     r7, r7, #1
        mov     r12, r0, lsl #2
        ldrsh   r0, [r3, +r12]
        add     r12, r3, r12
        cmp     r7, r1
        strh    r0, [r2, #2]
        ldrsh   r12, [r12, #2]
        strh    r12, [r2, #4]!
        blt     LBTO3
LBTO4:
        ldmia   sp!, {r4 - r10, pc}
LBTO5:
        mov     r0, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
LBTO_ownsSRSetDlyLine32sc_16sc:
        stmdb   sp!, {r4 - r10, lr}
        mov     r3, r1
        ldr     r2, [r3, #4]
        ldr     r1, [r3, #0x48]
        mov     r7, #0
        cmp     r0, #0
        str     r7, [r3, #0x2C]
        beq     LBTO10
        cmp     r1, #0
        ble     LBTO9
        cmp     r1, #5
        sub     r3, r1, #1
        addlt   r3, r0, r3, lsl #2
        blt     LBTO7
        add     r3, r0, r3, lsl #2
        mvn     r6, #0
        mvn     r5, #1
        mvn     r4, #2
        sub     lr, r1, #5
        sub     r12, r2, #2
LBTO6:
        rsb     r9, r7, #0
        rsb     r8, r7, r6
        mov     r10, r9, lsl #2
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        mov     r8, r8, lsl #2
        strh    r9, [r12, #2]
        ldrsh   r10, [r10, #2]
        strh    r10, [r12, #4]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        strh    r9, [r12, #6]
        ldrsh   r8, [r8, #2]
        rsb     r9, r7, r5
        mov     r10, r9, lsl #2
        strh    r8, [r12, #8]
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        rsb     r8, r7, r4
        strh    r9, [r12, #0xA]
        ldrsh   r10, [r10, #2]
        mov     r8, r8, lsl #2
        add     r7, r7, #4
        strh    r10, [r12, #0xC]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        cmp     r7, lr
        strh    r9, [r12, #0xE]
        ldrsh   r8, [r8, #2]
        strh    r8, [r12, #0x10]!
        ble     LBTO6
LBTO7:
        mov     r12, r7, lsl #2
        sub     r12, r12, #2
        add     r2, r12, r2
LBTO8:
        rsb     r0, r7, #0
        add     r7, r7, #1
        mov     r12, r0, lsl #2
        ldrsh   r0, [r3, +r12]
        add     r12, r3, r12
        cmp     r7, r1
        strh    r0, [r2, #2]
        ldrsh   r12, [r12, #2]
        strh    r12, [r2, #4]!
        blt     LBTO8
LBTO9:
        ldmia   sp!, {r4 - r10, pc}
LBTO10:
        mov     r0, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
        .long   0x46493132


