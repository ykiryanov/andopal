        .text
        .align  4
        .globl  ippiReconstructChromaIntraHalfsMB_H264_16s8u_P2R


ippiReconstructChromaIntraHalfsMB_H264_16s8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r6, [sp, #0x98]
        ldr     r4, [sp, #0x9C]
        ldr     lr, [sp, #0xA0]
        ldr     r5, [sp, #0xA4]
        ldr     r12, [sp, #0xA8]
        cmp     r0, #0
        beq     LKWU12
        cmp     r1, #0
        beq     LKWU12
        cmp     r2, #0
        beq     LKWU12
        ldr     r7, [r0]
        cmp     r7, #0
        beq     LKWU12
        cmp     lr, #0
        blt     LKWU11
        cmp     lr, #0x33
        bgt     LKWU11
        cmp     r6, #0
        bne     LKWU10
        add     r6, r1, #4
        str     r6, [sp, #0x18]
        add     r6, r2, #4
        ands    r9, r5, #4
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r6, [sp, #0x14]
        bne     LKWU0
        tst     r5, #1
        bne     LKWU0
        sub     r5, r1, r3
        ldrb    r6, [r5]
        add     r11, r1, r3, lsl #1
        str     r6, [sp, #0x24]
        ldrb    r6, [r5, #4]
        str     r6, [sp, #0x28]
        ldrb    r6, [r1, #-1]
        str     r6, [sp, #0x2C]
        sub     r6, r2, r3
        ldrb    r8, [r6]
        ldrb    r7, [r6, #4]
        str     r7, [sp, #0x30]
        ldrb    r7, [r2, #-1]
        str     r7, [sp, #0x34]
        ldrb    r7, [r5, #1]
        str     r7, [sp, #0x38]
        ldrb    r7, [r5, #5]
        str     r7, [sp, #0x3C]
        ldrb    r10, [r6, #5]
        ldrb    r7, [r6, #1]
        str     r10, [sp, #0x40]
        ldrb    r10, [r5, #2]
        add     r7, r8, r7
        ldr     r8, [sp, #0x34]
        str     r10, [sp, #0x44]
        ldrb    r10, [r5, #6]
        str     r10, [sp, #0x48]
        ldrb    r10, [r6, #2]
        str     r10, [sp, #0x4C]
        ldrb    r10, [r6, #6]
        str     r10, [sp, #0x50]
        ldrb    r10, [r5, #3]
        str     r10, [sp, #0x54]
        ldrb    r5, [r5, #7]
        str     r5, [sp, #0x58]
        ldrb    r5, [r6, #3]
        str     r5, [sp, #0x5C]
        ldrb    r6, [r6, #7]
        add     r5, r1, r3
        str     r6, [sp, #0x60]
        ldrb    r10, [r5, #-1]
        ldrb    r11, [r11, #-1]
        add     r5, r2, r3
        ldrb    r5, [r5, #-1]
        add     r6, r3, r3, lsl #1
        str     r11, [sp, #0x64]
        add     r11, r2, r3, lsl #1
        ldrb    r11, [r11, #-1]
        add     r8, r8, r5
        ldr     r5, [sp, #0x28]
        str     r11, [sp, #0x68]
        add     r11, r1, r6
        ldrb    r11, [r11, #-1]
        add     r6, r2, r6
        str     r11, [sp, #0x6C]
        ldrb    r6, [r6, #-1]
        ldr     r11, [sp, #0x38]
        str     r6, [sp, #0x70]
        ldr     r6, [sp, #0x24]
        add     r6, r6, r11
        ldr     r11, [sp, #0x2C]
        add     r10, r11, r10
        ldr     r11, [sp, #0x3C]
        add     r11, r5, r11
        str     r11, [sp, #0x3C]
        ldr     r5, [sp, #0x30]
        ldr     r11, [sp, #0x40]
        add     r5, r5, r11
        ldr     r11, [sp, #0x44]
        add     r11, r6, r11
        ldr     r6, [sp, #0x64]
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        add     r6, r10, r6
        ldr     r10, [sp, #0x4C]
        add     r7, r7, r10
        ldr     r10, [sp, #0x68]
        add     r8, r8, r10
        ldr     r10, [sp, #0x3C]
        add     r11, r10, r11
        ldr     r10, [sp, #0x50]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x54]
        add     r5, r5, r10
        ldr     r10, [sp, #0x44]
        add     r10, r10, r11
        ldr     r11, [sp, #0x6C]
        add     r6, r6, r11
        ldr     r11, [sp, #0x5C]
        add     r10, r6, r10
        add     r11, r7, r11
        ldr     r7, [sp, #0x70]
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x58]
        add     r8, r8, r7
        ldr     r7, [sp, #0x68]
        ldr     r6, [sp, #0x6C]
        add     r7, r7, r11
        ldr     r11, [sp, #0x60]
        add     r5, r5, r11
        add     r11, r8, r6
        add     r6, r10, #4
        add     r8, r7, #2
        add     r10, r5, #2
        mov     r5, r6, asr #3
        add     r7, r11, #4
        mov     r6, r8, asr #2
        mov     r8, r7, asr #3
        mov     r7, r10, asr #2
        and     r5, r5, #0xFF
        and     r6, r6, #0xFF
        and     r8, r8, #0xFF
        and     r7, r7, #0xFF
        b       LKWU3
LKWU0:
        cmp     r9, #0
        bne     LKWU1
        sub     r7, r1, r3
        ldrb    r5, [r7, #4]
        ldrb    r8, [r7]
        sub     r10, r2, r3
        str     r5, [sp, #0x70]
        ldrb    r5, [r10]
        str     r5, [sp, #0x6C]
        ldrb    r5, [r10, #4]
        str     r5, [sp, #0x68]
        ldrb    r5, [r7, #5]
        ldrb    r6, [r7, #1]
        str     r5, [sp, #0x64]
        ldrb    r5, [r10, #1]
        ldrb    r11, [r10, #5]
        str     r11, [sp, #0x60]
        ldrb    r11, [r7, #2]
        str     r11, [sp, #0x5C]
        ldrb    r11, [r7, #6]
        str     r11, [sp, #0x58]
        ldrb    r11, [r10, #2]
        str     r11, [sp, #0x54]
        ldrb    r11, [r10, #6]
        str     r11, [sp, #0x50]
        ldrb    r11, [r7, #3]
        str     r11, [sp, #0x4C]
        ldrb    r7, [r7, #7]
        add     r11, r8, r6
        ldr     r6, [sp, #0x70]
        str     r7, [sp, #0x48]
        ldrb    r7, [r10, #3]
        ldr     r8, [sp, #0x64]
        add     r6, r6, r8
        ldr     r8, [sp, #0x6C]
        str     r7, [sp, #0x44]
        ldrb    r7, [r10, #7]
        ldr     r10, [sp, #0x60]
        add     r8, r8, r5
        ldr     r5, [sp, #0x68]
        add     r10, r5, r10
        ldr     r5, [sp, #0x5C]
        add     r5, r11, r5
        ldr     r11, [sp, #0x58]
        add     r6, r6, r11
        ldr     r11, [sp, #0x54]
        add     r8, r8, r11
        ldr     r11, [sp, #0x50]
        add     r10, r10, r11
        ldr     r11, [sp, #0x4C]
        add     r7, r10, r7
        add     r7, r7, #2
        add     r5, r5, r11
        ldr     r11, [sp, #0x48]
        add     r5, r5, #2
        mov     r7, r7, asr #2
        mov     r5, r5, asr #2
        add     r6, r6, r11
        ldr     r11, [sp, #0x44]
        add     r6, r6, #2
        and     r5, r5, #0xFF
        mov     r6, r6, asr #2
        add     r8, r8, r11
        add     r8, r8, #2
        and     r6, r6, #0xFF
        mov     r8, r8, asr #2
        and     r8, r8, #0xFF
        and     r7, r7, #0xFF
        b       LKWU3
LKWU1:
        tst     r5, #1
        bne     LKWU2
        ldrb    r5, [r2, #-1]
        ldrb    r8, [r1, #-1]
        add     r6, r3, r3, lsl #1
        str     r5, [sp, #0x70]
        add     r5, r1, r3
        ldrb    r7, [r5, #-1]
        add     r5, r2, r3
        ldrb    r5, [r5, #-1]
        add     r8, r8, r7
        ldr     r7, [sp, #0x70]
        str     r5, [sp, #0x6C]
        add     r5, r1, r3, lsl #1
        ldrb    r5, [r5, #-1]
        ldr     r10, [sp, #0x6C]
        str     r5, [sp, #0x68]
        add     r5, r2, r3, lsl #1
        ldrb    r5, [r5, #-1]
        add     r7, r7, r10
        ldr     r10, [sp, #0x68]
        str     r5, [sp, #0x64]
        add     r5, r1, r6
        ldrb    r5, [r5, #-1]
        add     r6, r2, r6
        ldrb    r6, [r6, #-1]
        add     r8, r8, r10
        ldr     r10, [sp, #0x64]
        add     r5, r8, r5
        add     r5, r5, #2
        add     r7, r7, r10
        add     r6, r7, r6
        add     r6, r6, #2
        mov     r5, r5, asr #2
        mov     r6, r6, asr #2
        and     r8, r6, #0xFF
        and     r5, r5, #0xFF
        mov     r6, r5
        mov     r7, r8
        b       LKWU3
LKWU2:
        mov     r8, #0x80
        mov     r6, r8
        mov     r5, r6
        mov     r7, r5
LKWU3:
        str     r2, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r0, [sp, #8]
        ldr     r11, [sp, #0x14]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        mov     r10, #4
LKWU4:
        strb    r5, [r2]
        strb    r6, [r1]
        strb    r8, [r0]
        strb    r7, [r11]
        strb    r5, [r2, #1]
        strb    r6, [r1, #1]
        strb    r8, [r0, #1]
        strb    r7, [r11, #1]
        strb    r5, [r2, #2]
        strb    r6, [r1, #2]
        strb    r8, [r0, #2]
        strb    r7, [r11, #2]
        strb    r5, [r2, #3]
        strb    r6, [r1, #3]
        strb    r8, [r0, #3]
        strb    r7, [r11, #3]
        subs    r10, r10, #1
        add     r2, r3, r2
        add     r1, r3, r1
        add     r0, r3, r0
        add     r11, r3, r11
        bne     LKWU4
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #8]
        cmp     r9, #0
        str     r11, [sp, #0x14]
        bne     LKWU5
        tst     r12, #1
        bne     LKWU5
        ldr     r5, [sp, #0x1C]
        sub     r12, r1, r3
        ldrb    r7, [r12, #4]
        ldrb    r10, [r5, #-1]
        sub     r9, r2, r3
        ldrb    r6, [r9, #4]
        str     r6, [sp, #0x70]
        ldr     r6, [sp, #0x20]
        ldrb    r8, [r6, #-1]
        str     r8, [sp, #0x6C]
        ldrb    r11, [r9, #5]
        ldrb    r8, [r12, #5]
        str     r11, [sp, #0x68]
        ldrb    r11, [r12, #6]
        add     r8, r7, r8
        ldr     r7, [sp, #0x70]
        str     r11, [sp, #0x64]
        ldrb    r11, [r9, #6]
        str     r11, [sp, #0x60]
        ldrb    r12, [r12, #7]
        add     r11, r3, r3, lsl #1
        str     r12, [sp, #0x5C]
        ldrb    r9, [r9, #7]
        add     r12, r5, r3
        str     r9, [sp, #0x58]
        ldrb    r9, [r12, #-1]
        add     r12, r6, r3
        ldrb    r12, [r12, #-1]
        add     r9, r10, r9
        ldr     r10, [sp, #0x6C]
        str     r12, [sp, #0x54]
        add     r12, r5, r3, lsl #1
        ldrb    r12, [r12, #-1]
        add     r5, r5, r11
        add     r11, r6, r11
        str     r12, [sp, #0x50]
        add     r12, r6, r3, lsl #1
        ldrb    r6, [r11, #-1]
        ldrb    r12, [r12, #-1]
        ldr     r11, [sp, #0x54]
        ldrb    r5, [r5, #-1]
        add     r10, r10, r11
        ldr     r11, [sp, #0x68]
        add     r12, r10, r12
        ldr     r10, [sp, #0x64]
        add     r6, r12, r6
        ldr     r12, [sp, #0x5C]
        add     r7, r7, r11
        ldr     r11, [sp, #0x50]
        add     r8, r8, r10
        ldr     r10, [sp, #0x60]
        add     r8, r8, r12
        ldr     r12, [sp, #0x58]
        add     r9, r9, r11
        add     r7, r7, r10
        add     r5, r9, r5
        add     r12, r7, r12
        add     r7, r5, r8
        add     r12, r6, r12
        add     r5, r5, #2
        add     r7, r7, #4
        add     r6, r6, #2
        add     r12, r12, #4
        mov     r5, r5, asr #2
        mov     r8, r7, asr #3
        mov     r6, r6, asr #2
        mov     r12, r12, asr #3
        and     r7, r5, #0xFF
        and     r5, r8, #0xFF
        and     r6, r6, #0xFF
        and     r12, r12, #0xFF
        b       LKWU8
LKWU5:
        cmp     r9, #0
        bne     LKWU6
        sub     r9, r1, r3
        ldrb    r12, [r9, #4]
        ldrb    r5, [r9]
        str     r12, [sp, #0x70]
        sub     r12, r2, r3
        ldrb    r6, [r12]
        str     r6, [sp, #0x6C]
        ldrb    r8, [r12, #1]
        ldrb    r7, [r9, #1]
        ldrb    r6, [r9, #5]
        ldrb    r10, [r12, #4]
        str     r8, [sp, #0x68]
        ldrb    r8, [r12, #5]
        add     r5, r5, r7
        ldr     r7, [sp, #0x70]
        str     r8, [sp, #0x64]
        ldrb    r11, [r9, #6]
        ldrb    r8, [r9, #2]
        add     r6, r7, r6
        ldr     r7, [sp, #0x6C]
        str     r11, [sp, #0x60]
        ldrb    r11, [r12, #2]
        add     r8, r5, r8
        ldr     r5, [sp, #0x60]
        str     r11, [sp, #0x5C]
        ldrb    r11, [r12, #6]
        add     r6, r6, r5
        ldr     r5, [sp, #0x5C]
        str     r11, [sp, #0x58]
        ldrb    r11, [r9, #3]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x68]
        ldrb    r9, [r9, #7]
        add     r7, r7, r11
        ldr     r11, [sp, #0x64]
        add     r7, r7, r5
        ldr     r5, [sp, #0x58]
        str     r9, [sp, #0x50]
        ldrb    r9, [r12, #3]
        ldrb    r12, [r12, #7]
        add     r10, r10, r11
        add     r10, r10, r5
        ldr     r5, [sp, #0x54]
        add     r9, r7, r9
        add     r12, r10, r12
        add     r8, r8, r5
        ldr     r5, [sp, #0x50]
        add     r8, r8, #2
        add     r9, r9, #2
        add     r12, r12, #2
        add     r6, r6, r5
        add     r6, r6, #2
        mov     r8, r8, asr #2
        mov     r6, r6, asr #2
        mov     r12, r12, asr #2
        mov     r9, r9, asr #2
        and     r5, r6, #0xFF
        and     r7, r8, #0xFF
        and     r6, r9, #0xFF
        and     r12, r12, #0xFF
        b       LKWU8
LKWU6:
        tst     r12, #1
        bne     LKWU7
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        add     r10, r3, r3, lsl #1
        ldrb    r5, [r9, #-1]
        add     r6, r9, r3
        ldrb    r6, [r6, #-1]
        ldrb    r12, [r8, #-1]
        add     r6, r5, r6
        add     r5, r8, r3
        ldrb    r5, [r5, #-1]
        add     r7, r12, r5
        add     r12, r9, r3, lsl #1
        ldrb    r12, [r12, #-1]
        add     r9, r9, r10
        add     r5, r8, r3, lsl #1
        ldrb    r5, [r5, #-1]
        ldrb    r9, [r9, #-1]
        add     r10, r8, r10
        ldrb    r8, [r10, #-1]
        add     r12, r6, r12
        add     r5, r7, r5
        add     r9, r12, r9
        add     r8, r5, r8
        add     r12, r8, #2
        add     r9, r9, #2
        mov     r12, r12, asr #2
        and     r6, r12, #0xFF
        mov     r9, r9, asr #2
        and     r7, r9, #0xFF
        mov     r5, r7
        mov     r12, r6
        b       LKWU8
LKWU7:
        mov     r6, #0x80
        mov     r5, r6
        mov     r7, r5
        mov     r12, r7
LKWU8:
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x14]
        ldr     r11, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        mov     r8, #4
LKWU9:
        strb    r7, [r9]
        strb    r5, [r10]
        strb    r6, [r11]
        strb    r12, [r0]
        strb    r7, [r9, #1]
        strb    r5, [r10, #1]
        strb    r6, [r11, #1]
        strb    r12, [r0, #1]
        strb    r7, [r9, #2]
        strb    r5, [r10, #2]
        strb    r6, [r11, #2]
        strb    r12, [r0, #2]
        strb    r7, [r9, #3]
        strb    r5, [r10, #3]
        strb    r6, [r11, #3]
        strb    r12, [r0, #3]
        subs    r8, r8, #1
        add     r9, r3, r9
        add     r10, r3, r10
        add     r11, r3, r11
        add     r0, r3, r0
        bne     LKWU9
        ldr     r0, [sp, #8]
        str     lr, [sp, #4]
        str     r4, [sp]
        bl      ippiReconstructChromaInterMB_H264_16s8u_P2R
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWU10:
        mvn     r0, #0x74
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWU11:
        mvn     r0, #0xA
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LKWU12:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}


