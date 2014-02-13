        .text
        .align  4
        .globl  _ippsAdaptiveCodebookDecode_AMRWBE_16s


_ippsAdaptiveCodebookDecode_AMRWBE_16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0x24
        ldr     r5, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
        ldr     r4, [sp, #0x44]
        ldr     r12, [sp, #0x48]
        cmp     r1, #0
        beq     LDMD3
        cmp     r2, #0
        beq     LDMD3
        cmp     r3, #0
        beq     LDMD3
        cmp     r5, #0
        beq     LDMD3
        cmp     lr, #0
        blt     LDMD2
        cmp     lr, #3
        bgt     LDMD2
        cmn     r12, #0x11
        blt     LDMD0
        cmp     r12, #0x11
        ble     LDMD1
LDMD0:
        mvn     r0, #6
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r8, pc}
LDMD1:
        mov     r6, #0
        str     r6, [sp, #0x20]
        str     r12, [sp, #0x18]
        mov     r12, #0x1A
        str     r12, [sp, #0x10]
        add     r8, sp, #0x20
        str     r8, [sp, #0x14]
        ldr     r12, [sp, #0x20]
        str     lr, [sp, #4]
        str     r4, [sp, #8]
        str     r12, [sp, #0xC]
        str     r5, [sp]
        bl      ownAdaptiveCodebookDecode_WB_WBE
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r8, pc}
LDMD2:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r8, pc}
LDMD3:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r8, pc}


