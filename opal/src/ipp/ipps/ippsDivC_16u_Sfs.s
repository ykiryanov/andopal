        .text
        .align  4
        .globl  _ippsDivC_16u_Sfs


_ippsDivC_16u_Sfs:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        mov     r4, r1
        cmp     r12, #0x10
        mov     r1, r2
        ble     LDAN0
        cmp     r4, #0
        beq     LDAN2
        cmp     r0, #0
        beq     LDAN7
        mov     r0, r1
        mov     r1, r3
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsZero_16s
LDAN0:
        cmn     r12, #0x1F
        bge     LDAN1
        cmp     r4, #0
        beq     LDAN2
        cmp     r0, #0
        beq     LDAN7
        mov     r2, r3
        mvn     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsSet_16s
LDAN1:
        cmp     r12, #0
        bne     LDAN2
        cmp     r4, #1
        beq     LDAN4
LDAN2:
        cmp     r0, #0
        beq     LDAN7
        cmp     r1, #0
        beq     LDAN7
        cmp     r3, #0
        ble     LDAN6
        cmp     r4, #0
        beq     LDAN3
        cmp     r4, #1
        str     r12, [sp]
        beq     LDAN5
        mov     r2, r1
        mov     r1, r4
        bl      ownps_DivC_16u_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAN3:
        mvn     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAN4:
        mov     r2, r3
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsCopy_16s
LDAN5:
        mov     r2, r1
        mov     r1, r4
        bl      ownps_MulC_16u_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAN6:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAN7:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


