        .text
        .align  4
        .globl  _ippsEncDTXHandler_GSMAMR_16s


_ippsEncDTXHandler_GSMAMR_16s:
        stmdb   sp!, {r4, lr}
        ldr     r12, [sp, #8]
        cmp     r0, #0
        beq     LDQJ2
        cmp     r1, #0
        beq     LDQJ2
        cmp     r2, #0
        beq     LDQJ2
        cmp     r3, #0
        beq     LDQJ2
        ldrsh   lr, [r1]
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        cmp     r4, lr
        addne   lr, lr, #1
        strneh  lr, [r1]
        mov     lr, #0
        cmp     r12, #0
        strh    lr, [r3]
        beq     LDQJ0
        mov     r1, #7
        strh    r1, [r0]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LDQJ0:
        ldrsh   r4, [r0]
        mov     r12, #0x19
        cmp     r4, #0
        bne     LDQJ1
        strh    lr, [r1]
        strh    r12, [r2]
        mov     r0, #1
        strh    r0, [r3]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LDQJ1:
        sub     r4, r4, #1
        mov     r4, r4, lsl #16
        mov     r3, r4, asr #16
        strh    r3, [r0]
        ldrsh   r1, [r1]
        add     r1, r3, r1
        cmp     r1, #0x1E
        strlth  r12, [r2]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LDQJ2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


