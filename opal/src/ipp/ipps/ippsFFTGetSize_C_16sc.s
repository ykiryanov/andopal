        .text
        .align  4
        .globl  _ippsFFTGetSize_C_16sc


_ippsFFTGetSize_C_16sc:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #8
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        cmp     r0, #0
        mov     r4, r3
        blt     LCDA3
        cmp     r0, #0xE
        bgt     LCDA3
        cmp     r4, #0
        beq     LCDA4
        cmp     r5, #0
        beq     LCDA4
        cmp     r6, #0
        beq     LCDA4
        cmp     r1, #8
        beq     LCDA0
        cmp     r1, #4
        beq     LCDA0
        cmp     r1, #1
        beq     LCDA0
        cmp     r1, #2
        beq     LCDA0
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCDA0:
        cmp     r0, #0
        bne     LCDA1
        mov     r0, #0x50
        str     r0, [r4]
        mov     r0, #0
        str     r0, [r5]
        b       LCDA2
LCDA1:
        str     r6, [sp, #4]
        str     r5, [sp]
        mov     r3, r4
        bl      LCDA_getSizeCFFT
        ldr     r0, [r4]
        add     r0, r0, #0x60
        str     r0, [r4]
        ldr     r0, [r5]
        add     r0, r0, #0x20
        str     r0, [r5]
        ldr     r0, [r6]
        add     r0, r0, #0x20
LCDA2:
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCDA3:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCDA4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCDA_getSizeCFFT:
        stmdb   sp!, {r4, lr}
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        cmp     r0, #0
        bne     LCDA5
        mov     r0, #0
        mov     r12, r0
        str     r12, [r3]
        b       LCDA6
LCDA5:
        mov     r12, #1
        mov     r0, r12, lsl r0
        mov     r12, r0, asr #1
        add     r12, r0, r12, lsr #30
        mov     r0, r0, lsl #3
        mov     r12, r12, asr #2
        add     r12, r12, #1
        add     lr, r0, #0x1F
        mov     r4, r12, lsl #2
        add     r4, r4, #0x1F
        mov     r12, r12, lsl #1
        bic     r4, r4, #0x1F
        bic     lr, lr, #0x1F
        add     r12, r12, #0x1F
        add     r4, lr, r4
        str     r4, [r3]
        bic     r12, r12, #0x1F
LCDA6:
        str     r12, [r2]
        str     r0, [r1]
        mov     r0, #0
        ldmia   sp!, {r4, pc}


