        .text
        .align  4
        .globl  _ippiFilterDeblockingLuma_HorEdge_H264_8u_C1IR


_ippiFilterDeblockingLuma_HorEdge_H264_8u_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        cmp     r0, #0
        beq     LLCX19
        cmp     r2, #0
        beq     LLCX19
        cmp     r3, #0
        beq     LLCX19
        cmp     lr, #0
        beq     LLCX19
        cmp     r12, #0
        beq     LLCX19
        mov     r11, #0
        mov     r10, r11
        sub     r4, r1, r1, lsl #2
        add     r5, r1, r1, lsl #1
        mov     r9, #1
        mov     r8, r10
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x1C]
LLCX0:
        mla     r6, r1, r11, r0
        cmp     r10, #0
        mov     r4, r8
        movgt   r4, r9
        ldrb    r7, [r2, +r4]
        ldrb    r5, [r12]
        ldrb    r4, [r4, +r3]
        cmp     r5, #0
        bne     LLCX1
        ldrb    r5, [r12, #1]
        cmp     r5, #0
        bne     LLCX1
        ldrb    r5, [r12, #2]
        cmp     r5, #0
        bne     LLCX1
        ldrb    r5, [r12, #3]
        cmp     r5, #0
        beq     LLCX12
LLCX1:
        mov     r5, #0
        str     r10, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     lr, [sp, #0x18]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LLCX2:
        ldrb    r9, [r12, +r5, asr #2]
        mov     r10, r5, asr #2
        cmp     r9, #0
        addeq   r5, r5, #3
        addeq   r6, r6, #3
        beq     LLCX11
        sub     r2, r6, r1
        ldrb    lr, [r2]
        ldrb    r3, [r6]
        subs    r8, lr, r3
        rsbmi   r8, r8, #0
        cmp     r8, r7
        bcs     LLCX11
        sub     r0, r6, r1, lsl #1
        str     r0, [sp, #0x38]
        ldrb    r0, [r0]
        subs    r11, r0, lr
        rsbmi   r11, r11, #0
        cmp     r11, r4
        bcs     LLCX11
        ldrb    r11, [r6, +r1]
        str     r11, [sp, #0x34]
        subs    r11, r11, r3
        rsbmi   r11, r11, #0
        cmp     r11, r4
        bcs     LLCX11
        ldr     r11, [sp, #0x1C]
        ldrb    r11, [r6, +r11]
        str     r11, [sp, #0x20]
        ldrb    r11, [r6, +r1, lsl #1]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x20]
        subs    r11, r11, lr
        str     r11, [sp, #0x2C]
        bmi     LLCX18
LLCX3:
        ldr     r11, [sp, #0x28]
        subs    r11, r11, r3
        str     r11, [sp, #0x30]
        bmi     LLCX17
LLCX4:
        cmp     r9, #4
        beq     LLCX13
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x2C]
        ldrb    r8, [r8, +r10]
        str     r8, [sp, #0x24]
        cmp     r9, r4
        addcc   r9, r8, #1
        strcc   r9, [sp, #0x24]
        ldr     r9, [sp, #0x30]
        cmp     r9, r4
        bcs     LLCX5
        ldr     r9, [sp, #0x24]
        add     r9, r9, #1
        str     r9, [sp, #0x24]
LLCX5:
        ldr     r10, [sp, #0x34]
        sub     r9, r3, lr
        add     r9, r0, r9, lsl #2
        sub     r9, r9, r10
        add     r9, r9, #4
        movs    r10, r9, asr #3
        beq     LLCX7
        ldr     r9, [sp, #0x24]
        and     r9, r9, #0xFF
        rsb     r11, r9, #0
        cmp     r10, r11
        str     r11, [sp, #0x24]
        movgt   r11, r10
        cmp     r11, r9
        bgt     LLCX6
        ldr     r9, [sp, #0x24]
        cmp     r10, r9
        ldrle   r9, [sp, #0x24]
        movgt   r9, r10
LLCX6:
        add     r10, lr, r9
        sub     r9, r3, r9
        str     r9, [sp, #0x24]
        ldr     r9, [pc, #0x28C]
        ldr     r11, [sp, #0x24]
        add     r10, r9, r10
        ldrb    r9, [r10, #0x100]
        ldr     r10, [pc, #0x27C]
        add     r11, r10, r11
        ldrb    r10, [r11, #0x100]
        strb    r9, [r2]
        strb    r10, [r6]
LLCX7:
        ldr     r2, [sp, #0x2C]
        cmp     r2, r4
        bcs     LLCX9
        ldr     r9, [sp, #0x20]
        add     r2, lr, r3
        add     r2, r2, #1
        mov     r0, r0, lsl #1
        rsb     r2, r0, r2, asr #1
        add     r9, r2, r9
        mov     r0, r8
        rsb     r2, r0, #0
        mov     r9, r9, asr #1
        cmp     r9, r2
        mov     r10, r2
        movgt   r10, r9
        cmp     r10, r0
        bgt     LLCX8
        cmp     r9, r2
        movle   r0, r2
        movgt   r0, r9
LLCX8:
        ldr     r2, [sp, #0x38]
        ldrb    r9, [r2]
        add     r0, r9, r0
        strb    r0, [r2]
LLCX9:
        ldr     r0, [sp, #0x30]
        cmp     r0, r4
        bcs     LLCX11
        ldr     r2, [sp, #0x34]
        add     r3, lr, r3
        add     r0, r3, #1
        mov     r2, r2, lsl #1
        rsb     r0, r2, r0, asr #1
        ldr     r2, [sp, #0x28]
        add     r2, r0, r2
        rsb     r0, r8, #0
        mov     r2, r2, asr #1
        cmp     r2, r0
        mov     r3, r0
        movgt   r3, r2
        cmp     r3, r8
        bgt     LLCX10
        cmp     r2, r0
        movle   r8, r0
        movgt   r8, r2
LLCX10:
        ldrb    r0, [r6, +r1]
        add     r8, r0, r8
        strb    r8, [r6, +r1]
LLCX11:
        add     r5, r5, #1
        cmp     r5, #0x10
        add     r6, r6, #1
        blt     LLCX2
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     lr, [sp, #0x18]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r8, #0
        mov     r9, #1
LLCX12:
        add     r10, r10, #1
        cmp     r10, #4
        add     r11, r11, #4
        add     lr, lr, #4
        add     r12, r12, #4
        blt     LLCX0
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LLCX13:
        mov     r9, r7, lsr #2
        add     r9, r9, #2
        cmp     r8, r9
        movcs   r8, #0
        bcs     LLCX14
        ldr     r8, [sp, #0x2C]
        cmp     r8, r4
        movcs   r8, #1
        bcs     LLCX14
        add     r8, lr, r3
        add     r9, r8, r0
        sub     r8, r6, r1, lsl #2
        ldrb    r8, [r8]
        ldr     r10, [sp, #0x20]
        str     r8, [sp, #0x2C]
        ldr     r8, [sp, #0x34]
        add     r11, r10, r10, lsl #1
        add     r8, r8, r10
        add     r8, r8, r9, lsl #1
        add     r8, r8, #4
        add     r10, r10, r9
        str     r10, [sp, #0x24]
        mov     r8, r8, asr #3
        strb    r8, [r2]
        ldr     r8, [sp, #0x2C]
        add     r9, r11, r9
        ldr     r2, [sp, #0x24]
        add     r9, r9, r8, lsl #1
        add     r8, r9, #4
        ldr     r9, [sp, #0x38]
        add     r2, r2, #2
        mov     r8, r8, asr #3
        mov     r2, r2, asr #2
        strb    r2, [r9]
        ldr     r2, [sp, #0x1C]
        strb    r8, [r6, +r2]
        b       LLCX15
LLCX14:
        ldr     r10, [sp, #0x34]
        add     r9, lr, r0, lsl #1
        cmp     r8, #0
        add     r10, r9, r10
        add     r9, r10, #2
        mov     r9, r9, asr #2
        strb    r9, [r2]
        beq     LLCX16
LLCX15:
        ldr     r2, [sp, #0x30]
        cmp     r2, r4
        bcs     LLCX16
        add     r3, lr, r3
        ldr     lr, [sp, #0x34]
        ldr     r2, [sp, #0x14]
        add     r3, r3, lr
        ldr     lr, [sp, #0x28]
        ldrb    r2, [r6, +r2]
        add     r8, r0, lr
        add     r8, r8, r3, lsl #1
        add     r0, lr, lr, lsl #1
        add     lr, r3, lr
        add     r3, r0, r3
        add     r8, r8, #4
        add     r2, r3, r2, lsl #1
        add     lr, lr, #2
        mov     r8, r8, asr #3
        strb    r8, [r6]
        add     r2, r2, #4
        mov     lr, lr, asr #2
        strb    lr, [r6, +r1]
        mov     r2, r2, asr #3
        strb    r2, [r6, +r1, lsl #1]
        b       LLCX11
LLCX16:
        ldr     r2, [sp, #0x34]
        add     r0, r3, r0
        add     r2, r0, r2, lsl #1
        add     r0, r2, #2
        mov     r0, r0, asr #2
        strb    r0, [r6]
        b       LLCX11
LLCX17:
        ldr     r11, [sp, #0x30]
        rsb     r11, r11, #0
        str     r11, [sp, #0x30]
        b       LLCX4
LLCX18:
        ldr     r11, [sp, #0x2C]
        rsb     r11, r11, #0
        str     r11, [sp, #0x2C]
        b       LLCX3
LLCX19:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   ClampTbl


