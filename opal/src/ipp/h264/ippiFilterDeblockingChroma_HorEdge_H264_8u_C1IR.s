        .text
        .align  4
        .globl  _ippiFilterDeblockingChroma_HorEdge_H264_8u_C1IR


_ippiFilterDeblockingChroma_HorEdge_H264_8u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        cmp     r0, #0
        beq     LLDJ13
        cmp     r2, #0
        beq     LLDJ13
        cmp     r3, #0
        beq     LLDJ13
        cmp     lr, #0
        beq     LLDJ13
        cmp     r12, #0
        beq     LLDJ13
        ldrb    r7, [r12]
        ldrb    r6, [r2]
        ldrb    r5, [r3]
        cmp     r7, #0
        mov     r4, r0
        bne     LLDJ0
        ldrb    r8, [r12, #1]
        cmp     r8, #0
        bne     LLDJ0
        ldrb    r8, [r12, #2]
        cmp     r8, #0
        bne     LLDJ0
        ldrb    r8, [r12, #3]
        cmp     r8, #0
        beq     LLDJ4
LLDJ0:
        cmp     r7, #4
        beq     LLDJ10
        mov     r7, #0
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LLDJ1:
        ldrb    r0, [r12, +r7, asr #1]
        cmp     r0, #0
        mov     r0, r7, asr #1
        addeq   r7, r7, #1
        addeq   r4, r4, #1
        beq     LLDJ3
        sub     r3, r4, r1
        ldrb    r8, [r3]
        ldrb    r9, [r4]
        subs    r2, r8, r9
        rsbmi   r2, r2, #0
        cmp     r2, r6
        bcs     LLDJ3
        sub     r2, r4, r1, lsl #1
        ldrb    r2, [r2]
        subs    r10, r2, r8
        rsbmi   r10, r10, #0
        cmp     r10, r5
        bcs     LLDJ3
        ldrb    r10, [r4, +r1]
        subs    r11, r10, r9
        rsbmi   r11, r11, #0
        cmp     r11, r5
        bcs     LLDJ3
        ldrb    r0, [lr, +r0]
        sub     r11, r9, r8
        add     r11, r2, r11, lsl #2
        sub     r11, r11, r10
        add     r0, r0, #1
        add     r10, r11, #4
        and     r0, r0, #0xFF
        rsb     r2, r0, #0
        mov     r10, r10, asr #3
        cmp     r10, r2
        mov     r11, r2
        movgt   r11, r10
        cmp     r11, r0
        bgt     LLDJ2
        cmp     r10, r2
        movle   r0, r2
        movgt   r0, r10
LLDJ2:
        cmp     r0, #0
        beq     LLDJ3
        ldr     r2, [pc, #0x218]
        add     r8, r8, r0
        sub     r9, r9, r0
        add     r8, r2, r8
        ldrb    r0, [r8, #0x100]
        add     r9, r2, r9
        ldrb    r2, [r9, #0x100]
        strb    r0, [r3]
        strb    r2, [r4]
LLDJ3:
        add     r7, r7, #1
        cmp     r7, #8
        add     r4, r4, #1
        blt     LLDJ1
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LLDJ4:
        ldrb    r4, [r2, #1]
        ldrb    r5, [r12, #8]
        ldrb    r2, [r3, #1]
        add     r0, r0, r1, lsl #2
        add     r3, r12, #8
        cmp     r5, #0
        bne     LLDJ5
        ldrb    r5, [r12, #9]
        cmp     r5, #0
        bne     LLDJ5
        ldrb    r5, [r12, #0xA]
        cmp     r5, #0
        bne     LLDJ5
        ldrb    r12, [r12, #0xB]
        cmp     r12, #0
        beq     LLDJ9
LLDJ5:
        mov     r6, #0
LLDJ6:
        ldrb    r5, [r3, +r6, asr #1]
        add     r12, lr, r6, asr #1
        cmp     r5, #0
        addeq   r6, r6, #1
        addeq   r0, r0, #1
        beq     LLDJ8
        sub     r7, r0, r1
        ldrb    r8, [r7]
        ldrb    r9, [r0]
        subs    r5, r8, r9
        rsbmi   r5, r5, #0
        cmp     r5, r4
        bcs     LLDJ8
        sub     r5, r0, r1, lsl #1
        ldrb    r5, [r5]
        subs    r10, r5, r8
        rsbmi   r10, r10, #0
        cmp     r10, r2
        bcs     LLDJ8
        ldrb    r10, [r0, +r1]
        subs    r11, r10, r9
        rsbmi   r11, r11, #0
        cmp     r11, r2
        bcs     LLDJ8
        ldrb    r12, [r12, #4]
        sub     r11, r9, r8
        add     r11, r5, r11, lsl #2
        sub     r11, r11, r10
        add     r12, r12, #1
        add     r5, r11, #4
        and     r12, r12, #0xFF
        rsb     r10, r12, #0
        mov     r5, r5, asr #3
        cmp     r5, r10
        mov     r11, r10
        movgt   r11, r5
        cmp     r11, r12
        bgt     LLDJ7
        cmp     r5, r10
        movle   r12, r10
        movgt   r12, r5
LLDJ7:
        cmp     r12, #0
        beq     LLDJ8
        ldr     r5, [pc, #0xE8]
        add     r8, r8, r12
        sub     r9, r9, r12
        add     r8, r5, r8
        ldrb    r8, [r8, #0x100]
        add     r9, r5, r9
        ldrb    r9, [r9, #0x100]
        strb    r8, [r7]
        strb    r9, [r0]
LLDJ8:
        add     r6, r6, #1
        cmp     r6, #8
        add     r0, r0, #1
        blt     LLDJ6
LLDJ9:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLDJ10:
        add     r7, r4, r1
        mov     r8, #8
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LLDJ11:
        sub     r10, r4, r1
        ldrb    r2, [r10]
        ldrb    r9, [r4]
        subs    r0, r2, r9
        rsbmi   r0, r0, #0
        cmp     r0, r6
        bcs     LLDJ12
        sub     r0, r4, r1, lsl #1
        ldrb    r0, [r0]
        subs    r3, r0, r2
        rsbmi   r3, r3, #0
        cmp     r3, r5
        bcs     LLDJ12
        ldrb    r3, [r7]
        subs    r11, r3, r9
        rsbmi   r11, r11, #0
        cmp     r11, r5
        bcs     LLDJ12
        add     r2, r2, r0, lsl #1
        add     r2, r2, r3
        add     r0, r9, r0
        add     r3, r0, r3, lsl #1
        add     r2, r2, #2
        add     r3, r3, #2
        mov     r2, r2, asr #2
        strb    r2, [r10]
        mov     r3, r3, asr #2
        strb    r3, [r4]
LLDJ12:
        subs    r8, r8, #1
        add     r7, r7, #1
        add     r4, r4, #1
        bne     LLDJ11
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        b       LLDJ4
LLDJ13:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   ClampTbl


