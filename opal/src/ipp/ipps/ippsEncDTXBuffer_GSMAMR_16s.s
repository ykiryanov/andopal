        .text
        .align  4
        .globl  _ippsEncDTXBuffer_GSMAMR_16s


_ippsEncDTXBuffer_GSMAMR_16s:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0xC
        ldr     r6, [sp, #0x1C]
        mov     r4, r0
        cmp     r4, #0
        mov     r0, r1
        mov     r5, r2
        beq     LDQK1
        cmp     r0, #0
        beq     LDQK1
        cmp     r5, #0
        beq     LDQK1
        cmp     r3, #0
        beq     LDQK1
        cmp     r6, #0
        beq     LDQK1
        ldrsh   r12, [r5]
        add     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #8
        moveq   r12, #0
        streqh  r12, [r5]
        strneh  r12, [r5]
        add     r12, r12, r12, lsl #2
        add     r1, r3, r12, lsl #2
        mov     r2, #0xA
        bl      _ippsCopy_16s
        mov     r3, sp
        mov     r0, r4
        mov     r2, #0
        mov     r1, #0xA0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r0, [sp]
        cmn     r0, #7, 2
        mvngt   r0, #2, 2
        bgt     LDQK0
        cmp     r0, #3, 2
        movge   r0, r0, lsl #1
        movlt   r0, #2, 2
LDQK0:
        add     r2, sp, #8
        add     r1, sp, #4
        str     r0, [sp]
        bl      ownLog2
        ldrsh   r1, [sp, #8]
        ldrsh   r0, [sp, #4]
        ldrsh   r5, [r5]
        mov     r2, r1, lsl #16
        mov     r1, #0x49
        orr     r1, r1, #0x21, 24
        mov     r2, r2, asr #21
        add     r0, r2, r0, lsl #10
        sub     r0, r0, r1
        mov     r5, r5, lsl #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #17
        strh    r0, [r6, +r5]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}
LDQK1:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r6, pc}


