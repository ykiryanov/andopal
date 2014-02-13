        .text
        .align  4
        .globl  _ippsDecDTXBuffer_AMRWB_16s


_ippsDecDTXBuffer_AMRWB_16s:
        stmdb   sp!, {r4, r5, lr}
        ldr     r4, [sp, #0xC]
        cmp     r0, #0
        mov     r5, r2
        beq     LDLQ0
        cmp     r1, #0
        beq     LDLQ0
        cmp     r5, #0
        beq     LDLQ0
        cmp     r3, #0
        beq     LDLQ0
        cmp     r4, #0
        bne     LDLQ1
LDLQ0:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
LDLQ1:
        mov     r2, r5
        bl      LDLQ_ownBuffer
        ldrsh   r5, [r5]
        sub     r0, r0, #1, 22
        mov     r5, r5, lsl #1
        strh    r0, [r4, +r5]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LDLQ_ownBuffer:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x14
        ldrsh   r12, [r2]
        mov     r4, r0
        mov     r0, r1
        add     r12, r12, #1
        mov     r5, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #8
        moveq   r12, #0
        streqh  r12, [r2]
        strneh  r12, [r2]
        add     r1, r3, r12, lsl #5
        mov     r2, #0x10
        bl      _ippsCopy_16s
        add     r3, sp, #8
        str     r5, [sp]
        mov     r0, r4
        mov     r1, r4
        mov     r2, #1, 24
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r0, [sp, #8]
        add     r2, sp, #0x10
        add     r1, sp, #0xC
        bl      ownLog2
        ldrsh   r1, [sp, #0x10]
        ldrsh   r0, [sp, #0xC]
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #24
        add     r0, r1, r0, lsl #7
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        add     sp, sp, #0x14
        ldmia   sp!, {r4, r5, pc}


