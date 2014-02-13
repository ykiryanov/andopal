        .text
        .align  4
        .globl  __intel_memset


__intel_memset:
        and     r1, r1, #0xFF
        orr     r1, r1, r1, lsl #8
        orr     r1, r1, r1, lsl #16
        mov     r3, r0
        tst     r3, #3
        beq     LAHU_Loop4
        strneb  r1, [r3], #1
        subnes  r2, r2, #1
        tstne   r3, #3
        strneb  r1, [r3], #1
        subnes  r2, r2, #1
        tstne   r3, #3
        strneb  r1, [r3], #1
        subne   r2, r2, #1
LAHU_Loop4:
        subs    r2, r2, #4
        strcs   r1, [r3], #4
        bcs     LAHU_Loop4
        adds    r2, r2, #4
        strneb  r1, [r3], #1
        subnes  r2, r2, #1
        tstne   r3, #3
        strneb  r1, [r3], #1
        subnes  r2, r2, #1
        tstne   r3, #3
        strneb  r1, [r3], #1
        bx      lr


