        .text
        .align  4
        .globl  _ippiSubSAD8x8_8u16s_C1R


_ippiSubSAD8x8_8u16s_C1R:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        ldr     r4, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        cmp     r0, #0
        beq     LEFE0
        cmp     r2, #0
        beq     LEFE0
        cmp     r4, #0
        beq     LEFE0
        str     r12, [sp, #8]
        str     lr, [sp, #4]
        str     r4, [sp]
        bl      ownvc_SubSAD8x8_8u16s_C1R
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LEFE0:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}


