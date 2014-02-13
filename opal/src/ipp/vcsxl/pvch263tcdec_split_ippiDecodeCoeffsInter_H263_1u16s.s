        .text
        .align  4
        .globl  _ippiDecodeCoeffsInter_H263_1u16s


_ippiDecodeCoeffsInter_H263_1u16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        cmp     r0, #0
        beq     LFEW2
        cmp     r1, #0
        beq     LFEW2
        ldr     r4, [r0]
        cmp     r4, #0
        beq     LFEW2
        cmp     r2, #0
        beq     LFEW2
        cmp     r3, #0
        beq     LFEW2
        ldr     r4, [r1]
        cmp     r4, #0
        blt     LFEW1
        cmp     r4, #7
        bgt     LFEW1
        ldr     r7, [pc, #0x68]
        add     r8, sp, #0x10
        ldr     r5, [pc, #0x64]
        str     r7, [r8]
        ldr     r7, [pc, #0x60]
        add     r6, sp, #0x10
        str     r5, [r6, #4]
        add     r4, sp, #0x10
        str     r7, [r4, #8]
        cmp     r12, #0
        add     r5, sp, #0x10
        mov     r12, #0
        str     lr, [sp, #8]
        str     r12, [sp, #4]
        str     r5, [sp]
        beq     LFEW0
        bl      ownDecodeCoeffs_ModQ_H263
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r8, pc}
LFEW0:
        bl      ownDecodeCoeffs_H263
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r8, pc}
LFEW1:
        mvn     r0, #0xC0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r8, pc}
LFEW2:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r8, pc}
        .long   h263_coefTab0
        .long   h263_coefTab1
        .long   h263_coefTab2


