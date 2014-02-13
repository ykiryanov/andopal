        .text
        .align  4
        .globl  _ippsSub_32sc_Sfs


_ippsSub_32sc_Sfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r3, #0
        ble     LASU0
        mov     r3, r3, lsl #1
        str     r12, [sp]
        bl      _ippsSub_32s_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4
LASU0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4


