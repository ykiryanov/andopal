        .text
        .align  4
        .globl  _ippsSubC_64fc_I


_ippsSubC_64fc_I:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x10
        str     r0, [sp]
        ldr     r9, [sp, #0x2C]
        str     r1, [sp, #4]
        ldr     r0, [sp, #0x30]
        str     r2, [sp, #8]
        cmp     r9, #0
        str     r3, [sp, #0xC]
        beq     LAUI3
        cmp     r0, #0
        ble     LAUI2
        cmp     r0, #0
        sub     r8, r0, #1
        beq     LAUI1
        ldr     r7, [sp]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r4, [sp, #0xC]
LAUI0:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        str     r0, [r9]
        str     r1, [r9, #4]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        sub     r8, r8, #1
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        cmn     r8, #1
        add     r9, r9, #0x10
        bne     LAUI0
LAUI1:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r9, pc}
LAUI2:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r9, pc}
LAUI3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r9, pc}


