        .text
        .align  4
        .globl  ippiAddBackPredPB_H263_8u_C1R


ippiAddBackPredPB_H263_8u_C1R:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x10
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x14]
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        cmp     r0, #0
        beq     LFGO1
        cmp     r2, #0
        beq     LFGO1
        ldr     lr, [sp, #8]
        cmp     lr, #0
        ble     LFGO0
        ldr     lr, [sp, #0xC]
        cmp     lr, #0
        ble     LFGO0
        ldr     lr, [pc, #0x38]
        str     r3, [sp, #4]
        str     r2, [sp]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r12, [lr, +r12, lsl #2]
        blx     r12
        mov     r0, #0
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LFGO0:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LFGO1:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
        .long   LFGO_ownAddBackPredPB_8u_C1R


        .data
        .align  4


LFGO_ownAddBackPredPB_8u_C1R:
        .long   ownAddBackPredPBFF_8u_C1R
        .long   ownAddBackPredPBFH_8u_C1R
        .long   ownAddBackPredPBHF_8u_C1R
        .long   ownAddBackPredPBHH_8u_C1R


