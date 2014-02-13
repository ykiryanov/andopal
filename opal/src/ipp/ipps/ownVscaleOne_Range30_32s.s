        .text
        .align  4
        .globl  ownVscaleOne_Range30_32s


ownVscaleOne_Range30_32s:
        ldr     r0, [r0]
        cmp     r0, #0
        mov     r3, #0
        beq     LDEB2
        cmp     r0, #0
        blt     LDEB3
        cmp     r0, #1, 2
        strgeh  r3, [r2]
        bge     LDEB1
LDEB0:
        add     r3, r3, #1
        mov     r0, r0, lsl #1
        mov     r3, r3, lsl #16
        cmp     r0, #1, 2
        mov     r3, r3, asr #16
        blt     LDEB0
        strh    r3, [r2]
LDEB1:
        str     r0, [r1]
        bx      lr
LDEB2:
        str     r3, [r1]
        mov     r0, #0x1F
        strh    r0, [r2]
        bx      lr
LDEB3:
        cmp     r0, #3, 2
        strlth  r3, [r2]
        blt     LDEB1
LDEB4:
        add     r3, r3, #1
        mov     r0, r0, lsl #1
        mov     r3, r3, lsl #16
        cmp     r0, #3, 2
        mov     r3, r3, asr #16
        bge     LDEB4
        strh    r3, [r2]
        b       LDEB1


