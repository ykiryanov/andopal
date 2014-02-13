        .text
        .align  4
        .globl  _ippsUnpackSideInfo_MP3


_ippsUnpackSideInfo_MP3:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        cmp     r0, #0
        beq     LGDJ26
        cmp     r1, #0
        beq     LGDJ26
        cmp     r2, #0
        beq     LGDJ26
        cmp     r3, #0
        beq     LGDJ26
        cmp     r12, #0
        beq     LGDJ26
        cmp     r4, #0
        beq     LGDJ26
        ldr     lr, [r0]
        cmp     lr, #0
        beq     LGDJ26
        ldr     r5, [r4]
        cmp     r5, #0
        beq     LGDJ0
        cmp     r5, #1
        beq     LGDJ0
        mvn     r0, #0xAA
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ0:
        ldr     r6, [r4, #4]
        cmp     r6, #1
        beq     LGDJ2
LGDJ1:
        mvn     r0, #0xAA
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ2:
        ldr     r4, [r4, #0x1C]
        cmp     r4, #0
        blt     LGDJ1
        cmp     r4, #3
        bgt     LGDJ1
        cmp     r4, #3
        mov     r6, #2
        moveq   r4, #1
        movne   r4, r6
        ldrb    r8, [lr, #1]
        ldrb    r7, [lr]
        cmp     r5, #1
        ldrb    r5, [lr, #2]
        mov     r8, r8, lsl #16
        orr     r7, r8, r7, lsl #24
        ldrb    r8, [lr, #3]
        orr     r5, r7, r5, lsl #8
        add     r7, lr, #1
        mvn     lr, #0
        orr     r8, r5, r8
        mov     r5, #0
        beq     LGDJ12
        str     r7, [r0]
        mov     r8, r8, lsr #24
        str     r8, [r2]
        ldr     r12, [r0]
        cmp     r4, #1
        ldrb    r9, [r12]
        ldrb    r8, [r12, #1]
        ldrb    r7, [r12, #2]
        ldrb    r2, [r12, #3]
        mov     r9, r9, lsl #24
        orr     r8, r9, r8, lsl #16
        orr     r7, r8, r7, lsl #8
        orr     r2, r7, r2
        strne   r12, [r0]
        movne   r2, r2, lsr #30
        beq     LGDJ11
LGDJ3:
        cmp     r4, #0
        str     r2, [r3]
        ble     LGDJ9
        mov     r2, r5
        mov     r3, #7
LGDJ4:
        ldr     r7, [r0]
        mov     r3, r1
        rsb     r12, r6, #0x14
        ldrb    r11, [r7, #1]
        ldrb    r8, [r7]
        ldrb    r9, [r7, #2]
        ldrb    r10, [r7, #3]
        mov     r11, r11, lsl #16
        orr     r8, r11, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        orr     r10, r9, r10
        and     r8, r10, lr, lsr r6
        add     r6, r6, #0xC
        mov     r12, r8, lsr r12
        add     r7, r7, r6, asr #3
        str     r7, [r0]
        str     r12, [r1]
        ldr     r7, [r0]
        and     r12, r6, #7
        rsb     r6, r12, #0x17
        ldrb    r11, [r7, #1]
        ldrb    r8, [r7]
        ldrb    r9, [r7, #2]
        ldrb    r10, [r7, #3]
        mov     r11, r11, lsl #16
        orr     r8, r11, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        orr     r10, r9, r10
        and     r8, r10, lr, lsr r12
        add     r12, r12, #9
        mov     r6, r8, lsr r6
        add     r7, r7, r12, asr #3
        str     r7, [r0]
        str     r6, [r1, #4]
        ldr     r6, [r0]
        and     r12, r12, #7
        rsb     r7, r12, #0xE
        ldrb    r11, [r6, #1]
        ldrb    r8, [r6]
        ldrb    r9, [r6, #2]
        ldrb    r10, [r6, #3]
        mov     r11, r11, lsl #16
        orr     r8, r11, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        orr     r10, r9, r10
        and     r8, r10, lr, lsr r12
        add     r12, r12, #0x12
        mov     r7, r8, lsr r7
        add     r6, r6, r12, asr #3
        str     r6, [r0]
        and     r6, r7, #1
        str     r6, [r1, #0x10]
        mov     r6, #7
        add     r6, r6, #0x7E, 30
        and     r6, r6, r7, lsr #1
        str     r6, [r1, #0xC]
        mov     r7, r7, lsr #10
        and     r6, r7, #0xFF
        str     r6, [r1, #8]
        ldr     r7, [r0]
        ldr     r6, [r3, #0x10]
        and     r12, r12, #7
        ldrb    r9, [r7]
        ldrb    r8, [r7, #1]
        cmp     r6, #0
        ldrb    r6, [r7, #2]
        mov     r9, r9, lsl #24
        orr     r8, r9, r8, lsl #16
        add     r1, r1, #0x48
        orr     r6, r8, r6, lsl #8
        ldrb    r8, [r7, #3]
        orr     r8, r6, r8
        and     r6, r8, lr, lsr r12
        rsb     r8, r12, #0xA
        add     r12, r12, #0x16
        mov     r6, r6, lsr r8
        add     r7, r7, r12, asr #3
        str     r7, [r0]
        and     r8, r6, #7
        mov     r7, r6, lsr #3
        beq     LGDJ7
        str     r8, [r3, #0x30]
        mov     r8, r6, lsr #6
        and     r8, r8, #7
        str     r8, [r3, #0x28]
        mov     r8, r6, lsr #9
        and     r7, r7, #7
        and     r8, r8, #0x1F
        str     r7, [r3, #0x2C]
        mov     r7, r6, lsr #20
        str     r8, [r3, #0x20]
        mov     r8, r6, lsr #14
        mov     r6, r6, lsr #19
        ands    r7, r7, #3
        and     r8, r8, #0x1F
        and     r6, r6, #1
        and     r12, r12, #7
        str     r7, [r3, #0x14]
        str     r8, [r3, #0x1C]
        str     r6, [r3, #0x18]
        beq     LGDJ25
        cmp     r7, #2
        beq     LGDJ10
LGDJ5:
        mov     r6, #7
        str     r6, [r3, #0x34]
        mov     r6, #7
LGDJ6:
        rsb     r6, r6, #0x14
        str     r6, [r3, #0x38]
        b       LGDJ8
LGDJ7:
        and     r7, r7, #0xF
        str     r7, [r3, #0x34]
        mov     r7, r6, lsr #7
        and     r7, r7, #0x1F
        str     r7, [r3, #0x24]
        mov     r7, r6, lsr #12
        mov     r6, r6, lsr #17
        and     r7, r7, #0x1F
        and     r6, r6, #0x1F
        str     r8, [r3, #0x38]
        and     r12, r12, #7
        str     r7, [r3, #0x20]
        str     r6, [r3, #0x1C]
        str     r5, [r3, #0x14]
        str     r5, [r3, #0x18]
LGDJ8:
        ldr     r8, [r0]
        add     r2, r2, #1
        cmp     r2, r4
        ldrb    r10, [r8, #1]
        ldrb    r9, [r8]
        ldrb    r6, [r8, #2]
        ldrb    r7, [r8, #3]
        mov     r10, r10, lsl #16
        orr     r9, r10, r9, lsl #24
        orr     r6, r9, r6, lsl #8
        orr     r7, r6, r7
        and     r6, r7, lr, lsr r12
        rsb     r7, r12, #0x1E
        mov     r6, r6, lsr r7
        add     r12, r12, #2
        mov     r7, r6, lsr #1
        and     r6, r6, #1
        add     r8, r8, r12, asr #3
        str     r8, [r0]
        str     r6, [r3, #0x44]
        and     r7, r7, #1
        str     r7, [r3, #0x40]
        and     r6, r12, #7
        blt     LGDJ4
LGDJ9:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ10:
        cmp     r6, #0
        moveq   r6, #8
        streq   r6, [r3, #0x34]
        beq     LGDJ6
        b       LGDJ5
LGDJ11:
        str     r12, [r0]
        mov     r2, r2, lsr #31
        mov     r6, #1
        b       LGDJ3
LGDJ12:
        str     r7, [r0]
        mov     r8, r8, lsr #23
        str     r8, [r2]
        ldr     r8, [r0]
        cmp     r4, #1
        mvn     r7, #2, 2
        ldrb    r10, [r8]
        ldrb    r9, [r8, #1]
        ldrb    r2, [r8, #2]
        ldrb    r6, [r8, #3]
        mov     r10, r10, lsl #24
        orr     r9, r10, r9, lsl #16
        orr     r2, r9, r2, lsl #8
        orr     r6, r2, r6
        and     r7, r6, r7
        beq     LGDJ23
        str     r8, [r0]
        mov     r7, r7, lsr #28
        mov     r2, #4
LGDJ13:
        cmp     r4, #0
        str     r7, [r3]
        ble     LGDJ15
        add     r7, r12, #0xC
        add     r6, r12, #8
        add     r3, r12, #4
        str     r1, [sp, #4]
LGDJ14:
        ldr     r1, [r0]
        add     r5, r5, #1
        cmp     r5, r4
        ldrb    r11, [r1, #1]
        ldrb    r8, [r1]
        ldrb    r9, [r1, #2]
        ldrb    r10, [r1, #3]
        mov     r11, r11, lsl #16
        orr     r8, r11, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        orr     r10, r9, r10
        and     r8, r10, lr, lsr r2
        rsb     r9, r2, #0x1C
        add     r2, r2, #4
        mov     r8, r8, lsr r9
        add     r1, r1, r2, asr #3
        str     r1, [r0]
        and     r1, r8, #1
        str     r1, [r7], #0x10
        mov     r1, r8, lsr #1
        and     r1, r1, #1
        str     r1, [r6], #0x10
        mov     r1, r8, lsr #2
        mov     r8, r8, lsr #3
        and     r1, r1, #1
        str     r1, [r3], #0x10
        and     r8, r8, #1
        str     r8, [r12], #0x10
        and     r2, r2, #7
        blt     LGDJ14
        ldr     r1, [sp, #4]
LGDJ15:
        mov     r6, #0
        mov     r5, r6
        mov     r12, #7
LGDJ16:
        cmp     r4, #0
        ble     LGDJ22
        mov     r3, #0
        str     r6, [sp]
LGDJ17:
        ldr     r7, [r0]
        mov     r5, r1
        rsb     r6, r2, #0x14
        ldrb    r11, [r7, #1]
        ldrb    r9, [r7]
        ldrb    r10, [r7, #2]
        ldrb    r8, [r7, #3]
        mov     r11, r11, lsl #16
        orr     r9, r11, r9, lsl #24
        orr     r10, r9, r10, lsl #8
        add     r9, r2, #0xC
        orr     r8, r10, r8
        and     r2, r8, lr, lsr r2
        add     r7, r7, r9, asr #3
        str     r7, [r0]
        mov     r6, r2, lsr r6
        str     r6, [r1]
        ldr     r2, [r0]
        and     r6, r9, #7
        rsb     r7, r6, #0xA
        ldrb    r11, [r2, #1]
        ldrb    r8, [r2]
        ldrb    r9, [r2, #2]
        ldrb    r10, [r2, #3]
        mov     r11, r11, lsl #16
        orr     r8, r11, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        orr     r10, r9, r10
        and     r8, r10, lr, lsr r6
        add     r6, r6, #0x16
        mov     r7, r8, lsr r7
        add     r2, r2, r6, asr #3
        str     r2, [r0]
        and     r2, r6, #7
        and     r6, r7, #1
        str     r6, [r1, #0x10]
        mov     r6, r7, lsr #1
        and     r6, r6, #0xF
        str     r6, [r1, #0xC]
        mov     r6, r7, lsr #5
        and     r6, r6, #0xFF
        str     r6, [r1, #8]
        add     r6, r12, #0x7E, 30
        and     r7, r6, r7, lsr #13
        str     r7, [r1, #4]
        ldr     r6, [r0]
        ldr     r7, [r5, #0x10]
        add     r1, r1, #0x48
        ldrb    r11, [r6]
        ldrb    r8, [r6, #1]
        ldrb    r9, [r6, #2]
        ldrb    r10, [r6, #3]
        mov     r11, r11, lsl #24
        orr     r8, r11, r8, lsl #16
        orr     r9, r8, r9, lsl #8
        cmp     r7, #0
        orr     r10, r9, r10
        and     r7, r10, lr, lsr r2
        rsb     r8, r2, #0xA
        add     r2, r2, #0x16
        mov     r7, r7, lsr r8
        and     r8, r7, #7
        add     r6, r6, r2, asr #3
        str     r6, [r0]
        mov     r6, r7, lsr #3
        beq     LGDJ20
        str     r8, [r5, #0x30]
        mov     r8, r7, lsr #6
        and     r8, r8, #7
        str     r8, [r5, #0x28]
        mov     r8, r7, lsr #9
        and     r6, r6, #7
        and     r8, r8, #0x1F
        str     r6, [r5, #0x2C]
        mov     r6, r7, lsr #20
        str     r8, [r5, #0x20]
        mov     r8, r7, lsr #14
        mov     r7, r7, lsr #19
        ands    r6, r6, #3
        and     r8, r8, #0x1F
        and     r7, r7, #1
        and     r2, r2, #7
        str     r6, [r5, #0x14]
        str     r8, [r5, #0x1C]
        str     r7, [r5, #0x18]
        beq     LGDJ27
        cmp     r6, #2
        beq     LGDJ24
LGDJ18:
        str     r12, [r5, #0x34]
        mov     r6, #7
LGDJ19:
        rsb     r6, r6, #0x14
        str     r6, [r5, #0x38]
        b       LGDJ21
LGDJ20:
        and     r6, r6, #0xF
        str     r6, [r5, #0x34]
        mov     r6, #0
        str     r6, [r5, #0x14]
        str     r6, [r5, #0x18]
        mov     r6, r7, lsr #7
        and     r6, r6, #0x1F
        str     r6, [r5, #0x24]
        mov     r6, r7, lsr #12
        mov     r7, r7, lsr #17
        and     r6, r6, #0x1F
        and     r7, r7, #0x1F
        str     r8, [r5, #0x38]
        and     r2, r2, #7
        str     r6, [r5, #0x20]
        str     r7, [r5, #0x1C]
LGDJ21:
        ldr     r6, [r0]
        add     r3, r3, #1
        cmp     r3, r4
        ldrb    r10, [r6, #1]
        ldrb    r9, [r6]
        ldrb    r7, [r6, #2]
        ldrb    r8, [r6, #3]
        mov     r10, r10, lsl #16
        orr     r9, r10, r9, lsl #24
        orr     r7, r9, r7, lsl #8
        orr     r8, r7, r8
        and     r7, r8, lr, lsr r2
        rsb     r8, r2, #0x1D
        add     r2, r2, #3
        mov     r7, r7, lsr r8
        add     r6, r6, r2, asr #3
        str     r6, [r0]
        mov     r6, r7, lsr #1
        and     r6, r6, #1
        str     r6, [r5, #0x40]
        mov     r6, r7, lsr #2
        and     r7, r7, #1
        and     r6, r6, #1
        and     r2, r2, #7
        str     r7, [r5, #0x44]
        str     r6, [r5, #0x3C]
        blt     LGDJ17
        ldr     r6, [sp]
        mov     r5, #0
        add     r6, r6, #1
        cmp     r6, #2
        blt     LGDJ16
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ22:
        add     r6, r6, #1
        cmp     r6, #2
        blt     LGDJ16
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ23:
        str     r8, [r0]
        mov     r7, r7, lsr #26
        mov     r2, #6
        b       LGDJ13
LGDJ24:
        cmp     r7, #0
        moveq   r6, #8
        streq   r6, [r5, #0x34]
        beq     LGDJ19
        b       LGDJ18
LGDJ25:
        mvn     r0, #0xA9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ26:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDJ27:
        mvn     r0, #0xA9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


