        .text
        .align  4
        .globl  _ippsFFTGetSize_C_32sc


_ippsFFTGetSize_C_32sc:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #8
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        cmp     r0, #0
        mov     r6, r3
        blt     LCBE0
        cmp     r0, #0x18
        bgt     LCBE0
        cmp     r6, #0
        beq     LCBE2
        cmp     r4, #0
        beq     LCBE2
        cmp     r5, #0
        beq     LCBE2
        cmp     r1, #8
        beq     LCBE1
        cmp     r1, #4
        beq     LCBE1
        cmp     r1, #1
        beq     LCBE1
        cmp     r1, #2
        beq     LCBE1
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBE0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBE1:
        str     r5, [sp, #4]
        str     r4, [sp]
        mov     r3, r6
        bl      LCBE_getSizeCFFT
        ldr     r0, [r6]
        add     r0, r0, #0x60
        str     r0, [r6]
        ldr     r0, [r4]
        cmp     r0, #0
        addne   r0, r0, #0x20
        strne   r0, [r4]
        ldr     r0, [r5]
        cmp     r0, #0
        addne   r0, r0, #0x20
        strne   r0, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBE2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBE_getSizeCFFT:
        stmdb   sp!, {lr}
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #8]
        cmp     r0, #0
        bne     LCBE3
        mov     r0, #0
        mov     r12, r0
        str     r12, [r3]
        b       LCBE4
LCBE3:
        mov     r12, #1
        mov     r0, r12, lsl r0
        mov     r12, r0, asr #1
        add     r12, r0, r12, lsr #30
        bic     r12, r12, #3
        mov     r0, r0, lsl #4
        add     lr, r0, #0x1F
        add     r12, r12, #0x23
        bic     lr, lr, #0x1F
        bic     r12, r12, #0x1F
        add     lr, lr, r12
        str     lr, [r3]
LCBE4:
        str     r12, [r2]
        str     r0, [r1]
        mov     r0, #0
        ldr     pc, [sp], #4


