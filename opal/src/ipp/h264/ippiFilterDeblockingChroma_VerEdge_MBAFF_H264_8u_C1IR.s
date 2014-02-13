        .text
        .align  4
        .globl  _ippiFilterDeblockingChroma_VerEdge_MBAFF_H264_8u_C1IR


_ippiFilterDeblockingChroma_VerEdge_MBAFF_H264_8u_C1IR:
        stmdb   sp!, {r4 - r10, lr}
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        beq     LLDH13
        cmp     lr, #0
        beq     LLDH13
        cmp     r12, #0
        beq     LLDH13
        cmp     r2, #0
        beq     LLDH8
        ldrb    r4, [r12]
        cmp     r4, #0
        bne     LLDH0
        ldrb    r4, [r12, #1]
        cmp     r4, #0
        bne     LLDH0
        ldrb    r4, [r12, #2]
        cmp     r4, #0
        bne     LLDH0
        ldrb    r4, [r12, #3]
        cmp     r4, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r10, pc}
LLDH0:
        ldrb    r8, [r12]
        cmp     r8, #0
        beq     LLDH2
        ldrb    r6, [r0, #-1]
        ldrb    r7, [r0]
        sub     r4, r6, r7
        eor     r5, r4, r4, asr #31
        sub     r5, r5, r4, asr #31
        cmp     r5, r2
        bcs     LLDH2
        ldrb    r4, [r0, #-2]
        subs    r5, r4, r6
        rsbmi   r5, r5, #0
        cmp     r5, r3
        bcs     LLDH2
        ldrb    r5, [r0, #1]
        subs    r9, r5, r7
        rsbmi   r9, r9, #0
        cmp     r9, r3
        bcs     LLDH2
        cmp     r8, #4
        beq     LLDH9
        ldrb    r8, [lr]
        sub     r9, r7, r6
        add     r9, r4, r9, lsl #2
        sub     r9, r9, r5
        add     r8, r8, #1
        add     r4, r9, #4
        and     r5, r8, #0xFF
        movs    r8, r4, asr #3
        beq     LLDH2
        rsb     r4, r5, #0
        cmp     r8, r4
        mov     r9, r4
        movgt   r9, r8
        cmp     r9, r5
        movgt   r4, r5
        bgt     LLDH1
        cmp     r8, r4
        movgt   r4, r8
LLDH1:
        ldr     r5, [pc, #0x338]
        add     r6, r6, r4
        sub     r7, r7, r4
        add     r6, r5, r6
        add     r7, r5, r7
        ldrb    r6, [r6, #0x100]
        ldrb    r7, [r7, #0x100]
        strb    r6, [r0, #-1]
        strb    r7, [r0]
LLDH2:
        ldrb    r9, [r12, #1]
        add     r4, r0, r1
        cmp     r9, #0
        beq     LLDH4
        ldrb    r6, [r4, #-1]
        ldrb    r5, [r1, +r0]
        sub     r7, r6, r5
        eor     r8, r7, r7, asr #31
        sub     r8, r8, r7, asr #31
        cmp     r8, r2
        bcs     LLDH4
        ldrb    r8, [r4, #-2]
        subs    r7, r8, r6
        rsbmi   r7, r7, #0
        cmp     r7, r3
        bcs     LLDH4
        ldrb    r7, [r4, #1]
        subs    r10, r7, r5
        rsbmi   r10, r10, #0
        cmp     r10, r3
        bcs     LLDH4
        cmp     r9, #4
        beq     LLDH10
        ldrb    r9, [lr, #1]
        sub     r10, r5, r6
        add     r10, r8, r10, lsl #2
        sub     r10, r10, r7
        add     r9, r9, #1
        add     r7, r10, #4
        and     r8, r9, #0xFF
        movs    r9, r7, asr #3
        beq     LLDH4
        rsb     r7, r8, #0
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        cmp     r10, r8
        movgt   r7, r8
        bgt     LLDH3
        cmp     r9, r7
        movgt   r7, r9
LLDH3:
        ldr     r8, [pc, #0x270]
        add     r6, r6, r7
        sub     r5, r5, r7
        add     r6, r8, r6
        add     r5, r8, r5
        ldrb    r6, [r6, #0x100]
        ldrb    r5, [r5, #0x100]
        strb    r5, [r1, +r0]
        strb    r6, [r4, #-1]
LLDH4:
        ldrb    r9, [r12, #2]
        add     r0, r4, r1
        cmp     r9, #0
        beq     LLDH6
        ldrb    r6, [r0, #-1]
        ldrb    r5, [r1, +r4]
        sub     r7, r6, r5
        eor     r8, r7, r7, asr #31
        sub     r8, r8, r7, asr #31
        cmp     r8, r2
        bcs     LLDH6
        ldrb    r8, [r0, #-2]
        subs    r7, r8, r6
        rsbmi   r7, r7, #0
        cmp     r7, r3
        bcs     LLDH6
        ldrb    r7, [r0, #1]
        subs    r10, r7, r5
        rsbmi   r10, r10, #0
        cmp     r10, r3
        bcs     LLDH6
        cmp     r9, #4
        beq     LLDH11
        ldrb    r9, [lr, #2]
        sub     r10, r5, r6
        add     r10, r8, r10, lsl #2
        sub     r10, r10, r7
        add     r9, r9, #1
        add     r7, r10, #4
        and     r8, r9, #0xFF
        movs    r9, r7, asr #3
        beq     LLDH6
        rsb     r7, r8, #0
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        cmp     r10, r8
        movgt   r7, r8
        bgt     LLDH5
        cmp     r9, r7
        movgt   r7, r9
LLDH5:
        ldr     r8, [pc, #0x1A8]
        add     r6, r6, r7
        sub     r5, r5, r7
        add     r6, r8, r6
        add     r5, r8, r5
        ldrb    r6, [r6, #0x100]
        ldrb    r5, [r5, #0x100]
        strb    r5, [r1, +r4]
        strb    r6, [r0, #-1]
LLDH6:
        ldrb    r12, [r12, #3]
        add     r6, r0, r1
        cmp     r12, #0
        beq     LLDH8
        ldrb    r5, [r6, #-1]
        ldrb    r4, [r1, +r0]
        sub     r7, r5, r4
        eor     r8, r7, r7, asr #31
        sub     r8, r8, r7, asr #31
        cmp     r8, r2
        bcs     LLDH8
        ldrb    r7, [r6, #-2]
        subs    r2, r7, r5
        rsbmi   r2, r2, #0
        cmp     r2, r3
        bcs     LLDH8
        ldrb    r2, [r6, #1]
        subs    r8, r2, r4
        rsbmi   r8, r8, #0
        cmp     r8, r3
        bcs     LLDH8
        cmp     r12, #4
        beq     LLDH12
        ldrb    lr, [lr, #3]
        sub     r3, r4, r5
        add     r3, r7, r3, lsl #2
        sub     r3, r3, r2
        add     r2, r3, #4
        add     lr, lr, #1
        movs    r12, r2, asr #3
        and     r3, lr, #0xFF
        beq     LLDH8
        rsb     r2, r3, #0
        cmp     r12, r2
        mov     lr, r2
        movgt   lr, r12
        cmp     lr, r3
        movgt   r2, r3
        bgt     LLDH7
        cmp     r12, r2
        movgt   r2, r12
LLDH7:
        ldr     r3, [pc, #0xE0]
        add     r5, r5, r2
        sub     r4, r4, r2
        add     r5, r3, r5
        add     r4, r3, r4
        ldrb    r5, [r5, #0x100]
        ldrb    r4, [r4, #0x100]
        strb    r4, [r1, +r0]
        strb    r5, [r6, #-1]
LLDH8:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LLDH9:
        add     r6, r6, r4, lsl #1
        add     r6, r6, r5
        add     r4, r7, r4
        add     r5, r4, r5, lsl #1
        add     r6, r6, #2
        add     r4, r5, #2
        mov     r6, r6, asr #2
        mov     r4, r4, asr #2
        strb    r6, [r0, #-1]
        strb    r4, [r0]
        b       LLDH2
LLDH10:
        add     r6, r6, r8, lsl #1
        add     r6, r6, r7
        add     r8, r5, r8
        add     r7, r8, r7, lsl #1
        add     r6, r6, #2
        add     r5, r7, #2
        mov     r6, r6, asr #2
        mov     r5, r5, asr #2
        strb    r5, [r1, +r0]
        strb    r6, [r4, #-1]
        b       LLDH4
LLDH11:
        add     r6, r6, r8, lsl #1
        add     r6, r6, r7
        add     r8, r5, r8
        add     r7, r8, r7, lsl #1
        add     r6, r6, #2
        add     r5, r7, #2
        mov     r6, r6, asr #2
        mov     r5, r5, asr #2
        strb    r5, [r1, +r4]
        strb    r6, [r0, #-1]
        b       LLDH6
LLDH12:
        add     r5, r5, r7, lsl #1
        add     r5, r5, r2
        add     r7, r4, r7
        add     r2, r7, r2, lsl #1
        add     r5, r5, #2
        add     r2, r2, #2
        mov     r5, r5, asr #2
        mov     r2, r2, asr #2
        strb    r5, [r6, #-1]
        strb    r2, [r1, +r0]
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LLDH13:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}
        .long   ClampTbl


