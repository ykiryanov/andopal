        .text
        .align  4
        .globl  _ippsFFTGetSize_R_16s32s


_ippsFFTGetSize_R_16s32s:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #8
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        cmp     r0, #0
        mov     r6, r3
        blt     LCBD0
        cmp     r0, #0x18
        bgt     LCBD0
        cmp     r6, #0
        beq     LCBD2
        cmp     r4, #0
        beq     LCBD2
        cmp     r5, #0
        beq     LCBD2
        cmp     r1, #8
        beq     LCBD1
        cmp     r1, #4
        beq     LCBD1
        cmp     r1, #1
        beq     LCBD1
        cmp     r1, #2
        beq     LCBD1
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBD0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBD1:
        str     r5, [sp, #4]
        str     r4, [sp]
        mov     r3, r6
        bl      LCBD_getSizeRmFFT
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
LCBD2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCBD_getSizeRmFFT:
        stmdb   sp!, {r4, r5, lr}
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        cmp     r0, #0
        bne     LCBD3
        mov     r12, #0
        mov     r0, r12
        str     r0, [r3]
        b       LCBD4
LCBD3:
        sub     r12, r0, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        mov     r0, lr, lsl r0
        mov     r4, r12, asr #1
        mov     lr, r12, lsl #4
        add     r4, r12, r4, lsr #30
        bic     r4, r4, #3
        mov     r5, r0, lsl #4
        add     r12, lr, #0x1F
        add     r4, r4, #0x23
        mov     lr, r0, asr #1
        add     r5, r5, #0x1F
        bic     r4, r4, #0x1F
        bic     r12, r12, #0x1F
        add     lr, r0, lr, lsr #30
        bic     r5, r5, #0x1F
        add     r4, r12, r4
        add     r5, r4, r5
        bic     lr, lr, #3
        str     r5, [r3]
        add     r3, r0, #2
        add     lr, lr, #0x23
        bic     r0, lr, #0x1F
        mov     r12, r3, lsl #3
LCBD4:
        str     r0, [r2]
        mov     r0, #0
        str     r12, [r1]
        ldmia   sp!, {r4, r5, pc}


