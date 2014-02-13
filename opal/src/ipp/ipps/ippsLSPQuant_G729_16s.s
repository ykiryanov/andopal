        .text
        .align  4
        .globl  _ippsLSPQuant_G729_16s


_ippsLSPQuant_G729_16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0x40
        mov     r5, sp
        add     r12, sp, #0x1C
        and     r4, r12, #7
        and     r5, r5, #7
        rsb     r4, r4, #0
        rsb     r5, r5, #0
        and     r4, r4, #7
        and     r5, r5, #7
        add     lr, sp, #0x1C
        mov     r12, sp
        cmp     r0, #0
        add     r4, lr, r4
        add     r5, r12, r5
        mov     r8, r1
        mov     r6, r2
        mov     r7, r3
        beq     LDPN0
        cmp     r8, #0
        beq     LDPN0
        cmp     r6, #0
        beq     LDPN0
        cmp     r7, #0
        beq     LDPN0
        mov     r1, r4
        bl      _ippsLSPToLSF_G729_16s
        add     r3, sp, #0x38
        mov     r0, r4
        mov     r1, r8
        mov     r2, r5
        bl      _ippsLSFQuant_G729_16s
        add     r12, sp, #0x38
        add     lr, sp, #0x38
        add     r4, sp, #0x38
        ldrsh   r12, [r12]
        add     r8, sp, #0x38
        ldrsh   lr, [lr, #2]
        ldrsh   r4, [r4, #4]
        ldrsh   r8, [r8, #6]
        mov     r0, r5
        orr     r12, lr, r12, lsl #7
        strh    r12, [r7]
        orr     r4, r8, r4, lsl #5
        strh    r4, [r7, #2]
        mov     r1, r6
        bl      _ippsLSFToLSP_G729_16s
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r8, pc}
LDPN0:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r8, pc}


