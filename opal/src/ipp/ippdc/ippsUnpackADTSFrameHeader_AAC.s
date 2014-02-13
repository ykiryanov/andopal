        .text
        .align  4
        .globl  _ippsUnpackADTSFrameHeader_AAC


_ippsUnpackADTSFrameHeader_AAC:
        stmdb   sp!, {r1, r4, r5, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        beq     LGFH1
        cmp     r5, #0
        beq     LGFH1
        ldr     r2, [r4]
        cmp     r2, #0
        beq     LGFH1
        mov     r2, #0
        str     r2, [sp]
        mov     r1, sp
        mov     r2, #0xC
        mov     r0, r4
        bl      ownsGetBits_AAC
        mov     r1, sp
        mov     r2, #1
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #2
        bl      ownsGetBits_AAC
        str     r0, [r5, #4]
        mov     r1, sp
        mov     r2, #1
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5, #8]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #2
        bl      ownsGetBits_AAC
        str     r0, [r5, #0xC]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x10]
        mov     r1, sp
        mov     r2, #1
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x14]
        mov     r1, sp
        mov     r2, #3
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x18]
        mov     r1, sp
        mov     r2, #1
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x1C]
        mov     r1, sp
        mov     r2, #1
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x20]
        mov     r1, sp
        mov     r2, #1
        mov     r0, r4
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x28]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x2C]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #0xD
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x30]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #0xB
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x34]
        mov     r1, sp
        mov     r0, r4
        mov     r2, #2
        bl      ownsGetBits_AAC
        ldr     r2, [r5, #8]
        add     r0, r0, #1
        cmp     r2, #0
        str     r0, [r5, #0x38]
        bne     LGFH0
        mov     r1, sp
        mov     r0, r4
        mov     r2, #0x10
        bl      ownsGetBits_AAC
        str     r0, [r5, #0x3C]
LGFH0:
        mov     r0, #0
        ldmia   sp!, {r1, r4, r5, pc}
LGFH1:
        mvn     r0, #7
        ldmia   sp!, {r1, r4, r5, pc}


