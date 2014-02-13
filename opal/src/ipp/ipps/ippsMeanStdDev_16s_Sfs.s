        .text
        .align  4
        .globl  _ippsMeanStdDev_16s_Sfs


_ippsMeanStdDev_16s_Sfs:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x20]
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LBHY5
        cmp     r4, #0
        beq     LBHY5
        cmp     r5, #0
        beq     LBHY5
        cmp     r1, #2
        bge     LBHY0
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}
LBHY0:
        str     r12, [sp]
        add     r3, sp, #0xC
        add     r2, sp, #8
        mvn     r12, #0xFF
        bic     r6, r12, #0x7F, 24
        bl      _ippsMeanStdDev_16s32s_Sfs
        ldr     r1, [sp, #8]
        cmp     r1, #0
        blt     LBHY4
        mvn     r0, r6
        cmp     r1, r0
        movlt   r0, r1
LBHY1:
        ldr     r1, [sp, #0xC]
        strh    r0, [r5]
        cmp     r1, #0
        blt     LBHY3
        mvn     r6, r6
        cmp     r1, r6
        movlt   r6, r1
LBHY2:
        mov     r0, #0
        strh    r6, [r4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}
LBHY3:
        cmp     r1, r6
        movgt   r6, r1
        b       LBHY2
LBHY4:
        cmp     r1, r6
        mov     r0, r6
        movgt   r0, r1
        b       LBHY1
LBHY5:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}


