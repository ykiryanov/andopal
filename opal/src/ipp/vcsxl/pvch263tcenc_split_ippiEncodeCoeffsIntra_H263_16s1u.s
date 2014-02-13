        .text
        .align  4
        .globl  _ippiEncodeCoeffsIntra_H263_16s1u


_ippiEncodeCoeffsIntra_H263_16s1u:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        ldr     r4, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        cmp     r1, #0
        beq     LFEQ3
        cmp     r2, #0
        beq     LFEQ3
        cmp     r0, #0
        beq     LFEQ3
        ldr     r5, [r1]
        cmp     r5, #0
        beq     LFEQ3
        ldr     r5, [r2]
        cmp     r5, #0
        blt     LFEQ2
        cmp     r5, #7
        bgt     LFEQ2
        cmp     r3, #1
        blt     LFEQ1
        cmp     r3, #0x40
        bgt     LFEQ1
        cmp     r4, #0
        ldreq   r5, [pc, #0x60]
        moveq   r4, #1
        ldrne   r5, [pc, #0x5C]
        movne   r4, #0
        cmp     lr, #0
        str     r12, [sp, #8]
        beq     LFEQ0
        str     r4, [sp, #4]
        str     r5, [sp]
        bl      ownEncodeCoeffs_ModQ_H263_16s1u
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LFEQ0:
        str     r4, [sp, #4]
        str     r5, [sp]
        bl      ownEncodeCoeffs_H263_16s1u
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LFEQ1:
        mvn     r0, #0xA
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LFEQ2:
        mvn     r0, #0xC0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
LFEQ3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
        .long   h263_VLCParams
        .long   h263_advVLCParams


