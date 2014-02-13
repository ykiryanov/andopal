        .text
        .align  4
        .globl  _ippsAddC_16u_Sfs


_ippsAddC_16u_Sfs:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        mov     r4, r1
        cmp     r12, #0
        mov     r1, r2
        bne     LDAR0
        cmp     r4, #0
        bne     LDAR2
        mov     r2, r3
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsCopy_16s
LDAR0:
        cmp     r12, #0x11
        ble     LDAR1
        cmp     r0, #0
        beq     LDAR4
        mov     r0, r1
        mov     r1, r3
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsZero_16s
LDAR1:
        cmn     r12, #0xF
        bge     LDAR2
        cmp     r4, #0
        beq     LDAR2
        cmp     r0, #0
        beq     LDAR4
        mov     r2, r3
        mvn     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, lr}
        b       _ippsSet_16s
LDAR2:
        cmp     r0, #0
        beq     LDAR4
        cmp     r1, #0
        beq     LDAR4
        cmp     r3, #0
        ble     LDAR3
        mov     r2, r1
        str     r12, [sp]
        mov     r1, r4
        bl      ownps_AddC_16u_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAR3:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDAR4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


