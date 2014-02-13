        .text
        .align  4
        .globl  _ippsDotProd_16s32f


_ippsDotProd_16s32f:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r4, r3
        beq     LCGI1
        cmp     r1, #0
        beq     LCGI1
        cmp     r4, #0
        beq     LCGI1
        cmp     r2, #0
        ble     LCGI0
        mov     r3, sp
        bl      ownps_DotProd_16s16s
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        bl      __floatdisf
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCGI0:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LCGI1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


