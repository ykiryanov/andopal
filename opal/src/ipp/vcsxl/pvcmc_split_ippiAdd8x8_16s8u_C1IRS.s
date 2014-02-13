        .text
        .align  4
        .globl  _ippiAdd8x8_16s8u_C1IRS


_ippiAdd8x8_16s8u_C1IRS:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LEOG0
        cmp     r2, #0
        beq     LEOG0
        bl      ownvc_Add8x8_16s8u_C1IRS
        mov     r0, #0
        ldr     pc, [sp], #4
LEOG0:
        mvn     r0, #7
        ldr     pc, [sp], #4


