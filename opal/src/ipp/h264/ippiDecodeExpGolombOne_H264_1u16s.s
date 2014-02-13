        .text
        .align  4
        .globl  _ippiDecodeExpGolombOne_H264_1u16s


_ippiDecodeExpGolombOne_H264_1u16s:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LLBF17
        cmp     r1, #0
        beq     LLBF17
        cmp     r2, #0
        beq     LLBF17
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LLBF17
        ldr     r12, [r1]
        cmp     r12, #0
        blt     LLBF12
        cmp     r12, #0x1F
        bgt     LLBF12
        subs    r12, r12, #1
        bmi     LLBF16
        str     r12, [r1]
        ldr     lr, [r0]
        add     r12, r12, #1
        ldr     lr, [lr]
        mov     r12, lr, lsr r12
LLBF0:
        tst     r12, #1
        mov     r12, #0
        bne     LLBF11
        ldr     lr, [r1]
        subs    lr, lr, #8
        bmi     LLBF15
        str     lr, [r1]
        ldr     r5, [r0]
        add     r4, lr, #1
        ldr     r5, [r5]
        mov     r4, r5, lsr r4
LLBF1:
        and     r5, r4, #0xFF
        cmp     r5, #0
        mov     r4, #9
        bne     LLBF4
LLBF2:
        subs    lr, lr, #8
        bmi     LLBF14
        str     lr, [r1]
        ldr     r6, [r0]
        add     r5, lr, #1
        ldr     r6, [r6]
        mov     r5, r6, lsr r5
LLBF3:
        and     r5, r5, #0xFF
        cmp     r5, #0
        add     r4, r4, #8
        beq     LLBF2
LLBF4:
        tst     r5, #0x80
        movne   r6, r12
        bne     LLBF6
        mov     r6, r12
LLBF5:
        mov     r5, r5, lsl #1
        tst     r5, #0x80
        add     r6, r6, #1
        beq     LLBF5
LLBF6:
        sub     r5, lr, r6
        add     r6, r4, r6
        add     r4, r5, #7
        cmp     r4, #0x1F
        sub     lr, r6, #8
        strle   r4, [r1]
        ble     LLBF7
        sub     r5, r5, #0x19
        str     r5, [r1]
        ldr     r4, [r0]
        sub     r4, r4, #4
        str     r4, [r0]
LLBF7:
        cmp     lr, #0
        mov     r4, #1
        beq     LLBF9
        ldr     r12, [r1]
        subs    r12, r12, lr
        bmi     LLBF13
        str     r12, [r1]
        ldr     r0, [r0]
        add     r12, r12, #1
        ldr     r0, [r0]
        mov     r12, r0, lsr r12
LLBF8:
        mov     r0, r4, lsl lr
        sub     r0, r0, #1
        and     r12, r12, r0
LLBF9:
        add     lr, r12, r4, lsl lr
        cmp     r3, #0
        sub     lr, lr, #1
        beq     LLBF10
        tst     lr, #1
        add     r0, lr, #1
        movne   lr, r0, asr #1
        moveq   r0, r0, asr #1
        rsbeq   lr, r0, #0
LLBF10:
        mov     r0, #0
        strh    lr, [r2]
        ldmia   sp!, {r4 - r8, pc}
LLBF11:
        mov     r0, #0
        strh    r12, [r2]
        ldmia   sp!, {r4 - r8, pc}
LLBF12:
        mvn     r0, #4
        ldmia   sp!, {r4 - r8, pc}
LLBF13:
        add     r12, r12, #0x20
        str     r12, [r1]
        ldr     r7, [r0]
        rsb     r5, r12, #0x1F
        ldr     r6, [r7, #4]
        ldr     r1, [r7], #4
        str     r7, [r0]
        mov     r12, r6, lsr r12
        mov     r5, r1, lsl r5
        add     r12, r5, r12, lsr #1
        b       LLBF8
LLBF14:
        add     r6, lr, #0x20
        str     r6, [r1]
        ldr     r8, [r0]
        rsb     r5, r6, #0x1F
        ldr     lr, [r8]
        ldr     r7, [r8, #4]!
        str     r8, [r0]
        mov     r5, lr, lsl r5
        ldr     lr, [r1]
        mov     r6, r7, lsr r6
        add     r5, r5, r6, lsr #1
        b       LLBF3
LLBF15:
        add     lr, lr, #0x20
        str     lr, [r1]
        ldr     r7, [r0]
        rsb     r5, lr, #0x1F
        ldr     r6, [r7, #4]
        ldr     r4, [r7], #4
        str     r7, [r0]
        mov     r6, r6, lsr lr
        ldr     lr, [r1]
        mov     r5, r4, lsl r5
        add     r4, r5, r6, lsr #1
        b       LLBF1
LLBF16:
        add     r4, r12, #0x20
        str     r4, [r1]
        ldr     r6, [r0]
        rsb     lr, r4, #0x1F
        ldr     r12, [r6]
        ldr     r5, [r6, #4]!
        str     r6, [r0]
        mov     lr, r12, lsl lr
        mov     r4, r5, lsr r4
        add     r12, lr, r4, lsr #1
        b       LLBF0
LLBF17:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


