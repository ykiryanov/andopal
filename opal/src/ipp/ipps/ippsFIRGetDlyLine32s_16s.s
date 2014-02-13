        .text
        .align  4
        .globl  _ippsFIRGetDlyLine32s_16s


_ippsFIRGetDlyLine32s_16s:
        cmp     r0, #0
        beq     LBUV1
        cmp     r1, #0
        beq     LBUV1
        ldr     r3, [r0, #0x58]
        ldr     r2, [pc, #0x3C]
        subs    r3, r3, r2
        beq     LBUV0
        adds    r2, r3, #0xF8
        mvnne   r0, #0x10
        bxne    lr
        ldr     r3, [r0, #4]
        ldr     r12, [r0, #0x2C]
        ldr     r2, [r0, #0x48]
        add     r0, r3, r12, lsl #1
        b       _ippsFlip_16u
LBUV0:
        ldr     r2, [r0, #0x48]
        ldr     r3, [r0, #4]
        mov     r0, r3
        b       _ippsFlip_16u
LBUV1:
        mvn     r0, #7
        bx      lr
        .long   0x46493131


