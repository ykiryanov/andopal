        .text
        .align  4
        .globl  _ippsLevinsonDurbin_GSMAMR_32s16s


_ippsLevinsonDurbin_GSMAMR_32s16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x3C
        mov     r2, sp
        and     r2, r2, #0x1F
        rsb     r3, r2, #0
        mov     r2, sp
        and     r3, r3, #0x1F
        cmp     r0, #0
        add     r2, r2, r3
        beq     LDOR0
        cmp     r1, #0
        beq     LDOR0
        add     r3, sp, #0x38
        mov     lr, #0
        strh    lr, [sp, #0x38]
        bl      _ippsLevinsonDurbin_G729B
        add     sp, sp, #0x3C
        ldr     pc, [sp], #4
LDOR0:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldr     pc, [sp], #4


