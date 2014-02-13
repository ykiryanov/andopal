        .text
        .align  4
        .globl  _ippsSub_32f_I


_ippsSub_32f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LAUF2
        cmp     r4, #0
        beq     LAUF2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #0
        sub     r6, r2, #1
        beq     LAUF1
LAUF0:
        ldr     r0, [r4]
        ldr     r1, [r5], #4
        sub     r6, r6, #1
        bl      __subsf3
        str     r0, [r4], #4
        cmn     r6, #1
        bne     LAUF0
LAUF1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LAUF2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


