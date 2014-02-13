        .text
        .align  4
        .globl  _ippsLevinsonDurbin_G729B


_ippsLevinsonDurbin_G729B:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x40
        add     r12, sp, #8
        and     r12, r12, #0x1F
        mov     r4, r2
        rsb     r12, r12, #0
        add     r5, sp, #8
        and     r7, r12, #0x1F
        cmp     r4, #0
        mov     r2, r1
        add     r6, r5, r7
        beq     LDPM0
        str     r3, [sp]
        mov     r3, r6
        mov     r1, #0xA
        bl      _ippsLevinsonDurbin_G729_32s16s
        ldrsh   r5, [r7, +r5]
        ldrsh   r6, [r6, #2]
        strh    r5, [r4]
        strh    r6, [r4, #2]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r7, pc}
LDPM0:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r7, pc}


