        .text
        .align  4
        .globl  _ippsFFTGetSize_R_16s


_ippsFFTGetSize_R_16s:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #8
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        cmp     r0, #0
        mov     r4, r3
        blt     LCCZ3
        cmp     r0, #0xE
        bgt     LCCZ3
        cmp     r4, #0
        beq     LCCZ4
        cmp     r5, #0
        beq     LCCZ4
        cmp     r6, #0
        beq     LCCZ4
        cmp     r1, #8
        beq     LCCZ0
        cmp     r1, #4
        beq     LCCZ0
        cmp     r1, #1
        beq     LCCZ0
        cmp     r1, #2
        beq     LCCZ0
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCCZ0:
        cmp     r0, #0
        bne     LCCZ1
        mov     r0, #0x50
        str     r0, [r4]
        mov     r0, #0
        str     r0, [r5]
        b       LCCZ2
LCCZ1:
        str     r6, [sp, #4]
        str     r5, [sp]
        mov     r3, r4
        bl      LCCZ_getSizeRFFT
        ldr     r0, [r4]
        add     r0, r0, #0x60
        str     r0, [r4]
        ldr     r0, [r5]
        add     r0, r0, #0x20
        str     r0, [r5]
        ldr     r0, [r6]
        add     r0, r0, #0x20
LCCZ2:
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCCZ3:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCCZ4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCCZ_getSizeRFFT:
        stmdb   sp!, {r4, r5, lr}
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        cmp     r0, #0
        bne     LCCZ5
        mov     r12, #0
        mov     r0, r12
        str     r0, [r3]
        b       LCCZ6
LCCZ5:
        sub     r12, r0, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        mov     r0, lr, lsl r0
        mov     r4, r12, asr #1
        mov     lr, r0, asr #1
        add     r4, r12, r4, lsr #30
        add     r5, r0, lr, lsr #30
        mov     r12, r12, lsl #3
        add     lr, r12, #0x1F
        mov     r12, r5, asr #2
        bic     r4, r4, #3
        mov     r5, r0, lsl #3
        add     r4, r4, #0x23
        add     r5, r5, #0x1F
        bic     lr, lr, #0x1F
        bic     r4, r4, #0x1F
        add     r12, r12, #1
        bic     r5, r5, #0x1F
        add     r4, lr, r4
        mov     r12, r12, lsl #1
        add     r5, r4, r5
        str     r5, [r3]
        add     r12, r12, #0x1F
        add     r3, r0, #2
        bic     r0, r12, #0x1F
        mov     r12, r3, lsl #2
LCCZ6:
        str     r0, [r2]
        mov     r0, #0
        str     r12, [r1]
        ldmia   sp!, {r4, r5, pc}


