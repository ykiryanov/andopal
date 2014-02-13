        .text
        .align  4
        .globl  _ippsWinBlackmanOpt_64f_I


_ippsWinBlackmanOpt_64f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r4, r1
        cmp     r4, #4
        mov     r5, r0
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r6, pc}
        sub     r0, r4, #1
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [pc, #0x48]
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
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsWinBlackman_64f_I
        .long   0x54442d18
        .long   0x400921fb


