        .text
        .align  4
        .globl  _ippsDotProd_16s16sc32fc


_ippsDotProd_16s16sc32fc:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        mov     r4, r3
        beq     LCGL1
        cmp     r1, #0
        beq     LCGL1
        cmp     r4, #0
        beq     LCGL1
        cmp     r2, #0
        ble     LCGL0
        mov     r3, sp
        bl      ownps_DotProd_16s16sc
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        bl      __floatdisf
        str     r0, [r4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        bl      __floatdisf
        str     r0, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LCGL0:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LCGL1:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}


