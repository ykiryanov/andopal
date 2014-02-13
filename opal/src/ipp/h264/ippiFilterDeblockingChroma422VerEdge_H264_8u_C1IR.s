        .text
        .align  4
        .globl  _ippiFilterDeblockingChroma422VerEdge_H264_8u_C1IR


_ippiFilterDeblockingChroma422VerEdge_H264_8u_C1IR:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LLDK9
        ldr     r2, [r0]
        cmp     r2, #0
        beq     LLDK9
        ldr     lr, [r0, #8]
        cmp     lr, #0
        beq     LLDK9
        ldr     r12, [r0, #0xC]
        cmp     r12, #0
        beq     LLDK9
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        beq     LLDK9
        ldr     r3, [r0, #0x14]
        cmp     r3, #0
        beq     LLDK9
        mov     r5, #0
LLDK0:
        ldrb    r4, [r3, +r5, lsl #3]
        ldrb    lr, [lr, +r5]
        ldrb    r12, [r12, +r5]
        cmp     r4, #0
        add     r3, r3, r5, lsl #3
        add     r2, r2, r5, lsl #2
        add     r1, r1, r5, lsl #2
        bne     LLDK1
        ldrb    r4, [r3, #1]
        cmp     r4, #0
        bne     LLDK1
        ldrb    r4, [r3, #2]
        cmp     r4, #0
        bne     LLDK1
        ldrb    r4, [r3, #3]
        cmp     r4, #0
        beq     LLDK6
LLDK1:
        mov     r4, #0
        str     r5, [sp]
LLDK2:
        ldrb    r9, [r3, +r4, asr #2]
        mov     r10, r4, asr #2
        cmp     r9, #0
        bne     LLDK3
        ldr     r6, [r0, #4]
        add     r4, r4, #3
        add     r5, r6, r6, lsl #1
        add     r2, r5, r2
        b       LLDK5
LLDK3:
        ldrb    r6, [r2, #-1]
        ldrb    r5, [r2]
        subs    r7, r6, r5
        rsbmi   r7, r7, #0
        cmp     r7, lr
        ldrcs   r6, [r0, #4]
        bcs     LLDK5
        ldrb    r8, [r2, #-2]
        subs    r7, r8, r6
        rsbmi   r7, r7, #0
        cmp     r7, r12
        ldrcs   r6, [r0, #4]
        bcs     LLDK5
        ldrb    r7, [r2, #1]
        subs    r11, r7, r5
        rsbmi   r11, r11, #0
        cmp     r11, r12
        ldrcs   r6, [r0, #4]
        bcs     LLDK5
        cmp     r9, #4
        beq     LLDK8
        ldrb    r10, [r1, +r10]
        sub     r9, r5, r6
        add     r9, r8, r9, lsl #2
        sub     r9, r9, r7
        add     r8, r9, #4
        add     r10, r10, #1
        movs    r8, r8, asr #3
        and     r7, r10, #0xFF
        ldreq   r6, [r0, #4]
        beq     LLDK5
        rsb     r10, r7, #0
        cmp     r8, r10
        mov     r9, r10
        movgt   r9, r8
        cmp     r9, r7
        bgt     LLDK4
        cmp     r8, r10
        movle   r7, r10
        movgt   r7, r8
LLDK4:
        ldr     r8, [pc, #0x98]
        add     r6, r6, r7
        sub     r5, r5, r7
        add     r6, r8, r6
        add     r5, r8, r5
        ldrb    r6, [r6, #0x100]
        ldrb    r5, [r5, #0x100]
        strb    r6, [r2, #-1]
        strb    r5, [r2]
        ldr     r6, [r0, #4]
LLDK5:
        add     r4, r4, #1
        cmp     r4, #0x10
        add     r2, r2, r6
        blt     LLDK2
        ldr     r5, [sp]
LLDK6:
        add     r5, r5, #1
        cmp     r5, #2
        bge     LLDK7
        ldr     r2, [r0]
        ldr     lr, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     r1, [r0, #0x10]
        ldr     r3, [r0, #0x14]
        b       LLDK0
LLDK7:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LLDK8:
        add     r6, r6, r8, lsl #1
        add     r6, r6, r7
        add     r8, r5, r8
        add     r7, r8, r7, lsl #1
        add     r6, r6, #2
        add     r5, r7, #2
        mov     r6, r6, asr #2
        strb    r6, [r2, #-1]
        mov     r5, r5, asr #2
        strb    r5, [r2]
        ldr     r6, [r0, #4]
        b       LLDK5
LLDK9:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   ClampTbl


