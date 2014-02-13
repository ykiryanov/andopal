        .text
        .align  4
        .globl  _ippsSubC_16u_Sfs


_ippsSubC_16u_Sfs:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        mov     r4, r1
        cmp     r12, #0
        mov     r1, r2
        bne     LDAD0
        cmp     r4, #0
        bne     LDAD1
        mov     r2, r3
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsCopy_16s
LDAD0:
        cmp     r12, #0x10
        ble     LDAD1
        cmp     r0, #0
        beq     LDAD3
        mov     r0, r1
        mov     r1, r3
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsZero_16s
LDAD1:
        cmp     r0, #0
        beq     LDAD3
        cmp     r1, #0
        beq     LDAD3
        cmp     r3, #0
        ble     LDAD2
        mov     r2, r1
        str     r12, [sp]
        mov     r1, r4
        bl      ownps_SubC_16u_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAD2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAD3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


