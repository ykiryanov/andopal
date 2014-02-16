        .text
        .align  4
        .globl  ippiReconstructChroma422Intra4x4_H264High_16s8u_IP2R


ippiReconstructChroma422Intra4x4_H264High_16s8u_IP2R:
        mov     r12, sp
        stmdb   sp!, {r4, r5, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x4A, 30
        str     r0, [r11, #-0x24]
        str     r1, [r11, #-0x20]
        str     r2, [r11, #-0x1C]
        str     r3, [r11, #-0x18]
        ldr     r0, [r11, #-0x1C]
        and     r0, r0, #4
        str     r0, [r11, #-0x13C]
        ldr     r0, [r11, #-0x1C]
        and     r0, r0, #1
        str     r0, [r11, #-0x138]
        ldr     r0, [r11, #-0x1C]
        and     r0, r0, #0x10
        str     r0, [r11, #-0x134]
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        bne     LKXA0
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA0:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXA1
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0, #4]
        cmp     r0, #0
        bne     LKXA2
LKXA1:
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA2:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXA3
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0, #0x14]
        cmp     r0, #0
        bne     LKXA4
LKXA3:
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA4:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXA5
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #4]
        cmp     r0, #0
        bne     LKXA6
LKXA5:
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA6:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXA7
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0x14]
        cmp     r0, #0
        bne     LKXA8
LKXA7:
        mvn     r0, #7
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA8:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0, #8]
        cmp     r0, #0
        bgt     LKXA9
        mvn     r0, #0xD
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA9:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #8]
        cmp     r0, #0
        bgt     LKXA10
        mvn     r0, #0xD
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA10:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0
        blt     LKXA11
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0x27
        ble     LKXA12
LKXA11:
        mvn     r0, #0xA
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA12:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0
        blt     LKXA13
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0x27
        ble     LKXA14
LKXA13:
        mvn     r0, #0xA
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA14:
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r0, [r0, #4]
        str     r0, [r11, #-0x130]
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #4]
        str     r0, [r11, #-0x12C]
        ldr     r0, [r11, #-0x20]
        subs    r0, r0, #3
        beq     LKXA39
        adds    r0, r0, #3
        beq     LKXA25
        subs    r0, r0, #1
        beq     LKXA20
        subs    r0, r0, #1
        beq     LKXA15
        mvn     r0, #0xA
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA15:
        ldr     r0, [r11, #-0x13C]
        cmp     r0, #0
        bne     LKXA19
        ldr     r1, [r11, #-0x130]
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r2, [r0, #8]
        mov     r0, #0
        sub     r2, r0, r2
        add     r2, r1, r2
        str     r2, [r11, #-0x128]
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        sub     r2, r0, r2
        add     r2, r1, r2
        str     r2, [r11, #-0x124]
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #0x10
        bge     LKXA51
LKXA16:
        mov     r0, #0
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #8
        bge     LKXA18
LKXA17:
        ldr     r1, [r11, #-0x128]
        ldr     r0, [r11, #-0x11C]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x130]
        ldr     r1, [r11, #-0x11C]
        strb    r0, [r1, +r2]
        ldr     r1, [r11, #-0x124]
        ldr     r0, [r11, #-0x11C]
        ldrb    r0, [r0, +r1]
        ldr     r2, [r11, #-0x12C]
        ldr     r1, [r11, #-0x11C]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x11C]
        add     r0, r0, #1
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #8
        blt     LKXA17
LKXA18:
        ldr     r0, [r11, #-0x130]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x130]
        ldr     r0, [r11, #-0x12C]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x12C]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #0x10
        blt     LKXA16
        b       LKXA51
LKXA19:
        mvn     r0, #0x74
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA20:
        ldr     r0, [r11, #-0x138]
        cmp     r0, #0
        bne     LKXA24
        mov     r0, #0
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #0x10
        bge     LKXA51
LKXA21:
        mov     r0, #0
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #8
        bge     LKXA23
LKXA22:
        ldr     r0, [r11, #-0x130]
        ldrb    r0, [r0, #-1]
        ldr     r2, [r11, #-0x130]
        ldr     r1, [r11, #-0x11C]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x12C]
        ldrb    r0, [r0, #-1]
        ldr     r2, [r11, #-0x12C]
        ldr     r1, [r11, #-0x11C]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x11C]
        add     r0, r0, #1
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #8
        blt     LKXA22
LKXA23:
        ldr     r0, [r11, #-0x130]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x130]
        ldr     r0, [r11, #-0x12C]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x12C]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #0x10
        blt     LKXA21
        b       LKXA51
LKXA24:
        mvn     r0, #0x74
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA25:
        ldr     r0, [r11, #-0x13C]
        cmp     r0, #0
        bne     LKXA28
        ldr     r0, [r11, #-0x138]
        cmp     r0, #0
        bne     LKXA28
        mov     r0, #0
        str     r0, [r11, #-0x108]
        str     r0, [r11, #-0x104]
        str     r0, [r11, #-0xE8]
        str     r0, [r11, #-0xE4]
        str     r0, [r11, #-0x100]
        str     r0, [r11, #-0xFC]
        str     r0, [r11, #-0xF8]
        str     r0, [r11, #-0xF4]
        str     r0, [r11, #-0xE0]
        str     r0, [r11, #-0xDC]
        str     r0, [r11, #-0xF0]
        str     r0, [r11, #-0xEC]
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        bge     LKXA27
LKXA26:
        ldr     r1, [r11, #-0xE4]
        ldr     r2, [r11, #-0x130]
        ldr     r3, [r11, #-0x120]
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     lr, [r0, #8]
        mov     r0, #0
        sub     lr, r0, lr
        add     lr, r3, lr
        ldrb    r2, [lr, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE8]
        ldr     r2, [r11, #-0x130]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        ldr     lr, [r11, #-0x24]
        ldr     lr, [lr]
        ldr     lr, [lr, #8]
        sub     lr, r0, lr
        add     lr, r3, lr
        ldrb    r2, [lr, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xE8]
        ldr     r1, [r11, #-0x104]
        ldr     r2, [r11, #-0x130]
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3]
        ldr     r3, [r3, #8]
        ldr     lr, [r11, #-0x120]
        mul     r3, lr, r3
        sub     r3, r3, #1
        ldrb    r2, [r3, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0x104]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0x130]
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3]
        ldr     r3, [r3, #8]
        ldr     lr, [r11, #-0x120]
        add     lr, lr, #4
        mul     r3, lr, r3
        sub     r3, r3, #1
        ldrb    r2, [r3, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0x108]
        ldr     r1, [r11, #-0xDC]
        ldr     r2, [r11, #-0x12C]
        ldr     r3, [r11, #-0x120]
        ldr     lr, [r11, #-0x24]
        ldr     lr, [lr, #4]
        ldr     lr, [lr, #8]
        sub     lr, r0, lr
        add     lr, r3, lr
        ldrb    r2, [lr, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xDC]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0x12C]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        ldr     lr, [r11, #-0x24]
        ldr     lr, [lr, #4]
        ldr     lr, [lr, #8]
        sub     r0, r0, lr
        add     r0, r3, r0
        ldrb    r2, [r0, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xE0]
        ldr     r0, [r11, #-0xF4]
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldrb    r1, [r2, +r1]
        add     r1, r0, r1
        str     r1, [r11, #-0xF4]
        ldr     r0, [r11, #-0xF8]
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldrb    r1, [r2, +r1]
        add     r1, r0, r1
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0xFC]
        ldr     r0, [r11, #-0x130]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0xFC]
        ldr     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0x130]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0x100]
        ldr     r1, [r11, #-0xEC]
        ldr     r0, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3, #4]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0xEC]
        ldr     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3, #4]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0xF0]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        blt     LKXA26
LKXA27:
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0x104]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1]
        ldr     r0, [r11, #-0xE8]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #1]
        ldr     r0, [r11, #-0x108]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #2]
        ldr     r0, [r11, #-0xE8]
        ldr     r1, [r11, #-0x108]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #3]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xF4]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1]
        ldr     r0, [r11, #-0xE0]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #1]
        ldr     r0, [r11, #-0xF8]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #2]
        ldr     r0, [r11, #-0xE0]
        ldr     r1, [r11, #-0xF8]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #3]
        ldr     r0, [r11, #-0xFC]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #4]
        ldr     r0, [r11, #-0xFC]
        ldr     r1, [r11, #-0xE8]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #5]
        ldr     r0, [r11, #-0x100]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #6]
        ldr     r0, [r11, #-0x100]
        ldr     r1, [r11, #-0xE8]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #7]
        ldr     r0, [r11, #-0xEC]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #4]
        ldr     r0, [r11, #-0xEC]
        ldr     r1, [r11, #-0xE0]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #5]
        ldr     r0, [r11, #-0xF0]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #6]
        ldr     r0, [r11, #-0xF0]
        ldr     r1, [r11, #-0xE0]
        add     r1, r0, r1
        add     r0, r1, #4
        mov     r0, r0, asr #3
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #7]
        b       LKXA35
LKXA28:
        ldr     r0, [r11, #-0x13C]
        cmp     r0, #0
        bne     LKXA31
        mov     r0, #0
        str     r0, [r11, #-0xE8]
        str     r0, [r11, #-0xE4]
        str     r0, [r11, #-0xE0]
        str     r0, [r11, #-0xDC]
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        bge     LKXA30
LKXA29:
        ldr     r1, [r11, #-0xE4]
        ldr     r2, [r11, #-0x130]
        ldr     r3, [r11, #-0x120]
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     lr, [r0, #8]
        mov     r0, #0
        sub     lr, r0, lr
        add     lr, r3, lr
        ldrb    r2, [lr, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE8]
        ldr     r2, [r11, #-0x130]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        ldr     lr, [r11, #-0x24]
        ldr     lr, [lr]
        ldr     lr, [lr, #8]
        sub     lr, r0, lr
        add     lr, r3, lr
        ldrb    r2, [lr, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xE8]
        ldr     r1, [r11, #-0xDC]
        ldr     r2, [r11, #-0x12C]
        ldr     r3, [r11, #-0x120]
        ldr     lr, [r11, #-0x24]
        ldr     lr, [lr, #4]
        ldr     lr, [lr, #8]
        sub     lr, r0, lr
        add     lr, r3, lr
        ldrb    r2, [lr, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xDC]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0x12C]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        ldr     lr, [r11, #-0x24]
        ldr     lr, [lr, #4]
        ldr     lr, [lr, #8]
        sub     r0, r0, lr
        add     r0, r3, r0
        ldrb    r2, [r0, +r2]
        add     r2, r1, r2
        str     r2, [r11, #-0xE0]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        blt     LKXA29
LKXA30:
        ldr     r0, [r11, #-0xE4]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #2]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1]
        ldr     r0, [r11, #-0xE8]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #3]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #1]
        ldr     r0, [r11, #-0xDC]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #2]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1]
        ldr     r0, [r11, #-0xE0]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #3]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #1]
        ldr     r0, [r11, #-0xE4]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #6]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #4]
        ldr     r0, [r11, #-0xE8]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #7]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #5]
        ldr     r0, [r11, #-0xDC]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #6]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #4]
        ldr     r0, [r11, #-0xE0]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #7]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #5]
        b       LKXA35
LKXA31:
        ldr     r0, [r11, #-0x138]
        cmp     r0, #0
        bne     LKXA34
        mov     r0, #0
        str     r0, [r11, #-0x108]
        str     r0, [r11, #-0x104]
        str     r0, [r11, #-0x100]
        str     r0, [r11, #-0xFC]
        str     r0, [r11, #-0xF8]
        str     r0, [r11, #-0xF4]
        str     r0, [r11, #-0xF0]
        str     r0, [r11, #-0xEC]
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        bge     LKXA33
LKXA32:
        ldr     r0, [r11, #-0x104]
        ldr     r1, [r11, #-0x130]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldrb    r1, [r2, +r1]
        add     r1, r0, r1
        str     r1, [r11, #-0x104]
        ldr     r0, [r11, #-0x108]
        ldr     r1, [r11, #-0x130]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldrb    r1, [r2, +r1]
        add     r1, r0, r1
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0xF4]
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldrb    r1, [r2, +r1]
        add     r1, r0, r1
        str     r1, [r11, #-0xF4]
        ldr     r0, [r11, #-0xF8]
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldrb    r1, [r2, +r1]
        add     r1, r0, r1
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0xFC]
        ldr     r0, [r11, #-0x130]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0xFC]
        ldr     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0x130]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0x100]
        ldr     r1, [r11, #-0xEC]
        ldr     r0, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3, #4]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0xEC]
        ldr     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0x12C]
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x120]
        add     r3, r3, #4
        mul     r2, r3, r2
        sub     r2, r2, #1
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3, #4]
        ldr     r3, [r3, #8]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldrb    r0, [r3, +r0]
        add     r0, r1, r0
        str     r0, [r11, #-0xF0]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        blt     LKXA32
LKXA33:
        ldr     r0, [r11, #-0x104]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #1]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1]
        ldr     r0, [r11, #-0x108]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #3]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #2]
        ldr     r0, [r11, #-0xFC]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #5]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #4]
        ldr     r0, [r11, #-0x100]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #7]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #6]
        ldr     r0, [r11, #-0xF4]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #1]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1]
        ldr     r0, [r11, #-0xF8]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #3]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #2]
        ldr     r0, [r11, #-0xEC]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #5]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #4]
        ldr     r0, [r11, #-0xF0]
        add     r0, r0, #2
        mov     r0, r0, asr #2
        and     r0, r0, #0xFF
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #7]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #6]
        b       LKXA35
LKXA34:
        mov     r0, #0x80
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #3]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #2]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #1]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #7]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #6]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #5]
        sub     r1, r11, #0x46, 30
        strb    r0, [r1, #4]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #3]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #2]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #1]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #7]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #6]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #5]
        sub     r1, r11, #0x11, 28
        strb    r0, [r1, #4]
LKXA35:
        ldr     r0, [r11, #-0x130]
        str     r0, [r11, #-0xD8]
        ldr     r0, [r11, #-0x130]
        add     r0, r0, #4
        str     r0, [r11, #-0xD4]
        ldr     r0, [r11, #-0x130]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        mov     r1, r1, lsl #2
        add     r1, r0, r1
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0xD0]
        add     r0, r0, #4
        str     r0, [r11, #-0xCC]
        ldr     r0, [r11, #-0x130]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0xC8]
        add     r0, r0, #4
        str     r0, [r11, #-0xC4]
        ldr     r0, [r11, #-0xC8]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        mov     r1, r1, lsl #2
        add     r1, r0, r1
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xC0]
        add     r0, r0, #4
        str     r0, [r11, #-0xBC]
        ldr     r0, [r11, #-0x12C]
        str     r0, [r11, #-0xB8]
        ldr     r0, [r11, #-0x12C]
        add     r0, r0, #4
        str     r0, [r11, #-0xB4]
        ldr     r0, [r11, #-0x12C]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        mov     r1, r1, lsl #2
        add     r1, r0, r1
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0xB0]
        add     r0, r0, #4
        str     r0, [r11, #-0xAC]
        ldr     r0, [r11, #-0x12C]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA8]
        add     r0, r0, #4
        str     r0, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        mov     r1, r1, lsl #2
        add     r1, r0, r1
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xA0]
        add     r0, r0, #4
        str     r0, [r11, #-0x9C]
        mov     r0, #0
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #4
        bge     LKXA51
LKXA36:
        mov     r0, #0
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        bge     LKXA38
LKXA37:
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0]
        ldr     r2, [r11, #-0xD8]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #1]
        ldr     r2, [r11, #-0xD4]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #2]
        ldr     r2, [r11, #-0xD0]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #3]
        ldr     r2, [r11, #-0xCC]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #4]
        ldr     r2, [r11, #-0xC8]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #5]
        ldr     r2, [r11, #-0xC4]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #6]
        ldr     r2, [r11, #-0xC0]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x46, 30
        ldrb    r0, [r0, #7]
        ldr     r2, [r11, #-0xBC]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0]
        ldr     r2, [r11, #-0xB8]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #1]
        ldr     r2, [r11, #-0xB4]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #2]
        ldr     r2, [r11, #-0xB0]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #3]
        ldr     r2, [r11, #-0xAC]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #4]
        ldr     r2, [r11, #-0xA8]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #5]
        ldr     r2, [r11, #-0xA4]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #6]
        ldr     r2, [r11, #-0xA0]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        sub     r0, r11, #0x11, 28
        ldrb    r0, [r0, #7]
        ldr     r2, [r11, #-0x9C]
        ldr     r1, [r11, #-0x120]
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        blt     LKXA37
LKXA38:
        ldr     r0, [r11, #-0xD8]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xD4]
        ldr     r0, [r11, #-0xD0]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xCC]
        ldr     r0, [r11, #-0xC8]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xC4]
        ldr     r0, [r11, #-0xC0]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xBC]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xBC]
        ldr     r0, [r11, #-0xB8]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0xB4]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xB4]
        ldr     r0, [r11, #-0xB0]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0xAC]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xAC]
        ldr     r0, [r11, #-0xA8]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xA4]
        ldr     r0, [r11, #-0xA0]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x24]
        ldr     r1, [r1, #4]
        ldr     r1, [r1, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x9C]
        ldr     r0, [r11, #-0x11C]
        add     r0, r0, #1
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #4
        blt     LKXA36
        b       LKXA51
LKXA39:
        ldr     r0, [r11, #-0x13C]
        cmp     r0, #0
        bne     LKXA52
        ldr     r0, [r11, #-0x138]
        cmp     r0, #0
        bne     LKXA52
        ldr     r0, [r11, #-0x134]
        cmp     r0, #0
        bne     LKXA52
        mov     r0, #0
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #9
        bge     LKXA41
LKXA40:
        ldr     r1, [r11, #-0x130]
        ldr     r2, [r11, #-0x120]
        ldr     r0, [r11, #-0x24]
        ldr     r0, [r0]
        ldr     r3, [r0, #8]
        mov     r0, #0
        sub     r3, r0, r3
        add     r3, r2, r3
        sub     r2, r3, #1
        ldrb    r1, [r2, +r1]
        ldr     r2, [r11, #-0x120]
        sub     r3, r11, #0x98
        strb    r1, [r2, +r3]
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x120]
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3, #4]
        ldr     r3, [r3, #8]
        sub     r0, r0, r3
        add     r0, r2, r0
        sub     r0, r0, #1
        ldrb    r1, [r0, +r1]
        ldr     r0, [r11, #-0x120]
        sub     r2, r11, #0x8C
        strb    r1, [r0, +r2]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #9
        blt     LKXA40
LKXA41:
        mov     r0, #0
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #0x11
        bge     LKXA43
LKXA42:
        ldr     r0, [r11, #-0x130]
        ldr     r1, [r11, #-0x120]
        sub     r1, r1, #1
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2]
        ldr     r2, [r2, #8]
        mul     r1, r2, r1
        sub     r1, r1, #1
        ldrb    r0, [r1, +r0]
        ldr     r1, [r11, #-0x120]
        sub     r2, r11, #0x80
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x12C]
        ldr     r1, [r11, #-0x120]
        sub     r1, r1, #1
        ldr     r2, [r11, #-0x24]
        ldr     r2, [r2, #4]
        ldr     r2, [r2, #8]
        mul     r1, r2, r1
        sub     r1, r1, #1
        ldrb    r0, [r1, +r0]
        ldr     r1, [r11, #-0x120]
        sub     r2, r11, #0x6C
        strb    r0, [r1, +r2]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #0x11
        blt     LKXA42
LKXA43:
        mov     r0, #0
        str     r0, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        str     r0, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        bgt     LKXA45
LKXA44:
        ldr     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #4
        sub     r2, r11, #0x98
        ldrb    r2, [r0, +r2]
        ldr     r3, [r11, #-0x120]
        mov     r0, #0
        sub     r3, r0, r3
        add     r3, r3, #4
        sub     lr, r11, #0x98
        ldrb    lr, [r3, +lr]
        sub     r3, r0, lr
        add     r3, r2, r3
        ldr     r2, [r11, #-0x120]
        mul     r3, r2, r3
        add     r3, r1, r3
        str     r3, [r11, #-0x58]
        ldr     r1, [r11, #-0x50]
        ldr     r2, [r11, #-0x120]
        add     r2, r2, #4
        sub     r3, r11, #0x8C
        ldrb    r2, [r2, +r3]
        ldr     r3, [r11, #-0x120]
        sub     r3, r0, r3
        add     r3, r3, #4
        sub     lr, r11, #0x8C
        ldrb    lr, [r3, +lr]
        sub     r0, r0, lr
        add     r0, r2, r0
        ldr     r2, [r11, #-0x120]
        mul     r0, r2, r0
        add     r0, r1, r0
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #4
        ble     LKXA44
LKXA45:
        mov     r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #8
        bgt     LKXA47
LKXA46:
        ldr     r1, [r11, #-0x54]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #8
        sub     r2, r11, #0x80
        ldrb    r2, [r0, +r2]
        ldr     r3, [r11, #-0x120]
        mov     r0, #0
        sub     r3, r0, r3
        add     r3, r3, #8
        sub     lr, r11, #0x80
        ldrb    lr, [r3, +lr]
        sub     r3, r0, lr
        add     r3, r2, r3
        ldr     r2, [r11, #-0x120]
        mul     r3, r2, r3
        add     r3, r1, r3
        str     r3, [r11, #-0x54]
        ldr     r1, [r11, #-0x4C]
        ldr     r2, [r11, #-0x120]
        add     r2, r2, #8
        sub     r3, r11, #0x6C
        ldrb    r2, [r2, +r3]
        ldr     r3, [r11, #-0x120]
        sub     r3, r0, r3
        add     r3, r3, #8
        sub     lr, r11, #0x6C
        ldrb    lr, [r3, +lr]
        sub     r0, r0, lr
        add     r0, r2, r0
        ldr     r2, [r11, #-0x120]
        mul     r0, r2, r0
        add     r0, r1, r0
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #8
        ble     LKXA46
LKXA47:
        sub     r0, r11, #0x98
        ldrb    r0, [r0, #8]
        sub     r1, r11, #0x80
        ldrb    r1, [r1, #0x10]
        add     r1, r0, r1
        mov     r0, r1, lsl #4
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x58]
        mov     r1, #0x22
        mul     r1, r0, r1
        add     r0, r1, #0x20
        mov     r0, r0, asr #6
        str     r0, [r11, #-0x44]
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, lsl #2
        ldr     r1, [r11, #-0x54]
        add     r1, r0, r1
        add     r0, r1, #0x20
        mov     r0, r0, asr #6
        str     r0, [r11, #-0x40]
        sub     r0, r11, #0x8C
        ldrb    r0, [r0, #8]
        sub     r1, r11, #0x6C
        ldrb    r1, [r1, #0x10]
        add     r1, r0, r1
        mov     r0, r1, lsl #4
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x50]
        mov     r1, #0x22
        mul     r1, r0, r1
        add     r0, r1, #0x20
        mov     r0, r0, asr #6
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x4C]
        mov     r0, r0, lsl #2
        ldr     r1, [r11, #-0x4C]
        add     r1, r0, r1
        add     r0, r1, #0x20
        mov     r0, r0, asr #6
        str     r0, [r11, #-0x34]
        mov     r0, #0
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #0x10
        bge     LKXA51
LKXA48:
        mov     r0, #0
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #8
        bge     LKXA50
LKXA49:
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        ldr     r2, [r11, #-0x120]
        sub     r2, r2, #3
        mul     r1, r2, r1
        add     r0, r0, r1
        ldr     r1, [r11, #-0x40]
        ldr     r2, [r11, #-0x11C]
        sub     r2, r2, #7
        mul     r1, r2, r1
        add     r1, r0, r1
        add     r0, r1, #0x10
        mov     r0, r0, asr #5
        str     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x30]
        mov     r0, #0xFF
        cmp     r1, r0
        mov     r2, r0
        movlt   r2, r1
        mov     r1, #0
        cmp     r2, #0
        movlt   r2, r1
        and     r2, r2, #0xFF
        ldr     r3, [r11, #-0x130]
        ldr     lr, [r11, #-0x120]
        ldr     r4, [r11, #-0x24]
        ldr     r4, [r4]
        ldr     r4, [r4, #8]
        ldr     r5, [r11, #-0x11C]
        mul     r4, r5, r4
        add     r4, lr, r4
        strb    r2, [r4, +r3]
        ldr     r2, [r11, #-0x3C]
        ldr     r3, [r11, #-0x38]
        ldr     lr, [r11, #-0x120]
        sub     lr, lr, #3
        mul     r3, lr, r3
        add     r2, r2, r3
        ldr     r3, [r11, #-0x34]
        ldr     lr, [r11, #-0x11C]
        sub     lr, lr, #7
        mul     r3, lr, r3
        add     r3, r2, r3
        add     r2, r3, #0x10
        mov     r2, r2, asr #5
        str     r2, [r11, #-0x2C]
        ldr     r2, [r11, #-0x2C]
        cmp     r2, r0
        movlt   r0, r2
        cmp     r0, #0
        movlt   r0, r1
        and     r0, r0, #0xFF
        ldr     r1, [r11, #-0x12C]
        ldr     r2, [r11, #-0x120]
        ldr     r3, [r11, #-0x24]
        ldr     r3, [r3, #4]
        ldr     r3, [r3, #8]
        ldr     lr, [r11, #-0x11C]
        mul     r3, lr, r3
        add     r3, r2, r3
        strb    r0, [r3, +r1]
        ldr     r0, [r11, #-0x120]
        add     r0, r0, #1
        str     r0, [r11, #-0x120]
        ldr     r0, [r11, #-0x120]
        cmp     r0, #8
        blt     LKXA49
LKXA50:
        ldr     r0, [r11, #-0x11C]
        add     r0, r0, #1
        str     r0, [r11, #-0x11C]
        ldr     r0, [r11, #-0x11C]
        cmp     r0, #0x10
        blt     LKXA48
LKXA51:
        ldr     r2, [r11]
        ldr     r1, [r11, #-0x18]
        ldr     r0, [r11, #-0x24]
        bl      ippiReconstructChroma422Inter4x4_H264High_16s8u_IP2R
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x28]
        ldmdb   r11, {r4, r5, r11, sp, pc}
LKXA52:
        mvn     r0, #0x74
        ldmdb   r11, {r4, r5, r11, sp, pc}


