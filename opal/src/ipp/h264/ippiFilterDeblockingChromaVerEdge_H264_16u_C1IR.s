        .text
        .align  4
        .globl  _ippiFilterDeblockingChromaVerEdge_H264_16u_C1IR


_ippiFilterDeblockingChromaVerEdge_H264_16u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LLDB11
        ldr     r7, [r0]
        cmp     r7, #0
        beq     LLDB11
        ldr     r3, [r0, #8]
        cmp     r3, #0
        beq     LLDB11
        ldr     r12, [r0, #0xC]
        cmp     r12, #0
        beq     LLDB11
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LLDB11
        ldr     r2, [r0, #0x14]
        cmp     r2, #0
        beq     LLDB11
        ldr     lr, [r0, #4]
        cmp     lr, #0
        ble     LLDB12
        mov     r6, #0
LLDB0:
        ldrb    r4, [r2, +r6, lsl #3]
        mov     r5, r6, lsl #1
        ldrh    r3, [r3, +r5]
        ldrh    r12, [r12, +r5]
        cmp     r4, #0
        add     r2, r2, r6, lsl #3
        add     r5, r7, r6, lsl #3
        add     r1, r1, r6, lsl #3
        bne     LLDB1
        ldrb    r4, [r2, #1]
        cmp     r4, #0
        bne     LLDB1
        ldrb    r4, [r2, #2]
        cmp     r4, #0
        bne     LLDB1
        ldrb    r4, [r2, #3]
        cmp     r4, #0
        beq     LLDB8
LLDB1:
        mov     r4, #0
        str     r6, [sp]
        str     r7, [sp, #4]
LLDB2:
        ldrb    r10, [r2, +r4, asr #1]
        cmp     r10, #0
        bne     LLDB3
        mov     r6, lr, lsl #1
        add     r4, r4, #1
        add     r5, r5, r6
        b       LLDB7
LLDB3:
        ldrh    r7, [r5, #-2]
        ldrh    r6, [r5]
        subs    r8, r7, r6
        rsbmi   r8, r8, #0
        cmp     r8, r3
        movcs   r6, lr, lsl #1
        bcs     LLDB7
        ldrh    r8, [r5, #-4]
        subs    r9, r8, r7
        rsbmi   r9, r9, #0
        cmp     r9, r12
        movcs   r6, lr, lsl #1
        bcs     LLDB7
        ldrh    r9, [r5, #2]
        subs    r11, r9, r6
        rsbmi   r11, r11, #0
        cmp     r11, r12
        movcs   r6, lr, lsl #1
        bcs     LLDB7
        cmp     r10, #4
        beq     LLDB10
        bic     r10, r4, #1
        ldrh    r10, [r10, +r1]
        sub     r11, r6, r7
        add     r11, r8, r11, lsl #2
        sub     r11, r11, r9
        add     r9, r11, #4
        add     r10, r10, #1
        movs    r9, r9, asr #3
        bic     r8, r10, #1, 16
        moveq   r6, lr, lsl #1
        beq     LLDB7
        rsb     lr, r8, #0
        cmp     r9, lr
        mov     r10, lr
        movgt   r10, r9
        cmp     r10, r8
        bgt     LLDB4
        cmp     r9, lr
        movle   r8, lr
        movgt   r8, r9
LLDB4:
        ldr     lr, [r0, #0x18]
        mov     r9, #1
        add     r7, r7, r8
        mov     lr, r9, lsl lr
        sub     lr, lr, #1
        cmp     lr, r7
        blt     LLDB5
        cmp     r7, #0
        movlt   lr, #0
        movge   lr, r7
LLDB5:
        strh    lr, [r5, #-2]
        ldr     lr, [r0, #0x18]
        mov     r7, #1
        sub     r6, r6, r8
        mov     lr, r7, lsl lr
        sub     lr, lr, #1
        cmp     lr, r6
        blt     LLDB6
        cmp     r6, #0
        movlt   lr, #0
        movge   lr, r6
LLDB6:
        strh    lr, [r5]
        ldr     lr, [r0, #4]
        mov     r6, lr, lsl #1
LLDB7:
        add     r4, r4, #1
        cmp     r4, #8
        add     r5, r5, r6
        blt     LLDB2
        ldr     r6, [sp]
        ldr     r7, [sp, #4]
LLDB8:
        add     r6, r6, #1
        cmp     r6, #2
        bge     LLDB9
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     r1, [r0, #0x10]
        ldr     r2, [r0, #0x14]
        b       LLDB0
LLDB9:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLDB10:
        add     r7, r7, r8, lsl #1
        add     r7, r7, r9
        add     r8, r6, r8
        add     r9, r8, r9, lsl #1
        add     lr, r9, #2
        add     r7, r7, #2
        mov     lr, lr, asr #2
        strh    lr, [r5]
        mov     r7, r7, asr #2
        strh    r7, [r5, #-2]
        ldr     lr, [r0, #4]
        mov     r6, lr, lsl #1
        b       LLDB7
LLDB11:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLDB12:
        mvn     r0, #0xD
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


