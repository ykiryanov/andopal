        .text
        .align  4
        .globl  _ippsAddC_64fc_I


_ippsAddC_64fc_I:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x10
        str     r0, [sp]
        ldr     r9, [sp, #0x2C]
        str     r1, [sp, #4]
        ldr     r0, [sp, #0x30]
        str     r2, [sp, #8]
        cmp     r9, #0
        str     r3, [sp, #0xC]
        beq     LDDC3
        cmp     r0, #0
        ble     LDDC2
        cmp     r0, #0
        sub     r8, r0, #1
        beq     LDDC1
        ldr     r7, [sp]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r4, [sp, #0xC]
LDDC0:
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        str     r0, [r9]
        str     r1, [r9, #4]
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        sub     r8, r8, #1
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        cmn     r8, #1
        add     r9, r9, #0x10
        bne     LDDC0
LDDC1:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r9, pc}
LDDC2:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r9, pc}
LDDC3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r9, pc}


