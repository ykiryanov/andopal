        .text
        .align  4
        .globl  ippiFilterDeblockingLumaHorEdge_H264_16u_C1IR


ippiFilterDeblockingLumaHorEdge_H264_16u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        cmp     r0, #0
        beq     LLDA20
        ldr     r7, [r0]
        cmp     r7, #0
        beq     LLDA20
        ldr     r2, [r0, #8]
        cmp     r2, #0
        beq     LLDA20
        ldr     r12, [r0, #0xC]
        cmp     r12, #0
        beq     LLDA20
        ldr     lr, [r0, #0x10]
        cmp     lr, #0
        beq     LLDA20
        ldr     r3, [r0, #0x14]
        cmp     r3, #0
        beq     LLDA20
        ldr     r1, [r0, #4]
        cmp     r1, #0
        ble     LLDA21
        mov     r6, #0
        mov     r5, #1
        mov     r4, r6
LLDA0:
        cmp     r6, #0
        mov     r9, r4
        movgt   r9, r5
        mov     r8, r6, lsl #2
        mul     r1, r1, r8
        mov     r9, r9, lsl #1
        ldrh    r2, [r2, +r9]
        ldrh    r12, [r12, +r9]
        ldrb    r9, [r3, +r6, lsl #2]
        add     r3, r8, r3
        add     r1, r7, r1, lsl #1
        add     r8, lr, r6, lsl #3
        cmp     r9, #0
        bne     LLDA1
        ldrb    lr, [r3, #1]
        cmp     lr, #0
        bne     LLDA1
        ldrb    lr, [r3, #2]
        cmp     lr, #0
        bne     LLDA1
        ldrb    lr, [r3, #3]
        cmp     lr, #0
        beq     LLDA13
LLDA1:
        mov     lr, #0
        str     r8, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LLDA2:
        ldrb    r10, [r3, +lr, asr #2]
        cmp     r10, #0
        addeq   lr, lr, #3
        addeq   r1, r1, #6
        beq     LLDA12
        ldr     r9, [r0, #4]
        ldrh    r6, [r1]
        sub     r5, r1, r9, lsl #1
        ldrh    r7, [r5]
        subs    r8, r7, r6
        rsbmi   r8, r8, #0
        cmp     r8, r2
        bcs     LLDA12
        sub     r4, r1, r9, lsl #2
        ldrh    r11, [r4]
        mov     r4, r9, lsl #1
        str     r11, [sp, #0x20]
        subs    r11, r11, r7
        rsbmi   r11, r11, #0
        cmp     r11, r12
        bcs     LLDA12
        ldrh    r4, [r1, +r4]
        str     r4, [sp, #0x18]
        subs    r4, r4, r6
        rsbmi   r4, r4, #0
        cmp     r4, r12
        bcs     LLDA12
        mov     r4, r9, lsl #3
        rsb     r4, r4, r9, lsl #1
        ldrh    r4, [r1, +r4]
        mov     r11, r9, lsl #2
        str     r4, [sp, #0x10]
        ldrh    r11, [r1, +r11]
        subs    r4, r4, r7
        str     r4, [sp, #0x1C]
        str     r11, [sp, #0xC]
        bmi     LLDA19
LLDA3:
        ldr     r4, [sp, #0xC]
        subs    r4, r4, r6
        rsbmi   r4, r4, #0
        cmp     r10, #4
        beq     LLDA15
        ldr     r8, [sp, #0x1C]
        bic     r9, lr, #3
        cmp     r8, r12
        mov     r8, r9, asr #1
        ldr     r9, [sp, #8]
        ldrh    r8, [r9, +r8]
        str     r8, [sp, #0x14]
        addcc   r9, r8, #1
        strcc   r9, [sp, #0x14]
        cmp     r4, r12
        bcs     LLDA4
        ldr     r9, [sp, #0x14]
        add     r9, r9, #1
        str     r9, [sp, #0x14]
LLDA4:
        ldr     r9, [sp, #0x20]
        sub     r10, r6, r7
        add     r9, r9, r10, lsl #2
        ldr     r10, [sp, #0x18]
        sub     r9, r9, r10
        add     r9, r9, #4
        movs    r9, r9, asr #3
        beq     LLDA8
        ldr     r10, [sp, #0x14]
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        rsb     r11, r10, #0
        cmp     r9, r11
        str     r11, [sp, #0x24]
        movgt   r11, r9
        cmp     r11, r10
        str     r10, [sp, #0x14]
        bgt     LLDA5
        ldr     r10, [sp, #0x24]
        cmp     r9, r10
        ldrle   r9, [sp, #0x24]
        strle   r9, [sp, #0x14]
        strgt   r9, [sp, #0x14]
LLDA5:
        ldr     r10, [r0, #0x18]
        ldr     r9, [sp, #0x14]
        mov     r11, #1
        mov     r10, r11, lsl r10
        sub     r10, r10, #1
        add     r9, r7, r9
        cmp     r10, r9
        blt     LLDA6
        cmp     r9, #0
        movlt   r10, #0
        movge   r10, r9
LLDA6:
        strh    r10, [r5]
        ldr     r9, [r0, #0x18]
        ldr     r5, [sp, #0x14]
        mov     r10, #1
        mov     r9, r10, lsl r9
        sub     r9, r9, #1
        sub     r5, r6, r5
        cmp     r9, r5
        blt     LLDA7
        cmp     r5, #0
        movlt   r9, #0
        movge   r9, r5
LLDA7:
        strh    r9, [r1]
LLDA8:
        ldr     r5, [sp, #0x1C]
        cmp     r5, r12
        bcs     LLDA10
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x10]
        add     r5, r7, r6
        add     r5, r5, #1
        mov     r9, r9, lsl #1
        rsb     r5, r9, r5, asr #1
        add     r10, r5, r10
        mov     r9, r8
        rsb     r5, r9, #0
        mov     r10, r10, asr #1
        cmp     r10, r5
        mov     r11, r5
        movgt   r11, r10
        cmp     r11, r9
        bgt     LLDA9
        cmp     r10, r5
        movle   r9, r5
        movgt   r9, r10
LLDA9:
        ldr     r5, [r0, #4]
        mov     r5, r5, lsl #2
        rsb     r5, r5, #0
        ldrh    r10, [r1, +r5]
        add     r9, r10, r9
        strh    r9, [r1, +r5]
LLDA10:
        cmp     r4, r12
        bcs     LLDA12
        ldr     r5, [sp, #0x18]
        add     r6, r7, r6
        add     r4, r6, #1
        mov     r5, r5, lsl #1
        rsb     r6, r8, #0
        rsb     r4, r5, r4, asr #1
        ldr     r5, [sp, #0xC]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        cmp     r4, r6
        mov     r5, r6
        movgt   r5, r4
        cmp     r5, r8
        bgt     LLDA11
        cmp     r4, r6
        movle   r8, r6
        movgt   r8, r4
LLDA11:
        ldr     r4, [r0, #4]
        mov     r4, r4, lsl #1
        ldrh    r5, [r1, +r4]
        add     r8, r5, r8
        strh    r8, [r1, +r4]
LLDA12:
        add     lr, lr, #1
        cmp     lr, #0x10
        add     r1, r1, #2
        blt     LLDA2
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
        mov     r4, #0
        mov     r5, #1
LLDA13:
        add     r6, r6, #1
        cmp     r6, #4
        bge     LLDA14
        ldr     r2, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        ldr     r3, [r0, #0x14]
        ldr     r1, [r0, #4]
        b       LLDA0
LLDA14:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LLDA15:
        mov     r10, r2, lsr #2
        add     r10, r10, #2
        cmp     r8, r10
        movcs   r8, #0
        bcs     LLDA16
        ldr     r8, [sp, #0x1C]
        cmp     r8, r12
        movcs   r8, #1
        bcs     LLDA16
        ldr     r10, [sp, #0x20]
        add     r8, r7, r6
        sub     r9, r1, r9, lsl #3
        add     r10, r8, r10
        str     r10, [sp, #0x24]
        ldrh    r9, [r9]
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0x24]
        str     r9, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        add     r9, r9, r8
        add     r10, r9, r10, lsl #1
        add     r9, r10, #4
        ldr     r10, [sp, #0x24]
        mov     r9, r9, asr #3
        strh    r9, [r5]
        ldr     r5, [r0, #4]
        add     r10, r10, r8
        add     r10, r10, #2
        mov     r5, r5, lsl #2
        rsb     r5, r5, #0
        mov     r10, r10, asr #2
        strh    r10, [r1, +r5]
        ldr     r9, [sp, #0x24]
        add     r8, r8, r8, lsl #1
        ldr     r5, [r0, #4]
        add     r8, r8, r9
        ldr     r9, [sp, #0x1C]
        add     r9, r8, r9, lsl #1
        add     r8, r9, #4
        mov     r9, r5, lsl #3
        rsb     r5, r9, r5, lsl #1
        mov     r8, r8, asr #3
        strh    r8, [r1, +r5]
        b       LLDA17
LLDA16:
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        cmp     r8, #0
        add     r9, r7, r9, lsl #1
        add     r10, r9, r10
        add     r9, r10, #2
        mov     r9, r9, asr #2
        strh    r9, [r5]
        beq     LLDA18
LLDA17:
        cmp     r4, r12
        bcs     LLDA18
        ldr     r5, [sp, #0x18]
        ldr     r4, [r0, #4]
        add     r6, r7, r6
        add     r5, r6, r5
        ldr     r7, [sp, #0x20]
        add     r6, r4, r4, lsl #2
        add     r6, r4, r6
        ldrh    r4, [r1, +r6]
        ldr     r6, [sp, #0xC]
        add     r7, r7, r6
        add     r7, r7, r5, lsl #1
        add     r8, r7, #4
        add     r7, r6, r5
        mov     r8, r8, asr #3
        strh    r8, [r1]
        ldr     r8, [r0, #4]
        add     r7, r7, #2
        add     r6, r6, r6, lsl #1
        mov     r8, r8, lsl #1
        mov     r7, r7, asr #2
        strh    r7, [r1, +r8]
        ldr     r7, [r0, #4]
        add     r5, r6, r5
        add     r4, r5, r4, lsl #1
        add     r4, r4, #4
        mov     r7, r7, lsl #2
        mov     r4, r4, asr #3
        strh    r4, [r1, +r7]
        b       LLDA12
LLDA18:
        ldr     r4, [sp, #0x20]
        add     r6, r6, r4
        ldr     r4, [sp, #0x18]
        add     r4, r6, r4, lsl #1
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r1]
        b       LLDA12
LLDA19:
        ldr     r4, [sp, #0x1C]
        rsb     r4, r4, #0
        str     r4, [sp, #0x1C]
        b       LLDA3
LLDA20:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LLDA21:
        mvn     r0, #0xD
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


