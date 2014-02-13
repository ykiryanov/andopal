        .text
        .align  4
        .globl  _ippiInterpolateBlock_H264_8u_P2P1R


_ippiInterpolateBlock_H264_8u_P2P1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        cmp     r0, #0
        beq     LLAW6
        cmp     r1, #0
        beq     LLAW6
        cmp     r2, #0
        beq     LLAW6
        cmp     r3, #2
        bcc     LLAW5
        cmp     r3, #0x10
        bhi     LLAW5
        cmp     lr, #2
        bcc     LLAW5
        cmp     lr, #0x10
        bhi     LLAW5
        cmp     lr, #0
        bls     LLAW4
        mov     r6, #0
        sub     r5, r3, #5
        mov     r4, #1
LLAW0:
        cmp     r3, #0
        bls     LLAW3
        cmp     r3, #5
        movcc   r10, #0
        bcc     LLAW2
        mov     r10, #0
        sub     r9, r2, #1
        sub     r8, r0, #1
        sub     r7, r1, #1
        str     lr, [sp, #4]
        str     r3, [sp]
LLAW1:
        ldrb    r3, [r10, +r0]
        ldrb    lr, [r10, +r1]
        mov     r11, r6
        add     r3, r3, lr
        adds    lr, r3, #1
        movmi   r11, r4
        add     r11, r3, r11
        add     r3, r11, #1
        mov     r11, r6
        mov     r3, r3, asr #1
        strb    r3, [r10, +r2]
        ldrb    r3, [r8, #2]
        ldrb    lr, [r7, #2]
        add     r10, r10, #4
        add     r3, r3, lr
        adds    lr, r3, #1
        movmi   r11, r4
        add     r11, r3, r11
        add     r3, r11, #1
        mov     r11, r6
        mov     r3, r3, asr #1
        strb    r3, [r9, #2]
        ldrb    r3, [r8, #3]
        ldrb    lr, [r7, #3]
        add     r3, r3, lr
        adds    lr, r3, #1
        movmi   r11, r4
        add     r11, r3, r11
        add     r3, r11, #1
        mov     r11, r6
        mov     r3, r3, asr #1
        strb    r3, [r9, #3]
        ldrb    r3, [r8, #4]!
        ldrb    lr, [r7, #4]!
        add     r3, r3, lr
        adds    lr, r3, #1
        movmi   r11, r4
        add     r11, r3, r11
        add     r3, r11, #1
        cmp     r10, r5
        mov     r3, r3, asr #1
        strb    r3, [r9, #4]!
        bls     LLAW1
        ldr     lr, [sp, #4]
        ldr     r3, [sp]
LLAW2:
        ldrb    r7, [r10, +r1]
        ldrb    r8, [r10, +r0]
        add     r7, r8, r7
        adds    r9, r7, #1
        mov     r8, r6
        movmi   r8, r4
        add     r8, r7, r8
        add     r7, r8, #1
        mov     r7, r7, asr #1
        strb    r7, [r10, +r2]
        add     r10, r10, #1
        cmp     r10, r3
        bcc     LLAW2
LLAW3:
        subs    lr, lr, #1
        add     r0, r12, r0
        add     r1, r12, r1
        add     r2, r12, r2
        bne     LLAW0
LLAW4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLAW5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLAW6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


