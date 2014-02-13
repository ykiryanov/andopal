        .text
        .align  4
        .globl  _ippsAutoCorr_G723_16s


_ippsAutoCorr_G723_16s:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #6, 26
        mov     r3, sp
        and     r3, r3, #0xF
        rsb     r3, r3, #0
        and     r3, r3, #0xF
        mov     r12, sp
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        add     r4, r12, r3
        beq     LDQE1
        cmp     r6, #0
        beq     LDQE1
        cmp     r5, #0
        beq     LDQE1
        mov     r12, #3
        add     r3, sp, #0x5F, 30
        str     r12, [sp, #0x17C]
        mov     r2, #0xB4
        mov     r1, r4
        bl      _ippsAutoScale_16s
        ldr     r0, [pc, #0x5C]
        mov     r2, #0xB4
        mov     r1, r4
        mov     r3, #0xF
        bl      _ippsMul_NR_16s_ISfs
        add     r2, sp, #0x5E, 30
        mov     r1, r5
        mov     r0, r4
        bl      _ippsAutoCorr_NormE_G723_16s
        ldrsh   r5, [r5]
        cmp     r5, #0
        moveq   r0, #0x28
        beq     LDQE0
        ldr     r2, [sp, #0x17C]
        ldr     r0, [sp, #0x178]
        add     r2, r0, r2, lsl #1
        mov     r0, r2, lsl #16
        mov     r0, r0, asr #16
LDQE0:
        strh    r0, [r6]
        mov     r0, #0
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r6, pc}
LDQE1:
        mvn     r0, #7
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r6, pc}
        .long   HammingWindowTbl_G723


