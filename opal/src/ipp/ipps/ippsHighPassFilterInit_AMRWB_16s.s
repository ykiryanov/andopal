        .text
        .align  4
        .globl  _ippsHighPassFilterInit_AMRWB_16s


_ippsHighPassFilterInit_AMRWB_16s:
        cmp     r0, #0
        beq     LDJM3
        cmp     r1, #0
        beq     LDJM3
        cmp     r3, #0
        beq     LDJM3
        cmp     r2, #2
        blt     LDJM0
        cmp     r2, #3
        bgt     LDJM0
        cmp     r2, #3
        mov     r12, #0
        beq     LDJM2
        cmp     r2, #2
        movne   r0, #0
        bxne    lr
        b       LDJM1
LDJM0:
        mvn     r0, #6
        bx      lr
LDJM1:
        strh    r12, [r3, #0x10]
        strh    r12, [r3, #0x16]
        strh    r12, [r3, #0x12]
        strh    r12, [r3, #0x18]
        strh    r12, [r3, #0x1C]
        strh    r12, [r3, #0x1E]
        ldrsh   r2, [r0]
        strh    r2, [r3]
        ldrsh   r2, [r0, #2]
        strh    r2, [r3, #2]
        ldrsh   r0, [r0, #4]
        strh    r0, [r3, #4]
        ldrsh   r0, [r1]
        strh    r0, [r3, #8]
        ldrsh   r0, [r1, #2]
        strh    r0, [r3, #0xA]
        ldrsh   r1, [r1, #4]
        strh    r1, [r3, #0xC]
        mov     r0, #0
        bx      lr
LDJM2:
        strh    r12, [r3, #0x10]
        strh    r12, [r3, #0x16]
        strh    r12, [r3, #0x12]
        strh    r12, [r3, #0x18]
        strh    r12, [r3, #0x14]
        strh    r12, [r3, #0x1A]
        strh    r12, [r3, #0x1C]
        strh    r12, [r3, #0x1E]
        strh    r12, [r3, #0x20]
        str     r12, [r3, #0x24]
        ldrsh   r2, [r0]
        strh    r2, [r3]
        ldrsh   r2, [r0, #2]
        strh    r2, [r3, #2]
        ldrsh   r2, [r0, #4]
        strh    r2, [r3, #4]
        ldrsh   r0, [r0, #6]
        strh    r0, [r3, #6]
        ldrsh   r0, [r1]
        strh    r0, [r3, #8]
        ldrsh   r0, [r1, #2]
        strh    r0, [r3, #0xA]
        ldrsh   r0, [r1, #4]
        strh    r0, [r3, #0xC]
        ldrsh   r1, [r1, #6]
        strh    r1, [r3, #0xE]
        mov     r0, #0
        bx      lr
LDJM3:
        mvn     r0, #7
        bx      lr


