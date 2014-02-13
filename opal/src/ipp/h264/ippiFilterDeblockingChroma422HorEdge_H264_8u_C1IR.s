        .text
        .align  4
        .globl  _ippiFilterDeblockingChroma422HorEdge_H264_8u_C1IR


_ippiFilterDeblockingChroma422HorEdge_H264_8u_C1IR:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LLDM10
        ldr     r8, [r0]
        cmp     r8, #0
        beq     LLDM10
        ldr     r3, [r0, #8]
        cmp     r3, #0
        beq     LLDM10
        ldr     lr, [r0, #0xC]
        cmp     lr, #0
        beq     LLDM10
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LLDM10
        ldr     r2, [r0, #0x14]
        cmp     r2, #0
        beq     LLDM10
        mov     r6, #0
        mov     r5, #1
LLDM0:
        ldr     r4, [r0, #4]
        cmp     r6, #1
        mov     r7, r5
        mul     r12, r6, r4
        movlt   r7, r6
        ldrb    r3, [r7, +r3]
        ldrb    lr, [r7, +lr]
        ldrb    r7, [r2, +r6, lsl #2]
        add     r2, r2, r6, lsl #2
        add     r12, r8, r12, lsl #2
        cmp     r7, #0
        add     r1, r1, r6, lsl #2
        bne     LLDM1
        ldrb    r8, [r2, #1]
        cmp     r8, #0
        bne     LLDM1
        ldrb    r8, [r2, #2]
        cmp     r8, #0
        bne     LLDM1
        ldrb    r8, [r2, #3]
        cmp     r8, #0
        beq     LLDM5
LLDM1:
        cmp     r7, #4
        beq     LLDM7
        mov     r4, #0
        str     r6, [sp]
LLDM2:
        ldrb    r5, [r2, +r4, asr #1]
        mov     r10, r4, asr #1
        cmp     r5, #0
        addeq   r4, r4, #1
        addeq   r12, r12, #1
        beq     LLDM4
        ldr     r5, [r0, #4]
        ldrb    r7, [r12]
        sub     r9, r12, r5
        ldrb    r8, [r9]
        subs    r6, r8, r7
        rsbmi   r6, r6, #0
        cmp     r6, r3
        bcs     LLDM4
        sub     r6, r12, r5, lsl #1
        ldrb    r6, [r6]
        subs    r11, r6, r8
        rsbmi   r11, r11, #0
        cmp     r11, lr
        bcs     LLDM4
        ldrb    r5, [r5, +r12]
        subs    r11, r5, r7
        rsbmi   r11, r11, #0
        cmp     r11, lr
        bcs     LLDM4
        ldrb    r10, [r1, +r10]
        sub     r11, r7, r8
        add     r11, r6, r11, lsl #2
        sub     r11, r11, r5
        add     r10, r10, #1
        add     r5, r11, #4
        and     r10, r10, #0xFF
        rsb     r11, r10, #0
        mov     r5, r5, asr #3
        cmp     r5, r11
        mov     r6, r11
        movgt   r6, r5
        cmp     r6, r10
        bgt     LLDM3
        cmp     r5, r11
        movle   r10, r11
        movgt   r10, r5
LLDM3:
        cmp     r10, #0
        beq     LLDM4
        ldr     r6, [pc, #0xF8]
        add     r8, r8, r10
        sub     r7, r7, r10
        add     r8, r6, r8
        ldrb    r5, [r8, #0x100]
        add     r7, r6, r7
        ldrb    r6, [r7, #0x100]
        strb    r5, [r9]
        strb    r6, [r12]
LLDM4:
        add     r4, r4, #1
        cmp     r4, #8
        add     r12, r12, #1
        blt     LLDM2
        ldr     r6, [sp]
        mov     r5, #1
LLDM5:
        add     r6, r6, #1
        cmp     r6, #4
        bge     LLDM6
        ldr     r8, [r0]
        ldr     r3, [r0, #8]
        ldr     lr, [r0, #0xC]
        ldr     r1, [r0, #0x10]
        ldr     r2, [r0, #0x14]
        b       LLDM0
LLDM6:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LLDM7:
        mov     r7, #0
LLDM8:
        sub     r9, r12, r4
        ldrb    r2, [r9]
        ldrb    r8, [r12]
        subs    r1, r2, r8
        rsbmi   r1, r1, #0
        cmp     r1, r3
        bcs     LLDM9
        mov     r1, r4, lsl #1
        rsb     r1, r1, #0
        ldrb    r1, [r12, +r1]
        subs    r10, r1, r2
        rsbmi   r10, r10, #0
        cmp     r10, lr
        bcs     LLDM9
        ldrb    r4, [r4, +r12]
        subs    r10, r4, r8
        rsbmi   r10, r10, #0
        cmp     r10, lr
        bcs     LLDM9
        add     r2, r2, r1, lsl #1
        add     r2, r2, r4
        add     r1, r8, r1
        add     r4, r1, r4, lsl #1
        add     r2, r2, #2
        add     r1, r4, #2
        mov     r2, r2, asr #2
        strb    r2, [r9]
        mov     r1, r1, asr #2
        strb    r1, [r12]
LLDM9:
        add     r7, r7, #1
        cmp     r7, #8
        add     r12, r12, #1
        ldrlt   r4, [r0, #4]
        blt     LLDM8
        b       LLDM5
LLDM10:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   ClampTbl


