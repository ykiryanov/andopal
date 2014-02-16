        .text
        .align  4
        .globl  ippiFilterDeblockingLumaVerEdge_H264_16u_C1IR


ippiFilterDeblockingLumaVerEdge_H264_16u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        beq     LLCY19
        ldr     r1, [r0]
        cmp     r1, #0
        beq     LLCY19
        ldr     r3, [r0, #8]
        cmp     r3, #0
        beq     LLCY19
        ldr     r12, [r0, #0xC]
        cmp     r12, #0
        beq     LLCY19
        ldr     r6, [r0, #0x10]
        cmp     r6, #0
        beq     LLCY19
        ldr     r2, [r0, #0x14]
        cmp     r2, #0
        beq     LLCY19
        ldr     r7, [r0, #4]
        cmp     r7, #0
        ble     LLCY20
        mov     r5, #0
        mov     r4, #1
        mov     lr, r5
LLCY0:
        cmp     r5, #0
        mov     r9, lr
        ldrb    r8, [r2, +r5, lsl #2]
        movgt   r9, r4
        add     r2, r2, r5, lsl #2
        cmp     r8, #0
        mov     r9, r9, lsl #1
        ldrh    r3, [r3, +r9]
        ldrh    r12, [r12, +r9]
        add     r1, r1, r5, lsl #3
        add     r8, r6, r5, lsl #3
        bne     LLCY1
        ldrb    r6, [r2, #1]
        cmp     r6, #0
        bne     LLCY1
        ldrb    r6, [r2, #2]
        cmp     r6, #0
        bne     LLCY1
        ldrb    r6, [r2, #3]
        cmp     r6, #0
        beq     LLCY13
LLCY1:
        mov     r6, #0
        str     r8, [sp, #4]
        str     r5, [sp]
        str     r0, [sp, #0x10]
LLCY2:
        ldrb    r10, [r2, +r6, asr #2]
        cmp     r10, #0
        bne     LLCY3
        add     r0, r7, r7, lsl #2
        add     r0, r7, r0
        add     r6, r6, #3
        add     r1, r0, r1
        b       LLCY12
LLCY3:
        ldrh    lr, [r1, #-2]
        ldrh    r0, [r1]
        subs    r11, lr, r0
        rsbmi   r11, r11, #0
        cmp     r11, r3
        bcs     LLCY12
        ldrh    r4, [r1, #-4]
        subs    r5, r4, lr
        rsbmi   r5, r5, #0
        cmp     r5, r12
        bcs     LLCY12
        ldrh    r5, [r1, #2]
        subs    r8, r5, r0
        rsbmi   r8, r8, #0
        cmp     r8, r12
        bcs     LLCY12
        ldrh    r8, [r1, #-6]
        str     r8, [sp, #8]
        ldrh    r7, [r1, #4]
        subs    r8, r8, lr
        str     r7, [sp, #0x1C]
        rsbmi   r8, r8, #0
        ldr     r7, [sp, #0x1C]
        subs    r9, r7, r0
        rsbmi   r9, r9, #0
        cmp     r10, #4
        beq     LLCY15
        ldr     r10, [sp, #4]
        bic     r7, r6, #3
        cmp     r8, r12
        mov     r7, r7, asr #1
        ldrh    r7, [r10, +r7]
        str     r7, [sp, #0x18]
        addcc   r10, r7, #1
        strcc   r10, [sp, #0x18]
        cmp     r9, r12
        bcs     LLCY4
        ldr     r10, [sp, #0x18]
        add     r10, r10, #1
        str     r10, [sp, #0x18]
LLCY4:
        sub     r10, r0, lr
        add     r10, r4, r10, lsl #2
        sub     r10, r10, r5
        add     r10, r10, #4
        movs    r10, r10, asr #3
        str     r10, [sp, #0x14]
        beq     LLCY8
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        str     r10, [sp, #0x18]
        rsb     r10, r10, #0
        cmp     r11, r10
        ldr     r11, [sp, #0x14]
        str     r10, [sp, #0xC]
        movgt   r10, r11
        ldr     r11, [sp, #0x18]
        cmp     r10, r11
        bgt     LLCY5
        ldr     r11, [sp, #0xC]
        ldr     r10, [sp, #0x14]
        cmp     r10, r11
        ldrle   r10, [sp, #0xC]
        strle   r10, [sp, #0x18]
        ldrgt   r10, [sp, #0x14]
        strgt   r10, [sp, #0x18]
LLCY5:
        ldr     r10, [sp, #0x10]
        ldr     r10, [r10, #0x18]
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        add     r10, lr, r10
        str     r10, [sp, #0xC]
        mov     r10, #1
        mov     r11, r10, lsl r11
        sub     r10, r11, #1
        ldr     r11, [sp, #0xC]
        cmp     r10, r11
        blt     LLCY6
        ldr     r10, [sp, #0xC]
        cmp     r10, #0
        movlt   r10, #0
        ldrge   r10, [sp, #0xC]
LLCY6:
        strh    r10, [r1, #-2]
        ldr     r10, [sp, #0x10]
        ldr     r10, [r10, #0x18]
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        sub     r10, r0, r10
        str     r10, [sp, #0x18]
        mov     r10, #1
        mov     r11, r10, lsl r11
        sub     r10, r11, #1
        ldr     r11, [sp, #0x18]
        cmp     r10, r11
        blt     LLCY7
        ldr     r10, [sp, #0x18]
        cmp     r10, #0
        movlt   r10, #0
        ldrge   r10, [sp, #0x18]
LLCY7:
        strh    r10, [r1]
LLCY8:
        cmp     r8, r12
        bcs     LLCY10
        ldr     r11, [sp, #8]
        add     r8, lr, r0
        mov     r10, r4, lsl #1
        add     r8, r8, #1
        rsb     r10, r10, r8, asr #1
        add     r11, r10, r11
        mov     r8, r7
        rsb     r10, r8, #0
        mov     r11, r11, asr #1
        str     r11, [sp, #0xC]
        cmp     r11, r10
        ldr     r11, [sp, #0xC]
        str     r10, [sp, #8]
        movgt   r10, r11
        cmp     r10, r8
        bgt     LLCY9
        ldr     r8, [sp, #0xC]
        ldr     r10, [sp, #8]
        cmp     r8, r10
        ldrle   r8, [sp, #8]
        ldrgt   r8, [sp, #0xC]
LLCY9:
        add     r8, r4, r8
        strh    r8, [r1, #-4]
LLCY10:
        cmp     r9, r12
        ldrcs   r0, [sp, #0x10]
        ldrcs   r7, [r0, #4]
        bcs     LLCY12
        add     r0, lr, r0
        add     r0, r0, #1
        mov     lr, r5, lsl #1
        rsb     r0, lr, r0, asr #1
        ldr     lr, [sp, #0x1C]
        rsb     r4, r7, #0
        add     lr, r0, lr
        mov     r0, lr, asr #1
        cmp     r0, r4
        mov     lr, r4
        movgt   lr, r0
        cmp     lr, r7
        bgt     LLCY11
        cmp     r0, r4
        movle   r7, r4
        movgt   r7, r0
LLCY11:
        add     r7, r5, r7
        strh    r7, [r1, #2]
        ldr     r0, [sp, #0x10]
        ldr     r7, [r0, #4]
LLCY12:
        add     r6, r6, #1
        cmp     r6, #0x10
        add     r1, r1, r7, lsl #1
        blt     LLCY2
        ldr     r5, [sp]
        ldr     r0, [sp, #0x10]
        mov     lr, #0
        mov     r4, #1
LLCY13:
        add     r5, r5, #1
        cmp     r5, #4
        bge     LLCY14
        ldr     r1, [r0]
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     r6, [r0, #0x10]
        ldr     r2, [r0, #0x14]
        b       LLCY0
LLCY14:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LLCY15:
        mov     r7, r3, lsr #2
        add     r7, r7, #2
        cmp     r11, r7
        movcs   r7, #0
        bcs     LLCY16
        cmp     r8, r12
        movcs   r7, #1
        bcs     LLCY16
        ldrh    r7, [r1, #-8]
        ldr     r11, [sp, #8]
        str     r7, [sp, #0x18]
        add     r7, lr, r0
        add     r8, r7, r4
        add     r10, r11, r11, lsl #1
        add     r10, r10, r8
        add     r7, r5, r11
        str     r7, [sp, #0x14]
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x14]
        add     r7, r8, r11
        add     r8, r10, r8, lsl #1
        str     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r8, [sp, #0xC]
        mov     r7, r7, lsl #1
        add     r7, r7, #4
        add     r8, r8, r10, lsl #1
        ldr     r10, [sp, #0x14]
        add     r8, r8, #4
        mov     r7, r7, asr #3
        mov     r8, r8, asr #3
        add     r10, r10, #4
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x18]
        mov     r10, r10, asr #3
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x18]
        strh    r7, [r1, #-4]
        strh    r8, [r1, #-6]
        strh    r10, [r1, #-2]
        b       LLCY17
LLCY16:
        add     r8, lr, r4, lsl #1
        add     r8, r8, r5
        add     r8, r8, #2
        cmp     r7, #0
        mov     r8, r8, asr #2
        strh    r8, [r1, #-2]
        beq     LLCY18
LLCY17:
        cmp     r9, r12
        bcs     LLCY18
        ldrh    r7, [r1, #6]
        add     r0, lr, r0
        add     r5, r0, r5
        ldr     r0, [sp, #0x1C]
        add     lr, r0, r0, lsl #1
        add     lr, lr, r5
        add     r7, lr, r7, lsl #1
        add     r4, r4, r0
        add     r4, r4, r5, lsl #1
        add     r5, r0, r5
        add     r0, r7, #4
        add     r4, r4, #4
        add     r5, r5, #2
        mov     r0, r0, asr #3
        strh    r0, [r1, #4]
        mov     r4, r4, asr #3
        mov     r5, r5, asr #2
        strh    r4, [r1]
        strh    r5, [r1, #2]
        ldr     r0, [sp, #0x10]
        ldr     r7, [r0, #4]
        b       LLCY12
LLCY18:
        add     r4, r0, r4
        add     r5, r4, r5, lsl #1
        add     r0, r5, #2
        mov     r0, r0, asr #2
        strh    r0, [r1]
        ldr     r0, [sp, #0x10]
        ldr     r7, [r0, #4]
        b       LLCY12
LLCY19:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LLCY20:
        mvn     r0, #0xD
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


