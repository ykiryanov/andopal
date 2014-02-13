        .text
        .align  4
        .globl  __aeabi_memclr8
        .globl  __aeabi_memclr4
        .globl  __aeabi_memclr
        .globl  __aeabi_memset8
        .globl  __aeabi_memset4
        .globl  __aeabi_memset


__aeabi_memclr:
__aeabi_memclr8:
__aeabi_memclr4:
        mov     r2, #0
__aeabi_memset:
__aeabi_memset8:
__aeabi_memset4:
        and     r2, r2, #0xFF
        orr     r2, r2, r2, lsl #8
        orr     r2, r2, r2, lsl #16
        mov     r3, r0
        tst     r3, #3
        beq     LAIT_Loop4
        strneb  r2, [r3], #1
        subnes  r1, r1, #1
        tstne   r3, #3
        strneb  r2, [r3], #1
        subnes  r1, r1, #1
        tstne   r3, #3
        strneb  r2, [r3], #1
        subne   r1, r1, #1
LAIT_Loop4:
        subs    r1, r1, #4
        strcs   r2, [r3], #4
        bcs     LAIT_Loop4
        adds    r1, r1, #4
        strneb  r2, [r3], #1
        subnes  r1, r1, #1
        tstne   r3, #3
        strneb  r2, [r3], #1
        subnes  r1, r1, #1
        tstne   r3, #3
        strneb  r2, [r3], #1
        bx      lr


