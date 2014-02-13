        .text
        .align  4
        .globl  _ippiUpsampleFour_H263_8u_C1R


_ippiUpsampleFour_H263_8u_C1R:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x18
        str     r2, [sp, #0x10]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        str     r3, [sp, #0x14]
        ldr     lr, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        cmp     r0, #0
        beq     LFFG1
        cmp     r12, #0
        beq     LFFG1
        ldr     r4, [sp, #0x10]
        cmp     r4, #3
        ble     LFFG0
        tst     r4, #1
        bne     LFFG0
        ldr     r4, [sp, #0x14]
        cmp     r4, #3
        ble     LFFG0
        tst     r4, #1
        bne     LFFG0
        str     r3, [sp, #0xC]
        str     r2, [sp, #4]
        str     lr, [sp, #8]
        str     r12, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        bl      ownUpsampleFour_H263_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFG0:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFG1:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}


