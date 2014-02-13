        .text
        .align  4
        .globl  _ippsExcitationDelay_G723_16s


_ippsExcitationDelay_G723_16s:
        stmdb   sp!, {r4 - r9, lr}
        mov     r4, r2
        rsb     r3, r4, #0x8F
        mov     r12, r3, lsl #1
        ldrsh   r3, [r0, +r12]
        add     r12, r0, r12
        strh    r3, [r1]
        ldrsh   r12, [r12, #2]
        add     r7, r1, #4
        rsb     r3, r4, #0x91
        strh    r12, [r1, #2]
        mov     r5, #0
        add     r8, r0, r3, lsl #1
        mov     r9, r7
LDVN0:
        mov     r0, r5
        mov     r1, r4
        bl      __intel_imod
        add     r6, r5, #1
        mov     r0, r0, lsl #1
        ldrsh   r3, [r8, +r0]
        mov     r0, r6
        mov     r1, r4
        strh    r3, [r9], #4
        bl      __intel_imod
        mov     r0, r0, lsl #1
        ldrsh   r3, [r8, +r0]
        add     r5, r5, #2
        mov     r6, r6, lsl #1
        cmp     r5, #0x3E
        strh    r3, [r7, +r6]
        blt     LDVN0
        ldmia   sp!, {r4 - r9, pc}


