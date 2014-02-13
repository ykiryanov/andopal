        .text
        .align  4
        .globl  ownFilterBB16x16_H263_H


ownFilterBB16x16_H263_H:
        sub     r1, r0, r1
        ldrb    r3, [r1]
        ldrb    r2, [r0]
        add     r12, r3, r2
        add     r12, r12, #2
        add     r3, r12, r3, lsl #1
        add     r2, r12, r2, lsl #1
        mov     r3, r3, asr #2
        strb    r3, [r1]
        mov     r2, r2, asr #2
        strb    r2, [r0]
        ldrb    r2, [r0, #1]
        ldrb    r12, [r1, #1]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r2, r3, r2, lsl #1
        add     r12, r3, r12, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #1]
        mov     r2, r2, asr #2
        strb    r2, [r0, #1]
        ldrb    r2, [r0, #2]
        ldrb    r3, [r1, #2]
        add     r12, r3, r2
        add     r12, r12, #2
        add     r2, r12, r2, lsl #1
        add     r3, r12, r3, lsl #1
        mov     r3, r3, asr #2
        strb    r3, [r1, #2]
        mov     r2, r2, asr #2
        strb    r2, [r0, #2]
        ldrb    r12, [r1, #3]
        ldrb    r2, [r0, #3]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #3]
        mov     r2, r2, asr #2
        strb    r2, [r0, #3]
        ldrb    r12, [r1, #4]
        ldrb    r2, [r0, #4]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #4]
        mov     r2, r2, asr #2
        strb    r2, [r0, #4]
        ldrb    r3, [r1, #5]
        ldrb    r2, [r0, #5]
        add     r12, r3, r2
        add     r12, r12, #2
        add     r3, r12, r3, lsl #1
        add     r2, r12, r2, lsl #1
        mov     r3, r3, asr #2
        strb    r3, [r1, #5]
        mov     r2, r2, asr #2
        strb    r2, [r0, #5]
        ldrb    r3, [r1, #6]
        ldrb    r2, [r0, #6]
        add     r12, r3, r2
        add     r12, r12, #2
        add     r3, r12, r3, lsl #1
        add     r2, r12, r2, lsl #1
        mov     r3, r3, asr #2
        strb    r3, [r1, #6]
        mov     r2, r2, asr #2
        strb    r2, [r0, #6]
        ldrb    r12, [r1, #7]
        ldrb    r2, [r0, #7]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #7]
        mov     r2, r2, asr #2
        strb    r2, [r0, #7]
        ldrb    r3, [r1, #8]
        ldrb    r2, [r0, #8]
        add     r12, r3, r2
        add     r12, r12, #2
        add     r3, r12, r3, lsl #1
        add     r2, r12, r2, lsl #1
        mov     r3, r3, asr #2
        strb    r3, [r1, #8]
        mov     r2, r2, asr #2
        strb    r2, [r0, #8]
        ldrb    r12, [r1, #9]
        ldrb    r2, [r0, #9]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #9]
        mov     r2, r2, asr #2
        strb    r2, [r0, #9]
        ldrb    r2, [r0, #0xA]
        ldrb    r12, [r1, #0xA]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r2, r3, r2, lsl #1
        add     r12, r3, r12, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #0xA]
        mov     r2, r2, asr #2
        strb    r2, [r0, #0xA]
        ldrb    r2, [r0, #0xB]
        ldrb    r12, [r1, #0xB]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r2, r3, r2, lsl #1
        add     r12, r3, r12, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #0xB]
        mov     r2, r2, asr #2
        strb    r2, [r0, #0xB]
        ldrb    r12, [r1, #0xC]
        ldrb    r2, [r0, #0xC]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #0xC]
        mov     r2, r2, asr #2
        strb    r2, [r0, #0xC]
        ldrb    r12, [r1, #0xD]
        ldrb    r2, [r0, #0xD]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #0xD]
        mov     r2, r2, asr #2
        strb    r2, [r0, #0xD]
        ldrb    r12, [r1, #0xE]
        ldrb    r2, [r0, #0xE]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #0xE]
        mov     r2, r2, asr #2
        strb    r2, [r0, #0xE]
        ldrb    r12, [r1, #0xF]
        ldrb    r2, [r0, #0xF]
        add     r3, r12, r2
        add     r3, r3, #2
        add     r12, r3, r12, lsl #1
        add     r2, r3, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, #0xF]
        mov     r2, r2, asr #2
        strb    r2, [r0, #0xF]
        bx      lr


