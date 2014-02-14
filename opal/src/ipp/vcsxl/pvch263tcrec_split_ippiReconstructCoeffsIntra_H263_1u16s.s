        .text
        .align  4
        .globl  ippiReconstructCoeffsIntra_H263_1u16s


ippiReconstructCoeffsIntra_H263_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        ldr     r7, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        cmp     r0, #0
        mov     r4, r2
        beq     LFEL8
        cmp     r1, #0
        beq     LFEL8
        ldr     r8, [r0]
        cmp     r8, #0
        beq     LFEL8
        cmp     r4, #0
        beq     LFEL8
        cmp     r3, #0
        beq     LFEL8
        ldr     r9, [r1]
        cmp     r9, #0
        blt     LFEL7
        cmp     r9, #7
        bgt     LFEL7
        cmp     lr, #1
        blt     LFEL6
        cmp     lr, #0x1F
        bgt     LFEL6
        cmp     r7, #0
        bne     LFEL4
        ldrb    r11, [r8]
        ldrb    r10, [r8, #1]
        rsb     r5, r9, #8
        add     r7, r8, #1
        orr     r11, r10, r11, lsl #8
        mov     r5, r11, lsr r5
        and     r5, r5, #0xFF
        tst     r5, #0x7F
        beq     LFEL3
        cmp     r6, #0
        str     r7, [r0]
        mov     r2, #0
        streq   r2, [r3]
        beq     LFEL1
        cmp     r12, #0
        mov     r12, #1
        str     lr, [sp]
        str     r12, [sp, #4]
        beq     LFEL0
        mov     r2, r4
        bl      ownReconCoeffs_ModQ_H263
        mov     r2, r0
        b       LFEL1
LFEL0:
        mov     r2, r4
        bl      ownReconCoeffs_H263
        mov     r2, r0
LFEL1:
        cmp     r5, #0xFF
        bne     LFEL2
        mov     r1, #1, 22
        strh    r1, [r4]
        mov     r0, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL2:
        mov     r5, r5, lsl #3
        strh    r5, [r4]
        mov     r0, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL3:
        mvn     r0, #0
        str     r0, [r3]
        mvn     r0, #0xBE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL4:
        cmp     r12, #0
        str     r5, [sp, #4]
        str     lr, [sp]
        bne     LFEL5
        mov     r2, r4
        bl      ownReconCoeffs_AdvIntra_H263
        mov     r2, r0
        mov     r0, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL5:
        mov     r2, r4
        bl      ownReconCoeffs_AdvIntra_ModQ_H263
        mov     r2, r0
        mov     r0, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL6:
        mvn     r0, #0xBF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL7:
        mvn     r0, #0xC0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LFEL8:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


