        .text
        .align  4
        .globl  _ippsUnpackFrameHeader_MP3


_ippsUnpackFrameHeader_MP3:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LGDL1
        cmp     r1, #0
        beq     LGDL1
        ldr     r4, [r0]
        cmp     r4, #0
        beq     LGDL1
        ldrb    r5, [r4, #2]
        ldrb    r2, [r4, #1]
        ldrb    r3, [r4, #3]
        mov     r8, r5, lsr #1
        and     r8, r8, #1
        mov     r7, r2, lsr #1
        and     r7, r7, #3
        mov     r6, r2, lsr #3
        str     r7, [r1, #4]
        str     r8, [r1, #0x14]
        mov     r7, r5, lsr #2
        mov     r8, r5, lsr #4
        and     r6, r6, #1
        and     r5, r5, #1
        str     r6, [r1]
        str     r5, [r1, #0x18]
        mov     r12, r3, lsr #2
        mov     lr, r3, lsr #3
        mov     r6, r3, lsr #4
        mov     r5, r3, lsr #6
        and     r3, r3, #3
        ands    r2, r2, #1
        and     r7, r7, #3
        and     r8, r8, #0xF
        and     r12, r12, #1
        and     lr, lr, #1
        and     r6, r6, #3
        and     r5, r5, #3
        str     r3, [r1, #0x2C]
        str     r2, [r1, #8]
        str     r7, [r1, #0x10]
        str     r8, [r1, #0xC]
        str     r12, [r1, #0x28]
        str     lr, [r1, #0x24]
        str     r6, [r1, #0x20]
        str     r5, [r1, #0x1C]
        add     r3, r4, #4
        bne     LGDL0
        ldrb    r12, [r4, #4]
        ldrb    r2, [r4, #5]
        add     r3, r4, #6
        orr     r12, r2, r12, lsl #8
        str     r12, [r1, #0x30]
LGDL0:
        str     r3, [r0]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LGDL1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


