        .text
        .align  4
        .globl  _ippsUnpackADIFHeader_AAC


_ippsUnpackADIFHeader_AAC:
        stmdb   sp!, {r1, r4 - r10, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        mov     r8, r3
        beq     LGFI6
        cmp     r6, #0
        beq     LGFI6
        cmp     r5, #0
        beq     LGFI6
        ldr     r12, [r4]
        cmp     r12, #0
        beq     LGFI6
        cmp     r8, #1
        blt     LGFI5
        cmp     r8, #0x10
        bgt     LGFI5
        mov     r1, sp
        mov     r7, #0
        str     r7, [sp]
        mov     r0, r4
        mov     r2, #0x10
        bl      ownsGetBits_AAC
        mov     r2, r0
        mov     r1, sp
        mov     r2, r2, lsl #16
        str     r2, [r6]
        mov     r0, r4
        mov     r2, #0x10
        bl      ownsGetBits_AAC
        ldr     r12, [r6]
        mov     r1, sp
        orr     r0, r12, r0
        str     r0, [r6]
        mov     r0, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r6, #4]
        beq     LGFI1
        add     r10, r6, #0x5B
        mov     r9, #9
LGFI0:
        mov     r1, sp
        mov     r0, r4
        mov     r2, #8
        bl      ownsGetBits_AAC
        strb    r0, [r10, #1]!
        subs    r9, r9, #1
        bne     LGFI0
LGFI1:
        mov     r1, sp
        mov     r0, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        mov     r1, sp
        str     r0, [r6, #8]
        mov     r0, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        mov     r1, sp
        str     r0, [r6, #0xC]
        mov     r0, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        mov     r1, sp
        str     r0, [r6, #0x10]
        mov     r0, r4
        mov     r2, #0x17
        bl      ownsGetBits_AAC
        mov     r1, sp
        str     r0, [r6, #0x14]
        mov     r0, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        add     r0, r0, #1
        cmp     r0, r8
        str     r0, [r6, #0x18]
        bgt     LGFI5
        cmp     r0, #0
        ble     LGFI4
        mov     r8, r6
LGFI2:
        ldr     r3, [r6, #0x10]
        cmp     r3, #0
        bne     LGFI3
        mov     r1, sp
        mov     r0, r4
        mov     r2, #0x14
        bl      ownsGetBits_AAC
        str     r0, [r8, #0x1C]
LGFI3:
        mov     r1, sp
        mov     r2, r5
        mov     r0, r4
        bl      _ippsDecodePrgCfgElt_AAC
        ldr     r3, [r6, #0x18]
        add     r7, r7, #1
        add     r8, r8, #4
        cmp     r7, r3
        add     r5, r5, #0xDD, 30
        blt     LGFI2
LGFI4:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r10, pc}
LGFI5:
        mvn     r0, #0xA6
        ldmia   sp!, {r1, r4 - r10, pc}
LGFI6:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r10, pc}


