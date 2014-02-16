        .text
        .align  4
        .globl  ippiBiDirWeightBlock_H264_8u_P3P1R


ippiBiDirWeightBlock_H264_8u_P3P1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r7, [sp, #0x44]
        ldr     r6, [sp, #0x48]
        ldr     r5, [sp, #0x4C]
        ldr     r4, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        cmp     r0, #0
        beq     LLAY8
        cmp     r1, #0
        beq     LLAY8
        cmp     r2, #0
        beq     LLAY8
        ldr     r11, [sp, #0x58]
        cmp     r3, r11
        bcc     LLAY1
        cmp     lr, r11
        bcc     LLAY1
        cmp     r12, r11
        bcc     LLAY1
        ldr     r10, [sp, #0x5C]
        cmp     r10, #2
        beq     LLAY2
        cmp     r10, #4
        beq     LLAY2
        cmp     r10, #8
        beq     LLAY2
        cmp     r10, #0x10
        beq     LLAY2
LLAY0:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLAY1:
        mvn     r0, #0xD
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLAY2:
        cmp     r11, #2
        beq     LLAY3
        cmp     r11, #4
        beq     LLAY3
        cmp     r11, #8
        beq     LLAY3
        cmp     r11, #0x10
        bne     LLAY0
LLAY3:
        mov     r9, #1
        cmp     r10, #0
        mov     r9, r9, lsl r7
        ble     LLAY7
        add     r8, r5, r8
        add     r5, r8, #1
        str     r6, [sp]
        add     r7, r7, #1
        mov     r8, #0
        str     r4, [sp, #4]
        mov     r6, #0xFF
LLAY4:
        cmp     r11, #0
        ble     LLAY6
        str     r12, [sp, #0x10]
        str     r3, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r12, [sp]
        mov     r4, #0
        str     r10, [sp, #0x14]
        str     lr, [sp, #0xC]
LLAY5:
        ldrb    r10, [r4, +r0]
        ldrb    lr, [r4, +r1]
        mla     r10, r12, r10, r9
        mla     r10, r3, lr, r10
        mov     lr, r10, asr r7
        add     lr, lr, r5, asr #1
        cmp     lr, #0xFF
        movgt   lr, r6
        cmp     lr, #0
        movlt   lr, r8
        strb    lr, [r4, +r2]
        add     r4, r4, #1
        cmp     r4, r11
        blt     LLAY5
        ldr     r10, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #8]
LLAY6:
        subs    r10, r10, #1
        add     r0, r3, r0
        add     r1, lr, r1
        add     r2, r12, r2
        bne     LLAY4
LLAY7:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLAY8:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


