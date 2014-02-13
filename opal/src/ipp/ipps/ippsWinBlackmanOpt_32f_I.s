        .text
        .align  4
        .globl  _ippsWinBlackmanOpt_32f_I


_ippsWinBlackmanOpt_32f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r5, r1
        cmp     r5, #4
        mov     r4, r0
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r6, pc}
        sub     r0, r5, #1
        bl      __floatsidf
        mov     r2, r0
        ldr     r0, [pc, #0x4C]
        mov     r3, r1
        ldr     r1, [pc, #0x48]
        mov     r12, #0xFE, 12
        orr     r6, r12, #3, 4
        bl      __divdf3
        bl      cos
        mov     r2, r0
        mov     r3, r1
        mov     r1, r6
        mov     r0, #0
        bl      __divdf3
        mov     r2, r0
        eor     r3, r1, #2, 2
        bl      __muldf3
        bl      __truncdfsf2
        mov     r2, r0
        mov     r0, r4
        mov     r1, r5
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsWinBlackman_32f_I
        .long   0x54442d18
        .long   0x400921fb


