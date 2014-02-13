        .text
        .align  4
        .globl  _ippiReconstructChromaIntra4x4_H264High_32s16u_IP2R


_ippiReconstructChromaIntra4x4_H264High_32s16u_IP2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xBC
        mov     r4, r0
        cmp     r4, #0
        and     r8, r2, #4
        and     r3, r2, #1
        and     r7, r2, #0x10
        beq     LKWA28
        ldr     lr, [r4]
        cmp     lr, #0
        beq     LKWA28
        ldr     r10, [r4, #4]
        cmp     r10, #0
        beq     LKWA28
        ldr     r2, [lr]
        cmp     r2, #0
        beq     LKWA28
        ldr     r6, [lr, #4]
        cmp     r6, #0
        beq     LKWA28
        ldr     r2, [r2]
        cmp     r2, #0
        beq     LKWA28
        ldr     r2, [r10]
        cmp     r2, #0
        beq     LKWA28
        ldr     r5, [r10, #4]
        cmp     r5, #0
        beq     LKWA28
        ldr     r2, [r2]
        cmp     r2, #0
        beq     LKWA28
        ldr     r2, [lr, #0x14]
        cmp     r2, #0
        beq     LKWA28
        ldr     r2, [r10, #0x14]
        cmp     r2, #0
        beq     LKWA28
        ldr     r9, [lr, #8]
        cmp     r9, #0
        ble     LKWA27
        ldr     r2, [r10, #8]
        cmp     r2, #0
        ble     LKWA27
        ldr     r12, [lr, #0x10]
        cmp     r12, #0
        blt     LKWA0
        ldr     lr, [lr, #0x1C]
        add     r11, lr, lr, lsl #2
        add     r11, lr, r11
        sub     r11, r11, #9
        cmp     r12, r11
        bgt     LKWA0
        ldr     r10, [r10, #0x10]
        cmp     r10, #0
        blt     LKWA0
        cmp     r10, r11
        bgt     LKWA0
        subs    r1, r1, #3
        mov     r12, #0
        beq     LKWA19
        adds    r1, r1, #3
        beq     LKWA9
        subs    lr, r1, #1
        mov     r7, #8
        beq     LKWA5
        subs    lr, lr, #1
        beq     LKWA1
LKWA0:
        mvn     r0, #0xA
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}
LKWA1:
        cmp     r8, #0
        beq     LKWA2
        mvn     r0, #0x74
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}
LKWA2:
        sub     r9, r6, r9, lsl #1
        sub     r8, r5, r2, lsl #1
LKWA3:
        mov     r0, r9
        mov     r1, r6
        mov     r2, #0x10
        bl      _ippsCopy_8u
        mov     r0, r8
        mov     r2, #0x10
        mov     r1, r5
        bl      _ippsCopy_8u
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        subs    r7, r7, #1
        ldr     r2, [r2, #8]
        ldr     r3, [r3, #8]
        add     r6, r6, r2, lsl #1
        add     r5, r5, r3, lsl #1
        bne     LKWA3
LKWA4:
        mov     r0, r4
        bl      _ippiReconstructChromaInter4x4_H264High_32s16u_IP2R
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}
LKWA5:
        cmp     r3, #0
        beq     LKWA6
        mvn     r0, #0x74
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}
LKWA6:
        mov     r2, r7
LKWA7:
        mov     r3, r12
        mov     lr, r7
LKWA8:
        ldrh    r8, [r6, #-2]
        subs    lr, lr, #1
        strh    r8, [r6, +r3]
        ldrh    r8, [r5, #-2]
        strh    r8, [r5, +r3]
        add     r3, r3, #2
        bne     LKWA8
        ldr     r3, [r4]
        ldr     lr, [r4, #4]
        subs    r2, r2, #1
        ldr     r3, [r3, #8]
        ldr     lr, [lr, #8]
        add     r6, r6, r3, lsl #1
        add     r5, r5, lr, lsl #1
        bne     LKWA7
        b       LKWA4
LKWA9:
        cmp     r8, #0
        bne     LKWA13
        cmp     r3, #0
        rsb     r3, r9, #0
        rsb     r8, r2, #0
        beq     LKWA11
        mov     r7, r12
        mov     lr, r7
        add     r3, r6, r3, lsl #1
        add     r8, r5, r8, lsl #1
        mov     r0, lr
        mov     r11, #4
LKWA10:
        ldrh    r1, [r3]
        ldrh    r10, [r3, #8]
        subs    r11, r11, #1
        add     lr, r1, lr
        ldrh    r1, [r8]
        add     r7, r10, r7
        ldrh    r10, [r8, #8]
        add     r3, r3, #2
        add     r8, r8, #2
        add     r12, r1, r12
        add     r0, r10, r0
        bne     LKWA10
        add     lr, lr, #2
        add     r3, r7, #2
        add     r12, r12, #2
        mov     r7, lr, asr #2
        mov     lr, r12, asr #2
        add     r0, r0, #2
        mov     r3, r3, asr #2
        mov     r12, r0, asr #2
        bic     r12, r12, #0xFF, 8
        bic     r7, r7, #0xFF, 8
        bic     r3, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        bic     lr, lr, #0xFF, 8
        bic     r10, r7, #0xFF, 16
        bic     r3, r3, #0xFF, 16
        bic     r8, lr, #0xFF, 16
        mov     r7, r10
        mov     r11, r3
        mov     r0, r8
        str     r12, [sp, #0x20]
        b       LKWA16
LKWA11:
        mov     r11, r12
        mov     r7, r11
        str     r7, [sp, #0x38]
        add     r3, r6, r3, lsl #1
        str     r3, [sp, #0x20]
        mov     r10, r7
        mov     r3, r10
        str     r3, [sp, #0x3C]
        sub     r1, r6, #2
        add     r8, r5, r8, lsl #1
        str     r1, [sp, #0x14]
        mov     lr, r3
        str     r8, [sp, #0x18]
        mov     r0, lr
        sub     r1, r5, #2
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x20]
        str     r0, [sp, #0x1C]
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x1C]
        str     r1, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r0, [sp, #0x30]
        str     r7, [sp, #0x44]
        str     r5, [sp, #8]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x10]
        ldr     r0, [sp, #0x2C]
        ldr     r7, [sp, #0x24]
        ldr     r6, [sp, #0x28]
        ldr     r1, [sp, #4]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x1C]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x40]
LKWA12:
        ldrh    r8, [r6], #2
        add     r10, r5, #4
        mul     r11, r2, r10
        str     r8, [sp, #0x4C]
        mul     r8, r9, r10
        add     r5, r5, #1
        cmp     r5, #4
        str     r11, [sp, #0x50]
        mov     r11, r10, lsl #1
        ldr     r10, [sp, #0x20]
        mov     r8, r8, lsl #1
        ldrh    r10, [r10, +r11]
        str     r10, [sp, #0x54]
        mov     r10, r0, lsl #1
        ldrh    r10, [r4, +r10]
        add     r0, r0, r9
        str     r10, [sp, #0x58]
        ldrh    r10, [r7], #2
        str     r10, [sp, #0x5C]
        ldr     r10, [sp, #0x18]
        ldrh    r11, [r10, +r11]
        ldr     r10, [sp, #0x34]
        str     r11, [sp, #0x60]
        ldrh    r8, [r4, +r8]
        mov     r11, r12, lsl #1
        add     r12, r12, r2
        str     r8, [sp, #0x64]
        ldrh    r11, [r1, +r11]
        ldr     r8, [sp, #0x50]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x4C]
        mov     r8, r8, lsl #1
        ldrh    r8, [r1, +r8]
        add     r10, r11, r10
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x44]
        ldr     r11, [sp, #0x54]
        add     r10, r11, r10
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x38]
        ldr     r11, [sp, #0x58]
        add     r10, r11, r10
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x64]
        add     r10, r11, r10
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x5C]
        add     r10, r11, r10
        ldr     r11, [sp, #0x60]
        str     r10, [sp, #0x30]
        add     lr, r11, lr
        ldr     r11, [sp, #0x68]
        add     r3, r11, r3
        ldr     r11, [sp, #0x3C]
        add     r11, r8, r11
        str     r11, [sp, #0x3C]
        blt     LKWA12
        ldr     r10, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        ldr     r0, [sp, #0x30]
        ldr     r7, [sp, #0x44]
        ldr     r11, [sp, #0x40]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        add     r10, r12, r10
        add     r10, r10, #4
        add     r0, r3, r0
        add     r3, r0, #4
        mov     r10, r10, asr #3
        bic     r12, r10, #0xFF, 8
        bic     r10, r12, #0xFF, 16
        add     r12, r11, r7
        mov     r3, r3, asr #3
        add     r7, r7, #2
        ldr     r0, [sp, #0x3C]
        bic     r3, r3, #0xFF, 8
        add     r11, r11, #2
        mov     r7, r7, asr #2
        bic     r8, r3, #0xFF, 16
        mov     r11, r11, asr #2
        bic     r3, r7, #0xFF, 8
        bic     r7, r11, #0xFF, 8
        add     r11, r0, lr
        add     lr, lr, #2
        str     lr, [sp, #0x68]
        add     lr, r0, #2
        add     r12, r12, #4
        add     r0, r11, #4
        mov     r11, r12, asr #3
        ldr     r12, [sp, #0x68]
        mov     lr, lr, asr #2
        bic     lr, lr, #0xFF, 8
        str     lr, [sp, #0x68]
        mov     r0, r0, asr #3
        bic     lr, r0, #0xFF, 8
        ldr     r0, [sp, #0x68]
        mov     r12, r12, asr #2
        bic     r11, r11, #0xFF, 8
        bic     r12, r12, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        bic     r3, r3, #0xFF, 16
        bic     r7, r7, #0xFF, 16
        bic     r11, r11, #0xFF, 16
        bic     r12, r12, #0xFF, 16
        bic     r0, r0, #0xFF, 16
        str     lr, [sp, #0x20]
        b       LKWA16
LKWA13:
        cmp     r3, #0
        beq     LKWA14
        sub     lr, lr, #1
        mov     r3, #1
        mov     lr, r3, lsl lr
        bic     r3, lr, #0xFF, 8
        bic     r10, r3, #0xFF, 16
        mov     r11, r10
        mov     r7, r11
        mov     r3, r7
        mov     r0, r3
        str     r0, [sp, #0x20]
        mov     r12, r0
        mov     r8, r12
        b       LKWA16
LKWA14:
        mov     r1, r12
        mov     r0, r1
        mov     r11, r0
        mov     r10, r11
        mov     r8, r10
        sub     r7, r6, #2
        sub     lr, r5, #2
        mov     r3, r8
        str     r5, [sp, #8]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x10]
LKWA15:
        add     r4, r8, #4
        mul     r5, r9, r4
        mul     r4, r2, r4
        mov     r6, r3, lsl #1
        ldrh    r6, [r7, +r6]
        mov     r5, r5, lsl #1
        mov     r4, r4, lsl #1
        str     r6, [sp, #0x68]
        ldrh    r5, [r7, +r5]
        mov     r6, r12, lsl #1
        add     r8, r8, #1
        str     r5, [sp, #0x64]
        ldrh    r5, [lr, +r6]
        ldr     r6, [sp, #0x68]
        ldrh    r4, [lr, +r4]
        cmp     r8, #4
        add     r10, r5, r10
        add     r0, r6, r0
        ldr     r6, [sp, #0x64]
        add     r11, r4, r11
        add     r3, r3, r9
        add     r12, r12, r2
        add     r1, r6, r1
        blt     LKWA15
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        add     r0, r0, #2
        add     r11, r11, #2
        add     r1, r1, #2
        mov     r7, r0, asr #2
        add     r10, r10, #2
        mov     r3, r11, asr #2
        mov     lr, r1, asr #2
        mov     r12, r10, asr #2
        bic     r3, r3, #0xFF, 8
        bic     r7, r7, #0xFF, 8
        bic     r0, r3, #0xFF, 16
        bic     r12, r12, #0xFF, 8
        bic     r10, r7, #0xFF, 16
        bic     lr, lr, #0xFF, 8
        bic     r8, r12, #0xFF, 16
        bic     r7, lr, #0xFF, 16
        mov     r3, r10
        mov     r11, r7
        mov     r12, r8
        str     r0, [sp, #0x20]
LKWA16:
        add     r2, r5, r2, lsl #3
        add     r1, r2, #8
        add     lr, r6, #8
        str     r1, [sp, #4]
        str     lr, [sp, #0x18]
        add     r9, r6, r9, lsl #3
        mov     r1, #4
        add     lr, r9, #8
        str     r1, [sp, #0x1C]
        str     lr, [sp, #0x14]
        str     r8, [sp, #0x30]
        str     r11, [sp]
        str     r3, [sp, #0x28]
        str     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x1C]
        ldr     r1, [sp, #4]
        ldr     r3, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r10, [sp, #0x20]
        add     lr, r5, #8
        str     r12, [sp, #0x34]
        str     r7, [sp, #0x24]
LKWA17:
        str     r11, [sp, #0x1C]
        str     r1, [sp, #4]
        str     r2, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x10]
        ldr     r2, [sp, #0x34]
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp]
        ldr     r6, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        mov     r7, #0
        mov     r12, #4
        str     r3, [sp, #0x14]
LKWA18:
        ldr     r3, [sp, #0xC]
        subs    r12, r12, #1
        strh    r1, [r3, +r7]
        strh    r11, [r8, +r7]
        strh    r6, [r9, +r7]
        ldr     r3, [sp, #0x14]
        strh    r4, [r3, +r7]
        strh    lr, [r5, +r7]
        ldr     r3, [sp, #0x3C]
        strh    r2, [r3, +r7]
        ldr     r3, [sp, #0x38]
        strh    r0, [r3, +r7]
        ldr     r3, [sp, #4]
        strh    r10, [r3, +r7]
        add     r7, r7, #2
        bne     LKWA18
        ldr     r4, [sp, #0x10]
        ldr     r11, [sp, #0x1C]
        ldr     r1, [sp, #4]
        ldr     r12, [r4]
        ldr     r7, [r4, #4]
        ldr     r2, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        ldr     r12, [r12, #8]
        ldr     r7, [r7, #8]
        ldr     r3, [sp, #0x14]
        ldr     r6, [sp, #0xC]
        subs    r11, r11, #1
        add     r8, r8, r12, lsl #1
        add     r6, r6, r12, lsl #1
        add     r9, r9, r12, lsl #1
        add     r3, r3, r12, lsl #1
        add     r5, r5, r7, lsl #1
        add     lr, lr, r7, lsl #1
        add     r2, r2, r7, lsl #1
        add     r1, r1, r7, lsl #1
        bne     LKWA17
        b       LKWA4
LKWA19:
        cmp     r8, #0
        bne     LKWA20
        cmp     r3, #0
        bne     LKWA20
        cmp     r7, #0
        beq     LKWA21
LKWA20:
        mvn     r0, #0x74
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}
LKWA21:
        mov     r10, r12
        sub     r8, r6, #2
        sub     r7, r5, #2
        mov     r3, r10
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r5, [sp, #8]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x10]
LKWA22:
        sub     r0, r10, #1
        mul     r1, r9, r0
        mul     r0, r2, r0
        sub     r12, r10, r9
        sub     r6, r10, r2
        mov     r1, r1, lsl #1
        mov     r12, r12, lsl #1
        ldrh    r12, [r8, +r12]
        ldrh    r1, [r8, +r1]
        mov     r6, r6, lsl #1
        ldrh    r6, [r7, +r6]
        mov     r0, r0, lsl #1
        ldrh    r0, [r7, +r0]
        add     lr, sp, #0xA8
        add     r4, sp, #0x94
        add     r5, sp, #0x80
        add     r11, sp, #0x6C
        add     r10, r10, #1
        strh    r12, [lr, +r3]
        strh    r1, [r4, +r3]
        strh    r6, [r5, +r3]
        strh    r0, [r11, +r3]
        cmp     r10, #9
        add     r3, r3, #2
        blt     LKWA22
        ldr     r12, [sp]
        ldr     lr, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        mov     r7, r12
        mov     r2, r7
        mov     r3, r2
        mov     r10, #1
        mov     r8, #2
        str     lr, [sp, #4]
        str     r9, [sp, #0x48]
        str     r5, [sp, #8]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x10]
LKWA23:
        add     r0, sp, #0x6C
        add     r1, sp, #0x94
        add     lr, sp, #0xA8
        add     r0, r0, r8
        add     r1, r1, r8
        ldrh    r0, [r0, #8]
        ldrh    r1, [r1, #8]
        add     lr, lr, r8
        ldrh    lr, [lr, #8]
        rsb     r5, r10, #0
        str     r0, [sp, #0x68]
        add     r4, sp, #0x94
        add     r9, sp, #0x80
        add     r0, r9, r8
        add     r4, r4, r5, lsl #1
        ldrh    r4, [r4, #8]
        ldrh    r0, [r0, #8]
        add     r6, sp, #0xA8
        add     r9, sp, #0x6C
        sub     r1, r1, r4
        mla     r2, r10, r1, r2
        add     r6, r6, r5, lsl #1
        ldrh    r6, [r6, #8]
        add     r9, r9, r5, lsl #1
        ldrh    r9, [r9, #8]
        add     r11, sp, #0x80
        add     r5, r11, r5, lsl #1
        ldr     r1, [sp, #0x68]
        ldrh    r5, [r5, #8]
        sub     lr, lr, r6
        mla     r7, r10, lr, r7
        sub     r1, r1, r9
        mla     r12, r10, r1, r12
        sub     r0, r0, r5
        mla     r3, r10, r0, r3
        add     r10, r10, #1
        cmp     r10, #4
        add     r8, r8, #2
        ble     LKWA23
        ldr     lr, [sp, #4]
        ldr     r9, [sp, #0x48]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        add     r8, sp, #0xA8
        add     r11, sp, #0x94
        ldrh    r8, [r8, #0x10]
        ldrh    r11, [r11, #0x10]
        add     r10, sp, #0x80
        add     r0, sp, #0x6C
        ldrh    r10, [r10, #0x10]
        ldrh    r0, [r0, #0x10]
        add     r8, r8, r11
        add     r7, r7, r7, lsl #4
        add     r11, r2, r2, lsl #4
        add     r7, r7, #0x10
        add     r3, r3, r3, lsl #4
        add     r2, r12, r12, lsl #4
        add     r10, r10, r0
        add     r3, r3, #0x10
        mov     r7, r7, asr #5
        add     r12, r11, #0x10
        mov     r3, r3, asr #5
        sub     r0, r7, r7, lsl #2
        add     r2, r2, #0x10
        add     r8, r0, r8, lsl #4
        sub     r11, r3, r3, lsl #2
        mov     r2, r2, asr #5
        add     r10, r11, r10, lsl #4
        mov     r12, r12, asr #5
        sub     r0, r2, r2, lsl #2
        add     r0, r10, r0
        sub     r1, r12, r12, lsl #2
        mov     r11, #0
        add     r8, r8, r1
        mov     r10, #1
        str     r7, [sp, #0x20]
        str     r5, [sp, #8]
        str     r6, [sp, #0xC]
LKWA24:
        mla     r5, r12, r11, r8
        mla     r1, r11, r2, r0
        str     r8, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r12, [sp]
        ldr     r2, [sp, #0x20]
        ldr     r12, [sp, #8]
        ldr     r8, [sp, #0xC]
        mov     r7, #0
        add     r5, r5, #0x10
        add     r1, r1, #0x10
        mov     r6, r7
        str     r0, [sp, #0x1C]
LKWA25:
        mul     r9, r11, r9
        mov     lr, r10, lsl lr
        sub     lr, lr, #1
        mov     r0, r5, asr #5
        cmp     r0, lr
        movlt   lr, r0
        cmp     lr, #0
        mov     r0, #0
        movlt   lr, r0
        add     r9, r8, r9, lsl #1
        strh    lr, [r9, +r7]
        ldr     r0, [r4]
        ldr     lr, [r4, #4]
        mov     r9, r1, asr #5
        ldr     r0, [r0, #0x1C]
        add     r5, r5, r2
        ldr     lr, [lr, #8]
        add     r1, r1, r3
        mov     r0, r10, lsl r0
        sub     r0, r0, #1
        mul     lr, lr, r11
        cmp     r9, r0
        movlt   r0, r9
        cmp     r0, #0
        mov     r9, #0
        movlt   r0, r9
        add     lr, r12, lr, lsl #1
        add     r6, r6, #1
        strh    r0, [lr, +r7]
        cmp     r6, #8
        add     r7, r7, #2
        bge     LKWA26
        ldr     r9, [r4]
        ldr     lr, [r9, #0x1C]
        ldr     r9, [r9, #8]
        b       LKWA25
LKWA26:
        ldr     r0, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r12, [sp]
        add     r11, r11, #1
        cmp     r11, #8
        bge     LKWA4
        ldr     r1, [r4]
        ldr     lr, [r1, #0x1C]
        ldr     r9, [r1, #8]
        b       LKWA24
LKWA27:
        mvn     r0, #0xD
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}
LKWA28:
        mvn     r0, #7
        add     sp, sp, #0xBC
        ldmia   sp!, {r4 - r11, pc}


