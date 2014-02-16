        .text
        .align  4
        .globl  ippiFilterDeblockingChroma_VerEdge_H264_8u_C1IR


ippiFilterDeblockingChroma_VerEdge_H264_8u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     lr, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        cmp     r0, #0
        beq     LLDI7
        cmp     r2, #0
        beq     LLDI7
        cmp     r3, #0
        beq     LLDI7
        cmp     lr, #0
        beq     LLDI7
        cmp     r12, #0
        beq     LLDI7
        mov     r8, #0
LLDI0:
        ldrb    r4, [r12]
        ldrb    r7, [r2], #1
        ldrb    r6, [r3], #1
        cmp     r4, #0
        add     r5, r0, r8, lsl #2
        bne     LLDI1
        ldrb    r4, [r12, #1]
        cmp     r4, #0
        bne     LLDI1
        ldrb    r4, [r12, #2]
        cmp     r4, #0
        bne     LLDI1
        ldrb    r4, [r12, #3]
        cmp     r4, #0
        beq     LLDI5
LLDI1:
        mov     r4, #0
        str     r2, [sp]
        str     r3, [sp, #4]
        str     r8, [sp, #8]
        str     r0, [sp, #0xC]
LLDI2:
        ldrb    r9, [r12, +r4, asr #1]
        mov     r10, r4, asr #1
        cmp     r9, #0
        addeq   r4, r4, #1
        addeq   r5, r5, r1
        beq     LLDI4
        ldrb    r2, [r5, #-1]
        ldrb    r0, [r5]
        subs    r3, r2, r0
        rsbmi   r3, r3, #0
        cmp     r3, r7
        bcs     LLDI4
        ldrb    r8, [r5, #-2]
        subs    r3, r8, r2
        rsbmi   r3, r3, #0
        cmp     r3, r6
        bcs     LLDI4
        ldrb    r3, [r5, #1]
        subs    r11, r3, r0
        rsbmi   r11, r11, #0
        cmp     r11, r6
        bcs     LLDI4
        cmp     r9, #4
        beq     LLDI6
        ldrb    r10, [lr, +r10]
        sub     r9, r0, r2
        add     r9, r8, r9, lsl #2
        sub     r9, r9, r3
        add     r8, r9, #4
        add     r10, r10, #1
        movs    r8, r8, asr #3
        and     r3, r10, #0xFF
        beq     LLDI4
        rsb     r9, r3, #0
        cmp     r8, r9
        mov     r10, r9
        movgt   r10, r8
        cmp     r10, r3
        bgt     LLDI3
        cmp     r8, r9
        movle   r3, r9
        movgt   r3, r8
LLDI3:
        ldr     r8, [pc, #0x94]
        add     r2, r2, r3
        sub     r3, r0, r3
        add     r2, r8, r2
        ldrb    r0, [r2, #0x100]
        add     r3, r8, r3
        ldrb    r2, [r3, #0x100]
        strb    r0, [r5, #-1]
        strb    r2, [r5]
LLDI4:
        add     r4, r4, #1
        cmp     r4, #8
        add     r5, r5, r1
        blt     LLDI2
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r0, [sp, #0xC]
LLDI5:
        add     r8, r8, #1
        cmp     r8, #2
        add     r12, r12, #8
        add     lr, lr, #4
        blt     LLDI0
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LLDI6:
        add     r2, r2, r8, lsl #1
        add     r2, r2, r3
        add     r8, r0, r8
        add     r3, r8, r3, lsl #1
        add     r2, r2, #2
        add     r0, r3, #2
        mov     r2, r2, asr #2
        mov     r0, r0, asr #2
        strb    r2, [r5, #-1]
        strb    r0, [r5]
        b       LLDI4
LLDI7:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   ClampTbl


