        .text
        .align  4
        .globl  _ippsHighPassFilterInit_G729


_ippsHighPassFilterInit_G729:
        cmp     r0, #0
        beq     LDUF0
        cmp     r1, #0
        beq     LDUF0
        mov     r2, #0
        str     r2, [r1, #4]
        str     r2, [r1]
        strh    r2, [r1, #8]
        strh    r2, [r1, #0xA]
        ldrsh   r2, [r0]
        strh    r2, [r1, #0xC]
        ldrsh   r2, [r0, #2]
        strh    r2, [r1, #0xE]
        ldrsh   r2, [r0, #4]
        strh    r2, [r1, #0x10]
        ldrsh   r2, [r0, #6]
        strh    r2, [r1, #0x12]
        ldrsh   r2, [r0, #8]
        strh    r2, [r1, #0x14]
        ldrsh   r2, [r0, #0xA]
        mov     r0, #0
        strh    r2, [r1, #0x16]
        bx      lr
LDUF0:
        mvn     r0, #7
        bx      lr


