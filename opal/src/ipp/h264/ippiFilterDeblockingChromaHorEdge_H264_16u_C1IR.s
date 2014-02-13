        .text
        .align  4
        .globl  _ippiFilterDeblockingChromaHorEdge_H264_16u_C1IR


_ippiFilterDeblockingChromaHorEdge_H264_16u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LLDD17
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LLDD17
        ldr     r6, [r0, #8]
        cmp     r6, #0
        beq     LLDD17
        ldr     r4, [r0, #0xC]
        cmp     r4, #0
        beq     LLDD17
        ldr     r5, [r0, #0x10]
        cmp     r5, #0
        beq     LLDD17
        ldr     r3, [r0, #0x14]
        cmp     r3, #0
        beq     LLDD17
        ldr     lr, [r0, #4]
        cmp     lr, #0
        ble     LLDD18
        ldrb    r7, [r3]
        ldrh    r2, [r6]
        ldrh    r1, [r4]
        cmp     r7, #0
        bne     LLDD0
        ldrb    r8, [r3, #1]
        cmp     r8, #0
        bne     LLDD0
        ldrb    r8, [r3, #2]
        cmp     r8, #0
        bne     LLDD0
        ldrb    r8, [r3, #3]
        cmp     r8, #0
        beq     LLDD6
LLDD0:
        cmp     r7, #4
        beq     LLDD14
        mov     r4, #0
        str     r5, [sp]
LLDD1:
        ldrb    r5, [r3, +r4, asr #1]
        cmp     r5, #0
        addeq   r4, r4, #1
        addeq   r12, r12, #2
        beq     LLDD5
        mov     r5, lr, lsl #1
        rsb     r6, r5, #0
        ldrh    r6, [r12, +r6]
        ldrh    r8, [r12]
        rsb     r7, r5, r12
        subs    r5, r6, r8
        rsbmi   r5, r5, #0
        cmp     r5, r2
        bcs     LLDD5
        sub     r5, r12, lr, lsl #2
        ldrh    r9, [r5]
        mov     r5, lr, lsl #1
        subs    r10, r9, r6
        rsbmi   r10, r10, #0
        cmp     r10, r1
        bcs     LLDD5
        ldrh    r10, [r12, +r5]
        subs    r5, r10, r8
        rsbmi   r5, r5, #0
        cmp     r5, r1
        bcs     LLDD5
        ldr     r5, [sp]
        bic     r11, r4, #1
        ldrh    r5, [r11, +r5]
        sub     r11, r8, r6
        str     r11, [sp, #4]
        ldr     r11, [sp, #4]
        add     r5, r5, #1
        bic     r5, r5, #1, 16
        add     r11, r9, r11, lsl #2
        sub     r11, r11, r10
        add     r9, r11, #4
        rsb     r10, r5, #0
        mov     r9, r9, asr #3
        cmp     r9, r10
        str     r10, [sp, #4]
        movgt   r10, r9
        cmp     r10, r5
        bgt     LLDD2
        ldr     r5, [sp, #4]
        cmp     r9, r5
        ldrle   r5, [sp, #4]
        movgt   r5, r9
LLDD2:
        cmp     r5, #0
        beq     LLDD5
        ldr     lr, [r0, #0x18]
        mov     r9, #1
        add     r6, r6, r5
        mov     lr, r9, lsl lr
        sub     lr, lr, #1
        cmp     lr, r6
        blt     LLDD3
        cmp     r6, #0
        movlt   lr, #0
        movge   lr, r6
LLDD3:
        strh    lr, [r7]
        ldr     lr, [r0, #0x18]
        sub     r8, r8, r5
        mov     r5, #1
        mov     lr, r5, lsl lr
        sub     lr, lr, #1
        cmp     lr, r8
        blt     LLDD4
        cmp     r8, #0
        movlt   lr, #0
        movge   lr, r8
LLDD4:
        strh    lr, [r12]
        ldr     lr, [r0, #4]
LLDD5:
        add     r4, r4, #1
        cmp     r4, #8
        add     r12, r12, #2
        blt     LLDD1
        ldr     r12, [r0]
        ldr     r6, [r0, #8]
        ldr     r4, [r0, #0xC]
        ldr     r5, [r0, #0x10]
        ldr     r3, [r0, #0x14]
LLDD6:
        ldrb    r7, [r3, #8]
        ldrh    r1, [r4, #2]
        ldrh    r2, [r6, #2]
        add     lr, r12, lr, lsl #3
        cmp     r7, #0
        add     r12, r5, #8
        add     r4, r3, #8
        bne     LLDD7
        ldrb    r3, [r3, #9]
        cmp     r3, #0
        bne     LLDD7
        ldrb    r3, [r4, #2]
        cmp     r3, #0
        bne     LLDD7
        ldrb    r3, [r4, #3]
        cmp     r3, #0
        beq     LLDD13
LLDD7:
        mov     r3, #0
LLDD8:
        ldrb    r5, [r4, +r3, asr #1]
        cmp     r5, #0
        addeq   r3, r3, #1
        addeq   lr, lr, #2
        beq     LLDD12
        ldr     r8, [r0, #4]
        ldrh    r5, [lr]
        sub     r6, lr, r8, lsl #1
        ldrh    r7, [r6]
        subs    r9, r7, r5
        rsbmi   r9, r9, #0
        cmp     r9, r2
        bcs     LLDD12
        sub     r9, lr, r8, lsl #2
        ldrh    r9, [r9]
        mov     r8, r8, lsl #1
        subs    r10, r9, r7
        rsbmi   r10, r10, #0
        cmp     r10, r1
        bcs     LLDD12
        ldrh    r8, [lr, +r8]
        subs    r10, r8, r5
        rsbmi   r10, r10, #0
        cmp     r10, r1
        bcs     LLDD12
        bic     r10, r3, #1
        ldrh    r10, [r10, +r12]
        sub     r11, r5, r7
        add     r11, r9, r11, lsl #2
        sub     r9, r11, r8
        add     r10, r10, #1
        bic     r8, r10, #1, 16
        add     r9, r9, #4
        rsb     r10, r8, #0
        mov     r9, r9, asr #3
        cmp     r9, r10
        mov     r11, r10
        movgt   r11, r9
        cmp     r11, r8
        bgt     LLDD9
        cmp     r9, r10
        movle   r8, r10
        movgt   r8, r9
LLDD9:
        cmp     r8, #0
        beq     LLDD12
        ldr     r9, [r0, #0x18]
        mov     r10, #1
        add     r7, r7, r8
        mov     r9, r10, lsl r9
        sub     r9, r9, #1
        cmp     r9, r7
        blt     LLDD10
        cmp     r7, #0
        movlt   r9, #0
        movge   r9, r7
LLDD10:
        strh    r9, [r6]
        ldr     r6, [r0, #0x18]
        mov     r7, #1
        sub     r5, r5, r8
        mov     r6, r7, lsl r6
        sub     r6, r6, #1
        cmp     r6, r5
        blt     LLDD11
        cmp     r5, #0
        movlt   r6, #0
        movge   r6, r5
LLDD11:
        strh    r6, [lr]
LLDD12:
        add     r3, r3, #1
        cmp     r3, #8
        add     lr, lr, #2
        blt     LLDD8
LLDD13:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLDD14:
        mov     r7, #8
LLDD15:
        mov     r4, lr, lsl #1
        rsb     r3, r4, #0
        ldrh    r3, [r12, +r3]
        ldrh    r8, [r12]
        rsb     r6, r4, r12
        subs    r4, r3, r8
        rsbmi   r4, r4, #0
        cmp     r4, r2
        bcs     LLDD16
        sub     r4, r12, lr, lsl #2
        ldrh    r5, [r4]
        mov     r4, lr, lsl #1
        subs    r9, r5, r3
        rsbmi   r9, r9, #0
        cmp     r9, r1
        bcs     LLDD16
        ldrh    r4, [r12, +r4]
        subs    r9, r4, r8
        rsbmi   r9, r9, #0
        cmp     r9, r1
        bcs     LLDD16
        add     r3, r3, r5, lsl #1
        add     r3, r3, r4
        add     r3, r3, #2
        add     r5, r8, r5
        mov     r3, r3, asr #2
        strh    r3, [r6]
        add     r4, r5, r4, lsl #1
        add     r4, r4, #2
        mov     r3, r4, asr #2
        strh    r3, [r12]
        ldr     lr, [r0, #4]
LLDD16:
        subs    r7, r7, #1
        add     r12, r12, #2
        bne     LLDD15
        ldr     r12, [r0]
        ldr     r6, [r0, #8]
        ldr     r4, [r0, #0xC]
        ldr     r5, [r0, #0x10]
        ldr     r3, [r0, #0x14]
        b       LLDD6
LLDD17:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLDD18:
        mvn     r0, #0xD
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


