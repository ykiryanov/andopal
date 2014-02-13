        .text
        .align  4
        .globl  _ippiEncodeCoeffsCAVLCChromaDC2x4_H264_32s


_ippiEncodeCoeffsCAVLCChromaDC2x4_H264_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r5, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     lr, [sp, #0x44]
        ldr     r12, [pc, #0x14C]
        cmp     r0, #0
        add     r7, r0, #0x1C
        beq     LLCK6
        cmp     r1, #0
        beq     LLCK6
        cmp     r2, #0
        beq     LLCK6
        cmp     r3, #0
        beq     LLCK6
        cmp     r5, #0
        beq     LLCK6
        cmp     r4, #0
        beq     LLCK6
        cmp     lr, #0
        beq     LLCK6
        mov     r8, #1
        mov     r10, #0
        str     r8, [sp, #0x14]
        mov     r11, #7
        str     r11, [sp, #0x10]
        mov     r0, r10
        str     r3, [sp, #4]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r6, r0
        mov     r9, r6
        str     r2, [sp, #8]
        mov     r8, r9
        str     r5, [sp]
        mov     r2, #1
LLCK0:
        ldr     r5, [r7]
        cmp     r5, #0
        addeq   r9, r9, #1
        beq     LLCK4
        cmp     r3, #0
        beq     LLCK1
        cmp     r5, #1
        beq     LLCK5
        cmn     r5, #1
        beq     LLCK5
LLCK1:
        and     r3, r10, #0xFF
        rsb     r11, r3, #0
        mov     r3, #0
        add     r11, r4, r11, lsl #2
        str     r5, [r11, +r8, lsl #2]
LLCK2:
        cmp     r8, #0
        beq     LLCK3
        add     r6, r6, r9
        add     r5, r8, lr
        strb    r9, [r5, #-1]
        and     r6, r6, #0xFF
LLCK3:
        add     r8, r8, #1
        mov     r9, #0
LLCK4:
        ldr     r5, [r12], #-4
        subs    r1, r1, #1
        sub     r7, r7, r5, lsl #2
        bpl     LLCK0
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r5, [sp]
        strb    r10, [r1]
        strb    r0, [r2]
        strb    r8, [r3]
        add     r9, r6, r9
        mov     r0, #0
        strb    r9, [r5]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLCK5:
        cmn     r5, #1
        mov     r3, #0
        mov     r5, r3
        add     r10, r10, #1
        moveq   r5, r2
        and     r11, r10, #0xFF
        cmp     r11, #3
        orr     r0, r5, r0, lsl #1
        and     r0, r0, #0xFF
        movlt   r3, r2
        b       LLCK2
LLCK6:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LLCK_scan_chroma2x4


        .data
        .align  4


LLCK_scan_chroma2x4:
        .byte   0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x03,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0xFD,0xFF,0xFF,0xFF,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00


