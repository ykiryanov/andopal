        .text
        .align  4
        .globl  ippiOBMC8x8HP_MPEG4_8u_C1R


ippiOBMC8x8HP_MPEG4_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE8
        ldr     lr, [sp, #0x110]
        ldr     r12, [sp, #0x10C]
        ldr     r11, [sp, #0x11C]
        str     lr, [sp]
        ldr     lr, [sp, #0x114]
        ldr     r10, [sp, #0x120]
        mov     r7, r0
        cmp     r7, #0
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x118]
        mov     r4, r1
        str     lr, [sp, #0xC]
        mov     r6, r2
        str     r3, [sp, #4]
        beq     LENR8
        cmp     r6, #0
        beq     LENR8
        ldrsh   r9, [r12]
        ldrsh   r8, [r12, #2]
        add     r3, sp, #0x27
        bic     r5, r3, #0xF
        add     r12, r7, r9, asr #1
        mov     r3, r8, asr #1
        mla     r0, r4, r3, r12
        and     r3, r9, #1
        and     r12, r8, #1
        mov     r2, r5
        add     r3, r3, r12, lsl #1
        ldr     r12, [pc, #0x2B4]
        mov     r1, r4
        add     r12, r12, r10, lsl #2
        ldr     r3, [r12, +r3, lsl #3]
        str     r3, [sp, #0x10]
        ldr     r12, [sp, #0x10]
        mov     r3, #8
        blx     r12
        ldr     r3, [sp]
        add     r2, r5, #0x40
        add     lr, r5, #0x80
        ldrsh   r12, [r3]
        ldrsh   r3, [r3, #2]
        str     lr, [sp]
        cmp     r9, r12
        bne     LENR0
        cmp     r8, r3
        bne     LENR0
        ldr     r3, [r5]
        str     r3, [r5, #0x40]
        ldr     r3, [r5, #8]
        str     r3, [r5, #0x48]
        ldr     r3, [r5, #0x10]
        str     r3, [r5, #0x50]
        ldr     r3, [r5, #0x18]
        str     r3, [r5, #0x58]
        ldr     r3, [r5, #0x20]
        str     r3, [r5, #0x60]
        ldr     r3, [r5, #0x28]
        str     r3, [r5, #0x68]
        ldr     r3, [r5, #0x30]
        str     r3, [r5, #0x70]
        ldr     r3, [r5, #0x38]
        str     r3, [r5, #0x78]
        b       LENR1
LENR0:
        mov     lr, r3, asr #1
        add     r0, r7, r12, asr #1
        mla     r0, r4, lr, r0
        and     r3, r3, #1
        and     r12, r12, #1
        add     r3, r12, r3, lsl #1
        ldr     r12, [pc, #0x214]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x10]
        add     r12, r12, r10, lsl #2
        ldr     r3, [r12, +r3, lsl #3]
        mov     r1, r4
        str     r3, [sp, #0x14]
        ldr     r12, [sp, #0x14]
        mov     r3, #8
        blx     r12
LENR1:
        ldr     r3, [sp, #0xC]
        ldrsh   r12, [r3]
        ldrsh   r3, [r3, #2]
        cmp     r9, r12
        bne     LENR2
        cmp     r8, r3
        bne     LENR2
        ldr     r12, [r5]
        ldr     r3, [r5, #4]
        str     r12, [r5, #0x80]
        ldr     r12, [r5, #8]
        str     r3, [r5, #0x84]
        ldr     r3, [r5, #0xC]
        str     r12, [r5, #0x88]
        ldr     r12, [r5, #0x10]
        str     r3, [r5, #0x8C]
        ldr     r3, [r5, #0x14]
        str     r12, [r5, #0x90]
        ldr     r12, [r5, #0x18]
        str     r3, [r5, #0x94]
        ldr     r3, [r5, #0x1C]
        str     r12, [r5, #0x98]
        str     r3, [r5, #0x9C]
        b       LENR3
LENR2:
        ldr     r2, [sp]
        mov     lr, r3, asr #1
        add     r0, r7, r12, asr #1
        mla     r0, r4, lr, r0
        and     r3, r3, #1
        and     r12, r12, #1
        add     r3, r12, r3, lsl #1
        ldr     r12, [pc, #0x174]
        mov     r1, r4
        add     r12, r12, r10, lsl #2
        ldr     r12, [r12, +r3, lsl #3]
        mov     r3, #8
        blx     r12
LENR3:
        ldr     r3, [sp, #8]
        ldrsh   lr, [r3]
        ldrsh   r12, [r3, #2]
        cmp     r9, lr
        bne     LENR4
        cmp     r8, r12
        bne     LENR4
        ldr     r3, [r5, #0xC]
        ldr     r12, [r5, #0x14]
        ldr     lr, [r5, #4]
        str     r3, [r5, #0x4C]
        ldr     r3, [r5, #0x24]
        str     r12, [r5, #0x54]
        ldr     r12, [r5, #0x2C]
        str     lr, [r5, #0x44]
        ldr     lr, [r5, #0x1C]
        str     r3, [r5, #0x64]
        ldr     r3, [r5, #0x34]
        str     r12, [r5, #0x6C]
        ldr     r12, [r5, #0x3C]
        str     lr, [r5, #0x5C]
        str     r3, [r5, #0x74]
        str     r12, [r5, #0x7C]
        b       LENR5
LENR4:
        mov     r3, r12, asr #1
        mul     r3, r4, r3
        and     r0, r12, #1
        ldr     r12, [pc, #0xEC]
        and     r1, lr, #1
        add     r0, r1, r0, lsl #1
        add     r3, r3, #4
        add     r12, r12, r10, lsl #2
        ldr     r12, [r12, +r0, lsl #3]
        add     lr, r7, lr, asr #1
        add     r0, lr, r3
        add     r2, r5, #0x44
        mov     r3, #8
        mov     r1, r4
        blx     r12
LENR5:
        ldrsh   r3, [r11]
        ldrsh   r11, [r11, #2]
        cmp     r9, r3
        bne     LENR6
        cmp     r8, r11
        bne     LENR6
        ldr     r9, [r5, #0x20]
        ldr     r3, [r5, #0x24]
        ldr     r12, [r5, #0x28]
        ldr     lr, [r5, #0x2C]
        ldr     r4, [r5, #0x30]
        ldr     r7, [r5, #0x34]
        ldr     r8, [r5, #0x38]
        str     r9, [r5, #0xA0]
        ldr     r9, [r5, #0x3C]
        str     r3, [r5, #0xA4]
        str     r12, [r5, #0xA8]
        str     lr, [r5, #0xAC]
        str     r4, [r5, #0xB0]
        str     r7, [r5, #0xB4]
        str     r8, [r5, #0xB8]
        str     r9, [r5, #0xBC]
        b       LENR7
LENR6:
        ldr     lr, [pc, #0x64]
        mov     r12, r3, asr #1
        add     r7, r7, r4, lsl #2
        add     r10, lr, r10, lsl #2
        mov     lr, r11, asr #1
        mla     r12, r4, lr, r12
        and     r11, r11, #1
        and     r3, r3, #1
        add     r11, r3, r11, lsl #1
        ldr     r10, [r10, +r11, lsl #3]
        add     r0, r7, r12
        add     r2, r5, #0xA0
        mov     r1, r4
        mov     r3, #8
        blx     r10
LENR7:
        mov     r0, r5
        ldr     r2, [sp, #4]
        mov     r1, r6
        bl      ownvc_SumPredictOBMC8x8_8u_C1R
        mov     r0, #0
        add     sp, sp, #0xE8
        ldmia   sp!, {r4 - r11, pc}
LENR8:
        mvn     r0, #7
        add     sp, sp, #0xE8
        ldmia   sp!, {r4 - r11, pc}
        .long   LENR_ownvc_Copy8x8HP_8u_C1R
        .long   LENR_ownvc_Copy4x8HP_8u_C1R
        .long   LENR_ownvc_Copy8x4HP_8u_C1R


        .data
        .align  4


LENR_ownvc_Copy8x8HP_8u_C1R:
        .long   ownvc_Copy8x8_8u_C1R
        .long   ownvc_Copy8x8_8u_C1R
        .long   ownvc_Copy8x8HP_HF0_8u_C1R
        .long   ownvc_Copy8x8HP_HF1_8u_C1R
        .long   ownvc_Copy8x8HP_FH0_8u_C1R
        .long   ownvc_Copy8x8HP_FH1_8u_C1R
        .long   ownvc_Copy8x8HP_HH0_8u_C1R
        .long   ownvc_Copy8x8HP_HH1_8u_C1R
LENR_ownvc_Copy4x8HP_8u_C1R:
        .long   ownvc_Copy4x8_8u_C1R
        .long   ownvc_Copy4x8_8u_C1R
        .long   ownvc_Copy4x8HP_HF0_8u_C1R
        .long   ownvc_Copy4x8HP_HF1_8u_C1R
        .long   ownvc_Copy4x8HP_FH0_8u_C1R
        .long   ownvc_Copy4x8HP_FH1_8u_C1R
        .long   ownvc_Copy4x8HP_HH0_8u_C1R
        .long   ownvc_Copy4x8HP_HH1_8u_C1R
LENR_ownvc_Copy8x4HP_8u_C1R:
        .long   ownvc_Copy8x4_8u_C1R
        .long   ownvc_Copy8x4_8u_C1R
        .long   ownvc_Copy8x4HP_HF0_8u_C1R
        .long   ownvc_Copy8x4HP_HF1_8u_C1R
        .long   ownvc_Copy8x4HP_FH0_8u_C1R
        .long   ownvc_Copy8x4HP_FH1_8u_C1R
        .long   ownvc_Copy8x4HP_HH0_8u_C1R
        .long   ownvc_Copy8x4HP_HH1_8u_C1R


