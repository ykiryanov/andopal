        .text
        .align  4
        .globl  ippiReconstructChromaIntra4x4MB_H264_16s8u_P2R


ippiReconstructChromaIntra4x4MB_H264_16s8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB0
        ldr     r7, [sp, #0xE4]
        ldr     r12, [sp, #0xD8]
        ldr     r9, [sp, #0xD4]
        ldr     r8, [sp, #0xDC]
        ldr     lr, [sp, #0xE0]
        ldr     r6, [sp, #0xEC]
        ldr     r5, [sp, #0xF0]
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0xE8]
        and     r11, r7, #4
        and     r10, r7, #1
        cmp     r0, #0
        mov     r4, r3
        and     r7, r7, #0x10
        str     r1, [sp, #0x74]
        str     r2, [sp, #0x70]
        beq     LKWL26
        cmp     r1, #0
        beq     LKWL26
        cmp     r2, #0
        beq     LKWL26
        ldr     r3, [r0]
        cmp     r3, #0
        beq     LKWL26
        cmp     r12, #0
        beq     LKWL26
        cmp     r6, #0
        beq     LKWL26
        cmp     r8, #0x27
        bhi     LKWL0
        cmp     lr, #0x27
        bhi     LKWL0
        subs    r9, r9, #3
        beq     LKWL19
        adds    r9, r9, #3
        beq     LKWL9
        subs    r9, r9, #1
        beq     LKWL5
        subs    r9, r9, #1
        beq     LKWL1
LKWL0:
        mvn     r0, #0xA
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LKWL1:
        cmp     r11, #0
        beq     LKWL2
        mvn     r0, #0x74
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LKWL2:
        ldr     r11, [sp, #0x70]
        ldr     r10, [sp, #0x74]
        sub     r3, r1, r4
        str     r8, [sp, #0x40]
        sub     r9, r2, r4
        mov     r7, #8
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
        mov     r8, r3
LKWL3:
        mov     r1, r10
        mov     r0, r8
        mov     r2, #8
        bl      _ippsCopy_8u
        mov     r2, #8
        mov     r1, r11
        mov     r0, r9
        bl      _ippsCopy_8u
        subs    r7, r7, #1
        add     r10, r4, r10
        add     r11, r4, r11
        bne     LKWL3
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
LKWL4:
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r8, [sp, #4]
        ldr     r12, [sp, #0x7C]
        mov     r3, r4
        str     r12, [sp]
        bl      ippiReconstructChromaInter4x4MB_H264_16s8u_P2R
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LKWL5:
        cmp     r10, #0
        beq     LKWL6
        mvn     r0, #0x74
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LKWL6:
        ldr     r10, [sp, #0x70]
        ldr     r11, [sp, #0x74]
        mov     r7, #8
LKWL7:
        mov     r9, #0
LKWL8:
        ldrb    r3, [r11, #-1]
        strb    r3, [r11, +r9]
        ldrb    r3, [r10, #-1]
        strb    r3, [r10, +r9]
        add     r9, r9, #1
        cmp     r9, #8
        blt     LKWL8
        subs    r7, r7, #1
        add     r11, r4, r11
        add     r10, r4, r10
        bne     LKWL7
        b       LKWL4
LKWL9:
        cmp     r11, #0
        bne     LKWL13
        cmp     r10, #0
        sub     r9, r1, r4
        sub     r7, r2, r4
        beq     LKWL11
        add     r9, r9, #3
        str     r9, [sp, #0x60]
        add     r7, r7, #3
        str     r7, [sp, #0x64]
        mov     r9, #0
        str     r8, [sp, #0x40]
        str     r4, [sp, #0x2C]
        ldr     r8, [sp, #0x64]
        ldr     r4, [sp, #0x60]
        mov     r11, r9
        mov     r3, r11
        mov     r7, r3
        mov     r10, #4
        str     lr, [sp, #0x3C]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
LKWL10:
        ldrb    r0, [r4, #-3]
        ldrb    r1, [r4, #1]!
        ldrb    r2, [r8, #-3]
        ldrb    lr, [r8, #1]!
        subs    r10, r10, #1
        add     r3, r0, r3
        add     r11, r1, r11
        add     r9, r2, r9
        add     r7, lr, r7
        bne     LKWL10
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r4, [sp, #0x2C]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r7, r7, #2
        add     r10, r3, #2
        add     r11, r11, #2
        mov     r7, r7, asr #2
        add     r9, r9, #2
        mov     r10, r10, asr #2
        mov     r11, r11, asr #2
        and     r7, r7, #0xFF
        mov     r9, r9, asr #2
        and     r10, r10, #0xFF
        and     r11, r11, #0xFF
        str     r7, [sp, #0x74]
        and     r9, r9, #0xFF
        str     r10, [sp, #0x78]
        str     r11, [sp, #0x6C]
        mov     r3, r9
        str     r7, [sp, #0x70]
        b       LKWL16
LKWL11:
        add     r9, r9, #3
        add     r11, r1, r4, lsl #2
        str     r9, [sp, #0x50]
        str     r11, [sp, #0x78]
        mov     r9, #0
        add     r7, r7, #3
        add     r11, r2, r4, lsl #2
        str     r7, [sp, #0x54]
        str     r9, [sp, #0x24]
        mov     r7, r9
        sub     r11, r11, #2
        str     r11, [sp, #0x5C]
        sub     r11, r2, #2
        str     r7, [sp, #0x28]
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x78]
        mov     r10, r7
        str     r10, [sp, #0x20]
        sub     r11, r11, #2
        str     r11, [sp, #0x64]
        mov     r3, r10
        sub     r11, r1, #2
        str     r11, [sp, #0x60]
        str     r3, [sp, #0x18]
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r4, [sp, #0x2C]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x60]
        ldr     lr, [sp, #0x64]
        ldr     r4, [sp, #0x58]
        ldr     r5, [sp, #0x5C]
        ldr     r6, [sp, #0x50]
        str     r10, [sp, #0x1C]
        mov     r11, #4
        str     r8, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
LKWL12:
        ldrb    r1, [r6, #1]
        ldrb    r0, [r6, #-3]
        ldr     r8, [sp, #0x20]
        str     r1, [sp, #0x78]
        ldrb    r1, [r12, #1]
        subs    r11, r11, #1
        add     r8, r0, r8
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        ldrb    r1, [lr, #1]
        add     r6, r6, #1
        add     r7, r0, r7
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x70]
        ldrb    r1, [r3, #-3]
        str     r1, [sp, #0x6C]
        ldrb    r1, [r3, #1]!
        str     r1, [sp, #0x68]
        ldrb    r1, [r4, #1]
        ldrb    r2, [r5, #1]
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x74]
        add     r10, r2, r10
        add     r0, r8, r0
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x70]
        ldr     r8, [sp, #0x6C]
        add     r9, r0, r9
        ldr     r0, [sp, #0x24]
        add     r0, r8, r0
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        ldr     r8, [sp, #0x68]
        add     r0, r8, r0
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r1, r0
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x2C]
        add     r5, r5, r0
        add     r4, r4, r0
        add     lr, lr, r0
        add     r12, r12, r0
        bne     LKWL12
        ldr     r3, [sp, #0x20]
        ldr     r11, [sp, #0x28]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r4, [sp, #0x2C]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r3, r11, r3
        add     r11, r9, r7
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x24]
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x1C]
        add     r7, r7, #2
        str     r7, [sp, #0x68]
        add     r3, r11, r3
        ldr     r11, [sp, #0x18]
        str     r3, [sp, #0x70]
        add     r9, r9, #2
        add     r3, r10, r11
        str     r3, [sp, #0x6C]
        ldr     r3, [sp, #0x78]
        ldr     r7, [sp, #0x6C]
        str     r9, [sp, #0x64]
        add     r3, r3, #4
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        add     r11, r11, #2
        add     r10, r10, #2
        add     r3, r3, #4
        str     r3, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        add     r7, r7, #4
        str     r7, [sp, #0x6C]
        ldr     r7, [sp, #0x78]
        add     r3, r3, #4
        str     r3, [sp, #0x70]
        ldr     r3, [sp, #0x64]
        mov     r9, r7, asr #3
        ldr     r7, [sp, #0x68]
        mov     r3, r3, asr #2
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        mov     r11, r11, asr #2
        mov     r7, r7, asr #2
        str     r11, [sp, #0x68]
        and     r11, r7, #0xFF
        ldr     r7, [sp, #0x78]
        mov     r3, r3, asr #3
        str     r3, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        and     r7, r7, #0xFF
        mov     r10, r10, asr #2
        str     r7, [sp, #0x78]
        ldr     r7, [sp, #0x74]
        str     r10, [sp, #0x64]
        ldr     r10, [sp, #0x6C]
        and     r7, r7, #0xFF
        mov     r3, r3, asr #3
        str     r3, [sp, #0x70]
        mov     r10, r10, asr #3
        str     r7, [sp, #0x6C]
        ldr     r7, [sp, #0x70]
        str     r10, [sp, #0x60]
        and     r10, r9, #0xFF
        and     r9, r7, #0xFF
        ldr     r7, [sp, #0x68]
        and     r7, r7, #0xFF
        str     r7, [sp, #0x74]
        ldr     r7, [sp, #0x64]
        and     r3, r7, #0xFF
        ldr     r7, [sp, #0x60]
        and     r7, r7, #0xFF
        str     r7, [sp, #0x70]
        b       LKWL16
LKWL13:
        cmp     r10, #0
        beq     LKWL14
        mov     r9, #0x80
        mov     r11, r9
        str     r11, [sp, #0x6C]
        str     r11, [sp, #0x78]
        mov     r10, r11
        mov     r3, r10
        str     r3, [sp, #0x70]
        str     r3, [sp, #0x74]
        b       LKWL16
LKWL14:
        add     r11, r2, r4, lsl #2
        sub     r11, r11, #2
        str     r11, [sp, #0x50]
        sub     r11, r2, #2
        mov     r10, #0
        add     r3, r1, r4, lsl #2
        str     r11, [sp, #0x54]
        mov     r9, r10
        mov     r7, r9
        sub     r11, r3, #2
        sub     r3, r1, #2
        str     r3, [sp, #0x5C]
        str     r7, [sp, #0x64]
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     lr, [sp, #0x3C]
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x5C]
        ldr     lr, [sp, #0x54]
        ldr     r5, [sp, #0x50]
        ldr     r6, [sp, #0x64]
        mov     r3, #4
        str     r12, [sp, #0x38]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
LKWL15:
        ldrb    r0, [r8, #1]
        ldrb    r1, [r11, #1]
        ldrb    r2, [lr, #1]
        ldrb    r12, [r5, #1]
        subs    r3, r3, #1
        add     r7, r0, r7
        add     r9, r1, r9
        add     r10, r2, r10
        add     r6, r12, r6
        add     r5, r5, r4
        add     lr, lr, r4
        add     r11, r11, r4
        add     r8, r8, r4
        bne     LKWL15
        str     r6, [sp, #0x64]
        ldr     r11, [sp, #0x64]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r11, r11, #2
        add     r9, r9, #2
        str     r11, [sp, #0x78]
        add     r10, r10, #2
        mov     r11, r9, asr #2
        mov     r9, r10, asr #2
        ldr     r10, [sp, #0x78]
        add     r7, r7, #2
        and     r9, r9, #0xFF
        mov     r10, r10, asr #2
        str     r10, [sp, #0x74]
        ldr     r3, [sp, #0x74]
        mov     r7, r7, asr #2
        and     r10, r7, #0xFF
        and     r7, r11, #0xFF
        and     r3, r3, #0xFF
        str     r7, [sp, #0x78]
        mov     r11, r10
        str     r7, [sp, #0x6C]
        str     r9, [sp, #0x74]
        str     r3, [sp, #0x70]
LKWL16:
        add     r7, r1, r4, lsl #2
        str     r7, [sp, #0x68]
        add     r7, r2, r4, lsl #2
        str     r7, [sp, #0x20]
        add     r7, r1, #4
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x68]
        str     r1, [sp, #0x64]
        add     r7, r7, #4
        str     r7, [sp, #0x5C]
        add     r7, r2, #4
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #0x20]
        str     r2, [sp, #0x58]
        str     r9, [sp, #0x50]
        add     r7, r7, #4
        str     r7, [sp, #0x1C]
        mov     r7, #4
        str     r7, [sp, #0x18]
        str     r11, [sp, #0x54]
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x28]
        ldr     r1, [sp, #0x58]
        ldr     r2, [sp, #0x5C]
        ldr     r12, [sp, #0x68]
        ldr     lr, [sp, #0x60]
        ldr     r5, [sp, #0x64]
        ldr     r6, [sp, #0x70]
        ldr     r7, [sp, #0x74]
        str     r0, [sp, #0x4C]
LKWL17:
        str     r11, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r9, [sp, #0x28]
        str     r4, [sp, #0x2C]
        ldr     r4, [sp, #0x50]
        ldr     r8, [sp, #0x6C]
        ldr     r9, [sp, #0x78]
        ldr     r11, [sp, #0x54]
        mov     r0, #0
        str     r10, [sp, #0x18]
LKWL18:
        ldr     r10, [sp, #0x24]
        strb    r10, [r5, +r0]
        strb    r11, [lr, +r0]
        strb    r9, [r12, +r0]
        strb    r8, [r2, +r0]
        strb    r4, [r1, +r0]
        ldr     r10, [sp, #0x28]
        strb    r7, [r10, +r0]
        ldr     r10, [sp, #0x20]
        strb    r3, [r10, +r0]
        ldr     r10, [sp, #0x1C]
        strb    r6, [r10, +r0]
        add     r0, r0, #1
        cmp     r0, #4
        blt     LKWL18
        ldr     r4, [sp, #0x2C]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x28]
        subs    r10, r10, #1
        add     r5, r4, r5
        add     lr, r4, lr
        add     r12, r4, r12
        add     r2, r4, r2
        add     r1, r4, r1
        add     r9, r4, r9
        add     r8, r4, r8
        add     r11, r4, r11
        bne     LKWL17
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        b       LKWL4
LKWL19:
        cmp     r11, #0
        bne     LKWL20
        cmp     r10, #0
        bne     LKWL20
        cmp     r7, #0
        beq     LKWL21
LKWL20:
        mvn     r0, #0x74
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LKWL21:
        sub     r7, r1, r4
        sub     r10, r7, #2
        rsb     r7, r4, r1
        sub     r7, r7, #2
        str     r7, [sp, #0x68]
        rsb     r7, r4, r2
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x68]
        sub     r9, r7, #2
        sub     r7, r2, r4
        mov     r11, #0
        sub     r7, r7, #2
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
LKWL22:
        ldrb    r3, [r10, #1]!
        ldrb    r6, [r0, #1]
        ldrb    lr, [r7, #1]!
        ldrb    r2, [r9, #1]
        add     r8, sp, #0xA4
        add     r5, sp, #0x98
        add     r12, sp, #0x8C
        add     r1, sp, #0x80
        strb    r3, [r11, +r8]
        strb    r6, [r11, +r5]
        strb    lr, [r11, +r12]
        strb    r2, [r11, +r1]
        add     r11, r11, #1
        cmp     r11, #9
        add     r9, r9, r4
        add     r0, r0, r4
        blt     LKWL22
        ldr     r6, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r5, [sp, #0x30]
        mov     r3, #0
        mov     r11, r3
        mov     r10, r11
        mov     r9, r10
        mov     r7, #1
        str     r6, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     r4, [sp, #0x2C]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
LKWL23:
        add     r0, sp, #0x98
        add     r2, sp, #0xA4
        add     r8, sp, #0x80
        add     r4, sp, #0x8C
        add     r1, sp, #0x98
        add     r12, sp, #0xA4
        add     lr, sp, #0x80
        add     r6, sp, #0x8C
        add     r0, r0, r7
        ldrb    r0, [r0, #4]
        add     r2, r2, r7
        ldrb    r2, [r2, #4]
        add     r8, r8, r7
        ldrb    r8, [r8, #4]
        add     r4, r4, r7
        sub     r1, r1, r7
        ldrb    r1, [r1, #4]
        sub     r12, r12, r7
        ldrb    r12, [r12, #4]
        sub     lr, lr, r7
        ldrb    lr, [lr, #4]
        ldrb    r4, [r4, #4]
        sub     r6, r6, r7
        ldrb    r6, [r6, #4]
        sub     r0, r0, r1
        mla     r10, r7, r0, r10
        sub     r2, r2, r12
        mla     r11, r7, r2, r11
        sub     r8, r8, lr
        mla     r3, r7, r8, r3
        sub     r4, r4, r6
        mla     r9, r7, r4, r9
        add     r7, r7, #1
        cmp     r7, #4
        ble     LKWL23
        ldr     r6, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r4, [sp, #0x2C]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r7, sp, #0xA4
        ldrb    r7, [r7, #8]
        add     r11, r11, r11, lsl #4
        add     r10, r10, r10, lsl #4
        add     r3, r3, r3, lsl #4
        str     r7, [sp, #0x78]
        add     r7, sp, #0x98
        ldrb    r7, [r7, #8]
        add     r10, r10, #0x10
        add     r3, r3, #0x10
        str     r7, [sp, #0x74]
        add     r7, sp, #0x8C
        ldrb    r7, [r7, #8]
        str     r7, [sp, #0x70]
        add     r7, sp, #0x80
        ldrb    r7, [r7, #8]
        str     r3, [sp, #0x68]
        str     r5, [sp, #0x30]
        str     r7, [sp, #0x6C]
        add     r7, r9, r9, lsl #4
        add     r7, r7, #0x10
        ldr     r3, [sp, #0x6C]
        mov     r7, r7, asr #5
        add     r9, r11, #0x10
        ldr     r11, [sp, #0x74]
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x78]
        mov     r9, r9, asr #5
        str     r9, [sp, #0x64]
        str     r6, [sp, #0x34]
        add     r11, r7, r11
        str     r11, [sp, #0x78]
        ldr     r11, [sp, #0x70]
        mov     r7, r10, asr #5
        ldr     r10, [sp, #0x68]
        add     r3, r11, r3
        str     r3, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        sub     r11, r9, r9, lsl #2
        ldr     r9, [sp, #0x60]
        add     r11, r11, r3, lsl #4
        ldr     r3, [sp, #0x74]
        str     r7, [sp, #0x28]
        sub     r7, r7, r7, lsl #2
        mov     r10, r10, asr #5
        sub     r9, r9, r9, lsl #2
        add     r7, r11, r7
        str     r10, [sp, #0x24]
        add     r9, r9, r3, lsl #4
        str     r7, [sp, #0x54]
        ldr     r5, [sp, #0x54]
        sub     r10, r10, r10, lsl #2
        mov     r3, #0
        str     r8, [sp, #0x40]
        ldr     r3, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        add     r7, r9, r10
        mov     r10, r2
        mov     r9, r1
        mov     r11, #8
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x4C]
        mov     r6, #0xFF
LKWL24:
        str     r4, [sp, #0x2C]
        ldr     r4, [sp, #0x60]
        ldr     r8, [sp, #0x64]
        add     lr, r5, #0x10
        add     r12, r7, #0x10
        mov     r2, r9
        mov     r1, r10
        mov     r0, #8
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x20]
        mov     r3, #0
LKWL25:
        mov     r10, lr, asr #5
        cmp     r10, #0xFF
        mov     r9, r6
        movlt   r9, r10
        cmp     r9, #0
        movlt   r9, r3
        mov     r10, r12, asr #5
        cmp     r10, #0xFF
        mov     r11, r6
        movlt   r11, r10
        cmp     r11, #0
        strb    r9, [r2], #1
        movlt   r11, r3
        strb    r11, [r1], #1
        subs    r0, r0, #1
        add     lr, lr, r8
        add     r12, r12, r4
        bne     LKWL25
        ldr     r11, [sp, #0x20]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r4, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        subs    r11, r11, #1
        add     r10, r10, r4
        add     r9, r9, r4
        add     r5, r5, r8
        add     r7, r7, r3
        bne     LKWL24
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        b       LKWL4
LKWL26:
        mvn     r0, #7
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}


