        .text
        .align  4
        .globl  ownVad2BackgroundNoiseUpdate_GSMAMR_16s


ownVad2BackgroundNoiseUpdate_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r4, [pc, #0x200]
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        cmp     r1, #0x23
        mov     r8, #0
        mov     r1, #1
        bgt     LDOL1
        ldrsh   r2, [r0, #0xB4]
        strh    r8, [r0, #0xAC]
        cmp     r2, #0
        bne     LDOL0
        mov     r2, r8
        mov     r3, r2
        strh    r3, [r0, #0xA2]
        b       LDOL6
LDOL0:
        ldrsh   r2, [r0, #0xA2]
        mov     r1, r8
        mov     r3, r2
        b       LDOL6
LDOL1:
        ldrsh   r6, [r0, #0xAA]
        sub     r5, r4, #4
        mov     r6, r6, lsl #1
        ldrsh   r6, [r5, +r6]
        cmp     r2, r6
        ble     LDOL5
        cmp     r3, #7, 22
        bge     LDOL4
        cmp     lr, #0
        bne     LDOL3
        cmp     r12, #0
        bne     LDOL2
        ldrsh   r2, [r0, #0xA2]
        add     r2, r2, #1
        strh    r2, [r0, #0xA2]
        mov     r3, r2, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #0x32
        movlt   r1, r8
        strlth  r1, [r0, #0xAC]
        strgeh  r1, [r0, #0xAC]
        b       LDOL6
LDOL2:
        ldrsh   r2, [r0, #0xA2]
        mov     r1, r8
        strh    r1, [r0, #0xAC]
        mov     r3, r2
        b       LDOL6
LDOL3:
        ldrsh   r2, [r0, #0xA2]
        strh    r8, [r0, #0xAC]
        mov     r1, r8
        mov     r3, r2
        b       LDOL6
LDOL4:
        ldrsh   r2, [r0, #0xA2]
        strh    r8, [r0, #0xAC]
        mov     r1, r8
        mov     r3, r2
        b       LDOL6
LDOL5:
        ldrsh   r2, [r0, #0xA2]
        mov     r1, r8
        strh    r1, [r0, #0xAC]
        mov     r3, r2
LDOL6:
        ldrsh   r12, [r0, #0xA4]
        cmp     r3, r12
        movne   r3, r8
        ldreqsh r3, [r0, #0xA6]
        addeq   r3, r3, #1
        strh    r2, [r0, #0xA4]
        mov     r2, r3, lsl #16
        cmp     r2, #6, 16
        strh    r3, [r0, #0xA6]
        strgth  r8, [r0, #0xA2]
        cmp     r1, #1
        ldmneia sp!, {r4 - r11, pc}
        ldrsh   r1, [r0, #0xAA]
        cmp     r1, #1
        ldreqsh r1, [r4]
        movne   r1, r8
        mov     r12, #0xCD
        mov     r3, #0xFF
        mov     r2, #0x33
        orr     r12, r12, #3, 22
        orr     r3, r3, #0x7F, 24
        orr     r2, r2, #0x73, 24
        mvn     r7, #2, 2
        mov     lr, #2, 2
        mov     r6, #0x20
        mov     r5, r0
LDOL7:
        cmp     r1, #0
        blt     LDOL9
        ldr     lr, [r5]
        add     r10, r0, r8, lsl #2
        mov     r4, lr, asr r1
LDOL8:
        ldr     r9, [r10, #0x40]
        mov     lr, r4, asr #16
        add     r5, r5, #4
        mov     r11, r9, asr #16
        mov     lr, lr, lsl #16
        and     r4, r3, r4, asr #1
        mul     r4, r4, r12
        mov     r11, r11, lsl #16
        and     r9, r3, r9, asr #1
        mul     r9, r9, r2
        mov     r11, r11, asr #16
        mul     r11, r11, r2
        mov     lr, lr, asr #16
        mul     lr, lr, r12
        add     r8, r8, #1
        add     r9, r11, r9, asr #15
        add     r4, lr, r4, asr #15
        mov     lr, r6
        mov     r9, r9, lsl #1
        add     r4, r9, r4, lsl #1
        cmp     r4, #0x20
        movgt   lr, r4
        cmp     r8, #0xF
        str     lr, [r10, #0x40]
        ble     LDOL7
        ldmia   sp!, {r4 - r11, pc}
LDOL9:
        ldr     lr, [r5]
        rsb     r4, r1, #0
        bic     r4, r4, #0xFF, 8
        bic     r4, r4, #0xFF, 16
        cmp     lr, r7, asr r4
        add     r10, r0, r8, lsl #2
        movgt   r4, r7
        bgt     LDOL8
        mov     r9, #2, 2
        cmp     lr, r9, asr r4
        movge   r4, lr, lsl r4
        movlt   r4, #2, 2
        b       LDOL8
        .long   LDOL_tableStateChangeShiftR


        .data
        .align  4


LDOL_tableNoiseFloorChan:
        .byte   0x00,0x02,0x10,0x00
LDOL_tableStateChangeShiftR:
        .byte   0xFB,0xFF,0x05,0x00


