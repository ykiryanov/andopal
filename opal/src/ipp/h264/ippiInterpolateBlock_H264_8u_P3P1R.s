        .text
        .align  4
        .globl  _ippiInterpolateBlock_H264_8u_P3P1R


_ippiInterpolateBlock_H264_8u_P3P1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r5, [sp, #0x38]
        ldr     r4, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        cmp     r0, #0
        beq     LLAV6
        cmp     r1, #0
        beq     LLAV6
        cmp     r2, #0
        beq     LLAV6
        cmp     r3, #2
        bcc     LLAV5
        cmp     r3, #0x10
        bhi     LLAV5
        cmp     r5, #2
        bcc     LLAV5
        cmp     r5, #0x10
        bhi     LLAV5
        cmp     r5, #0
        bls     LLAV4
        sub     r8, r3, #5
        mov     r7, #0
        mov     r6, #1
        str     r8, [sp, #0x10]
LLAV0:
        cmp     r3, #0
        bls     LLAV3
        cmp     r3, #5
        movcc   r11, #0
        bcc     LLAV2
        str     r3, [sp]
        ldr     r3, [sp, #0x10]
        mov     r11, #0
        sub     r10, r2, #1
        sub     r9, r0, #1
        sub     r8, r1, #1
        str     lr, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp, #4]
LLAV1:
        ldrb    lr, [r11, +r0]
        ldrb    r4, [r11, +r1]
        mov     r5, r7
        add     lr, lr, r4
        adds    r4, lr, #1
        movmi   r5, r6
        add     r5, lr, r5
        add     lr, r5, #1
        mov     r5, r7
        mov     lr, lr, asr #1
        strb    lr, [r11, +r2]
        ldrb    lr, [r9, #2]
        ldrb    r4, [r8, #2]
        add     r11, r11, #4
        add     lr, lr, r4
        adds    r4, lr, #1
        movmi   r5, r6
        add     r5, lr, r5
        add     lr, r5, #1
        mov     r5, r7
        mov     lr, lr, asr #1
        strb    lr, [r10, #2]
        ldrb    lr, [r9, #3]
        ldrb    r4, [r8, #3]
        add     lr, lr, r4
        adds    r4, lr, #1
        movmi   r5, r6
        add     r5, lr, r5
        add     lr, r5, #1
        mov     r5, r7
        mov     lr, lr, asr #1
        strb    lr, [r10, #3]
        ldrb    lr, [r9, #4]!
        ldrb    r4, [r8, #4]!
        add     lr, lr, r4
        adds    r4, lr, #1
        movmi   r5, r6
        add     r5, lr, r5
        add     lr, r5, #1
        cmp     r11, r3
        mov     lr, lr, asr #1
        strb    lr, [r10, #4]!
        bls     LLAV1
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r3, [sp]
LLAV2:
        ldrb    r8, [r11, +r1]
        ldrb    r9, [r11, +r0]
        add     r8, r9, r8
        adds    r10, r8, #1
        mov     r9, r7
        movmi   r9, r6
        add     r9, r8, r9
        add     r8, r9, #1
        mov     r8, r8, asr #1
        strb    r8, [r11, +r2]
        add     r11, r11, #1
        cmp     r11, r3
        bcc     LLAV2
LLAV3:
        subs    r5, r5, #1
        add     r0, r4, r0
        add     r1, lr, r1
        add     r2, r12, r2
        bne     LLAV0
LLAV4:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LLAV5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LLAV6:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


