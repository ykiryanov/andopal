        .text
        .align  4
        .globl  _ippsGetSizeMCRA_32s


LAAJ_$M357:
_ippsGetSizeMCRA_32s:
        movs    r3, r0
        addmi   r3, r3, #1
        mov     r3, r3, asr #1
        add     r3, r3, #1
        mov     r3, r3, lsl #2
        mov     r2, #5
        mul     r2, r3, r2
        mov     r0, #0
        add     r3, r2, #0x44
        str     r3, [r1]
        mov     pc, lr
LAAJ_$M358:


        .text
        .align  4
        .globl  _ippsInitMCRA_32s


_ippsInitMCRA_32s:
        stmdb   sp!, {r4 - r11, lr}
LAAJ_$M366:
        movs    r3, r1
        addmi   r3, r3, #1
        mov     r4, r2
        mov     lr, r3, asr #1
        str     r1, [r4, #4]
        add     r3, r4, #0x44
        str     r0, [r4]
        add     r2, lr, #1
        str     r3, [r4, #0x30]
        add     r3, r3, r2, lsl #2
        str     r3, [r4, #0x34]
        add     r3, r3, r2, lsl #2
        str     r3, [r4, #0x38]
        mov     r8, #0
        add     r3, r3, r2, lsl #2
        str     r8, [r4, #8]
        str     r3, [r4, #0x3C]
        mov     r1, lr
        b       LAAJ1
LAAJ0:
        ldr     r3, [r4, #8]
        mov     r1, r1, asr #1
        add     r3, r3, #1
        str     r3, [r4, #8]
LAAJ1:
        cmp     r1, #0
        bgt     LAAJ0
        mov     r3, #0xA, 18
        str     lr, [r4, #0x10]
        mov     r2, r0
        str     r3, [r4, #0x2C]
        mov     r3, r0, asr #31
        ldr     r0, [pc, #0x364]
        mov     r11, r3
        mul     r10, r11, r0
        mov     r1, r2
        umull   r9, r11, r1, r0
        mul     r9, r1, r0
        add     r0, r10, r11
        mov     r1, r0, lsl #16
        ldr     r0, [r4, #8]
        orr     r1, r1, r9, lsr #16
        sub     r0, r0, #1
        mov     r0, r1, asr r0
        mov     r1, #0x7D
        add     r0, r0, #1
        mov     r11, r0, asr #31
        mul     r10, r11, r1
        umull   r9, r11, r0, r1
        mul     r1, r0, r1
        add     r0, r10, r11
        mov     r0, r0, lsl #17
        orr     r1, r0, r1, lsr #15
        mov     r0, #0xFA, 18
        str     r1, [r4, #0x14]
        mov     r1, lr, asr #31
        mul     r11, r1, r0
        umull   r10, r1, lr, r0
        mul     r0, lr, r0
        add     r1, r11, r1
        ldr     lr, [pc, #0x2F0]
        ldr     r11, [lr]
        mov     lr, pc
        mov     pc, r11
        mov     lr, r0
        mov     r3, r0, asr #31
        mvn     r2, #0
        mul     r10, r0, r2
        ldr     r0, [pc, #0x2CC]
        mov     r11, r3
        mul     r9, r11, r0
        mov     r1, lr
        add     r11, r10, r9
        umull   r9, r10, r1, r0
        mul     r9, r1, r0
        add     r0, r11, r10
        mov     r1, r0, lsl #1
        orr     r0, r1, r9, lsr #31
        mov     r5, r0, asr #31
        mov     r10, r0
        mov     r1, r0
        mov     r11, r5
        mul     r9, r10, r5
        mul     r10, r11, r1
        add     r6, r0, #2, 18
        add     r11, r9, r10
        umull   r9, r10, r0, r1
        mul     r9, r0, r1
        add     r0, r11, r10
        mov     r0, r0, lsl #17
        orr     r0, r0, r9, lsr #15
        mov     r0, r0, asr #1
        mov     r10, r0
        mov     r11, r0, asr #31
        mul     r9, r10, r5
        mul     r10, r11, r1
        add     r6, r0, r6
        add     r11, r9, r10
        umull   r9, r10, r0, r1
        mul     r1, r0, r1
        add     r0, r11, r10
        mov     r0, r0, lsl #17
        orr     r1, r0, r1, lsr #15
        mov     r11, r1, asr #31
        ldr     r0, [pc, #0x238]
        mul     r10, r11, r0
        umull   r9, r11, r1, r0
        mul     r9, r1, r0
        add     r1, r10, r11
        mov     r1, r1, lsl #1
        orr     r1, r1, r9, lsr #31
        add     r1, r1, r6
        mov     r1, r1, lsl #16
        str     r1, [r4, #0x20]
        mov     r1, lr
        mul     r10, r1, r2
        ldr     r1, [pc, #0x204]
        mov     r11, r3
        mul     r9, r11, r1
        add     r11, r10, r9
        umull   r9, r10, lr, r1
        mul     r9, lr, r1
        add     r1, r11, r10
        mov     r1, r1, lsl #1
        orr     r1, r1, r9, lsr #31
        mov     r6, r1, asr #31
        mov     r10, r1
        mov     r5, r1
        mul     r9, r10, r6
        mov     r11, r6
        mul     r10, r11, r5
        add     r7, r1, #2, 18
        add     r11, r9, r10
        umull   r9, r10, r1, r5
        mul     r9, r1, r5
        add     r1, r11, r10
        mov     r1, r1, lsl #17
        orr     r1, r1, r9, lsr #15
        mov     r1, r1, asr #1
        mov     r10, r1
        mov     r11, r1, asr #31
        mul     r9, r10, r6
        mul     r10, r11, r5
        add     r7, r1, r7
        add     r11, r9, r10
        umull   r9, r10, r1, r5
        mul     r9, r1, r5
        add     r1, r11, r10
        mov     r1, r1, lsl #17
        orr     r1, r1, r9, lsr #15
        mov     r11, r1, asr #31
        mul     r10, r11, r0
        umull   r9, r11, r1, r0
        mul     r9, r1, r0
        add     r1, r10, r11
        mov     r1, r1, lsl #1
        orr     r1, r1, r9, lsr #31
        add     r1, r1, r7
        mov     r1, r1, lsl #16
        str     r1, [r4, #0x28]
        mov     r1, lr
        mul     r2, r1, r2
        ldr     r1, [pc, #0x148]
        mul     r11, r3, r1
        add     r3, r2, r11
        umull   r11, r2, lr, r1
        mul     r11, lr, r1
        add     r1, r3, r2
        mov     r3, r1, lsl #1
        orr     r1, r3, r11, lsr #31
        mov     r3, r1, asr #31
        mov     r10, r1
        mov     r2, r1
        mov     r11, r3
        mul     r9, r10, r3
        mul     r10, r11, r2
        add     lr, r1, #2, 18
        add     r11, r9, r10
        umull   r9, r10, r1, r2
        mul     r9, r1, r2
        add     r1, r11, r10
        mov     r1, r1, lsl #17
        orr     r1, r1, r9, lsr #15
        mov     r1, r1, asr #1
        mov     r10, r1
        mov     r11, r1, asr #31
        mul     r3, r10, r3
        add     lr, r1, lr
        mul     r10, r11, r2
        add     r3, r3, r10
        str     r8, [r4, #0x18]
        umull   r10, r11, r1, r2
        mul     r2, r1, r2
        add     r1, r3, r11
        mov     r3, r1, lsl #17
        orr     r1, r3, r2, lsr #15
        mov     r3, r1, asr #31
        mul     r2, r3, r0
        umull   r11, r3, r1, r0
        mul     r11, r1, r0
        add     r0, r2, r3
        mov     r3, r0, lsl #1
        orr     r3, r3, r11, lsr #31
        add     r3, r3, lr
        mov     r0, r3, lsl #16
        mov     r2, r0, asr #31
        mov     lr, r0
        mov     r3, r2
        mul     r2, lr, r2
        mov     r1, r0
        mul     lr, r3, r1
        add     r3, r2, lr
        umull   lr, r2, r0, r1
        mul     r1, r0, r1
        add     r0, r3, r2
        mov     r3, r0, lsl #1
        orr     r0, r3, r1, lsr #31
        mov     r2, r0, asr #31
        mov     lr, r0
        mov     r3, r2
        mul     r2, lr, r2
        mov     r1, r0
        mul     lr, r3, r1
        add     r3, r2, lr
        umull   lr, r2, r0, r1
        mul     r1, r0, r1
        add     r0, r3, r2
        mov     r3, r0, lsl #1
        orr     r0, r3, r1, lsr #31
        mov     r2, r0, asr #31
        mov     lr, r0
        mov     r3, r2
        mov     r1, r0
        mul     r2, lr, r2
        mul     lr, r3, r1
        add     r3, r2, lr
        umull   lr, r2, r0, r1
        mul     r1, r0, r1
        add     r0, r3, r2
        mov     r3, r0, lsl #1
        orr     r3, r3, r1, lsr #31
        mov     r0, #0
        str     r3, [r4, #0x24]
        mov     r3, #1
        str     r3, [r4, #0x1C]
        ldmia   sp!, {r4 - r11, pc}
        .long   0xe63fbe08
        .long   0xe3700838
        .long   0x2aaaaaab
        .long   0xd25879b6
        .long   __imp___rt_sdiv64by64
        .long   0x010624dd
LAAJ_$M367:


        .data
        .align  4


LAAJ_$T359:
        .long   _ippsGetSizeMCRA_32s
        .byte   0x00,0x0B,0x00,0x40


        .data
        .align  4


LAAJ_$T368:
        .long   _ippsInitMCRA_32s
        .byte   0x01,0xFB,0x00,0x40


