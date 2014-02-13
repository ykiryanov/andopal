        .text
        .align  4
        .globl  ftp8
        .globl  __intel_ftp8


ftp8:
__intel_ftp8:
        mov     r2, r1, lsr #31
        mov     r2, r2, lsl #31
        mov     r1, r1, lsl #1
        movs    r3, r1, lsr #21
        mov     r1, r1, lsl #11
        bne     LAEN_NotZero
        orrs    r1, r1, r0
        moveq   r0, #1
        movne   r0, #4
        orr     r0, r0, r2
        bx      lr
LAEN_NotZero:
        ldr     r12, [pc, #0x24]
        cmp     r3, r12
        bne     LAEN_NormalDouble
        orrs    r1, r1, r0
        moveq   r0, #8
        movne   r0, #0x10
        orr     r0, r0, r2
        bx      lr
LAEN_NormalDouble:
        mov     r0, #2
        orr     r0, r0, r2
        bx      lr
        .long   0x000007ff


