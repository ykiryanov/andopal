        .text
        .align  4
        .globl  __inixsc_init
        .globl  __inixsc_init_destroy_register_r4_r5_r6


__inixsc_init:
        stmdb   sp!, {r4 - r6, lr}
        bl      __inixsc_init_destroy_register_r4_r5_r6
        ldmia   sp!, {r4 - r6, pc}
__inixsc_init_destroy_register_r4_r5_r6:
        add     r0, r0, #3
        mov     r0, r0, lsr #2
        mov     r0, r0, lsl #2
LAEM_init_loop:
        ldr     r3, [r0], #4
        mov     r12, r3, lsr #24
        sub     r3, r3, r12, lsl #24
        cmp     r12, #0xFF
        moveq   r0, #0
        bxeq    lr
        cmp     r12, #6
        movhi   r0, #6
        bxhi    lr
        ldr     r12, [pc, +r12, lsl #2]
        add     pc, pc, r12
        andeq   r0, r0, r0, lsr #32
LAEM_CaseTable:
        andeq   r0, r0, r4, asr r0
        andeq   r0, r0, r0, ror r0
        andeq   r0, r0, r4, lsr #1
        andeq   r0, r0, r0, asr #1
        ldreqd  r0, [r0], -r4
        andeq   r0, r0, r8, lsl r0
LAEM_CaseXX:
        mvneq   r0, #0
        bxeq    lr
LAEM_Case00:
        ldr     r12, [r0], #4
        tst     r3, #3
        tsteq   r12, #3
        add     r12, r12, r2
        moveq   r3, r3, lsr #2
        beq     LAEM_Case01_loop
LAEM_Case00_loop:
        subs    r3, r3, #1
        ldrb    r4, [r0], #1
        strb    r4, [r12], #1
        bne     LAEM_Case00_loop
        add     r0, r0, #3
        bic     r0, r0, #3
        b       LAEM_init_loop
LAEM_Case01:
        .long   0xe490c004
        .long   0xe08cc002
LAEM_Case01_loop:
        subs    r3, r3, #1
        ldr     r4, [r0], #4
        str     r4, [r12], #4
        bne     LAEM_Case01_loop
        b       LAEM_init_loop
LAEM_Case02:
        .long   0xe490c004
        .long   0xe4904004
        .long   0xe3130003
        .long   0x031c0003
        .long   0x01844404
        .long   0x01844804
        .long   0x01a03123
        .long   0x0a000000
        .long   0xe08cc002
LAEM_Case02_loop:
        .long   0xe2533001
        .long   0xe4cc4001
        .long   0x1a000000
        .long   0xea000000
LAEM_Case03:
        .long   0xe490c004
        .long   0xe08cc002
        .long   0xe4904004
LAEM_Case03_loop:
        .long   0xe2533001
        .long   0xe48c4004
        .long   0x1a000000
        .long   0xea000000
LAEM_Case04:
        .long   0xe3510000
        .long   0x03e00000
        .long   0x012fff1e
        .long   0xe7912103
        .long   0xea000000
LAEM_Case05:
        .long   0xe1a06823
        .long   0xe0433806
        .long   0xe7916106
LAEM_Case05_loop:
        .long   0xe4904004
        .long   0xe0844002
        .long   0xe3140003
        .long   0x0594c000
        .long   0x008cc006
        .long   0x0584c000
        .long   0x0a000000
        .long   0xe5d4c000
        .long   0xe5d45001
        .long   0xe18cc405
        .long   0xe5d45002
        .long   0xe18cc805
        .long   0xe5d45003
        .long   0xe18ccc05
        .long   0xe08cc006
        .long   0xe5c4c000
        .long   0xe1a0c42c
        .long   0xe5c4c001
        .long   0xe1a0c42c
        .long   0xe5c4c002
        .long   0xe1a0c42c
        .long   0xe5c4c003
LAEM_Case05_Skip:
        .long   0xe2533001
        .long   0x1a000000
        .long   0xea000000


