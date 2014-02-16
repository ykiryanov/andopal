        .text
        .align  4
        .globl  ippiFilterDeblockingChroma422VerEdge_H264_16u_C1IR


ippiFilterDeblockingChroma422VerEdge_H264_16u_C1IR:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LLDE11
        ldr     r2, [r0]
        cmp     r2, #0
        beq     LLDE11
        ldr     r12, [r0, #8]
        cmp     r12, #0
        beq     LLDE11
        ldr     lr, [r0, #0xC]
        cmp     lr, #0
        beq     LLDE11
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LLDE11
        ldr     r3, [r0, #0x14]
        cmp     r3, #0
        beq     LLDE11
        ldr     r4, [r0, #4]
        cmp     r4, #0
        ble     LLDE12
        mov     r6, #0
LLDE0:
        ldrb    r5, [r3, +r6, lsl #3]
        mov     r7, r6, lsl #1
        ldrh    r12, [r12, +r7]
        ldrh    lr, [lr, +r7]
        cmp     r5, #0
        add     r3, r3, r6, lsl #3
        add     r2, r2, r6, lsl #3
        add     r1, r1, r6, lsl #3
        bne     LLDE1
        ldrb    r5, [r3, #1]
        cmp     r5, #0
        bne     LLDE1
        ldrb    r5, [r3, #2]
        cmp     r5, #0
        bne     LLDE1
        ldrb    r5, [r3, #3]
        cmp     r5, #0
        beq     LLDE8
LLDE1:
        mov     r5, #0
        str     r6, [sp]
LLDE2:
        ldrb    r10, [r3, +r5, asr #2]
        cmp     r10, #0
        bne     LLDE3
        add     r6, r4, r4, lsl #2
        add     r6, r4, r6
        add     r2, r6, r2
        add     r5, r5, #3
        b       LLDE7
LLDE3:
        ldrh    r6, [r2, #-2]
        ldrh    r7, [r2]
        subs    r8, r6, r7
        rsbmi   r8, r8, #0
        cmp     r8, r12
        bcs     LLDE7
        ldrh    r8, [r2, #-4]
        subs    r9, r8, r6
        rsbmi   r9, r9, #0
        cmp     r9, lr
        bcs     LLDE7
        ldrh    r9, [r2, #2]
        subs    r11, r9, r7
        rsbmi   r11, r11, #0
        cmp     r11, lr
        bcs     LLDE7
        cmp     r10, #4
        beq     LLDE10
        bic     r10, r5, #3
        sub     r11, r7, r6
        mov     r10, r10, asr #1
        ldrh    r10, [r1, +r10]
        add     r11, r8, r11, lsl #2
        sub     r11, r11, r9
        add     r9, r11, #4
        add     r10, r10, #1
        movs    r9, r9, asr #3
        bic     r8, r10, #1, 16
        beq     LLDE7
        rsb     r10, r8, #0
        cmp     r9, r10
        mov     r4, r10
        movgt   r4, r9
        cmp     r4, r8
        bgt     LLDE4
        cmp     r9, r10
        movle   r8, r10
        movgt   r8, r9
LLDE4:
        ldr     r4, [r0, #0x18]
        mov     r9, #1
        add     r6, r6, r8
        mov     r4, r9, lsl r4
        sub     r4, r4, #1
        cmp     r4, r6
        blt     LLDE5
        cmp     r6, #0
        movlt   r4, #0
        movge   r4, r6
LLDE5:
        strh    r4, [r2, #-2]
        ldr     r6, [r0, #0x18]
        mov     r4, #1
        sub     r7, r7, r8
        mov     r6, r4, lsl r6
        sub     r4, r6, #1
        cmp     r4, r7
        blt     LLDE6
        cmp     r7, #0
        movlt   r4, #0
        movge   r4, r7
LLDE6:
        strh    r4, [r2]
        ldr     r4, [r0, #4]
LLDE7:
        add     r5, r5, #1
        cmp     r5, #0x10
        add     r2, r2, r4, lsl #1
        blt     LLDE2
        ldr     r6, [sp]
LLDE8:
        add     r6, r6, #1
        cmp     r6, #2
        bge     LLDE9
        ldr     r2, [r0]
        ldr     r12, [r0, #8]
        ldr     lr, [r0, #0xC]
        ldr     r1, [r0, #0x10]
        ldr     r3, [r0, #0x14]
        b       LLDE0
LLDE9:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LLDE10:
        add     r6, r6, r8, lsl #1
        add     r6, r6, r9
        add     r8, r7, r8
        add     r9, r8, r9, lsl #1
        add     r4, r9, #2
        add     r6, r6, #2
        mov     r4, r4, asr #2
        strh    r4, [r2]
        mov     r6, r6, asr #2
        strh    r6, [r2, #-2]
        ldr     r4, [r0, #4]
        b       LLDE7
LLDE11:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LLDE12:
        mvn     r0, #0xD
        ldmia   sp!, {r1, r4 - r11, pc}


