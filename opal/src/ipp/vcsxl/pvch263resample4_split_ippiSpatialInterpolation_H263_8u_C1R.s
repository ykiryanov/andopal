        .text
        .align  4
        .globl  _ippiSpatialInterpolation_H263_8u_C1R


_ippiSpatialInterpolation_H263_8u_C1R:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x18
        str     r2, [sp, #0x10]
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x28]
        cmp     r0, #0
        beq     LFFI3
        cmp     r12, #0
        beq     LFFI3
        ldr     lr, [sp, #0x10]
        cmp     lr, #0
        ble     LFFI2
        ldr     r4, [sp, #0x14]
        cmp     r4, #0
        ble     LFFI2
        cmp     lr, #3
        ble     LFFI2
        tst     lr, #1
        bne     LFFI2
        cmp     r4, #3
        ble     LFFI2
        tst     r4, #1
        bne     LFFI2
        cmp     r3, #3
        beq     LFFI1
        cmp     r3, #2
        str     r2, [sp, #4]
        str     r12, [sp]
        beq     LFFI0
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        bl      ownSpatialInterpolationHor_H263_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFI0:
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        bl      ownSpatialInterpolationVer_H263_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFI1:
        str     r2, [sp, #4]
        mvn     r2, #0
        str     r2, [sp, #0xC]
        mov     r2, #1
        str     r2, [sp, #8]
        str     r12, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        bl      ownUpsampleFour_H263_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFI2:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}
LFFI3:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4, pc}


