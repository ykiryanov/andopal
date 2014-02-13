        .text
        .align  4
        .globl  _ippsSub_16u_Sfs


_ippsSub_16u_Sfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r12, #0x10
        ble     LDAB0
        cmp     r0, #0
        beq     LDAB2
        cmp     r1, #0
        beq     LDAB2
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #8
        ldr     lr, [sp], #4
        b       _ippsZero_16s
LDAB0:
        cmp     r0, #0
        beq     LDAB2
        cmp     r1, #0
        beq     LDAB2
        cmp     r2, #0
        beq     LDAB2
        cmp     r3, #0
        ble     LDAB1
        str     r12, [sp]
        bl      ownps_Sub_16u_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDAB1:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDAB2:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


