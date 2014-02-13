        .text
        .align  4
        .globl  _ippiReconstructCoeffsInter_H263_1u16s


_ippiReconstructCoeffsInter_H263_1u16s:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        cmp     r0, #0
        beq     LFEM3
        cmp     r1, #0
        beq     LFEM3
        ldr     r4, [r0]
        cmp     r4, #0
        beq     LFEM3
        cmp     r2, #0
        beq     LFEM3
        cmp     r3, #0
        beq     LFEM3
        ldr     r4, [r1]
        cmp     r4, #0
        blt     LFEM2
        cmp     r4, #7
        bgt     LFEM2
        cmp     r12, #1
        blt     LFEM1
        cmp     r12, #0x1F
        bgt     LFEM1
        cmp     lr, #0
        mov     lr, #0
        str     r12, [sp]
        str     lr, [sp, #4]
        beq     LFEM0
        bl      ownReconCoeffs_ModQ_H263
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LFEM0:
        bl      ownReconCoeffs_H263
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LFEM1:
        mvn     r0, #0xBF
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LFEM2:
        mvn     r0, #0xC0
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LFEM3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


