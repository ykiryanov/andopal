        .text
        .align  4
        .globl  _ippsFFTGetSize_C_32s


_ippsFFTGetSize_C_32s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r3
        blt     LCBF0
        cmp     r7, #0x18
        bgt     LCBF0
        cmp     r4, #0
        beq     LCBF3
        cmp     r6, #0
        beq     LCBF3
        cmp     r5, #0
        beq     LCBF3
        cmp     r1, #8
        beq     LCBF1
        cmp     r1, #4
        beq     LCBF1
        cmp     r1, #1
        beq     LCBF1
        cmp     r1, #2
        beq     LCBF1
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCBF0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCBF1:
        str     r5, [sp, #4]
        str     r6, [sp]
        mov     r3, r4
        mov     r0, r7
        bl      LCBF_getSizeCFFT
        cmp     r7, #0
        ble     LCBF2
        ldr     r1, [r5]
        mov     r2, #1
        mov     r7, r2, lsl r7
        add     r7, r1, r7, lsl #3
        str     r7, [r5]
LCBF2:
        ldr     r0, [r4]
        add     r0, r0, #0x60
        str     r0, [r4]
        ldr     r0, [r6]
        cmp     r0, #0
        addne   r0, r0, #0x20
        strne   r0, [r6]
        ldr     r0, [r5]
        cmp     r0, #0
        addne   r0, r0, #0x20
        strne   r0, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCBF3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCBF_getSizeCFFT:
        stmdb   sp!, {lr}
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #8]
        cmp     r0, #0
        bne     LCBF4
        mov     r0, #0
        mov     r12, r0
        str     r12, [r3]
        b       LCBF5
LCBF4:
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
LCBF5:
        str     r12, [r2]
        str     r0, [r1]
        mov     r0, #0
        ldr     pc, [sp], #4


