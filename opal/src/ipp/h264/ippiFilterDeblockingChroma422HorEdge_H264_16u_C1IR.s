        .text
        .align  4
        .globl  _ippiFilterDeblockingChroma422HorEdge_H264_16u_C1IR


_ippiFilterDeblockingChroma422HorEdge_H264_16u_C1IR:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LLDG12
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LLDG12
        ldr     r1, [r0, #8]
        cmp     r1, #0
        beq     LLDG12
        ldr     lr, [r0, #0xC]
        cmp     lr, #0
        beq     LLDG12
        ldr     r2, [r0, #0x10]
        cmp     r2, #0
        beq     LLDG12
        ldr     r3, [r0, #0x14]
        cmp     r3, #0
        beq     LLDG12
        ldr     r4, [r0, #4]
        cmp     r4, #0
        ble     LLDG13
        mov     r6, #0
        mov     r5, #1
LLDG0:
        mul     r8, r6, r4
        cmp     r6, #1
        mov     r7, r5
        movlt   r7, r6
        add     r2, r2, r6, lsl #3
        mov     r7, r7, lsl #1
        ldrh    r1, [r1, +r7]
        ldrh    lr, [lr, +r7]
        ldrb    r7, [r3, +r6, lsl #2]
        add     r12, r12, r8, lsl #3
        add     r3, r3, r6, lsl #2
        cmp     r7, #0
        bne     LLDG1
        ldrb    r8, [r3, #1]
        cmp     r8, #0
        bne     LLDG1
        ldrb    r8, [r3, #2]
        cmp     r8, #0
        bne     LLDG1
        ldrb    r8, [r3, #3]
        cmp     r8, #0
        beq     LLDG7
LLDG1:
        cmp     r7, #4
        beq     LLDG9
        mov     r4, #0
        str     r6, [sp]
LLDG2:
        ldrb    r5, [r3, +r4, asr #1]
        cmp     r5, #0
        addeq   r4, r4, #1
        addeq   r12, r12, #2
        beq     LLDG6
        ldr     r5, [r0, #4]
        ldrh    r6, [r12]
        sub     r7, r12, r5, lsl #1
        ldrh    r11, [r7]
        subs    r8, r11, r6
        rsbmi   r8, r8, #0
        cmp     r8, r1
        bcs     LLDG6
        sub     r8, r12, r5, lsl #2
        ldrh    r9, [r8]
        mov     r5, r5, lsl #1
        subs    r8, r9, r11
        rsbmi   r8, r8, #0
        cmp     r8, lr
        bcs     LLDG6
        ldrh    r8, [r12, +r5]
        subs    r5, r8, r6
        rsbmi   r5, r5, #0
        cmp     r5, lr
        bcs     LLDG6
        bic     r5, r4, #1
        ldrh    r5, [r5, +r2]
        sub     r10, r6, r11
        add     r10, r9, r10, lsl #2
        sub     r10, r10, r8
        add     r5, r5, #1
        add     r8, r10, #4
        bic     r5, r5, #1, 16
        rsb     r9, r5, #0
        mov     r8, r8, asr #3
        cmp     r8, r9
        mov     r10, r9
        movgt   r10, r8
        cmp     r10, r5
        bgt     LLDG3
        cmp     r8, r9
        movle   r5, r9
        movgt   r5, r8
LLDG3:
        cmp     r5, #0
        beq     LLDG6
        ldr     r8, [r0, #0x18]
        mov     r9, #1
        add     r11, r11, r5
        mov     r8, r9, lsl r8
        sub     r8, r8, #1
        cmp     r8, r11
        blt     LLDG4
        cmp     r11, #0
        movlt   r8, #0
        movge   r8, r11
LLDG4:
        strh    r8, [r7]
        sub     r6, r6, r5
        ldr     r5, [r0, #0x18]
        mov     r7, #1
        mov     r5, r7, lsl r5
        sub     r5, r5, #1
        cmp     r5, r6
        blt     LLDG5
        cmp     r6, #0
        movlt   r5, #0
        movge   r5, r6
LLDG5:
        strh    r5, [r12]
LLDG6:
        add     r4, r4, #1
        cmp     r4, #8
        add     r12, r12, #2
        blt     LLDG2
        ldr     r6, [sp]
        mov     r5, #1
LLDG7:
        add     r6, r6, #1
        cmp     r6, #4
        bge     LLDG8
        ldr     r12, [r0]
        ldr     r1, [r0, #8]
        ldr     lr, [r0, #0xC]
        ldr     r2, [r0, #0x10]
        ldr     r3, [r0, #0x14]
        ldr     r4, [r0, #4]
        b       LLDG0
LLDG8:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LLDG9:
        mov     r8, #0
LLDG10:
        mov     r3, r4, lsl #1
        rsb     r2, r3, #0
        ldrh    r2, [r12, +r2]
        ldrh    r9, [r12]
        rsb     r7, r3, r12
        subs    r3, r2, r9
        rsbmi   r3, r3, #0
        cmp     r3, r1
        bcs     LLDG11
        sub     r3, r12, r4, lsl #2
        ldrh    r3, [r3]
        mov     r4, r4, lsl #1
        subs    r10, r3, r2
        rsbmi   r10, r10, #0
        cmp     r10, lr
        bcs     LLDG11
        ldrh    r4, [r12, +r4]
        subs    r10, r4, r9
        rsbmi   r10, r10, #0
        cmp     r10, lr
        bcs     LLDG11
        add     r2, r2, r3, lsl #1
        add     r2, r2, r4
        add     r3, r9, r3
        add     r4, r3, r4, lsl #1
        add     r3, r2, #2
        add     r2, r4, #2
        mov     r3, r3, asr #2
        strh    r3, [r7]
        mov     r2, r2, asr #2
        strh    r2, [r12]
LLDG11:
        add     r8, r8, #1
        cmp     r8, #8
        add     r12, r12, #2
        ldrlt   r4, [r0, #4]
        blt     LLDG10
        b       LLDG7
LLDG12:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LLDG13:
        mvn     r0, #0xD
        ldmia   sp!, {r1, r4 - r11, pc}


