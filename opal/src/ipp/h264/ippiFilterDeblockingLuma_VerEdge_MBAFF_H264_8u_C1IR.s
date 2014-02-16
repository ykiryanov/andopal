        .text
        .align  4
        .globl  ippiFilterDeblockingLuma_VerEdge_MBAFF_H264_8u_C1IR


ippiFilterDeblockingLuma_VerEdge_MBAFF_H264_8u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r4, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        cmp     r0, #0
        beq     LLCV17
        cmp     r4, #0
        beq     LLCV17
        cmp     r12, #0
        beq     LLCV17
        cmp     r2, #0
        beq     LLCV0
        ldrb    lr, [r12]
        cmp     lr, #0
        bne     LLCV1
        ldrb    lr, [r12, #1]
        cmp     lr, #0
        bne     LLCV1
        ldrb    lr, [r12, #2]
        cmp     lr, #0
        bne     LLCV1
        ldrb    lr, [r12, #3]
        cmp     lr, #0
        bne     LLCV1
LLCV0:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LLCV1:
        mov     lr, #0
        str     r4, [sp, #0x18]
LLCV2:
        ldrb    r9, [r12, +lr, asr #1]
        mov     r10, lr, asr #1
        cmp     r9, #0
        beq     LLCV10
        ldrb    r5, [r0, #-1]
        ldrb    r4, [r0]
        sub     r7, r5, r4
        eor     r6, r7, r7, asr #31
        sub     r8, r6, r7, asr #31
        cmp     r8, r2
        bcs     LLCV10
        ldrb    r6, [r0, #-2]
        subs    r7, r6, r5
        rsbmi   r7, r7, #0
        cmp     r7, r3
        bcs     LLCV10
        ldrb    r7, [r0, #1]
        subs    r11, r7, r4
        rsbmi   r11, r11, #0
        cmp     r11, r3
        bcs     LLCV10
        ldrb    r11, [r0, #-3]
        str     r11, [sp, #0x14]
        ldrb    r11, [r0, #2]
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x14]
        subs    r11, r11, r5
        str     r11, [sp, #4]
        bmi     LLCV16
LLCV3:
        ldr     r11, [sp, #0xC]
        subs    r11, r11, r4
        str     r11, [sp]
        bmi     LLCV15
LLCV4:
        cmp     r9, #4
        beq     LLCV11
        ldr     r8, [sp, #0x18]
        ldrb    r9, [r8, +r10]
        ldr     r8, [sp, #4]
        cmp     r8, r3
        mov     r8, r9
        addcc   r8, r9, #1
        andcc   r8, r8, #0xFF
        ldr     r10, [sp]
        cmp     r10, r3
        addcc   r8, r8, #1
        andcc   r8, r8, #0xFF
        sub     r10, r4, r5
        add     r10, r6, r10, lsl #2
        sub     r10, r10, r7
        add     r10, r10, #4
        movs    r10, r10, asr #3
        str     r10, [sp, #8]
        beq     LLCV6
        ldr     r11, [sp, #8]
        rsb     r10, r8, #0
        str     r10, [sp, #0x10]
        cmp     r11, r10
        ldr     r11, [sp, #8]
        movgt   r10, r11
        cmp     r10, r8
        bgt     LLCV5
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #8]
        cmp     r10, r8
        ldrle   r8, [sp, #0x10]
        ldrgt   r8, [sp, #8]
LLCV5:
        add     r10, r5, r8
        sub     r8, r4, r8
        str     r8, [sp, #0x10]
        ldr     r8, [pc, #0x27C]
        add     r10, r8, r10
        ldrb    r8, [r10, #0x100]
        ldr     r10, [pc, #0x270]
        str     r8, [sp, #8]
        ldr     r8, [sp, #0x10]
        add     r8, r10, r8
        ldr     r10, [sp, #8]
        ldrb    r8, [r8, #0x100]
        strb    r10, [r0, #-1]
        strb    r8, [r0]
LLCV6:
        ldr     r8, [sp, #4]
        cmp     r8, r3
        bcs     LLCV8
        add     r8, r5, r4
        add     r8, r8, #1
        mov     r10, r6, lsl #1
        rsb     r8, r10, r8, asr #1
        ldr     r10, [sp, #0x14]
        str     r9, [sp, #4]
        add     r10, r8, r10
        ldr     r8, [sp, #4]
        mov     r10, r10, asr #1
        str     r10, [sp, #0x10]
        rsb     r8, r8, #0
        cmp     r10, r8
        ldr     r10, [sp, #0x10]
        str     r8, [sp, #8]
        movgt   r8, r10
        ldr     r10, [sp, #4]
        cmp     r8, r10
        bgt     LLCV7
        ldr     r10, [sp, #0x10]
        ldr     r8, [sp, #8]
        cmp     r10, r8
        ldrle   r8, [sp, #8]
        strle   r8, [sp, #4]
        ldrgt   r8, [sp, #0x10]
        strgt   r8, [sp, #4]
LLCV7:
        ldr     r8, [sp, #4]
        add     r8, r6, r8
        strb    r8, [r0, #-2]
LLCV8:
        ldr     r6, [sp]
        cmp     r6, r3
        bcs     LLCV10
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r5, r7, lsl #1
        rsb     r4, r5, r4, asr #1
        ldr     r5, [sp, #0xC]
        add     r5, r4, r5
        rsb     r4, r9, #0
        mov     r5, r5, asr #1
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        cmp     r6, r9
        bgt     LLCV9
        cmp     r5, r4
        movle   r9, r4
        movgt   r9, r5
LLCV9:
        add     r9, r7, r9
        strb    r9, [r0, #1]
LLCV10:
        add     lr, lr, #1
        cmp     lr, #8
        add     r0, r1, r0
        blt     LLCV2
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LLCV11:
        mov     r9, r2, lsr #2
        add     r9, r9, #2
        cmp     r8, r9
        movcs   r8, #0
        bcs     LLCV12
        ldr     r8, [sp, #4]
        cmp     r8, r3
        movcs   r8, #1
        bcs     LLCV12
        ldrb    r8, [r0, #-4]
        str     r8, [sp, #0x10]
        add     r8, r5, r4
        add     r9, r8, r6
        ldr     r8, [sp, #0x14]
        add     r10, r8, r8, lsl #1
        str     r10, [sp, #8]
        add     r10, r7, r8
        str     r10, [sp, #4]
        ldr     r10, [sp, #8]
        add     r8, r8, r9
        add     r10, r10, r9
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #4]
        mov     r8, r8, lsl #1
        add     r8, r8, #4
        add     r9, r10, r9, lsl #1
        str     r9, [sp, #8]
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        mov     r8, r8, asr #3
        add     r9, r10, r9, lsl #1
        ldr     r10, [sp, #8]
        add     r9, r9, #4
        add     r10, r10, #4
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x14]
        mov     r9, r9, asr #3
        mov     r10, r10, asr #3
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x14]
        strb    r8, [r0, #-2]
        strb    r9, [r0, #-3]
        strb    r10, [r0, #-1]
        b       LLCV13
LLCV12:
        add     r9, r5, r6, lsl #1
        add     r9, r9, r7
        add     r9, r9, #2
        cmp     r8, #0
        mov     r9, r9, asr #2
        strb    r9, [r0, #-1]
        beq     LLCV14
LLCV13:
        ldr     r8, [sp]
        cmp     r8, r3
        bcs     LLCV14
        add     r4, r5, r4
        ldr     r5, [sp, #0xC]
        add     r7, r4, r7
        ldrb    r4, [r0, #3]
        add     r8, r5, r5, lsl #1
        add     r6, r6, r5
        add     r8, r8, r7
        add     r6, r6, r7, lsl #1
        add     r4, r8, r4, lsl #1
        add     r5, r7, r5
        add     r6, r6, #4
        add     r5, r5, #2
        add     r4, r4, #4
        mov     r6, r6, asr #3
        mov     r5, r5, asr #2
        mov     r4, r4, asr #3
        strb    r6, [r0]
        strb    r5, [r0, #1]
        strb    r4, [r0, #2]
        b       LLCV10
LLCV14:
        add     r6, r4, r6
        add     r7, r6, r7, lsl #1
        add     r4, r7, #2
        mov     r4, r4, asr #2
        strb    r4, [r0]
        b       LLCV10
LLCV15:
        ldr     r11, [sp]
        rsb     r11, r11, #0
        str     r11, [sp]
        b       LLCV4
LLCV16:
        ldr     r11, [sp, #4]
        rsb     r11, r11, #0
        str     r11, [sp, #4]
        b       LLCV3
LLCV17:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   ClampTbl


