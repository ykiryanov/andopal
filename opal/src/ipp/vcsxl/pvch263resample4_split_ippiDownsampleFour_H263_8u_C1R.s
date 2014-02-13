        .text
        .align  4
        .globl  _ippiDownsampleFour_H263_8u_C1R


_ippiDownsampleFour_H263_8u_C1R:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        str     r2, [sp, #0x10]
        cmp     r0, #0
        str     r3, [sp, #0x14]
        beq     LFFJ1
        cmp     r12, #0
        beq     LFFJ1
        ldr     r2, [sp, #0x10]
        cmp     r2, #0
        ble     LFFJ0
        ldr     r3, [sp, #0x14]
        cmp     r3, #0
        ble     LFFJ0
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r4, [sp, #8]
        bl      ownDownsampleFour_H263_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFJ0:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFJ1:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}


