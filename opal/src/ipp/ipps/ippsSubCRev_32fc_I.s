        .text
        .align  4
        .globl  _ippsSubCRev_32fc_I


_ippsSubCRev_32fc_I:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        mov     r4, r2
        str     r0, [sp]
        cmp     r4, #0
        str     r1, [sp, #4]
        beq     LAUU3
        cmp     r3, #0
        ble     LAUU2
        cmp     r3, #0
        sub     r7, r3, #1
        beq     LAUU1
        ldr     r6, [sp]
        ldr     r5, [sp, #4]
LAUU0:
        ldr     r1, [r4]
        mov     r0, r6
        sub     r7, r7, #1
        bl      __subsf3
        ldr     r1, [r4, #4]
        str     r0, [r4]
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, #4]
        cmn     r7, #1
        add     r4, r4, #8
        bne     LAUU0
LAUU1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LAUU2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LAUU3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}


