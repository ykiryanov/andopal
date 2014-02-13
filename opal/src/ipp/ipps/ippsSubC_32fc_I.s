        .text
        .align  4
        .globl  _ippsSubC_32fc_I


_ippsSubC_32fc_I:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        mov     r4, r2
        str     r0, [sp]
        cmp     r4, #0
        str     r1, [sp, #4]
        beq     LAUM3
        cmp     r3, #0
        ble     LAUM2
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LAUM1
        ldr     r6, [sp]
        ldr     r5, [sp, #4]
LAUM0:
        ldr     r0, [r4]
        mov     r1, r6
        sub     r7, r7, #1
        bl      __subsf3
        str     r0, [r4]
        ldr     r0, [r4, #4]
        mov     r1, r5
        bl      __subsf3
        str     r0, [r4, #4]
        cmn     r7, #1
        add     r4, r4, #8
        bne     LAUM0
LAUM1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LAUM2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LAUM3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}


