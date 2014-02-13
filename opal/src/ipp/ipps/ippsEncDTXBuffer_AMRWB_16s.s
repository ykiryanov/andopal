        .text
        .align  4
        .globl  _ippsEncDTXBuffer_AMRWB_16s


_ippsEncDTXBuffer_AMRWB_16s:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r4, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        cmp     r0, #0
        mov     r5, r2
        beq     LDLP1
        cmp     r1, #0
        beq     LDLP1
        cmp     r5, #0
        beq     LDLP1
        cmp     r3, #0
        beq     LDLP1
        cmp     r4, #0
        beq     LDLP1
        cmp     r6, #5
        beq     LDLP0
        cmp     r6, #9
        beq     LDLP0
        cmp     r6, #0xD
        beq     LDLP0
        cmp     r6, #0xF
        beq     LDLP0
        cmp     r6, #0x10
        beq     LDLP0
        cmp     r6, #0x12
        beq     LDLP0
        cmp     r6, #0x13
        beq     LDLP0
        cmp     r6, #0x14
        beq     LDLP0
        cmp     r6, #0x15
        beq     LDLP0
        cmp     r6, #0x19
        mvnne   r0, #6
        ldmneia sp!, {r4 - r7, pc}
LDLP0:
        mov     r2, r5
        bl      LDLP_ownBuffer
        mov     r7, r0
        mov     r0, r6
        bl      LDLP_ownGetEnAdjast
        ldrsh   r5, [r5]
        sub     r7, r7, #1, 22
        sub     r7, r7, r0
        mov     r5, r5, lsl #1
        mov     r0, #0
        strh    r7, [r4, +r5]
        ldmia   sp!, {r4 - r7, pc}
LDLP1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
LDLP_ownBuffer:
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
LDLP_ownGetEnAdjast:
        subs    r0, r0, #0x10
        moveq   r0, #0x7A
        bxeq    lr
        adds    r0, r0, #1
        moveq   r0, #0x80
        bxeq    lr
        adds    r0, r0, #2
        moveq   r0, #0x8D
        bxeq    lr
        adds    r0, r0, #4
        moveq   r0, #0xB3
        bxeq    lr
        adds    r0, r0, #4
        moveq   r0, #0xE6
        bxeq    lr
        movne   r0, #0x73
        bxne    lr


