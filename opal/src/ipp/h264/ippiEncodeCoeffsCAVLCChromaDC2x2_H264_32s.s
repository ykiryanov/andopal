        .text
        .align  4
        .globl  ippiEncodeCoeffsCAVLCChromaDC2x2_H264_32s


ippiEncodeCoeffsCAVLCChromaDC2x2_H264_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r4, [sp, #0x34]
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        cmp     r0, #0
        str     r4, [sp, #4]
        beq     LLCM19
        cmp     r1, #0
        beq     LLCM19
        cmp     r2, #0
        beq     LLCM19
        cmp     r3, #0
        beq     LLCM19
        cmp     lr, #0
        beq     LLCM19
        cmp     r12, #0
        beq     LLCM19
        ldr     r4, [sp, #4]
        cmp     r4, #0
        beq     LLCM19
        ldr     r4, [r0, #0xC]
        mov     r8, #0
        mov     r5, #1
        cmp     r4, #0
        bne     LLCM0
        mov     r7, r8
        mov     r6, r7
        mov     r4, r5
        b       LLCM2
LLCM0:
        cmp     r4, #1
        beq     LLCM18
        cmn     r4, #1
        beq     LLCM18
        mov     r7, r8
        str     r4, [r12]
        mov     r6, r7
        mov     r4, r6
LLCM1:
        mov     r5, r8
        mov     r8, #1
LLCM2:
        ldr     r9, [r0, #8]
        cmp     r9, #0
        addeq   r10, r5, #1
        moveq   r5, #0
        beq     LLCM6
        cmp     r4, #0
        beq     LLCM3
        cmp     r9, #1
        beq     LLCM15
        cmn     r9, #1
        beq     LLCM15
LLCM3:
        rsb     r4, r7, #0
        add     r4, r12, r4, lsl #2
        str     r9, [r4, +r8, lsl #2]
        mov     r4, #0
LLCM4:
        cmp     r8, #0
        mov     r10, #0
        moveq   r5, r10
        beq     LLCM5
        ldr     r9, [sp, #4]
        add     r9, r8, r9
        strb    r5, [r9, #-1]
LLCM5:
        add     r8, r8, #1
LLCM6:
        ldr     r9, [r0, #4]
        cmp     r9, #0
        str     r9, [sp]
        addeq   r10, r10, #1
        beq     LLCM10
        cmp     r4, #0
        beq     LLCM7
        ldr     r4, [sp]
        cmp     r4, #1
        beq     LLCM16
        ldr     r4, [sp]
        cmn     r4, #1
        beq     LLCM16
LLCM7:
        ldr     r11, [sp]
        rsb     r9, r7, #0
        mov     r4, #0
        add     r9, r12, r9, lsl #2
        str     r11, [r9, +r8, lsl #2]
LLCM8:
        cmp     r8, #0
        beq     LLCM9
        ldr     r9, [sp, #4]
        add     r5, r5, r10
        and     r5, r5, #0xFF
        add     r9, r8, r9
        strb    r10, [r9, #-1]
LLCM9:
        add     r8, r8, #1
        mov     r10, #0
LLCM10:
        ldr     r0, [r0]
        cmp     r0, #0
        addeq   r10, r10, #1
        beq     LLCM14
        cmp     r4, #0
        beq     LLCM11
        cmp     r0, #1
        beq     LLCM17
        cmn     r0, #1
        beq     LLCM17
LLCM11:
        rsb     r4, r7, #0
        add     r4, r12, r4, lsl #2
        str     r0, [r4, +r8, lsl #2]
LLCM12:
        cmp     r8, #0
        beq     LLCM13
        ldr     r0, [sp, #4]
        add     r0, r8, r0
        strb    r10, [r0, #-1]
        add     r10, r5, r10
        and     r5, r10, #0xFF
LLCM13:
        add     r8, r8, #1
        mov     r10, #0
LLCM14:
        strb    r7, [r1]
        strb    r6, [r2]
        strb    r8, [r3]
        add     r10, r5, r10
        mov     r0, #0
        strb    r10, [lr]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLCM15:
        cmn     r9, #1
        mov     r4, #0
        mov     r10, r4
        mov     r9, #1
        moveq   r10, r9
        add     r7, r7, #1
        cmp     r7, #3
        orr     r6, r10, r6, lsl #1
        and     r6, r6, #0xFF
        movlt   r4, r9
        b       LLCM4
LLCM16:
        ldr     r4, [sp]
        add     r7, r7, #1
        mov     r9, #1
        cmn     r4, #1
        mov     r4, #0
        moveq   r4, r9
        orr     r6, r4, r6, lsl #1
        mov     r4, #0
        cmp     r7, #3
        and     r6, r6, #0xFF
        movlt   r4, r9
        b       LLCM8
LLCM17:
        cmn     r0, #1
        movne   r0, #0
        moveq   r0, #1
        orr     r6, r0, r6, lsl #1
        add     r7, r7, #1
        and     r6, r6, #0xFF
        b       LLCM12
LLCM18:
        cmn     r4, #1
        movne   r6, #0
        mov     r7, r5
        moveq   r6, #1
        mov     r4, r7
        b       LLCM1
LLCM19:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


