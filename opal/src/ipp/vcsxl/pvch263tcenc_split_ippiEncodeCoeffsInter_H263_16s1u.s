        .text
        .align  4
        .globl  _ippiEncodeCoeffsInter_H263_16s1u


_ippiEncodeCoeffsInter_H263_16s1u:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        cmp     r1, #0
        beq     LFER3
        cmp     r2, #0
        beq     LFER3
        cmp     r0, #0
        beq     LFER3
        ldr     r4, [r1]
        cmp     r4, #0
        beq     LFER3
        ldr     r4, [r2]
        cmp     r4, #0
        blt     LFER2
        cmp     r4, #7
        bgt     LFER2
        cmp     r3, #1
        blt     LFER1
        cmp     r3, #0x40
        bgt     LFER1
        ldr     r4, [pc, #0x50]
        cmp     r12, #0
        mov     r12, #0
        str     lr, [sp, #8]
        str     r12, [sp, #4]
        str     r4, [sp]
        beq     LFER0
        bl      ownEncodeCoeffs_ModQ_H263_16s1u
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LFER0:
        bl      ownEncodeCoeffs_H263_16s1u
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LFER1:
        mvn     r0, #0xA
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LFER2:
        mvn     r0, #0xC0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LFER3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
        .long   h263_VLCParams


