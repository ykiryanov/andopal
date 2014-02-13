        .text
        .align  4
        .globl  _ippsCrossCorrLagMax_16s


_ippsCrossCorrLagMax_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0xC
        ldr     r10, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r2
        mov     r7, r3
        beq     LDTJ4
        cmp     r1, #0
        beq     LDTJ4
        cmp     r10, #0
        beq     LDTJ4
        cmp     r9, #0
        beq     LDTJ4
        cmp     r4, #0
        ble     LDTJ3
        cmp     r7, #0
        blt     LDTJ2
        mov     r8, #0
        str     r8, [r10]
        cmp     r7, #0
        str     r7, [r9]
        blt     LDTJ1
        add     r6, r1, r7, lsl #1
LDTJ0:
        add     r3, sp, #8
        str     r8, [sp]
        mov     r0, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ippsDotProd_16s32s_Sfs
        add     lr, sp, #8
        ldr     r12, [r10]
        ldr     lr, [lr]
        cmp     lr, r12
        strgt   r7, [r9]
        strgt   lr, [r10]
        subs    r7, r7, #1
        sub     r6, r6, #2
        bpl     LDTJ0
LDTJ1:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LDTJ2:
        mvn     r0, #6
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LDTJ3:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LDTJ4:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}


