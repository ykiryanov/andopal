        .text
        .align  4
        .globl  ippiEncodeCoeffsCAVLC_H264_16s


ippiEncodeCoeffsCAVLC_H264_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r7, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        ldr     r5, [sp, #0x44]
        ldr     r4, [sp, #0x48]
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
        cmp     r0, #0
        beq     LLCO9
        cmp     r7, #0
        beq     LLCO9
        cmp     r6, #0
        beq     LLCO9
        cmp     r5, #0
        beq     LLCO9
        cmp     r4, #0
        beq     LLCO9
        cmp     lr, #0
        beq     LLCO9
        cmp     r12, #0
        beq     LLCO9
        cmp     r2, #0
        beq     LLCO9
        cmp     r3, #0xF
        bgt     LLCO6
        cmp     r3, r1
        blt     LLCO6
        cmp     r3, r1
        blt     LLCO8
        add     r2, r2, r3, lsl #2
        str     r2, [sp, #4]
        mov     r11, #1
        mov     r10, #0
        str     r11, [sp]
        mov     r8, r10
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x10]
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
        mov     r2, r8
        mov     r9, r2
        mov     r11, r9
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
LLCO0:
        ldr     r6, [r4], #-4
        mov     r6, r6, lsl #1
        ldrsh   r6, [r0, +r6]
        cmp     r6, #0
        addeq   r9, r9, #1
        beq     LLCO4
        cmp     r5, #0
        beq     LLCO1
        cmp     r6, #1
        beq     LLCO7
        cmn     r6, #1
        beq     LLCO7
LLCO1:
        and     r5, r10, #0xFF
        rsb     r7, r5, #0
        mov     r5, r11, lsl #1
        add     r7, lr, r7, lsl #1
        strh    r6, [r7, +r5]
        mov     r5, #0
LLCO2:
        cmp     r11, #0
        beq     LLCO3
        add     r2, r2, r9
        add     r6, r11, r12
        strb    r9, [r6, #-1]
        and     r2, r2, #0xFF
LLCO3:
        add     r11, r11, #1
        mov     r9, #0
LLCO4:
        sub     r3, r3, #1
        cmp     r3, r1
        bge     LLCO0
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
LLCO5:
        strb    r10, [r7]
        strb    r8, [r6]
        strb    r11, [r5]
        add     r9, r2, r9
        mov     r0, #0
        strb    r9, [r4]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLCO6:
        mvn     r0, #0xA
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLCO7:
        mov     r5, #0
        cmn     r6, #1
        mov     r6, #1
        moveq   r5, r6
        orr     r8, r5, r8, lsl #1
        add     r10, r10, #1
        mov     r5, #0
        and     r7, r10, #0xFF
        cmp     r7, #3
        and     r8, r8, #0xFF
        movlt   r5, r6
        b       LLCO2
LLCO8:
        mov     r10, #0
        mov     r8, r10
        mov     r2, r8
        mov     r9, r2
        mov     r11, r9
        b       LLCO5
LLCO9:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


