        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729A_32f


_ippsFixedCodebookSearch_G729A_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x33, 28
        add     r5, sp, #0xBD, 30
        mov     r9, r0
        mov     r8, r1
        mov     r4, r2
        mov     r0, r5
        mov     r2, #0x18
        mov     r1, #0
        mov     r6, r3
        bl      __intel_memset
        add     r12, sp, #0xB4
        add     r5, sp, #0x8D, 30
        add     lr, sp, #0x5D, 30
        and     r7, r12, #0x1F
        and     r11, r5, #0x1F
        and     r10, lr, #0x1F
        rsb     r7, r7, #0
        rsb     r11, r11, #0
        rsb     r10, r10, #0
        add     r5, sp, #0x8D, 30
        and     r7, r7, #0x1F
        add     lr, sp, #0x5D, 30
        add     r12, sp, #0xB4
        and     r11, r11, #0x1F
        and     r10, r10, #0x1F
        cmp     r9, #0
        add     r5, r5, r11
        add     r2, lr, r10
        add     r7, r12, r7
        beq     LDLY18
        cmp     r8, #0
        beq     LDLY18
        cmp     r4, #0
        beq     LDLY18
        cmp     r6, #0
        beq     LDLY18
        ldr     r12, [pc, #0x8F4]
        ldr     r10, [pc, #0x8F4]
        ldr     lr, [pc, #0x8F4]
        ldr     r0, [r12]
        add     r12, r8, #0x20
        ldr     r1, [r10]
        ldr     r3, [lr]
        add     r10, r5, #0x20
        str     r12, [sp, #0x84]
        add     r12, r8, #0x40
        str     r10, [sp, #0x58]
        add     r10, r2, #0x20
        str     r12, [sp, #0x88]
        add     r12, r8, #0x60
        str     r10, [sp, #0x54]
        add     r10, r5, #0x40
        str     r12, [sp, #0x8C]
        add     r12, r8, #0x80
        str     r10, [sp, #0x64]
        add     r10, r2, #0x40
        str     r12, [sp, #0x90]
        add     r12, r8, #0xA0
        str     r10, [sp, #0x60]
        add     r10, r7, #0x40
        str     r12, [sp, #0x94]
        add     r12, r8, #0x2A, 28
        str     r10, [sp, #0x5C]
        add     r10, r5, #0x60
        str     r12, [sp, #0x98]
        add     r12, r8, #0x3A, 28
        str     r10, [sp, #0x70]
        add     r10, r2, #0x60
        str     r12, [sp, #0x9C]
        add     r12, r8, #0x4A, 28
        str     r10, [sp, #0x6C]
        add     r10, r7, #0x60
        str     r12, [sp, #0xA0]
        add     r12, r8, #0x5A, 28
        str     r10, [sp, #0x68]
        add     r10, r5, #0x80
        str     r12, [sp, #0xA4]
        add     r12, r8, #0x6A, 28
        str     r10, [sp, #0x7C]
        add     r10, r2, #0x80
        add     lr, r7, #0x20
        str     r12, [sp, #0xA8]
        add     r12, r8, #0x7A, 28
        str     r10, [sp, #0x78]
        add     r10, r7, #0x80
        str     lr, [sp, #0x80]
        str     r12, [sp, #0xAC]
        str     r10, [sp, #0x74]
        add     r12, r8, #0x8A, 28
        str     lr, [sp, #0x50]
        mov     r10, r7
        str     r7, [sp, #0x34]
        str     r8, [sp, #0x48]
        ldr     r8, [sp, #0x74]
        ldr     r7, [sp, #0x50]
        str     r12, [sp, #0xB0]
        mov     r12, #0
        mov     r11, r5
        mov     lr, #8
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r4, [sp, #0x44]
        str     r2, [sp, #0x4C]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     r2, [sp, #0x38]
        mov     r5, r0
        mov     r4, r1
        mov     r6, r3
LDLY0:
        ldr     r0, [r9]
        mov     r1, r4
        str     r0, [sp, #0x28]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLY1
        str     r5, [r11]
        ldr     r2, [sp, #0x4C]
        str     r6, [r2]
        ldr     r2, [sp, #0x28]
        str     r2, [r10]
        b       LDLY2
LDLY1:
        ldr     r2, [sp, #0x28]
        str     r6, [r11]
        ldr     r12, [sp, #0x4C]
        eor     r2, r2, #2, 2
        str     r2, [r10]
        str     r5, [r12]
LDLY2:
        ldr     r0, [r9, #4]
        mov     r1, r4
        str     r0, [sp, #0x28]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLY3
        ldr     r2, [sp, #0x58]
        str     r5, [r2]
        ldr     r2, [sp, #0x54]
        str     r6, [r2]
        ldr     r2, [sp, #0x28]
        str     r2, [r7]
        b       LDLY4
LDLY3:
        ldr     r12, [sp, #0x58]
        ldr     r2, [sp, #0x28]
        str     r6, [r12]
        ldr     r12, [sp, #0x54]
        eor     r2, r2, #2, 2
        str     r2, [r7]
        str     r5, [r12]
LDLY4:
        ldr     r0, [r9, #8]
        mov     r1, r4
        str     r0, [sp, #0x28]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLY5
        ldr     r2, [sp, #0x64]
        str     r5, [r2]
        ldr     r2, [sp, #0x60]
        str     r6, [r2]
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0x5C]
        str     r12, [r2]
        b       LDLY6
LDLY5:
        ldr     r12, [sp, #0x64]
        ldr     r2, [sp, #0x28]
        str     r6, [r12]
        ldr     r12, [sp, #0x60]
        eor     r2, r2, #2, 2
        str     r5, [r12]
        ldr     r12, [sp, #0x5C]
        str     r2, [r12]
LDLY6:
        ldr     r0, [r9, #0xC]
        mov     r1, r4
        str     r0, [sp, #0x28]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLY7
        ldr     r2, [sp, #0x70]
        str     r5, [r2]
        ldr     r2, [sp, #0x6C]
        str     r6, [r2]
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0x68]
        str     r12, [r2]
        b       LDLY8
LDLY7:
        ldr     r12, [sp, #0x70]
        ldr     r2, [sp, #0x28]
        str     r6, [r12]
        ldr     r12, [sp, #0x6C]
        eor     r2, r2, #2, 2
        str     r5, [r12]
        ldr     r12, [sp, #0x68]
        str     r2, [r12]
LDLY8:
        ldr     r0, [r9, #0x10]
        mov     r1, r4
        str     r0, [sp, #0x28]
        bl      __gesf2
        cmp     r0, #0
        blt     LDLY9
        ldr     r2, [sp, #0x7C]
        str     r5, [r2]
        ldr     r2, [sp, #0x78]
        str     r6, [r2]
        ldr     r2, [sp, #0x28]
        str     r2, [r8]
        b       LDLY10
LDLY9:
        ldr     r12, [sp, #0x7C]
        ldr     r2, [sp, #0x28]
        str     r6, [r12]
        ldr     r12, [sp, #0x78]
        eor     r2, r2, #2, 2
        str     r2, [r8]
        str     r5, [r12]
LDLY10:
        ldr     r12, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        add     r9, r9, #0x14
        add     r12, r12, #5
        str     r12, [sp, #0x30]
        ldr     r12, [sp, #0x4C]
        subs    r2, r2, #1
        str     r2, [sp, #0x2C]
        add     r12, r12, #4
        str     r12, [sp, #0x4C]
        ldr     r12, [sp, #0x58]
        add     r10, r10, #4
        add     r7, r7, #4
        add     r12, r12, #4
        str     r12, [sp, #0x58]
        ldr     r12, [sp, #0x54]
        add     r8, r8, #4
        add     r11, r11, #4
        add     r12, r12, #4
        str     r12, [sp, #0x54]
        ldr     r12, [sp, #0x64]
        add     r12, r12, #4
        str     r12, [sp, #0x64]
        ldr     r12, [sp, #0x60]
        add     r12, r12, #4
        str     r12, [sp, #0x60]
        ldr     r12, [sp, #0x5C]
        add     r12, r12, #4
        str     r12, [sp, #0x5C]
        ldr     r12, [sp, #0x70]
        add     r12, r12, #4
        str     r12, [sp, #0x70]
        ldr     r12, [sp, #0x6C]
        add     r12, r12, #4
        str     r12, [sp, #0x6C]
        ldr     r12, [sp, #0x68]
        add     r12, r12, #4
        str     r12, [sp, #0x68]
        ldr     r12, [sp, #0x7C]
        add     r12, r12, #4
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0x78]
        add     r12, r12, #4
        str     r12, [sp, #0x78]
        bne     LDLY0
        ldr     r12, [sp, #0x30]
        ldr     r8, [sp, #0x48]
        ldr     r2, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        ldr     r4, [sp, #0x44]
        ldr     r7, [sp, #0x34]
        str     r12, [sp, #0x32C]
        add     r0, r8, #0xA0
        mov     r1, r5
        bl      ownFixedCodebookACorrSign_32f
        ldr     lr, [pc, #0x560]
        mov     r12, #0
        mov     r9, r12
        ldr     r10, [lr]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r4, [sp, #0x44]
        str     r8, [sp, #0x48]
LDLY11:
        add     r2, sp, #0xBD, 30
        mov     r5, r10
        add     r3, r9, #2
        mov     r4, r5
        mov     r11, #0
        add     r6, r7, r3, lsl #5
        add     r8, r2, r12
        str     r12, [sp, #0x38]
        str     r7, [sp, #0x34]
LDLY12:
        ldr     r7, [r6], #4
        mov     r1, r4
        mov     r0, r7
        bl      __gtsf2
        cmp     r0, #0
        ble     LDLY13
        add     r2, sp, #0xBD, 30
        ldr     r0, [r2, +r9, lsl #3]
        mov     r5, r4
        mov     r4, r7
        str     r11, [r2, +r9, lsl #3]
        str     r0, [r8, #4]
        b       LDLY14
LDLY13:
        mov     r0, r7
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r5, r7
        strgt   r11, [r8, #4]
LDLY14:
        add     r11, r11, #1
        cmp     r11, #8
        blt     LDLY12
        ldr     r12, [sp, #0x38]
        ldr     r7, [sp, #0x34]
        add     r9, r9, #1
        cmp     r9, #3
        add     r12, r12, #8
        blt     LDLY11
        ldr     lr, [pc, #0x4A8]
        ldr     r12, [pc, #0x4A0]
        ldr     r5, [sp, #0x3C]
        ldr     lr, [lr]
        ldr     r6, [sp, #0x40]
        ldr     r11, [r12]
        ldr     r4, [sp, #0x44]
        ldr     r8, [sp, #0x48]
        mov     r2, #0
        str     r2, [sp, #0x7C]
        str     lr, [sp, #0x318]
        str     r11, [sp, #0x30C]
        mov     r12, #1
        mov     r0, #2
        str     r10, [sp, #0x310]
        str     r2, [sp, #0x324]
        str     r12, [sp, #0x328]
        str     r0, [sp, #0x320]
        ldr     r11, [sp, #0x88]
        mov     r9, #3
        mov     lr, #8
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r4, [sp, #0x44]
        ldr     lr, [sp, #0xAC]
        ldr     r5, [sp, #0x98]
        ldr     r6, [sp, #0x94]
        ldr     r4, [sp, #0x8C]
        str     r9, [sp, #0x78]
        mov     r10, #0x18
LDLY15:
        add     r2, sp, #0xBD, 30
        ldr     r2, [r2, #4]
        add     r12, sp, #0xBD, 30
        ldr     r12, [r12]
        add     r1, sp, #0xC7, 30
        str     r1, [sp, #0x1C]
        mov     r1, #0
        str     r1, [sp, #0xC]
        add     r0, sp, #0xC6, 30
        str     r0, [sp, #0x20]
        add     r1, sp, #0xC5, 30
        str     r1, [sp, #0x24]
        str     r12, [sp, #0x10]
        add     r3, sp, #0xCB, 30
        str     r2, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r9, [sp, #8]
        ldr     r0, [r11, +r2, lsl #2]
        add     r1, lr, r12, lsl #5
        add     r2, lr, r2, lsl #5
        str     r0, [sp, #4]
        ldr     r12, [r11, +r12, lsl #2]
        mov     r0, r7
        mov     r3, r4
        str     r12, [sp]
        bl      ownFixedCodebookASearchPhaseA_32f
        add     r2, sp, #0xC3, 30
        str     r2, [sp, #0x1C]
        mov     r2, #8
        str     r2, [sp, #0xC]
        add     r12, sp, #0x31, 28
        str     r12, [sp, #0x18]
        add     lr, sp, #0xCA, 30
        str     lr, [sp, #0x14]
        add     r0, sp, #0xC9, 30
        str     r0, [sp, #0x10]
        ldr     r2, [sp, #0x318]
        mov     r3, r8
        mov     r0, r7
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x314]
        str     r6, [sp]
        mov     lr, #0x1A, 28
        str     r2, [sp, #4]
        ldr     r12, [sp, #0x32C]
        ldr     r2, [sp, #0x31C]
        add     r12, r8, r12, lsl #2
        add     r1, lr, r12
        add     r2, r5, r2, lsl #2
        bl      ownFixedCodebookASearchPhaseB_32f
        cmp     r0, #0
        beq     LDLY16
        ldr     lr, [sp, #0x31C]
        ldr     r2, [sp, #0x32C]
        str     lr, [sp, #0x78]
        str     r9, [sp, #0x7C]
        str     r2, [sp, #0x320]
LDLY16:
        add     r2, sp, #0xBD, 30
        add     r12, r2, r10
        ldr     r2, [r12, #-0xC]
        ldr     r12, [r12, #-0x10]
        add     lr, sp, #0xC7, 30
        str     lr, [sp, #0x1C]
        sub     r1, r9, #2
        str     r1, [sp, #0xC]
        str     r12, [sp, #0x10]
        add     r0, sp, #0xCB, 30
        str     r2, [sp, #0x14]
        str     r0, [sp, #0x18]
        mov     lr, #0
        str     lr, [sp, #8]
        add     lr, sp, #0xC5, 30
        str     lr, [sp, #0x24]
        add     lr, sp, #0xC6, 30
        str     lr, [sp, #0x20]
        ldr     lr, [r4, +r2, lsl #2]
        add     r1, r5, r12, lsl #2
        add     r2, r5, r2, lsl #2
        str     lr, [sp, #4]
        ldr     r12, [r4, +r12, lsl #2]
        mov     r0, r7
        mov     r3, r8
        str     r12, [sp]
        bl      ownFixedCodebookASearchPhaseA_32f
        add     r2, sp, #0xC3, 30
        str     r2, [sp, #0x1C]
        mov     r2, #1
        str     r2, [sp, #0xC]
        add     r12, sp, #0x31, 28
        str     r12, [sp, #0x18]
        add     lr, sp, #0x32, 28
        str     lr, [sp, #0x14]
        add     r4, sp, #0xCA, 30
        str     r4, [sp, #0x10]
        ldr     r2, [sp, #0x318]
        ldr     r3, [sp, #0x84]
        ldr     r0, [sp, #0x80]
        str     r2, [sp, #8]
        ldr     r2, [sp, #0xA0]
        ldr     r12, [sp, #0x314]
        str     r2, [sp]
        str     r12, [sp, #4]
        ldr     r2, [sp, #0x31C]
        ldr     r12, [sp, #0x32C]
        ldr     lr, [sp, #0xA4]
        add     r2, r6, r2, lsl #5
        add     r1, lr, r12, lsl #2
        bl      ownFixedCodebookASearchPhaseB_32f
        cmp     r0, #0
        beq     LDLY17
        ldr     lr, [sp, #0x32C]
        ldr     r2, [sp, #0x31C]
        str     lr, [sp, #0x78]
        str     r9, [sp, #0x7C]
        str     r2, [sp, #0x324]
LDLY17:
        ldr     r2, [sp, #0xA8]
        ldr     r5, [sp, #0x9C]
        ldr     lr, [sp, #0xB0]
        ldr     r4, [sp, #0x90]
        add     r9, r9, #1
        cmp     r9, #5
        str     r2, [sp, #0xA4]
        add     r10, r10, #8
        blt     LDLY15
        ldr     r5, [sp, #0x3C]
        ldr     r12, [sp, #0x78]
        ldr     lr, [sp, #0x78]
        ldr     r6, [sp, #0x40]
        ldr     r4, [sp, #0x44]
        ldr     r11, [sp, #0x324]
        add     r12, r5, r12, lsl #2
        str     r12, [sp, #0xB0]
        ldr     r12, [sp, #0x7C]
        ands    r7, r11, #7
        add     r12, lr, r12, lsl #3
        str     r12, [sp, #0xAC]
        ldr     r0, [r5, +r11, lsl #2]
        mov     r12, r11, lsr #31
        subne   r7, r7, r12, lsl #3
        bl      __fixsfsi
        ldr     r9, [sp, #0x328]
        str     r0, [sp, #0x32C]
        add     r7, r7, r7, lsl #2
        mov     r12, r9, lsl #2
        str     r7, [sp, #0xA8]
        add     r12, r12, #0x20
        ldr     r0, [r5, +r12]
        mov     r12, r11, asr #2
        str     r12, [sp, #0xA4]
        add     r7, r9, #8
        mov     r12, r7, lsr #31
        str     r12, [sp, #0xA0]
        bl      __fixsfsi
        ldr     r10, [sp, #0x320]
        str     r0, [sp, #0x31C]
        ldr     r1, [sp, #0xA0]
        ands    r8, r7, #7
        mov     r12, r10, lsl #2
        mov     r7, r7, asr #2
        subne   r8, r8, r1, lsl #3
        ldr     r1, [sp, #0xA4]
        add     r12, r12, #0x40
        ldr     r0, [r5, +r12]
        add     r8, r8, r8, lsl #2
        add     r1, r11, r1, lsr #29
        str     r1, [sp, #0xA4]
        bl      __fixsfsi
        ldr     r12, [sp, #0xB0]
        ldr     r1, [sp, #0x7C]
        add     r5, r10, #0x10
        ands    r11, r5, #7
        ldr     r1, [r12, +r1, lsl #5]
        str     r0, [sp, #0x48]
        str     r7, [sp, #0xB0]
        mov     r12, r5, lsr #31
        subne   r11, r11, r12, lsl #3
        mov     r0, r1
        bl      __fixsfsi
        ldr     r1, [sp, #0xB0]
        ldr     lr, [sp, #0xA4]
        mov     r7, r0
        mov     r5, r5, asr #2
        add     r9, r9, r1, lsr #29
        mov     r0, r4
        add     r5, r10, r5, lsr #29
        add     r11, r11, r11, lsl #2
        add     r12, r9, #8
        add     r1, r5, #0x10
        ldr     r5, [sp, #0xA8]
        add     r12, r8, r12, asr #3
        add     r1, r11, r1, asr #3
        str     r1, [sp, #0x320]
        add     lr, r5, lr, asr #3
        str     lr, [sp, #0x324]
        str     r12, [sp, #0x328]
        mov     r1, #0x28
        bl      _ippsZero_32f
        ldr     r0, [sp, #0x32C]
        ldr     r10, [sp, #0x324]
        ldr     r1, [sp, #0xAC]
        str     r0, [sp, #0xB0]
        mov     r1, r1, lsr #31
        str     r1, [sp, #0xA8]
        bl      __floatsisf
        ldr     r5, [sp, #0x31C]
        ldr     r9, [sp, #0x328]
        str     r0, [r4, +r10, lsl #2]
        mov     r0, r5
        bl      __floatsisf
        ldr     r8, [sp, #0x320]
        str     r0, [r4, +r9, lsl #2]
        ldr     r0, [sp, #0x48]
        bl      __floatsisf
        ldr     r1, [sp, #0xAC]
        str     r0, [r4, +r8, lsl #2]
        ldr     r12, [sp, #0xA8]
        ands    r11, r1, #7
        mov     r1, r1, asr #2
        mov     r0, r7
        subne   r11, r11, r12, lsl #3
        ldr     r12, [sp, #0x78]
        add     r11, r11, r11, lsl #2
        add     r1, r12, r1, lsr #29
        str     r1, [sp, #0xAC]
        bl      __floatsisf
        ldr     r1, [sp, #0x7C]
        ldr     r12, [sp, #0xAC]
        add     r1, r12, r1, lsl #3
        ldr     r12, [sp, #0xB0]
        add     r1, r11, r1, asr #3
        str     r0, [r4, +r1, lsl #2]
        cmp     r12, #0
        movle   r12, #0
        movgt   r12, #1
        cmp     r5, #0
        addgt   r12, r12, #2
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        addgt   r12, r12, #4
        cmp     r7, #0
        addgt   r12, r12, #8
        ldr     r2, [pc, #0x74]
        str     r12, [r6, #4]
        mov     lr, r10, asr #31
        smull   r0, r12, r1, r2
        smull   r10, r4, r10, r2
        smull   r5, r0, r9, r2
        smull   r5, r2, r8, r2
        rsb     lr, lr, r4, asr #1
        mov     r4, r1, asr #31
        rsb     r12, r4, r12, asr #1
        mov     r9, r9, asr #31
        rsb     r0, r9, r0, asr #1
        add     r4, r12, r12, lsl #2
        sub     r1, r1, r4
        mov     r8, r8, asr #31
        rsb     r2, r8, r2, asr #1
        add     r0, lr, r0, lsl #3
        sub     r1, r1, #3
        add     r12, r1, r12, lsl #1
        add     r2, r0, r2, lsl #6
        mov     r0, #0
        add     r12, r2, r12, lsl #9
        str     r12, [r6]
        add     sp, sp, #0x33, 28
        ldmia   sp!, {r4 - r11, pc}
LDLY18:
        mvn     r0, #7
        add     sp, sp, #0x33, 28
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLY__2il0floatpacket.3
        .long   LDLY__2il0floatpacket.1
        .long   LDLY__2il0floatpacket.2
        .long   0x66666667


        .data
        .align  4


LDLY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLY__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0xBF
LDLY__2il0floatpacket.3:
        .byte   0x00,0x00,0x80,0x3F


