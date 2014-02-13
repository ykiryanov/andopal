        .text
        .align  4
        .globl  _ippsHighPassFilterGetDlyLine_AMRWB_16s


_ippsHighPassFilterGetDlyLine_AMRWB_16s:
        cmp     r0, #0
        beq     LDJO2
        cmp     r1, #0
        beq     LDJO2
        cmp     r2, #2
        blt     LDJO0
        cmp     r2, #3
        bgt     LDJO0
        cmp     r2, #2
        beq     LDJO1
        ldrsh   r2, [r0, #0x1A]
        strh    r2, [r1]
        ldrsh   r2, [r0, #0x14]
        strh    r2, [r1, #2]
        ldrsh   r2, [r0, #0x18]
        strh    r2, [r1, #4]
        ldrsh   r2, [r0, #0x12]
        strh    r2, [r1, #6]
        ldrsh   r2, [r0, #0x16]
        strh    r2, [r1, #8]
        ldrsh   r2, [r0, #0x10]
        strh    r2, [r1, #0xA]
        ldrsh   r2, [r0, #0x1C]
        strh    r2, [r1, #0xC]
        ldrsh   r2, [r0, #0x1E]
        strh    r2, [r1, #0xE]
        ldrsh   r0, [r0, #0x20]
        strh    r0, [r1, #0x10]
        mov     r0, #0
        bx      lr
LDJO0:
        mvn     r0, #6
        bx      lr
LDJO1:
        ldrsh   r2, [r0, #0x18]
        strh    r2, [r1]
        ldrsh   r2, [r0, #0x12]
        strh    r2, [r1, #2]
        ldrsh   r2, [r0, #0x16]
        strh    r2, [r1, #4]
        ldrsh   r2, [r0, #0x10]
        strh    r2, [r1, #6]
        ldrsh   r2, [r0, #0x1C]
        strh    r2, [r1, #8]
        ldrsh   r0, [r0, #0x1E]
        strh    r0, [r1, #0xA]
        mov     r0, #0
        bx      lr
LDJO2:
        mvn     r0, #7
        bx      lr


