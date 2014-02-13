        .text
        .align  4
        .globl  _ippiReconstructChromaIntraHalfs4x4MB_H264_16s8u_P2R


_ippiReconstructChromaIntraHalfs4x4MB_H264_16s8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA0
        ldr     r12, [sp, #0xC8]
        ldr     r4, [sp, #0xC4]
        ldr     r6, [sp, #0xCC]
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0xD0]
        ldr     lr, [sp, #0xD4]
        ldr     r5, [sp, #0xD8]
        ldr     r7, [sp, #0xDC]
        ldr     r8, [sp, #0xE0]
        ldr     r9, [sp, #0xE4]
        cmp     r0, #0
        beq     LKWK12
        cmp     r1, #0
        beq     LKWK12
        cmp     r2, #0
        beq     LKWK12
        cmp     r7, #0
        beq     LKWK12
        cmp     r8, #0
        beq     LKWK12
        ldr     r10, [r0]
        cmp     r10, #0
        beq     LKWK12
        cmp     r6, #0x27
        bhi     LKWK11
        cmp     r12, #0x27
        bhi     LKWK11
        cmp     r4, #0
        bne     LKWK10
        add     r10, r1, #4
        str     r10, [sp, #0x38]
        add     r10, r2, #4
        ands    r4, lr, #4
        str     r1, [sp, #0x3C]
        str     r2, [sp, #0x40]
        str     r10, [sp, #0x34]
        bne     LKWK0
        tst     lr, #1
        bne     LKWK0
        sub     lr, r1, r3
        ldrb    r10, [lr]
        str     r10, [sp, #0x4C]
        ldrb    r10, [lr, #4]
        str     r10, [sp, #0x48]
        ldrb    r10, [r1, #-1]
        str     r10, [sp, #0x44]
        sub     r10, r2, r3
        ldrb    r11, [r10]
        str     r11, [sp, #0x50]
        ldrb    r11, [r10, #4]
        str     r11, [sp, #0x54]
        ldrb    r11, [r2, #-1]
        str     r11, [sp, #0x58]
        ldrb    r11, [lr, #1]
        str     r11, [sp, #0x5C]
        ldrb    r11, [lr, #5]
        str     r11, [sp, #0x60]
        ldrb    r11, [r10, #1]
        str     r11, [sp, #0x64]
        ldrb    r11, [r10, #5]
        str     r11, [sp, #0x68]
        ldrb    r11, [lr, #2]
        str     r11, [sp, #0x6C]
        ldrb    r11, [lr, #6]
        str     r11, [sp, #0x70]
        ldrb    r11, [r10, #2]
        str     r11, [sp, #0x74]
        ldrb    r11, [r10, #6]
        str     r11, [sp, #0x78]
        ldrb    r11, [lr, #3]
        str     r11, [sp, #0x7C]
        ldrb    lr, [lr, #7]
        add     r11, r1, r3, lsl #1
        str     lr, [sp, #0x80]
        ldrb    lr, [r10, #3]
        str     lr, [sp, #0x84]
        ldrb    r10, [r10, #7]
        add     lr, r1, r3
        str     r10, [sp, #0x88]
        ldrb    lr, [lr, #-1]
        add     r10, r2, r3
        ldrb    r10, [r10, #-1]
        str     r10, [sp, #0x8C]
        ldrb    r11, [r11, #-1]
        add     r10, r3, r3, lsl #1
        str     r11, [sp, #0x90]
        add     r11, r2, r3, lsl #1
        ldrb    r11, [r11, #-1]
        str     r11, [sp, #0x94]
        add     r11, r1, r10
        ldrb    r11, [r11, #-1]
        add     r10, r2, r10
        str     r11, [sp, #0x98]
        ldrb    r10, [r10, #-1]
        ldr     r11, [sp, #0x5C]
        str     r10, [sp, #0x9C]
        ldr     r10, [sp, #0x4C]
        add     r10, r10, r11
        ldr     r11, [sp, #0x44]
        add     lr, r11, lr
        ldr     r11, [sp, #0x64]
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x50]
        add     r11, lr, r11
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x8C]
        ldr     lr, [sp, #0x58]
        add     r11, lr, r11
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x60]
        ldr     lr, [sp, #0x48]
        add     r11, lr, r11
        str     r11, [sp, #0x60]
        ldr     lr, [sp, #0x54]
        ldr     r11, [sp, #0x68]
        add     r11, lr, r11
        ldr     lr, [sp, #0x6C]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x94]
        add     lr, r10, lr
        str     lr, [sp, #0x6C]
        ldr     lr, [sp, #0x5C]
        ldr     r10, [sp, #0x90]
        add     r10, lr, r10
        str     r10, [sp, #0x90]
        ldr     lr, [sp, #0x64]
        ldr     r10, [sp, #0x74]
        add     lr, lr, r10
        ldr     r10, [sp, #0x8C]
        add     r11, r10, r11
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #0x70]
        ldr     r10, [sp, #0x60]
        add     r11, r10, r11
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x78]
        ldr     r10, [sp, #0x68]
        add     r11, r10, r11
        str     r11, [sp, #0x78]
        ldr     r11, [sp, #0x7C]
        ldr     r10, [sp, #0x6C]
        add     r11, r10, r11
        str     r11, [sp, #0x7C]
        ldr     r11, [sp, #0x98]
        ldr     r10, [sp, #0x90]
        add     r11, r10, r11
        ldr     r10, [sp, #0x84]
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0x9C]
        add     r10, lr, r10
        ldr     lr, [sp, #0x94]
        add     r11, lr, r11
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x80]
        ldr     lr, [sp, #0x8C]
        add     r11, lr, r11
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #0x88]
        ldr     lr, [sp, #0x78]
        add     r11, lr, r11
        ldr     lr, [sp, #0x98]
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x7C]
        add     lr, lr, r11
        ldr     r11, [sp, #0x9C]
        add     r10, r11, r10
        add     r10, r10, #4
        str     r10, [sp, #0x9C]
        ldr     r10, [sp, #0x90]
        add     r11, lr, #4
        ldr     lr, [sp, #0x94]
        add     r10, r10, #2
        str     r10, [sp, #0x98]
        mov     r10, r11, asr #3
        add     lr, lr, #2
        mov     r11, lr, asr #2
        ldr     lr, [sp, #0x9C]
        and     r11, r11, #0xFF
        str     r11, [sp, #0x4C]
        mov     lr, lr, asr #3
        str     lr, [sp, #0x9C]
        ldr     lr, [sp, #0x98]
        ldr     r11, [sp, #0x9C]
        mov     lr, lr, asr #2
        str     lr, [sp, #0x98]
        and     lr, r10, #0xFF
        and     r10, r11, #0xFF
        ldr     r11, [sp, #0x98]
        and     r11, r11, #0xFF
        str     r11, [sp, #0x48]
        b       LKWK3
LKWK0:
        cmp     r4, #0
        bne     LKWK1
        sub     lr, r1, r3
        ldrb    r10, [lr]
        str     r10, [sp, #0x9C]
        ldrb    r10, [lr, #4]
        str     r10, [sp, #0x98]
        sub     r10, r2, r3
        ldrb    r11, [r10]
        str     r11, [sp, #0x94]
        ldrb    r11, [r10, #4]
        str     r11, [sp, #0x90]
        ldrb    r11, [lr, #1]
        str     r11, [sp, #0x8C]
        ldrb    r11, [lr, #5]
        str     r11, [sp, #0x88]
        ldrb    r11, [r10, #1]
        str     r11, [sp, #0x84]
        ldrb    r11, [r10, #5]
        str     r11, [sp, #0x80]
        ldrb    r11, [lr, #2]
        str     r11, [sp, #0x7C]
        ldrb    r11, [lr, #6]
        str     r11, [sp, #0x78]
        ldrb    r11, [r10, #2]
        str     r11, [sp, #0x74]
        ldrb    r11, [r10, #6]
        str     r11, [sp, #0x70]
        ldrb    r11, [lr, #3]
        str     r11, [sp, #0x6C]
        ldrb    lr, [lr, #7]
        ldr     r11, [sp, #0x88]
        str     lr, [sp, #0x68]
        ldrb    lr, [r10, #3]
        str     lr, [sp, #0x64]
        ldrb    r10, [r10, #7]
        ldr     lr, [sp, #0x9C]
        str     r10, [sp, #0x60]
        ldr     r10, [sp, #0x8C]
        add     lr, lr, r10
        ldr     r10, [sp, #0x98]
        add     r11, r10, r11
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x84]
        ldr     r10, [sp, #0x94]
        add     r11, r10, r11
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0x80]
        ldr     r10, [sp, #0x90]
        add     r11, r10, r11
        ldr     r10, [sp, #0x7C]
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #0x74]
        add     r10, lr, r10
        ldr     lr, [sp, #0x9C]
        str     r10, [sp, #0x90]
        ldr     r10, [sp, #0x78]
        add     lr, lr, r10
        ldr     r10, [sp, #0x98]
        add     r11, r10, r11
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x70]
        ldr     r10, [sp, #0x94]
        add     r11, r10, r11
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0x6C]
        ldr     r10, [sp, #0x90]
        add     r11, r10, r11
        ldr     r10, [sp, #0x68]
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #0x60]
        add     r10, lr, r10
        str     r10, [sp, #0x90]
        ldr     r10, [sp, #0x64]
        ldr     lr, [sp, #0x9C]
        add     r10, lr, r10
        ldr     lr, [sp, #0x98]
        add     r10, r10, #2
        add     r11, lr, r11
        ldr     lr, [sp, #0x94]
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x90]
        str     r10, [sp, #0x94]
        ldr     r10, [sp, #0x9C]
        add     lr, lr, #2
        add     r11, r11, #2
        str     r11, [sp, #0x98]
        add     r10, r10, #2
        ldr     r11, [sp, #0x94]
        str     r10, [sp, #0x9C]
        ldr     r10, [sp, #0x98]
        mov     r11, r11, asr #2
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0x9C]
        mov     lr, lr, asr #2
        mov     r10, r10, asr #2
        mov     r11, r11, asr #2
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x98]
        and     r10, r10, #0xFF
        str     r10, [sp, #0x4C]
        and     r10, r11, #0xFF
        ldr     r11, [sp, #0x9C]
        and     lr, lr, #0xFF
        and     r11, r11, #0xFF
        str     r11, [sp, #0x48]
        b       LKWK3
LKWK1:
        tst     lr, #1
        bne     LKWK2
        ldrb    lr, [r1, #-1]
        add     r10, r1, r3, lsl #1
        str     lr, [sp, #0x9C]
        ldrb    lr, [r2, #-1]
        str     lr, [sp, #0x98]
        add     lr, r1, r3
        ldrb    lr, [lr, #-1]
        str     lr, [sp, #0x94]
        add     lr, r2, r3
        ldrb    lr, [lr, #-1]
        str     lr, [sp, #0x90]
        ldrb    r10, [r10, #-1]
        ldr     r11, [sp, #0x90]
        add     lr, r3, r3, lsl #1
        str     r10, [sp, #0x8C]
        add     r10, r2, r3, lsl #1
        ldrb    r10, [r10, #-1]
        str     r10, [sp, #0x88]
        add     r10, r1, lr
        ldrb    r10, [r10, #-1]
        add     lr, r2, lr
        str     r10, [sp, #0x84]
        ldrb    lr, [lr, #-1]
        ldr     r10, [sp, #0x94]
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0x9C]
        add     r10, lr, r10
        ldr     lr, [sp, #0x98]
        add     lr, lr, r11
        ldr     r11, [sp, #0x8C]
        add     r10, r10, r11
        ldr     r11, [sp, #0x88]
        add     lr, lr, r11
        ldr     r11, [sp, #0x84]
        add     r10, r10, r11
        ldr     r11, [sp, #0x80]
        add     r10, r10, #2
        mov     r10, r10, asr #2
        add     lr, lr, r11
        add     r11, lr, #2
        and     lr, r10, #0xFF
        mov     r11, r11, asr #2
        and     r10, r11, #0xFF
        str     lr, [sp, #0x4C]
        str     r10, [sp, #0x48]
        b       LKWK3
LKWK2:
        mov     r10, #0x80
        mov     lr, r10
        str     lr, [sp, #0x4C]
        str     lr, [sp, #0x48]
LKWK3:
        mov     r11, #4
        str     r11, [sp, #0x44]
        str     r5, [sp, #0x30]
        str     r12, [sp, #0x2C]
        str     r6, [sp, #0x28]
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
        ldr     r11, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        ldr     r6, [sp, #0x34]
        ldr     r2, [sp, #0x40]
        ldr     r12, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
LKWK4:
        strb    lr, [r5]
        strb    r1, [r12]
        strb    r10, [r2]
        strb    r0, [r6]
        strb    lr, [r5, #1]
        strb    r1, [r12, #1]
        strb    r10, [r2, #1]
        strb    r0, [r6, #1]
        strb    lr, [r5, #2]
        strb    r1, [r12, #2]
        strb    r10, [r2, #2]
        strb    r0, [r6, #2]
        strb    lr, [r5, #3]
        strb    r1, [r12, #3]
        strb    r10, [r2, #3]
        strb    r0, [r6, #3]
        subs    r11, r11, #1
        add     r5, r3, r5
        add     r12, r3, r12
        add     r2, r3, r2
        add     r6, r3, r6
        bne     LKWK4
        str     r6, [sp, #0x34]
        str     r2, [sp, #0x40]
        str     r12, [sp, #0x38]
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x30]
        ldr     r12, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        cmp     r4, #0
        bne     LKWK5
        tst     r5, #1
        bne     LKWK5
        sub     r5, r1, r3
        ldrb    lr, [r5, #4]
        sub     r10, r2, r3
        str     lr, [sp, #0x9C]
        ldr     lr, [sp, #0x3C]
        ldrb    r4, [lr, #-1]
        str     r4, [sp, #0x98]
        ldrb    r4, [r10, #4]
        str     r4, [sp, #0x94]
        ldr     r4, [sp, #0x40]
        ldrb    r11, [r4, #-1]
        str     r11, [sp, #0x90]
        ldrb    r11, [r5, #5]
        str     r11, [sp, #0x8C]
        ldrb    r11, [r10, #5]
        str     r11, [sp, #0x88]
        ldrb    r11, [r5, #6]
        str     r11, [sp, #0x84]
        ldrb    r11, [r10, #6]
        str     r11, [sp, #0x80]
        ldrb    r5, [r5, #7]
        add     r11, lr, r3, lsl #1
        str     r5, [sp, #0x7C]
        ldrb    r10, [r10, #7]
        add     r5, lr, r3
        str     r10, [sp, #0x78]
        ldrb    r5, [r5, #-1]
        add     r10, r4, r3
        ldrb    r10, [r10, #-1]
        str     r10, [sp, #0x74]
        ldrb    r11, [r11, #-1]
        add     r10, r3, r3, lsl #1
        add     lr, lr, r10
        str     r11, [sp, #0x70]
        add     r11, r4, r3, lsl #1
        ldrb    r11, [r11, #-1]
        add     r10, r4, r10
        ldr     r4, [sp, #0x74]
        str     r11, [sp, #0x6C]
        ldrb    lr, [lr, #-1]
        ldr     r11, [sp, #0x88]
        str     lr, [sp, #0x68]
        ldrb    lr, [r10, #-1]
        ldr     r10, [sp, #0x8C]
        str     lr, [sp, #0x64]
        ldr     lr, [sp, #0x98]
        add     r5, lr, r5
        ldr     lr, [sp, #0x90]
        add     lr, lr, r4
        ldr     r4, [sp, #0x9C]
        add     r4, r4, r10
        ldr     r10, [sp, #0x94]
        add     r10, r10, r11
        ldr     r11, [sp, #0x70]
        add     r5, r5, r11
        ldr     r11, [sp, #0x6C]
        add     lr, lr, r11
        ldr     r11, [sp, #0x84]
        add     r4, r4, r11
        ldr     r11, [sp, #0x80]
        add     r10, r10, r11
        ldr     r11, [sp, #0x68]
        add     r5, r5, r11
        ldr     r11, [sp, #0x64]
        add     lr, lr, r11
        ldr     r11, [sp, #0x7C]
        add     r4, r4, r11
        ldr     r11, [sp, #0x78]
        add     r10, r10, r11
        add     r11, r5, r4
        add     r4, lr, r10
        add     r10, r5, #2
        add     r5, r11, #4
        add     lr, lr, #2
        add     r4, r4, #4
        mov     r10, r10, asr #2
        mov     r5, r5, asr #3
        mov     lr, lr, asr #2
        mov     r4, r4, asr #3
        and     r10, r10, #0xFF
        and     r5, r5, #0xFF
        and     lr, lr, #0xFF
        and     r4, r4, #0xFF
        b       LKWK8
LKWK5:
        cmp     r4, #0
        bne     LKWK6
        sub     r4, r1, r3
        ldrb    lr, [r4]
        sub     r5, r2, r3
        str     lr, [sp, #0x9C]
        ldrb    lr, [r4, #4]
        str     lr, [sp, #0x98]
        ldrb    lr, [r5]
        str     lr, [sp, #0x94]
        ldrb    lr, [r5, #4]
        str     lr, [sp, #0x90]
        ldrb    r10, [r4, #1]
        ldrb    lr, [r4, #5]
        ldrb    r11, [r5, #1]
        str     r11, [sp, #0x8C]
        ldrb    r11, [r5, #5]
        str     r11, [sp, #0x88]
        ldrb    r11, [r4, #2]
        str     r11, [sp, #0x84]
        ldrb    r11, [r4, #6]
        str     r11, [sp, #0x80]
        ldrb    r11, [r5, #2]
        str     r11, [sp, #0x7C]
        ldrb    r11, [r5, #6]
        str     r11, [sp, #0x78]
        ldrb    r11, [r4, #3]
        str     r11, [sp, #0x74]
        ldrb    r4, [r4, #7]
        ldr     r11, [sp, #0x88]
        str     r4, [sp, #0x70]
        ldrb    r4, [r5, #3]
        str     r4, [sp, #0x6C]
        ldr     r4, [sp, #0x9C]
        ldrb    r5, [r5, #7]
        add     r10, r4, r10
        ldr     r4, [sp, #0x98]
        str     r5, [sp, #0x68]
        add     r5, r4, lr
        ldr     lr, [sp, #0x94]
        ldr     r4, [sp, #0x8C]
        add     lr, lr, r4
        ldr     r4, [sp, #0x90]
        add     r4, r4, r11
        ldr     r11, [sp, #0x84]
        add     r10, r10, r11
        ldr     r11, [sp, #0x80]
        add     r5, r5, r11
        ldr     r11, [sp, #0x7C]
        add     lr, lr, r11
        ldr     r11, [sp, #0x78]
        add     r4, r4, r11
        ldr     r11, [sp, #0x74]
        add     r10, r10, r11
        ldr     r11, [sp, #0x70]
        add     r10, r10, #2
        mov     r10, r10, asr #2
        and     r10, r10, #0xFF
        add     r5, r5, r11
        ldr     r11, [sp, #0x6C]
        add     r5, r5, #2
        add     lr, lr, r11
        ldr     r11, [sp, #0x68]
        add     lr, lr, #2
        mov     r5, r5, asr #2
        mov     lr, lr, asr #2
        add     r4, r4, r11
        add     r4, r4, #2
        and     r5, r5, #0xFF
        mov     r4, r4, asr #2
        and     lr, lr, #0xFF
        and     r4, r4, #0xFF
        b       LKWK8
LKWK6:
        tst     r5, #1
        bne     LKWK7
        ldr     r11, [sp, #0x3C]
        add     r10, r3, r3, lsl #1
        ldrb    lr, [r11, #-1]
        str     lr, [sp, #0x9C]
        ldr     lr, [sp, #0x40]
        ldrb    r4, [lr, #-1]
        add     r5, lr, r3
        str     r4, [sp, #0x98]
        ldrb    r5, [r5, #-1]
        add     r4, r11, r3
        ldrb    r4, [r4, #-1]
        str     r5, [sp, #0x94]
        add     r5, r11, r3, lsl #1
        ldrb    r5, [r5, #-1]
        add     r11, r11, r10
        add     r10, lr, r10
        str     r5, [sp, #0x90]
        add     r5, lr, r3, lsl #1
        ldrb    r11, [r11, #-1]
        ldrb    r5, [r5, #-1]
        str     r11, [sp, #0x8C]
        ldrb    lr, [r10, #-1]
        ldr     r10, [sp, #0x9C]
        ldr     r11, [sp, #0x94]
        add     r10, r10, r4
        ldr     r4, [sp, #0x98]
        add     r4, r4, r11
        ldr     r11, [sp, #0x90]
        add     r5, r4, r5
        ldr     r4, [sp, #0x8C]
        add     r10, r10, r11
        add     lr, r5, lr
        add     lr, lr, #2
        add     r10, r10, r4
        add     r10, r10, #2
        mov     lr, lr, asr #2
        mov     r10, r10, asr #2
        and     r10, r10, #0xFF
        and     lr, lr, #0xFF
        mov     r5, r10
        mov     r4, lr
        b       LKWK8
LKWK7:
        mov     lr, #0x80
        mov     r5, lr
        mov     r10, r5
        mov     r4, r10
LKWK8:
        str     r6, [sp, #0x28]
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x34]
        ldr     r6, [sp, #0x40]
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        mov     r11, #4
LKWK9:
        strb    r10, [r1]
        strb    r5, [r2]
        strb    lr, [r6]
        strb    r4, [r0]
        strb    r10, [r1, #1]
        strb    r5, [r2, #1]
        strb    lr, [r6, #1]
        strb    r4, [r0, #1]
        strb    r10, [r1, #2]
        strb    r5, [r2, #2]
        strb    lr, [r6, #2]
        strb    r4, [r0, #2]
        strb    r10, [r1, #3]
        strb    r5, [r2, #3]
        strb    lr, [r6, #3]
        strb    r4, [r0, #3]
        subs    r11, r11, #1
        add     r1, r3, r1
        add     r2, r3, r2
        add     r6, r3, r6
        add     r0, r3, r0
        bne     LKWK9
        ldr     r6, [sp, #0x28]
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        str     r12, [sp, #8]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r6, [sp, #4]
        ldr     r12, [sp, #0x24]
        str     r12, [sp]
        bl      _ippiReconstructChromaInter4x4MB_H264_16s8u_P2R
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWK10:
        mvn     r0, #0x74
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWK11:
        mvn     r0, #0xA
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
LKWK12:
        mvn     r0, #7
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}


