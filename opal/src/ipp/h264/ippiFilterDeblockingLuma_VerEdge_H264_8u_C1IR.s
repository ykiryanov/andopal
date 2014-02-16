        .text
        .align  4
        .globl  ippiFilterDeblockingLuma_VerEdge_H264_8u_C1IR


ippiFilterDeblockingLuma_VerEdge_H264_8u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     r8, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        cmp     r0, #0
        beq     LLCW19
        cmp     r2, #0
        beq     LLCW19
        cmp     r3, #0
        beq     LLCW19
        cmp     r8, #0
        beq     LLCW19
        cmp     r12, #0
        beq     LLCW19
        mov     r11, #0
        mov     r10, #0
        add     r4, r1, r1, lsl #1
        mov     r9, #1
LLCW0:
        cmp     r10, #0
        mov     lr, r11
        movgt   lr, r9
        ldrb    r7, [r2, +lr]
        ldrb    r5, [r12]
        ldrb    lr, [lr, +r3]
        add     r6, r0, r10, lsl #2
        cmp     r5, #0
        bne     LLCW1
        ldrb    r5, [r12, #1]
        cmp     r5, #0
        bne     LLCW1
        ldrb    r5, [r12, #2]
        cmp     r5, #0
        bne     LLCW1
        ldrb    r5, [r12, #3]
        cmp     r5, #0
        beq     LLCW12
LLCW1:
        mov     r5, #0
        str     r10, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LLCW2:
        ldrb    r9, [r12, +r5, asr #2]
        mov     r10, r5, asr #2
        cmp     r9, #0
        addeq   r5, r5, #3
        addeq   r6, r6, r4
        beq     LLCW11
        ldrb    r3, [r6, #-1]
        ldrb    r2, [r6]
        subs    r8, r3, r2
        rsbmi   r8, r8, #0
        cmp     r8, r7
        bcs     LLCW11
        ldrb    r0, [r6, #-2]
        subs    r11, r0, r3
        rsbmi   r11, r11, #0
        cmp     r11, lr
        bcs     LLCW11
        ldrb    r11, [r6, #1]
        str     r11, [sp, #0x28]
        subs    r11, r11, r2
        rsbmi   r11, r11, #0
        cmp     r11, lr
        bcs     LLCW11
        ldrb    r11, [r6, #-3]
        str     r11, [sp, #0x14]
        ldrb    r11, [r6, #2]
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x14]
        subs    r11, r11, r3
        str     r11, [sp, #0x2C]
        bmi     LLCW18
LLCW3:
        ldr     r11, [sp, #0x20]
        subs    r11, r11, r2
        str     r11, [sp, #0x24]
        bmi     LLCW17
LLCW4:
        cmp     r9, #4
        beq     LLCW13
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0x2C]
        ldrb    r8, [r8, +r10]
        str     r8, [sp, #0x1C]
        cmp     r9, lr
        addcc   r9, r8, #1
        strcc   r9, [sp, #0x1C]
        ldr     r9, [sp, #0x24]
        cmp     r9, lr
        bcs     LLCW5
        ldr     r9, [sp, #0x1C]
        add     r9, r9, #1
        str     r9, [sp, #0x1C]
LLCW5:
        ldr     r10, [sp, #0x28]
        sub     r9, r2, r3
        add     r9, r0, r9, lsl #2
        sub     r9, r9, r10
        add     r9, r9, #4
        movs    r9, r9, asr #3
        beq     LLCW7
        ldr     r10, [sp, #0x1C]
        and     r10, r10, #0xFF
        str     r10, [sp, #0x1C]
        rsb     r10, r10, #0
        ldr     r11, [sp, #0x1C]
        cmp     r9, r10
        str     r10, [sp, #0x18]
        movgt   r10, r9
        cmp     r10, r11
        bgt     LLCW6
        ldr     r10, [sp, #0x18]
        cmp     r9, r10
        ldrle   r9, [sp, #0x18]
        strle   r9, [sp, #0x1C]
        strgt   r9, [sp, #0x1C]
LLCW6:
        ldr     r10, [sp, #0x1C]
        add     r9, r3, r10
        sub     r10, r2, r10
        str     r10, [sp, #0x1C]
        ldr     r10, [pc, #0x28C]
        add     r9, r10, r9
        ldrb    r9, [r9, #0x100]
        ldr     r10, [sp, #0x1C]
        str     r9, [sp, #0x18]
        ldr     r9, [pc, #0x278]
        add     r10, r9, r10
        ldrb    r9, [r10, #0x100]
        ldr     r10, [sp, #0x18]
        strb    r9, [r6]
        strb    r10, [r6, #-1]
LLCW7:
        ldr     r9, [sp, #0x2C]
        cmp     r9, lr
        bcs     LLCW9
        ldr     r11, [sp, #0x14]
        add     r9, r3, r2
        add     r9, r9, #1
        mov     r10, r0, lsl #1
        rsb     r9, r10, r9, asr #1
        add     r11, r9, r11
        mov     r10, r8
        rsb     r9, r10, #0
        mov     r11, r11, asr #1
        cmp     r11, r9
        str     r9, [sp, #0x1C]
        movgt   r9, r11
        cmp     r9, r10
        bgt     LLCW8
        ldr     r9, [sp, #0x1C]
        cmp     r11, r9
        ldrle   r10, [sp, #0x1C]
        movgt   r10, r11
LLCW8:
        add     r10, r0, r10
        strb    r10, [r6, #-2]
LLCW9:
        ldr     r0, [sp, #0x24]
        cmp     r0, lr
        bcs     LLCW11
        add     r2, r3, r2
        add     r0, r2, #1
        ldr     r2, [sp, #0x28]
        mov     r2, r2, lsl #1
        rsb     r0, r2, r0, asr #1
        ldr     r2, [sp, #0x20]
        add     r2, r0, r2
        rsb     r0, r8, #0
        mov     r2, r2, asr #1
        cmp     r2, r0
        mov     r3, r0
        movgt   r3, r2
        cmp     r3, r8
        bgt     LLCW10
        cmp     r2, r0
        movle   r8, r0
        movgt   r8, r2
LLCW10:
        ldr     r0, [sp, #0x28]
        add     r8, r0, r8
        strb    r8, [r6, #1]
LLCW11:
        add     r5, r5, #1
        cmp     r5, #0x10
        add     r6, r6, r1
        blt     LLCW2
        ldr     r10, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r9, #1
        mov     r11, #0
LLCW12:
        add     r10, r10, #1
        cmp     r10, #4
        add     r8, r8, #4
        add     r12, r12, #4
        blt     LLCW0
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LLCW13:
        mov     r9, r7, lsr #2
        add     r9, r9, #2
        cmp     r8, r9
        movcs   r8, #0
        bcs     LLCW14
        ldr     r8, [sp, #0x2C]
        cmp     r8, lr
        movcs   r8, #1
        bcs     LLCW14
        ldrb    r8, [r6, #-4]
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x28]
        str     r8, [sp, #0x2C]
        add     r8, r3, r2
        add     r8, r8, r0
        add     r11, r10, r10, lsl #1
        add     r9, r9, r10
        add     r11, r11, r8
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x2C]
        add     r9, r9, r8, lsl #1
        add     r10, r10, r8
        ldr     r8, [sp, #0x1C]
        add     r9, r9, #4
        str     r9, [sp, #0x2C]
        mov     r10, r10, lsl #1
        add     r9, r10, #4
        ldr     r10, [sp, #0x2C]
        add     r8, r8, r11, lsl #1
        add     r8, r8, #4
        mov     r10, r10, asr #3
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x2C]
        mov     r9, r9, asr #3
        mov     r8, r8, asr #3
        strb    r10, [r6, #-1]
        strb    r9, [r6, #-2]
        strb    r8, [r6, #-3]
        b       LLCW15
LLCW14:
        ldr     r10, [sp, #0x28]
        add     r9, r3, r0, lsl #1
        cmp     r8, #0
        add     r10, r9, r10
        add     r9, r10, #2
        mov     r9, r9, asr #2
        strb    r9, [r6, #-1]
        beq     LLCW16
LLCW15:
        ldr     r8, [sp, #0x24]
        cmp     r8, lr
        bcs     LLCW16
        ldrb    r8, [r6, #3]
        add     r2, r3, r2
        ldr     r3, [sp, #0x28]
        add     r2, r2, r3
        ldr     r3, [sp, #0x20]
        add     r9, r0, r3
        add     r9, r9, r2, lsl #1
        add     r10, r3, r3, lsl #1
        add     r0, r10, r2
        add     r3, r2, r3
        add     r8, r0, r8, lsl #1
        add     r9, r9, #4
        add     r3, r3, #2
        add     r0, r8, #4
        mov     r9, r9, asr #3
        mov     r3, r3, asr #2
        mov     r0, r0, asr #3
        strb    r9, [r6]
        strb    r3, [r6, #1]
        strb    r0, [r6, #2]
        b       LLCW11
LLCW16:
        add     r0, r2, r0
        ldr     r2, [sp, #0x28]
        add     r2, r0, r2, lsl #1
        add     r0, r2, #2
        mov     r0, r0, asr #2
        strb    r0, [r6]
        b       LLCW11
LLCW17:
        ldr     r11, [sp, #0x24]
        rsb     r11, r11, #0
        str     r11, [sp, #0x24]
        b       LLCW4
LLCW18:
        ldr     r11, [sp, #0x2C]
        rsb     r11, r11, #0
        str     r11, [sp, #0x2C]
        b       LLCW3
LLCW19:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   ClampTbl


