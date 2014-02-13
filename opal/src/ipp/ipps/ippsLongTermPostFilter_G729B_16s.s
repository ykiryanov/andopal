        .text
        .align  4
        .globl  _ippsLongTermPostFilter_G729B_16s


_ippsLongTermPostFilter_G729B_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x34
        add     lr, sp, #0xC
        ldr     r6, [sp, #0x54]
        and     lr, lr, #0xF
        ldr     r9, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        rsb     lr, lr, #0
        mov     r5, r1
        add     r12, sp, #0xC
        and     lr, lr, #0xF
        cmp     r5, #0
        add     r4, r12, lr
        mov     r7, r0
        mov     r1, r2
        mov     r10, r3
        beq     LDPK3
        cmp     r1, #0
        beq     LDPK3
        cmp     r10, #0
        beq     LDPK3
        cmp     r6, #0
        beq     LDPK3
        cmp     r9, #0
        beq     LDPK3
        cmp     r7, #0
        blt     LDPK0
        cmp     r7, #0x8F
        bgt     LDPK0
        cmp     r8, #0
        blt     LDPK0
        cmp     r8, #2
        ble     LDPK1
LDPK0:
        mvn     r0, #6
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r10, pc}
LDPK1:
        ldr     r0, [pc, #0x98]
        mov     r12, #0xF
        str     r12, [sp]
        mov     r2, r4
        mov     r3, #0xB
        bl      _ippsMul_NR_16s_Sfs
        add     r10, r10, #0x4D, 30
        mov     r1, r4
        mov     r0, r5
        mov     r2, r10
        bl      _ippsResidualFilter_G729_16s
        cmp     r8, #1
        mov     r4, #0
        beq     LDPK2
        mov     r1, r6
        mov     r0, r10
        mov     r2, #0x28
        bl      _ippsCopy_16s
        strh    r4, [r9]
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r10, pc}
LDPK2:
        add     r12, sp, #8
        str     r12, [sp]
        mov     r3, r6
        mov     r2, r10
        mov     r1, r7
        mov     r0, #1, 18
        bl      _ippsLongTermPostFilter_G729_16s
        ldrsh   r1, [sp, #8]
        mov     r0, #1
        cmp     r1, #0
        movne   r4, r0
        strh    r4, [r9]
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r10, pc}
LDPK3:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r10, pc}
        .long   facGamma2_pst


