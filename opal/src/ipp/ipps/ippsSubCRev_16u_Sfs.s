        .text
        .align  4
        .globl  _ippsSubCRev_16u_Sfs


_ippsSubCRev_16u_Sfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r1, #0
        beq     LDAF1
        cmp     r12, #0x10
        bgt     LDAF1
        cmp     r0, #0
        beq     LDAF2
        cmp     r2, #0
        beq     LDAF2
        cmp     r3, #0
        ble     LDAF0
        str     r12, [sp]
        bl      ownps_SubCRev_16u_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDAF0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDAF1:
        cmp     r0, #0
        beq     LDAF2
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #8
        ldr     lr, [sp], #4
        b       _ippsZero_16s
LDAF2:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


