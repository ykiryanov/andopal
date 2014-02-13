        .text
        .align  4
        .globl  _ippiFilterDeblockingLumaVerEdgeMBAFF_H264_16u_C1IR


_ippiFilterDeblockingLumaVerEdgeMBAFF_H264_16u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LLCZ17
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LLCZ17
        ldr     r3, [r0, #8]
        cmp     r3, #0
        beq     LLCZ17
        ldr     r1, [r0, #0xC]
        cmp     r1, #0
        beq     LLCZ17
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LLCZ17
        ldr     r2, [r0, #0x14]
        cmp     r2, #0
        beq     LLCZ17
        ldr     r1, [r0, #4]
        cmp     r1, #0
        ble     LLCZ16
        ldrh    r3, [r3]
        cmp     r3, #0
        beq     LLCZ0
        ldrb    r3, [r2]
        cmp     r3, #0
        bne     LLCZ1
        ldrb    r3, [r2, #1]
        cmp     r3, #0
        bne     LLCZ1
        ldrb    r3, [r2, #2]
        cmp     r3, #0
        bne     LLCZ1
        ldrb    r3, [r2, #3]
        cmp     r3, #0
        bne     LLCZ1
LLCZ0:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLCZ1:
        mov     r3, #0
LLCZ2:
        ldrb    r9, [r2, +r3, asr #1]
        cmp     r9, #0
        beq     LLCZ11
        ldrh    r8, [r12, #-2]
        ldrh    r7, [r12]
        subs    r11, r8, r7
        rsbmi   r11, r11, #0
        ldr     r2, [r0, #8]
        ldrh    r10, [r2]
        cmp     r11, r10
        bcs     LLCZ11
        ldrh    r6, [r12, #-4]
        subs    lr, r6, r8
        rsbmi   lr, lr, #0
        ldr     r2, [r0, #0xC]
        ldrh    r2, [r2]
        cmp     lr, r2
        bcs     LLCZ11
        ldrh    r5, [r12, #2]
        subs    lr, r5, r7
        rsbmi   lr, lr, #0
        cmp     lr, r2
        bcs     LLCZ11
        ldrh    r1, [r12, #-6]
        str     r1, [sp, #4]
        ldrh    r4, [r12, #4]
        subs    r1, r1, r8
        rsbmi   r1, r1, #0
        subs    lr, r4, r7
        rsbmi   lr, lr, #0
        cmp     r9, #4
        beq     LLCZ12
        ldr     r9, [r0, #0x10]
        bic     r10, r3, #1
        cmp     r1, r2
        ldrh    r10, [r10, +r9]
        mov     r9, r10
        addcc   r9, r10, #1
        biccc   r9, r9, #1, 16
        cmp     lr, r2
        bcs     LLCZ3
        add     r9, r9, #1
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
LLCZ3:
        sub     r11, r7, r8
        add     r11, r6, r11, lsl #2
        sub     r11, r11, r5
        add     r11, r11, #4
        movs    r11, r11, asr #3
        beq     LLCZ7
        rsb     r2, r9, #0
        cmp     r11, r2
        str     r2, [sp]
        movgt   r2, r11
        cmp     r2, r9
        bgt     LLCZ4
        ldr     r2, [sp]
        cmp     r11, r2
        ldrle   r9, [sp]
        movgt   r9, r11
LLCZ4:
        ldr     r2, [r0, #0x18]
        add     r11, r8, r9
        str     r11, [sp]
        mov     r11, #1
        mov     r2, r11, lsl r2
        ldr     r11, [sp]
        sub     r2, r2, #1
        cmp     r2, r11
        blt     LLCZ5
        ldr     r2, [sp]
        cmp     r2, #0
        movlt   r2, #0
        ldrge   r2, [sp]
LLCZ5:
        strh    r2, [r12, #-2]
        ldr     r2, [r0, #0x18]
        mov     r11, #1
        sub     r9, r7, r9
        mov     r2, r11, lsl r2
        sub     r2, r2, #1
        cmp     r2, r9
        blt     LLCZ6
        cmp     r9, #0
        movlt   r2, #0
        movge   r2, r9
LLCZ6:
        strh    r2, [r12]
        ldr     r2, [r0, #0xC]
        ldrh    r2, [r2]
LLCZ7:
        cmp     r1, r2
        bcs     LLCZ9
        add     r1, r8, r7
        add     r1, r1, #1
        mov     r2, r6, lsl #1
        rsb     r1, r2, r1, asr #1
        ldr     r2, [sp, #4]
        add     r2, r1, r2
        mov     r1, r10
        rsb     r9, r1, #0
        mov     r2, r2, asr #1
        cmp     r2, r9
        mov     r11, r9
        movgt   r11, r2
        cmp     r11, r1
        bgt     LLCZ8
        cmp     r2, r9
        movle   r1, r9
        movgt   r1, r2
LLCZ8:
        add     r1, r6, r1
        strh    r1, [r12, #-4]
        ldr     r1, [r0, #0xC]
        ldrh    r2, [r1]
LLCZ9:
        cmp     lr, r2
        ldrcs   r1, [r0, #4]
        bcs     LLCZ11
        add     r7, r8, r7
        add     r1, r7, #1
        mov     r2, r5, lsl #1
        rsb     r1, r2, r1, asr #1
        add     r4, r1, r4
        rsb     r1, r10, #0
        mov     r2, r4, asr #1
        cmp     r2, r1
        mov     lr, r1
        movgt   lr, r2
        cmp     lr, r10
        bgt     LLCZ10
        cmp     r2, r1
        movle   r10, r1
        movgt   r10, r2
LLCZ10:
        add     r10, r5, r10
        strh    r10, [r12, #2]
        ldr     r1, [r0, #4]
LLCZ11:
        add     r3, r3, #1
        cmp     r3, #8
        add     r12, r12, r1, lsl #1
        ldrlt   r2, [r0, #0x14]
        blt     LLCZ2
        b       LLCZ18
LLCZ12:
        mov     r10, r10, asr #2
        add     r9, r10, #2
        cmp     r11, r9
        movcs   r1, #0
        bcs     LLCZ13
        cmp     r1, r2
        movcs   r1, #1
        bcs     LLCZ13
        ldr     r9, [sp, #4]
        ldrh    r2, [r12, #-8]
        add     r1, r8, r7
        add     r10, r9, r9, lsl #1
        add     r1, r1, r6
        add     r10, r10, r1
        add     r2, r10, r2, lsl #1
        add     r10, r5, r9
        add     r2, r2, #4
        add     r9, r1, r9
        add     r10, r10, r1, lsl #1
        mov     r2, r2, asr #3
        strh    r2, [r12, #-6]
        mov     r9, r9, lsl #1
        add     r1, r10, #4
        add     r2, r9, #4
        mov     r1, r1, asr #3
        mov     r2, r2, asr #3
        strh    r1, [r12, #-2]
        strh    r2, [r12, #-4]
        b       LLCZ14
LLCZ13:
        cmp     r1, #0
        add     r1, r8, r6, lsl #1
        add     r1, r1, r5
        add     r1, r1, #2
        mov     r1, r1, asr #2
        strh    r1, [r12, #-2]
        beq     LLCZ15
LLCZ14:
        ldr     r1, [r0, #0xC]
        ldrh    r1, [r1]
        cmp     lr, r1
        bcs     LLCZ15
        ldrh    r1, [r12, #6]
        add     r7, r8, r7
        add     r2, r4, r4, lsl #1
        add     r5, r7, r5
        add     r6, r6, r4
        add     r2, r2, r5
        add     r1, r2, r1, lsl #1
        add     r6, r6, r5, lsl #1
        add     r5, r4, r5
        add     r1, r1, #4
        add     lr, r6, #4
        add     r2, r5, #2
        mov     r1, r1, asr #3
        strh    r1, [r12, #4]
        mov     lr, lr, asr #3
        mov     r2, r2, asr #2
        strh    lr, [r12]
        strh    r2, [r12, #2]
        ldr     r1, [r0, #4]
        b       LLCZ11
LLCZ15:
        add     r6, r7, r6
        add     r5, r6, r5, lsl #1
        add     r1, r5, #2
        mov     r1, r1, asr #2
        strh    r1, [r12]
        ldr     r1, [r0, #4]
        b       LLCZ11
LLCZ16:
        mvn     r0, #0xD
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLCZ17:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLCZ18:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


