        .text
        .align  4
        .globl  _ippsHighPassFilterSetDlyLine_AMRWB_16s


_ippsHighPassFilterSetDlyLine_AMRWB_16s:
        cmp     r1, #0
        beq     LDJL2
        cmp     r0, #0
        beq     LDJL2
        cmp     r2, #2
        blt     LDJL0
        cmp     r2, #3
        bgt     LDJL0
        cmp     r2, #2
        ldrsh   r2, [r0]
        beq     LDJL1
        strh    r2, [r1, #0x1A]
        ldrsh   r2, [r0, #2]
        strh    r2, [r1, #0x14]
        ldrsh   r2, [r0, #4]
        strh    r2, [r1, #0x18]
        ldrsh   r2, [r0, #6]
        strh    r2, [r1, #0x12]
        ldrsh   r2, [r0, #8]
        strh    r2, [r1, #0x16]
        ldrsh   r2, [r0, #0xA]
        strh    r2, [r1, #0x10]
        ldrsh   r2, [r0, #0xC]
        strh    r2, [r1, #0x1C]
        ldrsh   r2, [r0, #0xE]
        strh    r2, [r1, #0x1E]
        ldrsh   r0, [r0, #0x10]
        strh    r0, [r1, #0x20]
        mov     r0, #0
        bx      lr
LDJL0:
        mvn     r0, #6
        bx      lr
LDJL1:
        strh    r2, [r1, #0x18]
        ldrsh   r2, [r0, #2]
        strh    r2, [r1, #0x12]
        ldrsh   r2, [r0, #4]
        strh    r2, [r1, #0x16]
        ldrsh   r2, [r0, #6]
        strh    r2, [r1, #0x10]
        ldrsh   r2, [r0, #8]
        strh    r2, [r1, #0x1C]
        ldrsh   r0, [r0, #0xA]
        strh    r0, [r1, #0x1E]
        mov     r0, #0
        bx      lr
LDJL2:
        mvn     r0, #7
        bx      lr


