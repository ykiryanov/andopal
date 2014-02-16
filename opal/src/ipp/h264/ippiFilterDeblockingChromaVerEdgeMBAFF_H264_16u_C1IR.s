        .text
        .align  4
        .globl  ippiFilterDeblockingChromaVerEdgeMBAFF_H264_16u_C1IR


ippiFilterDeblockingChromaVerEdgeMBAFF_H264_16u_C1IR:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LLDC8
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LLDC8
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LLDC8
        ldr     r1, [r0, #0x14]
        cmp     r1, #0
        beq     LLDC8
        ldr     r2, [r0, #8]
        cmp     r2, #0
        beq     LLDC8
        ldr     r3, [r0, #0xC]
        cmp     r3, #0
        beq     LLDC8
        ldrh    r2, [r2]
        cmp     r2, #0
        beq     LLDC0
        ldrb    r2, [r1]
        cmp     r2, #0
        bne     LLDC1
        ldrb    r2, [r1, #1]
        cmp     r2, #0
        bne     LLDC1
        ldrb    r2, [r1, #2]
        cmp     r2, #0
        bne     LLDC1
        ldrb    r2, [r1, #3]
        cmp     r2, #0
        bne     LLDC1
LLDC0:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LLDC1:
        mov     r3, #0
LLDC2:
        ldrb    lr, [r1, +r3]
        cmp     lr, #0
        beq     LLDC6
        ldrh    r1, [r12, #-2]
        ldrh    r2, [r12]
        subs    r4, r1, r2
        rsbmi   r4, r4, #0
        ldr     r5, [r0, #8]
        ldrh    r5, [r5]
        cmp     r4, r5
        bcs     LLDC6
        ldrh    r5, [r12, #-4]
        subs    r4, r5, r1
        rsbmi   r4, r4, #0
        ldr     r6, [r0, #0xC]
        ldrh    r6, [r6]
        cmp     r4, r6
        bcs     LLDC6
        ldrh    r4, [r12, #2]
        subs    r7, r4, r2
        rsbmi   r7, r7, #0
        cmp     r7, r6
        bcs     LLDC6
        cmp     lr, #4
        beq     LLDC7
        ldr     lr, [r0, #0x10]
        mov     r7, r3, lsl #1
        sub     r6, r2, r1
        ldrh    lr, [lr, +r7]
        add     r6, r5, r6, lsl #2
        sub     r6, r6, r4
        add     r4, r6, #4
        add     lr, lr, #1
        bic     lr, lr, #1, 16
        movs    r4, r4, asr #3
        beq     LLDC6
        rsb     r6, lr, #0
        cmp     r4, r6
        mov     r5, r6
        movgt   r5, r4
        cmp     r5, lr
        bgt     LLDC3
        cmp     r4, r6
        movle   lr, r6
        movgt   lr, r4
LLDC3:
        ldr     r5, [r0, #0x18]
        mov     r4, #1
        add     r1, r1, lr
        mov     r5, r4, lsl r5
        sub     r5, r5, #1
        cmp     r5, r1
        blt     LLDC4
        cmp     r1, #0
        movlt   r5, #0
        movge   r5, r1
LLDC4:
        strh    r5, [r12, #-2]
        ldr     r1, [r0, #0x18]
        sub     r2, r2, lr
        mov     r1, r4, lsl r1
        sub     r1, r1, #1
        cmp     r1, r2
        blt     LLDC5
        cmp     r2, #0
        movlt   r1, #0
        movge   r1, r2
LLDC5:
        strh    r1, [r12]
LLDC6:
        ldr     r1, [r0, #4]
        add     r3, r3, #1
        cmp     r3, #4
        add     r12, r12, r1, lsl #1
        ldrlt   r1, [r0, #0x14]
        blt     LLDC2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LLDC7:
        add     r1, r1, r5, lsl #1
        add     r1, r1, r4
        add     r5, r2, r5
        add     r4, r5, r4, lsl #1
        add     r1, r1, #2
        add     r2, r4, #2
        mov     r1, r1, asr #2
        mov     r2, r2, asr #2
        strh    r1, [r12, #-2]
        strh    r2, [r12]
        b       LLDC6
LLDC8:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


