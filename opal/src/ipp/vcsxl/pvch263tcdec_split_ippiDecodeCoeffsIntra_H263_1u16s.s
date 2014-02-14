        .text
        .align  4
        .globl  ippiDecodeCoeffsIntra_H263_1u16s


ippiDecodeCoeffsIntra_H263_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r6, [sp, #0x40]
        ldr     lr, [sp, #0x44]
        ldr     r12, [sp, #0x48]
        cmp     r0, #0
        mov     r4, r2
        beq     LFEV5
        cmp     r1, #0
        beq     LFEV5
        ldr     r5, [r0]
        cmp     r5, #0
        beq     LFEV5
        cmp     r4, #0
        beq     LFEV5
        cmp     r3, #0
        beq     LFEV5
        ldr     r5, [r1]
        cmp     r5, #0
        blt     LFEV4
        cmp     r5, #7
        bgt     LFEV4
        cmp     r6, #0
        add     r9, sp, #0x10
        beq     LFEV0
        ldr     r11, [pc, #0x90]
        ldr     r7, [pc, #0x90]
        ldr     r8, [pc, #0x90]
        mov     r10, #0
        mov     r5, r10
        b       LFEV1
LFEV0:
        ldrsh   r5, [r4]
        ldr     r11, [pc, #0x80]
        ldr     r7, [pc, #0x80]
        ldr     r8, [pc, #0x80]
        mov     r10, #1
LFEV1:
        add     r2, sp, #0x10
        str     r11, [r2]
        add     r11, sp, #0x10
        str     r7, [r11, #4]
        str     r8, [r9, #8]
        add     r7, sp, #0x10
        cmp     lr, #0
        str     r12, [sp, #8]
        str     r7, [sp]
        beq     LFEV2
        str     r10, [sp, #4]
        mov     r2, r4
        bl      ownDecodeCoeffs_ModQ_H263
        b       LFEV3
LFEV2:
        str     r10, [sp, #4]
        mov     r2, r4
        bl      ownDecodeCoeffs_H263
LFEV3:
        cmp     r6, #0
        streqh  r5, [r4]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LFEV4:
        mvn     r0, #0xC0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LFEV5:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   h263_advCoefTab0
        .long   h263_advCoefTab1
        .long   h263_advCoefTab2
        .long   h263_coefTab0
        .long   h263_coefTab1
        .long   h263_coefTab2


