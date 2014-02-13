        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729A_32s16s


_ippsFixedCodebookSearch_G729A_32s16s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LDVH0
        cmp     r4, #0
        beq     LDVH0
        cmp     r7, #0
        beq     LDVH0
        cmp     r6, #0
        beq     LDVH0
        mov     r1, r4
        mov     r0, #0xF
        mov     r2, #0x9A, 30
        bl      _ippsRShiftC_32s_I
        mov     r0, r5
        mov     r3, r6
        mov     r2, r7
        mov     r1, r4
        bl      ownFixedCodebookSearch_G729A_32s16s
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDVH0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


