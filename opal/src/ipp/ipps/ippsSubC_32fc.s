        .text
        .align  4
        .globl  _ippsSubC_32fc


_ippsSubC_32fc:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #8
        str     r1, [sp]
        ldr     r1, [sp, #0x20]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r3
        str     r2, [sp, #4]
        beq     LAUN3
        cmp     r6, #0
        beq     LAUN3
        cmp     r1, #0
        ble     LAUN2
        cmp     r1, #0
        sub     r8, r1, #1
        beq     LAUN1
        ldr     r5, [sp]
        ldr     r4, [sp, #4]
LAUN0:
        ldr     r0, [r7]
        mov     r1, r5
        sub     r8, r8, #1
        bl      __subsf3
        str     r0, [r6]
        ldr     r0, [r7, #4]
        mov     r1, r4
        add     r7, r7, #8
        bl      __subsf3
        str     r0, [r6, #4]
        cmn     r8, #1
        add     r6, r6, #8
        bne     LAUN0
LAUN1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LAUN2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LAUN3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}


