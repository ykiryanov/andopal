        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729_16s


_ippsToeplizMatrix_G729_16s:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x9B, 28
        mov     r2, sp
        and     r2, r2, #0xF
        rsb     r3, r2, #0
        mov     r2, sp
        and     r3, r3, #0xF
        cmp     r0, #0
        mov     r4, r1
        add     r5, r2, r3
        beq     LDPE0
        cmp     r4, #0
        beq     LDPE0
        mov     r1, r5
        bl      _ippsToeplizMatrix_G729_16s32s
        mov     r0, r5
        mov     r1, r4
        mov     r3, #0xF
        mov     r2, #0x9A, 30
        bl      ownConvert_32s16s_sfs
        mov     r0, #0
        add     sp, sp, #0x9B, 28
        ldmia   sp!, {r4, r5, pc}
LDPE0:
        mvn     r0, #7
        add     sp, sp, #0x9B, 28
        ldmia   sp!, {r4, r5, pc}


