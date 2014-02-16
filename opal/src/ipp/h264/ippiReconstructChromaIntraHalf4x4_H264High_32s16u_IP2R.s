        .text
        .align  4
        .globl  ippiReconstructChromaIntraHalf4x4_H264High_32s16u_IP2R


ippiReconstructChromaIntraHalf4x4_H264High_32s16u_IP2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        cmp     r0, #0
        beq     LKVZ13
        ldr     r7, [r0]
        cmp     r7, #0
        beq     LKVZ13
        ldr     r6, [r7]
        cmp     r6, #0
        beq     LKVZ13
        ldr     r4, [r7, #4]
        cmp     r4, #0
        beq     LKVZ13
        ldr     r8, [r0, #4]
        cmp     r8, #0
        beq     LKVZ13
        ldr     lr, [r8]
        cmp     lr, #0
        beq     LKVZ13
        ldr     r12, [r8, #4]
        cmp     r12, #0
        beq     LKVZ13
        ldr     r5, [r7, #0x14]
        cmp     r5, #0
        beq     LKVZ13
        ldr     r6, [r6]
        cmp     r6, #0
        beq     LKVZ13
        ldr     r5, [r8, #0x14]
        cmp     r5, #0
        beq     LKVZ13
        ldr     lr, [lr]
        cmp     lr, #0
        beq     LKVZ13
        ldr     r5, [r7, #8]
        cmp     r5, #0
        ble     LKVZ12
        ldr     r6, [r8, #8]
        cmp     r6, #0
        ble     LKVZ12
        ldr     lr, [r7, #0x10]
        cmp     lr, #0
        blt     LKVZ11
        ldr     r7, [r7, #0x1C]
        add     r9, r7, r7, lsl #2
        add     r9, r7, r9
        sub     r9, r9, #9
        cmp     lr, r9
        bgt     LKVZ11
        ldr     r8, [r8, #0x10]
        cmp     r8, #0
        blt     LKVZ11
        cmp     r8, r9
        bgt     LKVZ11
        cmp     r1, #0
        bne     LKVZ10
        add     r8, r4, #8
        str     r8, [sp, #0x10]
        add     r8, r12, #8
        ands    r1, r2, #4
        mov     lr, r4
        str     r12, [sp, #0x14]
        str     r8, [sp, #0xC]
        bne     LKVZ0
        tst     r2, #1
        bne     LKVZ0
        ldrh    r2, [r4, #-2]
        rsb     r7, r5, #0
        rsb     r8, r6, #0
        str     r2, [sp, #0x18]
        mov     r7, r7, lsl #1
        ldrh    r2, [r4, +r7]
        add     r9, r7, r4
        str     r2, [sp, #0x1C]
        ldrh    r2, [r12, #-2]
        str     r2, [sp, #0x20]
        ldrh    r7, [r9, #8]
        mov     r2, r8, lsl #1
        add     r10, r12, r2
        str     r7, [sp, #0x24]
        ldrh    r2, [r12, +r2]
        sub     r7, r4, #2
        sub     r8, r12, #2
        str     r2, [sp, #0x28]
        ldrh    r2, [r10, #8]
        str     r2, [sp, #0x2C]
        ldrh    r2, [r9, #2]
        str     r2, [sp, #0x30]
        ldrh    r2, [r9, #0xA]
        str     r2, [sp, #0x34]
        mov     r2, r5, lsl #1
        ldrh    r2, [r7, +r2]
        str     r2, [sp, #0x38]
        ldrh    r2, [r10, #2]
        ldrh    r11, [r10, #0xA]
        str     r11, [sp, #0x3C]
        mov     r11, r6, lsl #1
        ldrh    r11, [r8, +r11]
        str     r11, [sp, #0x40]
        ldrh    r11, [r9, #4]
        str     r11, [sp, #0x44]
        ldrh    r11, [r9, #0xC]
        str     r11, [sp, #0x48]
        mov     r11, r5, lsl #2
        ldrh    r11, [r7, +r11]
        str     r11, [sp, #0x4C]
        ldrh    r11, [r10, #4]
        str     r11, [sp, #0x50]
        ldrh    r11, [r10, #0xC]
        str     r11, [sp, #0x54]
        mov     r11, r6, lsl #2
        ldrh    r11, [r8, +r11]
        str     r11, [sp, #0x58]
        ldrh    r11, [r9, #6]
        str     r11, [sp, #0x5C]
        ldrh    r9, [r9, #0xE]
        str     r9, [sp, #0x60]
        ldrh    r11, [r10, #6]
        add     r9, r5, r5, lsl #2
        add     r9, r5, r9
        str     r11, [sp, #0x64]
        ldrh    r10, [r10, #0xE]
        ldr     r5, [sp, #0x1C]
        ldr     r11, [sp, #0x3C]
        str     r10, [sp, #0x68]
        ldrh    r9, [r7, +r9]
        add     r10, r6, r6, lsl #2
        ldr     r7, [sp, #0x30]
        add     r10, r6, r10
        str     r9, [sp, #0x6C]
        ldrh    r6, [r8, +r10]
        add     r7, r5, r7
        ldr     r8, [sp, #0x38]
        ldr     r5, [sp, #0x18]
        add     r8, r5, r8
        ldr     r5, [sp, #0x28]
        add     r9, r5, r2
        ldr     r5, [sp, #0x40]
        ldr     r2, [sp, #0x20]
        add     r10, r2, r5
        ldr     r5, [sp, #0x34]
        ldr     r2, [sp, #0x24]
        add     r5, r2, r5
        ldr     r2, [sp, #0x2C]
        add     r2, r2, r11
        ldr     r11, [sp, #0x44]
        add     r7, r7, r11
        ldr     r11, [sp, #0x4C]
        add     r8, r8, r11
        ldr     r11, [sp, #0x50]
        add     r9, r9, r11
        ldr     r11, [sp, #0x58]
        add     r10, r10, r11
        ldr     r11, [sp, #0x48]
        add     r6, r10, r6
        ldr     r10, [sp, #0x60]
        add     r5, r5, r11
        ldr     r11, [sp, #0x54]
        add     r5, r5, r10
        ldr     r10, [sp, #0x68]
        add     r5, r5, #2
        add     r2, r2, r11
        ldr     r11, [sp, #0x5C]
        add     r2, r2, r10
        add     r2, r2, #2
        mov     r5, r5, asr #2
        add     r7, r7, r11
        ldr     r11, [sp, #0x6C]
        mov     r2, r2, asr #2
        add     r8, r8, r11
        ldr     r11, [sp, #0x64]
        add     r7, r8, r7
        add     r9, r9, r11
        add     r9, r6, r9
        add     r6, r7, #4
        add     r7, r9, #4
        mov     r6, r6, asr #3
        mov     r8, r7, asr #3
        bic     r9, r6, #3, 16
        bic     r7, r5, #3, 16
        bic     r8, r8, #3, 16
        bic     r6, r2, #3, 16
        b       LKVZ3
LKVZ0:
        cmp     r1, #0
        bne     LKVZ1
        rsb     r6, r6, #0
        rsb     r5, r5, #0
        mov     r8, r6, lsl #1
        mov     r5, r5, lsl #1
        ldrh    r6, [r4, +r5]
        add     r2, r5, r4
        ldrh    r7, [r2, #8]
        add     r5, r12, r8
        ldrh    r8, [r12, +r8]
        str     r8, [sp, #0x6C]
        ldrh    r10, [r5, #8]
        ldrh    r8, [r2, #2]
        str     r8, [sp, #0x68]
        ldrh    r8, [r2, #0xA]
        str     r8, [sp, #0x64]
        ldrh    r8, [r5, #0xA]
        ldrh    r9, [r5, #2]
        str     r8, [sp, #0x60]
        ldrh    r11, [r2, #0xC]
        ldrh    r8, [r2, #4]
        str     r11, [sp, #0x5C]
        ldrh    r11, [r5, #4]
        str     r11, [sp, #0x58]
        ldrh    r11, [r5, #0xC]
        str     r11, [sp, #0x54]
        ldrh    r11, [r2, #6]
        str     r11, [sp, #0x50]
        ldrh    r11, [r5, #6]
        ldrh    r2, [r2, #0xE]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x68]
        ldrh    r5, [r5, #0xE]
        add     r6, r6, r11
        ldr     r11, [sp, #0x64]
        add     r8, r6, r8
        ldr     r6, [sp, #0x5C]
        add     r7, r7, r11
        ldr     r11, [sp, #0x6C]
        add     r7, r7, r6
        ldr     r6, [sp, #0x58]
        add     r2, r7, r2
        add     r9, r11, r9
        ldr     r11, [sp, #0x60]
        add     r9, r9, r6
        ldr     r6, [sp, #0x54]
        add     r2, r2, #2
        add     r10, r10, r11
        mov     r2, r2, asr #2
        add     r10, r10, r6
        ldr     r6, [sp, #0x50]
        add     r5, r10, r5
        add     r5, r5, #2
        bic     r7, r2, #3, 16
        add     r8, r8, r6
        ldr     r6, [sp, #0x4C]
        add     r8, r8, #2
        mov     r5, r5, asr #2
        mov     r8, r8, asr #2
        add     r9, r9, r6
        add     r9, r9, #2
        mov     r6, r9, asr #2
        bic     r9, r8, #3, 16
        bic     r8, r6, #3, 16
        bic     r6, r5, #3, 16
        b       LKVZ3
LKVZ1:
        tst     r2, #1
        bne     LKVZ2
        ldrh    r2, [r4, #-2]
        sub     r10, r4, #2
        sub     r8, r12, #2
        str     r2, [sp, #0x6C]
        ldrh    r7, [r12, #-2]
        mov     r2, r5, lsl #1
        ldrh    r2, [r10, +r2]
        mov     r9, r5, lsl #2
        add     r11, r5, r5, lsl #2
        str     r2, [sp, #0x68]
        ldrh    r9, [r10, +r9]
        mov     r2, r6, lsl #1
        ldrh    r2, [r8, +r2]
        str     r9, [sp, #0x64]
        mov     r9, r6, lsl #2
        ldrh    r9, [r8, +r9]
        add     r11, r5, r11
        add     r2, r7, r2
        str     r9, [sp, #0x60]
        add     r9, r6, r6, lsl #2
        ldrh    r5, [r10, +r11]
        add     r9, r6, r9
        ldrh    r8, [r8, +r9]
        ldr     r6, [sp, #0x6C]
        ldr     r9, [sp, #0x68]
        ldr     r7, [sp, #0x64]
        add     r6, r6, r9
        add     r6, r6, r7
        ldr     r7, [sp, #0x60]
        add     r5, r6, r5
        add     r5, r5, #2
        add     r2, r2, r7
        add     r8, r2, r8
        add     r2, r8, #2
        mov     r5, r5, asr #2
        mov     r2, r2, asr #2
        bic     r9, r5, #3, 16
        bic     r8, r2, #3, 16
        mov     r7, r9
        mov     r6, r8
        b       LKVZ3
LKVZ2:
        sub     r7, r7, #1
        mov     r2, #1
        mov     r7, r2, lsl r7
        bic     r2, r7, #0xFF, 8
        bic     r9, r2, #0xFF, 16
        mov     r7, r9
        mov     r6, r7
        mov     r8, r6
LKVZ3:
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r3, [sp]
        ldr     r3, [sp, #0xC]
        ldr     r12, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        mov     r10, #4
LKVZ4:
        strh    r9, [lr]
        strh    r7, [r4]
        strh    r8, [r12]
        strh    r6, [r3]
        strh    r9, [lr, #2]
        strh    r7, [r4, #2]
        strh    r8, [r12, #2]
        strh    r6, [r3, #2]
        strh    r9, [lr, #4]
        strh    r7, [r4, #4]
        strh    r8, [r12, #4]
        strh    r6, [r3, #4]
        strh    r9, [lr, #6]
        strh    r7, [r4, #6]
        strh    r8, [r12, #6]
        strh    r6, [r3, #6]
        ldr     r2, [r0, #4]
        ldr     r11, [r0]
        subs    r10, r10, #1
        ldr     r2, [r2, #8]
        ldr     r5, [r11, #8]
        add     lr, lr, r5, lsl #1
        add     r4, r4, r5, lsl #1
        add     r12, r12, r2, lsl #1
        add     r3, r3, r2, lsl #1
        bne     LKVZ4
        str     r3, [sp, #0xC]
        str     r12, [sp, #0x14]
        str     r4, [sp, #0x10]
        ldr     r12, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r3, [sp]
        cmp     r1, #0
        bne     LKVZ5
        tst     r3, #1
        bne     LKVZ5
        ldrh    r1, [lr, #-2]
        rsb     r3, r5, #0
        sub     r11, lr, #2
        str     r1, [sp, #0x6C]
        add     r4, r4, r3, lsl #1
        ldrh    r1, [r4, #8]
        add     r10, r5, r5, lsl #2
        add     r10, r5, r10
        str     r1, [sp, #0x68]
        rsb     r1, r2, #0
        add     r3, r12, r1, lsl #1
        ldr     r1, [sp, #0x14]
        ldrh    r9, [r3, #8]
        sub     r6, r1, #2
        ldrh    r1, [r1, #-2]
        str     r1, [sp, #0x64]
        ldrh    r8, [r4, #0xA]
        mov     r1, r5, lsl #1
        ldrh    r1, [r11, +r1]
        str     r1, [sp, #0x60]
        ldrh    r1, [r3, #0xA]
        str     r1, [sp, #0x5C]
        mov     r1, r2, lsl #1
        ldrh    r12, [r6, +r1]
        ldrh    r1, [r4, #0xC]
        str     r1, [sp, #0x58]
        mov     r1, r5, lsl #2
        ldrh    r1, [r11, +r1]
        str     r1, [sp, #0x54]
        ldrh    r4, [r4, #0xE]
        ldrh    r7, [r3, #0xC]
        mov     r1, r2, lsl #2
        ldrh    r1, [r6, +r1]
        str     r4, [sp, #0x50]
        ldrh    r3, [r3, #0xE]
        add     r4, r2, r2, lsl #2
        ldrh    r11, [r11, +r10]
        add     r4, r2, r4
        ldrh    r6, [r6, +r4]
        ldr     r2, [sp, #0x6C]
        ldr     r4, [sp, #0x60]
        add     r2, r2, r4
        ldr     r4, [sp, #0x64]
        add     r12, r4, r12
        ldr     r4, [sp, #0x68]
        add     r1, r12, r1
        ldr     r12, [sp, #0x58]
        add     r6, r1, r6
        add     r8, r4, r8
        ldr     r4, [sp, #0x5C]
        ldr     r1, [sp, #0x50]
        add     r8, r8, r12
        add     r9, r9, r4
        ldr     r4, [sp, #0x54]
        add     r7, r9, r7
        add     r8, r8, r1
        add     r3, r7, r3
        add     r2, r2, r4
        add     r11, r2, r11
        add     r2, r11, r8
        add     r1, r6, r3
        add     r2, r2, #4
        add     r1, r1, #4
        add     r11, r11, #2
        add     r6, r6, #2
        mov     r12, r1, asr #3
        mov     r2, r2, asr #3
        mov     r11, r11, asr #2
        mov     r6, r6, asr #2
        bic     r1, r2, #3, 16
        bic     r3, r11, #3, 16
        bic     r2, r6, #3, 16
        bic     r12, r12, #3, 16
        b       LKVZ8
LKVZ5:
        cmp     r1, #0
        bne     LKVZ6
        rsb     r1, r2, #0
        rsb     r5, r5, #0
        mov     r3, r1, lsl #1
        mov     r2, r5, lsl #1
        add     r1, r4, r2
        ldrh    r4, [r4, +r2]
        ldrh    r5, [r1, #8]
        ldrh    r7, [r1, #2]
        ldrh    r6, [r1, #0xA]
        add     r2, r12, r3
        ldrh    r12, [r12, +r3]
        ldrh    r3, [r2, #8]
        add     r5, r5, r6
        add     r4, r4, r7
        ldrh    r6, [r2, #0xA]
        ldrh    r7, [r2, #2]
        add     r3, r3, r6
        ldrh    r6, [r1, #0xC]
        add     r12, r12, r7
        ldrh    r7, [r1, #4]
        add     r5, r5, r6
        ldrh    r6, [r2, #0xC]
        add     r4, r4, r7
        ldrh    r7, [r2, #4]
        add     r3, r3, r6
        ldrh    r6, [r1, #0xE]
        add     r12, r12, r7
        ldrh    r7, [r1, #6]
        ldrh    r1, [r2, #6]
        ldrh    r2, [r2, #0xE]
        add     r6, r5, r6
        add     r1, r12, r1
        add     r4, r4, r7
        add     r2, r3, r2
        add     r1, r1, #2
        add     r2, r2, #2
        add     r4, r4, #2
        add     r6, r6, #2
        mov     r12, r1, asr #2
        mov     r5, r2, asr #2
        mov     r4, r4, asr #2
        mov     r6, r6, asr #2
        bic     r2, r12, #3, 16
        bic     r3, r4, #3, 16
        bic     r1, r6, #3, 16
        bic     r12, r5, #3, 16
        b       LKVZ8
LKVZ6:
        tst     r3, #1
        bne     LKVZ7
        ldrh    r3, [lr, #-2]
        ldr     r1, [sp, #0x14]
        mov     r6, r5, lsl #1
        sub     r12, lr, #2
        ldrh    r6, [r12, +r6]
        sub     r4, r1, #2
        ldrh    r1, [r1, #-2]
        add     r3, r3, r6
        mov     r6, r2, lsl #1
        ldrh    r6, [r4, +r6]
        add     r1, r1, r6
        mov     r6, r5, lsl #2
        ldrh    r6, [r12, +r6]
        add     r3, r3, r6
        mov     r6, r2, lsl #2
        ldrh    r6, [r4, +r6]
        add     r1, r1, r6
        add     r6, r5, r5, lsl #2
        add     r6, r5, r6
        ldrh    r12, [r12, +r6]
        add     r5, r2, r2, lsl #2
        add     r5, r2, r5
        ldrh    r4, [r4, +r5]
        add     r12, r3, r12
        add     r2, r12, #2
        add     r4, r1, r4
        add     r1, r4, #2
        mov     r2, r2, asr #2
        bic     r3, r2, #3, 16
        mov     r1, r1, asr #2
        bic     r2, r1, #3, 16
        mov     r1, r3
        mov     r12, r2
        b       LKVZ8
LKVZ7:
        ldr     r11, [r11, #0x1C]
        mov     r1, #1
        sub     r11, r11, #1
        mov     r11, r1, lsl r11
        bic     r1, r11, #0xFF, 8
        bic     r3, r1, #0xFF, 16
        mov     r1, r3
        mov     r12, r1
        mov     r2, r12
LKVZ8:
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        mov     r7, #4
LKVZ9:
        strh    r3, [lr]
        strh    r1, [r5]
        strh    r2, [r6]
        strh    r12, [r4]
        strh    r3, [lr, #2]
        strh    r1, [r5, #2]
        strh    r2, [r6, #2]
        strh    r12, [r4, #2]
        strh    r3, [lr, #4]
        strh    r1, [r5, #4]
        strh    r2, [r6, #4]
        strh    r12, [r4, #4]
        strh    r3, [lr, #6]
        strh    r1, [r5, #6]
        strh    r2, [r6, #6]
        strh    r12, [r4, #6]
        ldr     r8, [r0]
        ldr     r9, [r0, #4]
        subs    r7, r7, #1
        ldr     r8, [r8, #8]
        ldr     r9, [r9, #8]
        add     lr, lr, r8, lsl #1
        add     r5, r5, r8, lsl #1
        add     r6, r6, r9, lsl #1
        add     r4, r4, r9, lsl #1
        bne     LKVZ9
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, lr}
        b       ippiReconstructChromaInter4x4_H264High_32s16u_IP2R
LKVZ10:
        mvn     r0, #0x74
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LKVZ11:
        mvn     r0, #0xA
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LKVZ12:
        mvn     r0, #0xD
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LKVZ13:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}


