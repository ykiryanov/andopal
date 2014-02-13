        .text
        .align  4
        .globl  _ipps_initTabDct_Dir_64f


_ipps_initTabDct_Dir_64f:
        stmdb   sp!, {r4 - r8, lr}
        mov     r7, r1
        mov     r6, r0, lsl #2
        mov     r0, r6
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [pc, #0x4C]
        ldr     r1, [pc, #0x4C]
        bl      __divdf3
        cmp     r6, #0
        mov     r5, r0
        mov     r4, r1
        ble     LCTP1
        sub     r8, r7, #4
        mov     r7, #0
LCTP0:
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      cos
        add     r7, r7, #1
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        cmp     r7, r6
        blt     LCTP0
LCTP1:
        ldmia   sp!, {r4 - r8, pc}
        .long   0x54442d18
        .long   0x401921fb


