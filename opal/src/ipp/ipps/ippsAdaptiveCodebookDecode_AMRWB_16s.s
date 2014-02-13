        .text
        .align  4
        .globl  _ippsAdaptiveCodebookDecode_AMRWB_16s


_ippsAdaptiveCodebookDecode_AMRWB_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x20
        ldr     r7, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        ldr     r5, [sp, #0x44]
        ldr     r4, [sp, #0x48]
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
        mov     r8, r2
        cmp     r1, #0
        mov     r2, r3
        beq     LDMC2
        cmp     r8, #0
        beq     LDMC2
        cmp     r2, #0
        beq     LDMC2
        cmp     r7, #0
        beq     LDMC2
        cmp     r12, #0
        beq     LDMC2
        cmp     r6, #0
        blt     LDMC0
        cmp     r6, #3
        bgt     LDMC0
        cmp     lr, #5
        beq     LDMC1
        cmp     lr, #9
        beq     LDMC1
        cmp     lr, #0xD
        beq     LDMC1
        cmp     lr, #0xF
        beq     LDMC1
        cmp     lr, #0x10
        beq     LDMC1
        cmp     lr, #0x12
        beq     LDMC1
        cmp     lr, #0x13
        beq     LDMC1
        cmp     lr, #0x14
        beq     LDMC1
        cmp     lr, #0x15
        beq     LDMC1
        cmp     lr, #0x19
        beq     LDMC1
        mvn     r0, #6
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r9, pc}
LDMC0:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r9, pc}
LDMC1:
        ldrsh   r9, [r12, #0x16]
        mov     r3, r1
        strh    r9, [r2]
        str     r12, [sp, #0x14]
        mov     r12, #0
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x18]
        str     r4, [sp, #0xC]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
        mov     r1, r8
        bl      ownAdaptiveCodebookDecode_WB_WBE
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r9, pc}
LDMC2:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r9, pc}


