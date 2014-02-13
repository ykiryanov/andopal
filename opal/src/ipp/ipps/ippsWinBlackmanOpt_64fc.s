        .text
        .align  4
        .globl  _ippsWinBlackmanOpt_64fc


_ippsWinBlackmanOpt_64fc:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        mov     r6, r2
        cmp     r6, #4
        mov     r4, r0
        mov     r5, r1
        bge     LAKX0
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LAKX0:
        sub     r0, r6, #1
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [pc, #0x50]
        ldr     r1, [pc, #0x50]
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
        mov     r3, r0
        str     r1, [sp]
        mov     r0, r4
        mov     r2, r6
        mov     r1, r5
        bl      _ippsWinBlackman_64fc
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
        .long   0x54442d18
        .long   0x400921fb


