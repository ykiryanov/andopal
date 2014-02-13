        .text
        .align  4
        .globl  _ippsGetVarPointDV_16sc


_ippsGetVarPointDV_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x3C]
        cmp     r12, #0x10
        mov     r5, #3
        moveq   r7, #3
        movne   r7, #7
        cmp     r0, #0
        beq     LANG8
        cmp     r1, #0
        beq     LANG8
        cmp     r2, #0
        beq     LANG8
        cmp     r3, #0
        beq     LANG8
        ldrsh   lr, [r0, #2]
        ldrsh   r0, [r0]
        cmp     r12, #0x10
        and     r12, lr, #0xFF
        eor     r9, r12, #0x80
        mul     r4, r9, r9
        and     r12, r0, #0xFF
        eor     r12, r12, #0x80
        mul     r8, r12, r12
        sub     r0, r0, r12
        mov     r4, r4, asr #4
        str     r4, [sp]
        add     r5, r5, #0xFF
        sub     lr, lr, r9
        bic     r6, r0, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        orr     r6, r6, lr, lsl #16
        str     r6, [r1]
        sub     lr, lr, #0x80
        sub     r0, r0, #0x80
        add     lr, r5, lr, asr #8
        add     r5, r5, r0, asr #8
        and     r0, lr, #3
        and     lr, r5, #3
        mov     r6, r0, lsl #2
        rsb     r0, r12, #1, 24
        mul     r5, r0, r0
        rsb     r0, r9, #1, 24
        mul     r10, r0, r0
        add     r0, lr, #1
        and     r0, r0, #3
        add     r11, lr, r6
        ldrb    r11, [r11, +r3]
        add     r1, r6, #4
        and     r1, r1, #0xC
        str     r11, [sp, #4]
        add     r11, r6, r0
        ldrb    r11, [r11, +r3]
        str     r11, [sp, #8]
        add     r11, r1, r0
        ldrb    r11, [r11, +r3]
        add     r1, lr, r1
        str     r11, [sp, #0xC]
        ldrb    r1, [r1, +r3]
        add     r11, r4, r8, asr #4
        str     r1, [sp, #0x10]
        mov     r1, r10, asr #4
        add     r10, r4, r5, asr #4
        bic     r4, r11, #0xFF, 8
        ldr     r11, [sp, #4]
        bic     r4, r4, #0xFF, 16
        bic     r10, r10, #0xFF, 8
        and     r11, r11, r7
        str     r11, [sp, #4]
        add     r11, r1, r5, asr #4
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #4]
        str     r4, [r2, +r11, lsl #2]
        bic     r4, r10, #0xFF, 16
        add     r10, r1, r8, asr #4
        str     r10, [sp, #4]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #8]
        orr     r4, r4, #1, 16
        bic     r10, r10, #0xFF, 8
        str     r4, [sp, #8]
        bic     r4, r10, #0xFF, 16
        ldr     r10, [sp, #4]
        and     r11, r11, r7
        str     r11, [sp, #0x14]
        bic     r10, r10, #0xFF, 8
        str     r10, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #0x14]
        orr     r4, r4, #2, 16
        str     r10, [r2, +r11, lsl #2]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #4]
        and     r10, r10, r7
        str     r4, [r2, +r10, lsl #2]
        ldr     r4, [sp, #0x10]
        bic     r11, r11, #0xFF, 16
        orr     r11, r11, #3, 16
        and     r4, r4, r7
        str     r11, [r2, +r4, lsl #2]
        beq     LANG9
        add     r4, r9, #1, 24
        mul     r4, r4, r4
        rsb     r10, r9, #2, 24
        mul     r9, r10, r10
        add     r10, r6, #8
        str     r4, [sp, #0x14]
        rsb     r4, r12, #2, 24
        mul     r4, r4, r4
        add     r12, r12, #1, 24
        mul     r12, r12, r12
        and     r10, r10, #0xC
        add     r6, r6, #0xC
        and     r6, r6, #0xC
        str     r12, [sp, #0x10]
        mov     r12, r9, asr #4
        add     r9, lr, r10
        ldrb    r9, [r9, +r3]
        add     r10, r10, r0
        add     r0, r6, r0
        str     r9, [sp, #0xC]
        add     r6, lr, r6
        ldrb    lr, [r10, +r3]
        ldrb    r0, [r0, +r3]
        ldrb    r6, [r6, +r3]
        ldr     r3, [sp, #0x14]
        ldr     r10, [sp]
        add     r9, r12, r8, asr #4
        and     lr, lr, r7
        mov     r3, r3, asr #4
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        and     r0, r0, r7
        add     r11, r10, r4, asr #4
        and     r3, r3, r7
        and     r7, r6, r7
        ldr     r6, [sp, #0x10]
        cmp     r9, r11
        add     r12, r12, r5, asr #4
        add     r4, r1, r4, asr #4
        add     r10, r10, r6, asr #4
        ldr     r6, [sp, #0x14]
        add     r8, r6, r8, asr #4
        add     r5, r6, r5, asr #4
        ldr     r6, [sp, #0x10]
        add     r1, r1, r6, asr #4
        bge     LANG0
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        orr     r6, r9, #1, 14
        b       LANG1
LANG0:
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        orr     r6, r11, #2, 14
LANG1:
        cmp     r12, r10
        bge     LANG2
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        orr     r12, r12, #5, 16
        b       LANG3
LANG2:
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        orr     r12, r10, #9, 16
LANG3:
        cmp     r4, r8
        bge     LANG4
        bic     r4, r4, #0xFF, 8
        bic     r4, r4, #0xFF, 16
        orr     r4, r4, #6, 16
        b       LANG5
LANG4:
        bic     r8, r8, #0xFF, 8
        bic     r8, r8, #0xFF, 16
        orr     r4, r8, #0xA, 16
LANG5:
        cmp     r5, r1
        bge     LANG6
        bic     r5, r5, #0xFF, 8
        bic     r5, r5, #0xFF, 16
        orr     r5, r5, #7, 16
        b       LANG7
LANG6:
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        orr     r5, r1, #0xB, 16
LANG7:
        str     r6, [r2, +r3, lsl #2]
        str     r12, [r2, +lr, lsl #2]
        str     r4, [r2, +r0, lsl #2]
        mov     r0, #0
        str     r5, [r2, +r7, lsl #2]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LANG8:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LANG9:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


