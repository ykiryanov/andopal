        .text
        .align  4
        .globl  _ippsWinBlackmanOpt_16sc


_ippsWinBlackmanOpt_16sc:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r2
        cmp     r6, #4
        mov     r4, r0
        mov     r5, r1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r7, pc}
        sub     r0, r6, #1
        bl      __floatsidf
        mov     r2, r0
        ldr     r0, [pc, #0x50]
        mov     r3, r1
        ldr     r1, [pc, #0x4C]
        mov     r12, #0xFE, 12
        orr     r7, r12, #3, 4
        bl      __divdf3
        bl      cos
        mov     r2, r0
        mov     r3, r1
        mov     r1, r7
        mov     r0, #0
        bl      __divdf3
        mov     r2, r0
        eor     r3, r1, #2, 2
        bl      __muldf3
        bl      __truncdfsf2
        mov     r3, r0
        mov     r0, r4
        mov     r2, r6
        mov     r1, r5
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsWinBlackman_16sc
        .long   0x54442d18
        .long   0x400921fb


