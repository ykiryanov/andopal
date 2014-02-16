        .text
        .align  4
        .globl  ippiReconstructChroma422Intra4x4_H264High_32s16u_IP2R


ippiReconstructChroma422Intra4x4_H264High_32s16u_IP2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x11, 28
        ldr     r4, [sp, #0x134]
        cmp     r0, #0
        and     r8, r2, #4
        and     r7, r2, #1
        and     lr, r2, #0x10
        beq     LKWX31
        ldr     r6, [r0]
        cmp     r6, #0
        beq     LKWX31
        ldr     r5, [r0, #4]
        cmp     r5, #0
        beq     LKWX31
        ldr     r12, [r6]
        cmp     r12, #0
        beq     LKWX31
        ldr     r10, [r6, #4]
        cmp     r10, #0
        beq     LKWX31
        ldr     r12, [r12]
        cmp     r12, #0
        beq     LKWX31
        ldr     r12, [r5]
        cmp     r12, #0
        beq     LKWX31
        ldr     r9, [r5, #4]
        cmp     r9, #0
        beq     LKWX31
        ldr     r12, [r12]
        cmp     r12, #0
        beq     LKWX31
        ldr     r12, [r6, #0x14]
        cmp     r12, #0
        beq     LKWX31
        ldr     r12, [r5, #0x14]
        cmp     r12, #0
        beq     LKWX31
        ldr     r2, [r6, #0x10]
        cmp     r2, #0
        blt     LKWX0
        ldr     r11, [r6, #0x1C]
        add     r12, r11, r11, lsl #2
        add     r12, r11, r12
        sub     r12, r12, #9
        cmp     r2, r12
        bgt     LKWX0
        ldr     r2, [r5, #0x10]
        cmp     r2, #0
        blt     LKWX0
        cmp     r2, r12
        bgt     LKWX0
        subs    r1, r1, #3
        beq     LKWX20
        adds    r1, r1, #3
        mov     r12, #0
        beq     LKWX10
        subs    r1, r1, #1
        beq     LKWX6
        subs    r1, r1, #1
        beq     LKWX1
LKWX0:
        mvn     r0, #0xA
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}
LKWX1:
        cmp     r8, #0
        beq     LKWX2
        mvn     r0, #0x74
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}
LKWX2:
        ldr     r6, [r6, #8]
        ldr     r5, [r5, #8]
        mov     r7, #0x10
        sub     r6, r10, r6, lsl #1
        sub     r5, r9, r5, lsl #1
LKWX3:
        mov     r1, r6
        mov     r11, r5
        mov     r2, r12
        mov     r8, #8
LKWX4:
        ldrh    lr, [r1], #2
        subs    r8, r8, #1
        strh    lr, [r10, +r2]
        ldrh    lr, [r11], #2
        strh    lr, [r9, +r2]
        add     r2, r2, #2
        bne     LKWX4
        ldr     r8, [r0]
        ldr     r11, [r0, #4]
        subs    r7, r7, #1
        ldr     r8, [r8, #8]
        ldr     r11, [r11, #8]
        add     r10, r10, r8, lsl #1
        add     r9, r9, r11, lsl #1
        bne     LKWX3
LKWX5:
        mov     r2, r4
        mov     r1, r3
        bl      ippiReconstructChroma422Inter4x4_H264High_32s16u_IP2R
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}
LKWX6:
        cmp     r7, #0
        beq     LKWX7
        mvn     r0, #0x74
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}
LKWX7:
        mov     r5, #0x10
LKWX8:
        mov     r7, r12
        mov     r6, #8
LKWX9:
        ldrh    r8, [r10, #-2]
        subs    r6, r6, #1
        strh    r8, [r10, +r7]
        ldrh    r8, [r9, #-2]
        strh    r8, [r9, +r7]
        add     r7, r7, #2
        bne     LKWX9
        ldr     r6, [r0]
        ldr     r7, [r0, #4]
        subs    r5, r5, #1
        ldr     r6, [r6, #8]
        ldr     r7, [r7, #8]
        add     r10, r10, r6, lsl #1
        add     r9, r9, r7, lsl #1
        bne     LKWX8
        b       LKWX5
LKWX10:
        cmp     r8, #0
        bne     LKWX14
        cmp     r7, #0
        beq     LKWX12
        ldr     r8, [r6, #8]
        ldr     r5, [r5, #8]
        mov     lr, r12
        rsb     r7, r8, #0
        mov     r1, lr
        rsb     r6, r5, #0
        add     r7, r10, r7, lsl #1
        mov     r2, r1
        add     r6, r9, r6, lsl #1
        mov     r11, #4
        str     r10, [sp, #0xC]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
        str     r0, [sp]
LKWX11:
        ldrh    r0, [r7]
        ldrh    r3, [r7, #8]
        ldrh    r4, [r6]
        ldrh    r10, [r6, #8]
        subs    r11, r11, #1
        add     r1, r0, r1
        add     lr, r3, lr
        add     r12, r4, r12
        add     r2, r10, r2
        add     r7, r7, #2
        add     r6, r6, #2
        bne     LKWX11
        ldr     r10, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        add     lr, lr, #2
        add     r2, r2, #2
        mov     lr, lr, asr #2
        bic     r6, lr, #0xFF, 8
        mov     r2, r2, asr #2
        add     r1, r1, #2
        bic     r7, r6, #0xFF, 16
        add     r12, r12, #2
        bic     r2, r2, #0xFF, 8
        mov     r1, r1, asr #2
        bic     r6, r2, #0xFF, 16
        mov     r12, r12, asr #2
        bic     r1, r1, #0xFF, 8
        bic     r12, r12, #0xFF, 8
        bic     lr, r1, #0xFF, 16
        str     r7, [sp, #0x7C]
        str     r6, [sp, #0x58]
        bic     r12, r12, #0xFF, 16
        mov     r1, lr
        mov     r2, r12
        str     r7, [sp, #0x64]
        str     r6, [sp, #0x4C]
        str     r1, [sp, #0x74]
        str     r2, [sp, #0x78]
        str     r7, [sp, #0x70]
        str     r6, [sp, #0x14]
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x18]
        str     r7, [sp, #0x54]
        str     r6, [sp, #0x24]
        str     r1, [sp, #0x50]
        str     r2, [sp, #0x28]
        mov     r7, r8, lsl #3
        mov     r6, r5, lsl #3
        b       LKWX17
LKWX12:
        ldr     r8, [r6, #8]
        ldr     r5, [r5, #8]
        mov     r1, r12
        str     r1, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     lr, r1
        str     lr, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     lr, [sp, #0x2C]
        add     r11, r9, r5, lsl #4
        str     r11, [sp, #0x5C]
        sub     r11, r10, #2
        str     lr, [sp, #0x28]
        rsb     r7, r8, #0
        str     r11, [sp, #0x58]
        sub     r11, r9, #2
        str     lr, [sp, #0x24]
        mov     r2, lr
        add     r7, r10, r7, lsl #1
        str     r7, [sp, #0x70]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x70]
        rsb     r6, r5, #0
        str     r2, [sp, #0x10]
        add     r6, r9, r6, lsl #1
        str     r6, [sp, #0x6C]
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x6C]
        str     r2, [sp, #0x38]
        str     r2, [sp, #0x68]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x68]
        add     r6, r10, r8, lsl #4
        str     r6, [sp, #0x60]
        mov     r7, r8, lsl #3
        mov     r6, r5, lsl #3
        str     r11, [sp, #0x64]
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x48]
        str     r9, [sp, #0x20]
        str     r10, [sp, #0xC]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
        str     r0, [sp]
        ldr     r0, [sp, #0x64]
        ldr     r10, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        ldr     r4, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r7, [sp, #0x68]
        str     r2, [sp, #0x18]
        str     lr, [sp, #0x14]
        str     r1, [sp, #0x1C]
LKWX13:
        ldrh    r11, [r9], #2
        ldr     lr, [sp, #0x58]
        str     r11, [sp, #0x7C]
        add     r11, r7, #4
        mul     r1, r5, r11
        mul     r2, r8, r11
        mov     r11, r11, lsl #1
        add     r7, r7, #1
        str     r1, [sp, #0x78]
        mov     r1, r0, lsl #1
        str     r1, [sp, #0x74]
        ldrh    r1, [lr, +r1]
        ldr     lr, [sp, #0x58]
        mov     r2, r2, lsl #1
        str     r1, [sp, #0x80]
        ldrh    r1, [r10], #2
        str     r2, [sp, #0x88]
        cmp     r7, #4
        str     r1, [sp, #0x84]
        ldrh    r2, [lr, +r2]
        ldr     lr, [sp, #0x70]
        mov     r1, r12, lsl #1
        str     r2, [sp, #0x8C]
        ldrh    r2, [r3, +r1]
        sub     r1, r1, #2
        str     r2, [sp, #0x90]
        ldr     r2, [sp, #0x78]
        str     r11, [sp, #0x78]
        ldrh    r11, [lr, +r11]
        ldr     lr, [sp, #0x6C]
        mov     r2, r2, lsl #1
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #0x78]
        add     r0, r0, r8
        add     r12, r12, r5
        ldrh    r11, [lr, +r11]
        str     r11, [sp, #0x78]
        ldrh    r11, [r3, +r2]
        sub     r2, r2, #2
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0x74]
        sub     r11, r11, #2
        ldrh    r11, [r6, +r11]
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x88]
        sub     r11, r11, #2
        ldrh    r11, [r6, +r11]
        str     r11, [sp, #0x88]
        ldrh    r11, [r4, +r1]
        ldr     r1, [sp, #0x34]
        str     r11, [sp, #0x9C]
        ldrh    r11, [r4, +r2]
        ldr     r2, [sp, #0x7C]
        add     r1, r2, r1
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x94]
        add     r1, r2, r1
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp, #0x80]
        add     r1, r2, r1
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        ldr     r2, [sp, #0x8C]
        add     r1, r2, r1
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0x84]
        add     r1, r2, r1
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x78]
        add     r1, r2, r1
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x90]
        add     r1, r2, r1
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x98]
        add     r1, r2, r1
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x74]
        add     r1, r2, r1
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x88]
        add     r1, r2, r1
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x9C]
        add     r1, r2, r1
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x38]
        add     r1, r11, r1
        str     r1, [sp, #0x38]
        blt     LKWX13
        ldr     lr, [sp, #0x14]
        ldr     r11, [sp, #0x3C]
        ldr     r12, [sp, #0x34]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x18]
        ldr     r6, [sp, #0x44]
        ldr     r7, [sp, #0x48]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        add     r12, r11, r12
        ldr     r11, [sp, #0x40]
        str     r12, [sp, #0x9C]
        ldr     r12, [sp, #0x10]
        add     r11, r11, r1
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0x24]
        add     r12, r11, r12
        ldr     r11, [sp, #0x28]
        str     r12, [sp, #0x94]
        add     r11, r11, lr
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x2C]
        add     r11, r11, r1
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x30]
        add     r12, r11, r1
        str     r12, [sp, #0x88]
        add     r12, r2, lr
        str     r12, [sp, #0x84]
        ldr     r12, [sp, #0x38]
        add     r2, r2, #2
        add     r1, r1, #2
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0x40]
        add     r12, r12, lr
        str     r12, [sp, #0x80]
        ldr     r12, [sp, #0x9C]
        add     lr, lr, #2
        str     lr, [sp, #0x74]
        ldr     lr, [sp, #0x88]
        add     r12, r12, #4
        str     r12, [sp, #0x9C]
        ldr     r12, [sp, #0x8C]
        add     lr, lr, #4
        str     lr, [sp, #0x8C]
        ldr     lr, [sp, #0x84]
        str     r2, [sp, #0x88]
        add     r1, r1, #2
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x98]
        add     lr, lr, #4
        str     lr, [sp, #0x84]
        ldr     lr, [sp, #0x38]
        add     r1, r1, #4
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x94]
        add     lr, lr, #2
        str     lr, [sp, #0x6C]
        ldr     lr, [sp, #0x80]
        add     r1, r1, #4
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0x28]
        add     lr, lr, #4
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0x9C]
        ldr     r2, [sp, #0x80]
        add     r1, r1, #2
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x90]
        mov     lr, lr, asr #3
        str     lr, [sp, #0x9C]
        ldr     lr, [sp, #0x7C]
        mov     r2, r2, asr #3
        add     r1, r1, #4
        mov     lr, lr, asr #2
        str     lr, [sp, #0x7C]
        ldr     lr, [sp, #0x78]
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x2C]
        mov     lr, lr, asr #2
        str     lr, [sp, #0x78]
        ldr     lr, [sp, #0x98]
        add     r1, r1, #2
        add     r12, r12, #4
        mov     lr, lr, asr #3
        str     lr, [sp, #0x98]
        ldr     lr, [sp, #0x94]
        mov     r1, r1, asr #2
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x6C]
        mov     lr, lr, asr #3
        str     lr, [sp, #0x94]
        ldr     lr, [sp, #0x74]
        mov     r12, r12, asr #3
        str     r12, [sp, #0x64]
        ldr     r12, [sp, #0x8C]
        mov     lr, lr, asr #2
        str     lr, [sp, #0x74]
        ldr     lr, [sp, #0x70]
        mov     r12, r12, asr #3
        str     r12, [sp, #0x8C]
        ldr     r12, [sp, #0x88]
        str     r2, [sp, #0x88]
        ldr     r2, [sp, #0x9C]
        mov     lr, lr, asr #2
        str     lr, [sp, #0x70]
        ldr     lr, [sp, #0x90]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x9C]
        ldr     r2, [sp, #0x7C]
        mov     lr, lr, asr #3
        str     lr, [sp, #0x90]
        ldr     lr, [sp, #0x84]
        mov     r1, r1, asr #2
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x84]
        ldr     r2, [sp, #0x78]
        add     r11, r11, #2
        mov     r12, r12, asr #2
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x80]
        ldr     r2, [sp, #0x98]
        mov     r11, r11, asr #2
        mov     lr, lr, asr #3
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x98]
        ldr     r2, [sp, #0x94]
        bic     r11, r11, #0xFF, 8
        str     r11, [sp, #0x60]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x94]
        ldr     r2, [sp, #0x74]
        ldr     r11, [sp, #0x8C]
        bic     r12, r12, #0xFF, 8
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x78]
        ldr     r2, [sp, #0x70]
        bic     r1, r1, #0xFF, 8
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x84]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x70]
        ldr     r2, [sp, #0x90]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0x80]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x90]
        ldr     r2, [sp, #0x68]
        bic     r1, r1, #0xFF, 16
        str     r12, [sp, #0x5C]
        ldr     r12, [sp, #0x88]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x98]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x6C]
        ldr     r2, [sp, #0x64]
        bic     r11, r11, #0xFF, 8
        str     r11, [sp, #0x8C]
        bic     r1, r1, #0xFF, 16
        bic     lr, lr, #0xFF, 8
        bic     r11, r12, #0xFF, 8
        ldr     r12, [sp, #0x9C]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x94]
        str     lr, [sp, #0x40]
        bic     lr, r12, #0xFF, 16
        bic     r12, r1, #0xFF, 16
        ldr     r1, [sp, #0x78]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x68]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x70]
        bic     r11, r11, #0xFF, 16
        str     r11, [sp, #0x14]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x90]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x6C]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x68]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x60]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x8C]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x5C]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x40]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x34]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x18]
        b       LKWX17
LKWX14:
        cmp     r7, #0
        beq     LKWX15
        sub     r11, r11, #1
        ldr     r8, [r6, #8]
        ldr     r5, [r5, #8]
        mov     r12, #1
        mov     r11, r12, lsl r11
        bic     r12, r11, #0xFF, 8
        bic     lr, r12, #0xFF, 16
        mov     r1, lr
        str     r1, [sp, #0x64]
        str     r1, [sp, #0x74]
        str     r1, [sp, #0x7C]
        str     r1, [sp, #0x70]
        str     r1, [sp, #0x1C]
        str     r1, [sp, #0x54]
        str     r1, [sp, #0x50]
        mov     r12, r1
        str     r12, [sp, #0x78]
        str     r12, [sp, #0x58]
        mov     r2, r12
        str     r2, [sp, #0x14]
        str     r2, [sp, #0x18]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x4C]
        str     r2, [sp, #0x28]
        mov     r7, r8, lsl #3
        mov     r6, r5, lsl #3
        b       LKWX17
LKWX15:
        ldr     r8, [r6, #8]
        ldr     r5, [r5, #8]
        mov     r2, r12
        mov     r1, r2
        str     r1, [sp, #0x6C]
        str     r1, [sp, #0x70]
        mov     r11, r1
        mov     r6, r11
        str     r6, [sp, #0x74]
        str     r6, [sp, #0x78]
        add     lr, r9, r5, lsl #4
        str     lr, [sp, #0x58]
        sub     lr, r10, #2
        str     r6, [sp, #0x7C]
        str     lr, [sp, #0x50]
        str     r6, [sp, #0x64]
        sub     lr, r9, #2
        str     lr, [sp, #0x4C]
        ldr     lr, [sp, #0x64]
        add     r6, r10, r8, lsl #4
        str     r6, [sp, #0x5C]
        mov     r7, r8, lsl #3
        mov     r6, r5, lsl #3
        str     lr, [sp, #0x60]
        str     r11, [sp, #0x40]
        str     r6, [sp, #0x44]
        str     r7, [sp, #0x48]
        str     r9, [sp, #0x20]
        str     r10, [sp, #0xC]
        str     r4, [sp, #8]
        ldr     r6, [sp, #0x60]
        ldr     r7, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r10, [sp, #0x58]
        ldr     r11, [sp, #0x5C]
        ldr     r4, [sp, #0x64]
        str     r1, [sp, #0x54]
        str     r2, [sp, #0x68]
        str     r3, [sp, #4]
        str     r0, [sp]
LKWX16:
        add     r0, r4, #4
        mul     r3, r8, r0
        mul     r0, r5, r0
        mov     r2, r6, lsl #1
        ldrh    r1, [r9, +r2]
        mov     r3, r3, lsl #1
        mov     r0, r0, lsl #1
        sub     r2, r2, #2
        str     r1, [sp, #0x9C]
        ldrh    lr, [r9, +r3]
        mov     r1, r12, lsl #1
        sub     r3, r3, #2
        str     lr, [sp, #0x98]
        ldrh    lr, [r7, +r1]
        sub     r1, r1, #2
        add     r4, r4, #1
        str     lr, [sp, #0x94]
        ldrh    lr, [r7, +r0]
        sub     r0, r0, #2
        cmp     r4, #4
        str     lr, [sp, #0x90]
        ldrh    r3, [r11, +r3]
        ldrh    r2, [r11, +r2]
        ldr     lr, [sp, #0x6C]
        str     r3, [sp, #0x8C]
        ldrh    r3, [r10, +r1]
        ldr     r1, [sp, #0x9C]
        ldrh    r0, [r10, +r0]
        add     r6, r6, r8
        add     lr, r1, lr
        str     lr, [sp, #0x6C]
        ldr     lr, [sp, #0x68]
        ldr     r1, [sp, #0x98]
        add     r12, r12, r5
        add     lr, r1, lr
        str     lr, [sp, #0x68]
        ldr     lr, [sp, #0x74]
        ldr     r1, [sp, #0x94]
        add     lr, r1, lr
        str     lr, [sp, #0x74]
        ldr     lr, [sp, #0x40]
        ldr     r1, [sp, #0x90]
        add     lr, r1, lr
        ldr     r1, [sp, #0x54]
        str     lr, [sp, #0x40]
        add     r1, r2, r1
        ldr     r2, [sp, #0x70]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x8C]
        add     r2, r1, r2
        ldr     r1, [sp, #0x7C]
        str     r2, [sp, #0x70]
        add     r1, r3, r1
        ldr     r3, [sp, #0x78]
        str     r1, [sp, #0x7C]
        add     r3, r0, r3
        str     r3, [sp, #0x78]
        blt     LKWX16
        ldr     lr, [sp, #0x70]
        ldr     r11, [sp, #0x40]
        ldr     r1, [sp, #0x54]
        ldr     r2, [sp, #0x68]
        ldr     r6, [sp, #0x44]
        ldr     r7, [sp, #0x48]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        ldr     r12, [sp, #0x6C]
        add     lr, lr, #2
        str     lr, [sp, #0x98]
        ldr     lr, [sp, #0x74]
        add     r12, r12, #2
        str     r12, [sp, #0x9C]
        add     lr, lr, #2
        str     lr, [sp, #0x94]
        ldr     lr, [sp, #0x7C]
        add     r12, r2, #2
        add     r1, r1, #2
        add     lr, lr, #2
        str     lr, [sp, #0x8C]
        ldr     lr, [sp, #0x78]
        add     r11, r11, #2
        str     r11, [sp, #0x90]
        add     lr, lr, #2
        str     lr, [sp, #0x88]
        ldr     lr, [sp, #0x9C]
        mov     r12, r12, asr #2
        str     r12, [sp, #0x9C]
        ldr     r12, [sp, #0x98]
        mov     r11, lr, asr #2
        ldr     lr, [sp, #0x88]
        mov     r12, r12, asr #2
        str     r12, [sp, #0x98]
        ldr     r12, [sp, #0x94]
        mov     r2, r1, asr #2
        mov     lr, lr, asr #2
        mov     r1, r12, asr #2
        ldr     r12, [sp, #0x90]
        bic     r11, r11, #0xFF, 8
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x9C]
        mov     r12, r12, asr #2
        str     r12, [sp, #0x94]
        ldr     r12, [sp, #0x8C]
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x8C]
        ldr     r2, [sp, #0x94]
        mov     r12, r12, asr #2
        bic     r12, r12, #0xFF, 8
        str     r12, [sp, #0x94]
        ldr     r12, [sp, #0x90]
        bic     lr, lr, #0xFF, 8
        str     lr, [sp, #0x88]
        bic     r11, r11, #0xFF, 8
        bic     lr, r12, #0xFF, 16
        ldr     r12, [sp, #0x8C]
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x98]
        bic     r12, r12, #0xFF, 16
        bic     r1, r1, #0xFF, 8
        str     r12, [sp, #0x50]
        bic     r11, r11, #0xFF, 8
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x98]
        ldr     r2, [sp, #0x9C]
        bic     r12, r1, #0xFF, 16
        ldr     r1, [sp, #0x98]
        bic     r11, r11, #0xFF, 16
        str     r11, [sp, #0x1C]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x94]
        str     r11, [sp, #0x70]
        ldr     r11, [sp, #0x78]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x88]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x28]
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x50]
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        bic     r2, r2, #0xFF, 16
        str     r2, [sp, #0x74]
        str     lr, [sp, #0x7C]
        str     r2, [sp, #0x64]
        str     r1, [sp, #0x54]
        str     r12, [sp, #0x58]
        str     r11, [sp, #0x14]
LKWX17:
        add     r2, r10, #8
        add     r11, r10, r7
        str     r2, [sp, #0x10]
        add     r2, r11, #8
        add     r8, r10, r8, lsl #4
        str     r2, [sp, #0x30]
        add     r2, r8, #8
        str     r2, [sp, #0x5C]
        add     r7, r8, r7
        add     r2, r7, #8
        str     r2, [sp, #0x60]
        add     r2, r9, #8
        add     r1, r9, r6
        str     r2, [sp, #0x68]
        add     r2, r1, #8
        add     r5, r9, r5, lsl #4
        str     r2, [sp, #0x2C]
        add     r2, r5, #8
        add     r6, r5, r6
        str     r2, [sp, #0x34]
        add     r2, r6, #8
        str     r2, [sp, #0x6C]
        mov     r2, #4
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x3C]
        str     lr, [sp, #0x38]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
        str     r0, [sp]
        ldr     r4, [sp, #0x44]
        ldr     r0, [sp, #0x68]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x10]
        str     r6, [sp, #0x48]
        str     r9, [sp, #0x20]
        str     r10, [sp, #0xC]
LKWX18:
        str     r4, [sp, #0x44]
        ldr     r4, [sp, #0x14]
        mov     r9, #0
        mov     r6, #4
        str     r5, [sp, #0x40]
LKWX19:
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x38]
        subs    r6, r6, #1
        strh    r10, [r5, +r9]
        ldr     r5, [sp, #0x7C]
        strh    r5, [lr, +r9]
        ldr     r5, [sp, #0x74]
        strh    r5, [r11, +r9]
        ldr     r5, [sp, #0x64]
        strh    r5, [r12, +r9]
        ldr     r5, [sp, #0x50]
        strh    r5, [r8, +r9]
        ldr     r5, [sp, #0x54]
        strh    r5, [r3, +r9]
        ldr     r5, [sp, #0x1C]
        strh    r5, [r7, +r9]
        ldr     r5, [sp, #0x70]
        strh    r5, [r2, +r9]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x3C]
        strh    r10, [r5, +r9]
        ldr     r5, [sp, #0x58]
        strh    r5, [r0, +r9]
        ldr     r5, [sp, #0x78]
        strh    r5, [r1, +r9]
        ldr     r5, [sp, #0x2C]
        ldr     r10, [sp, #0x4C]
        strh    r10, [r5, +r9]
        ldr     r5, [sp, #0x40]
        ldr     r10, [sp, #0x28]
        strh    r10, [r5, +r9]
        ldr     r5, [sp, #0x34]
        ldr     r10, [sp, #0x24]
        strh    r10, [r5, +r9]
        ldr     r5, [sp, #0x48]
        ldr     r10, [sp, #0x18]
        strh    r10, [r5, +r9]
        ldr     r5, [sp, #0x6C]
        strh    r4, [r5, +r9]
        add     r9, r9, #2
        bne     LKWX19
        ldr     r6, [sp]
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #0x40]
        ldr     r9, [r6]
        ldr     r10, [sp, #0xC]
        ldr     r6, [r6, #4]
        subs    r4, r4, #1
        ldr     r9, [r9, #8]
        ldr     r6, [r6, #8]
        add     r10, r10, r9, lsl #1
        str     r10, [sp, #0xC]
        add     lr, lr, r9, lsl #1
        add     r11, r11, r9, lsl #1
        add     r12, r12, r9, lsl #1
        add     r8, r8, r9, lsl #1
        add     r3, r3, r9, lsl #1
        add     r7, r7, r9, lsl #1
        add     r2, r2, r9, lsl #1
        ldr     r9, [sp, #0x20]
        add     r0, r0, r6, lsl #1
        add     r1, r1, r6, lsl #1
        add     r9, r9, r6, lsl #1
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x2C]
        add     r5, r5, r6, lsl #1
        add     r9, r9, r6, lsl #1
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x34]
        add     r9, r9, r6, lsl #1
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x48]
        add     r9, r9, r6, lsl #1
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x6C]
        add     r6, r9, r6, lsl #1
        str     r6, [sp, #0x6C]
        bne     LKWX18
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        b       LKWX5
LKWX20:
        cmp     r8, #0
        bne     LKWX21
        cmp     r7, #0
        bne     LKWX21
        cmp     lr, #0
        beq     LKWX22
LKWX21:
        mvn     r0, #0x74
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}
LKWX22:
        ldr     r8, [r6, #8]
        ldr     r12, [r5, #8]
        mov     r7, #0
        mov     r6, r7
        sub     r5, r10, #2
        sub     lr, r9, #2
        str     r3, [sp, #4]
        str     r0, [sp]
LKWX23:
        sub     r0, r6, r8
        sub     r1, r6, r12
        mov     r0, r0, lsl #1
        ldrh    r0, [r5, +r0]
        mov     r1, r1, lsl #1
        ldrh    r1, [lr, +r1]
        add     r3, sp, #0xFC
        add     r2, sp, #0xE8
        add     r6, r6, #1
        strh    r0, [r3, +r7]
        strh    r1, [r2, +r7]
        cmp     r6, #9
        add     r7, r7, #2
        blt     LKWX23
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        mov     r7, #0
        mov     r6, r7
        sub     r5, r10, #2
        sub     lr, r9, #2
        str     r3, [sp, #4]
        str     r0, [sp]
LKWX24:
        sub     r0, r6, #1
        mul     r2, r8, r0
        mul     r0, r12, r0
        add     r1, sp, #0xC4
        add     r3, sp, #0xA0
        mov     r2, r2, lsl #1
        ldrh    r2, [r5, +r2]
        mov     r0, r0, lsl #1
        ldrh    r0, [lr, +r0]
        add     r6, r6, #1
        strh    r2, [r1, +r7]
        strh    r0, [r3, +r7]
        cmp     r6, #0x11
        add     r7, r7, #2
        blt     LKWX24
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        mov     r6, #0
        mov     lr, r6
        mov     r5, #1
        mov     r12, #2
        str     r3, [sp, #4]
        str     r0, [sp]
LKWX25:
        rsb     r7, r5, #0
        add     r2, sp, #0xFC
        add     r0, sp, #0xFC
        add     r1, sp, #0xE8
        add     r2, r2, r7, lsl #1
        ldrh    r2, [r2, #8]
        add     r3, sp, #0xE8
        add     r0, r0, r12
        ldrh    r0, [r0, #8]
        add     r1, r1, r12
        ldrh    r1, [r1, #8]
        add     r7, r3, r7, lsl #1
        ldrh    r3, [r7, #8]
        sub     r0, r0, r2
        mla     lr, r5, r0, lr
        add     r12, r12, #2
        sub     r1, r1, r3
        mla     r6, r5, r1, r6
        add     r5, r5, #1
        cmp     r5, #4
        ble     LKWX25
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        mov     r7, #0
        str     r7, [sp, #0x6C]
        ldr     r2, [sp, #0x6C]
        mov     r5, #1
        mov     r12, #2
        str     r10, [sp, #0xC]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
        str     r0, [sp]
LKWX26:
        rsb     r4, r5, #0
        add     r10, sp, #0xC4
        add     r0, sp, #0xC4
        add     r1, sp, #0xA0
        add     r10, r10, r4, lsl #1
        ldrh    r10, [r10, #0x10]
        add     r3, sp, #0xA0
        add     r0, r0, r12
        ldrh    r0, [r0, #0x10]
        add     r1, r1, r12
        ldrh    r1, [r1, #0x10]
        add     r4, r3, r4, lsl #1
        ldrh    r3, [r4, #0x10]
        sub     r0, r0, r10
        mla     r2, r5, r0, r2
        add     r12, r12, #2
        sub     r1, r1, r3
        mla     r7, r5, r1, r7
        add     r5, r5, #1
        cmp     r5, #8
        ble     LKWX26
        str     r2, [sp, #0x6C]
        ldr     r10, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        add     r1, sp, #0xE8
        ldrh    r1, [r1, #0x10]
        add     r12, sp, #0xFC
        add     r5, sp, #0xC4
        ldrh    r12, [r12, #0x10]
        ldrh    r5, [r5, #0x20]
        str     r1, [sp, #0x9C]
        add     r1, sp, #0xA0
        ldrh    r1, [r1, #0x20]
        add     r2, lr, lr, lsl #5
        add     r2, lr, r2
        str     r1, [sp, #0x98]
        add     r1, r6, r6, lsl #5
        add     r1, r6, r1
        add     lr, r1, #0x20
        ldr     r1, [sp, #0x6C]
        add     r7, r7, r7, lsl #2
        add     r6, r2, #0x20
        add     r1, r1, r1, lsl #2
        add     r7, r7, #0x20
        add     r2, r12, r5
        add     r1, r1, #0x20
        mov     r12, r7, asr #6
        ldr     r7, [sp, #0x9C]
        mov     r5, r1, asr #6
        ldr     r1, [sp, #0x98]
        mov     r6, r6, asr #6
        mov     lr, lr, asr #6
        str     r6, [sp, #0x6C]
        add     r7, r7, r1
        sub     r1, lr, lr, lsl #2
        sub     r6, r6, r6, lsl #2
        add     r1, r1, r7, lsl #4
        add     r2, r6, r2, lsl #4
        mov     r7, #0
        str     r2, [sp, #0x9C]
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x9C]
        sub     r6, r5, r5, lsl #3
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x68]
        sub     r2, r12, r12, lsl #3
        add     r7, r7, r6
        add     r6, r1, r2
        mov     r1, #1
        str     r9, [sp, #0x20]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
LKWX27:
        mla     r2, r10, r12, r6
        mla     r3, r5, r10, r7
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     r5, [sp, #0x10]
        ldr     r12, [sp, #0x6C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0xC]
        mov     r9, #0
        mov     r4, r9
        add     r3, r3, #0x10
        add     r2, r2, #0x10
        str     r7, [sp, #0x18]
LKWX28:
        mul     r8, r10, r8
        mov     r7, r1, lsl r11
        sub     r7, r7, #1
        mov     r11, r3, asr #5
        cmp     r11, r7
        movlt   r7, r11
        cmp     r7, #0
        mov     r11, #0
        movlt   r7, r11
        add     r8, r6, r8, lsl #1
        strh    r7, [r8, +r9]
        ldr     r11, [r0]
        ldr     r7, [r0, #4]
        mov     r8, r2, asr #5
        ldr     r11, [r11, #0x1C]
        add     r3, r3, r12
        ldr     r7, [r7, #8]
        add     r2, r2, lr
        mov     r11, r1, lsl r11
        sub     r11, r11, #1
        mul     r7, r7, r10
        cmp     r8, r11
        movlt   r11, r8
        cmp     r11, #0
        mov     r8, #0
        movlt   r11, r8
        add     r7, r5, r7, lsl #1
        add     r4, r4, #1
        strh    r11, [r7, +r9]
        cmp     r4, #8
        add     r9, r9, #2
        bge     LKWX29
        ldr     r7, [r0]
        ldr     r11, [r7, #0x1C]
        ldr     r8, [r7, #8]
        b       LKWX28
LKWX29:
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        add     r10, r10, #1
        cmp     r10, #0x10
        bge     LKWX30
        ldr     r2, [r0]
        ldr     r11, [r2, #0x1C]
        ldr     r8, [r2, #8]
        b       LKWX27
LKWX30:
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        b       LKWX5
LKWX31:
        mvn     r0, #7
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}


