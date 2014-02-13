        .text
        .align  4
        .globl  _ippsMDCTInvGetSize_32f


_ippsMDCTInvGetSize_32f:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0xC
        mov     r6, r1
        cmp     r6, #0
        mov     r7, r0
        mov     r5, r3
        beq     LGDZ5
        cmp     r2, #0
        beq     LGDZ5
        cmp     r5, #0
        beq     LGDZ5
        cmp     r7, #0xC
        subeq   r12, r7, #1
        andeq   lr, r7, r12
        beq     LGDZ0
        cmp     r7, #0x24
        subeq   r12, r7, #1
        andeq   lr, r7, r12
        beq     LGDZ0
        cmp     r7, #0x20
        blt     LGDZ4
        sub     r12, r7, #1
        ands    lr, r7, r12
        bne     LGDZ4
LGDZ0:
        mov     r12, #0
        str     r12, [r2]
        cmp     lr, #0
        str     r12, [r5]
        mov     r8, #1
        mov     r4, #0
        bne     LGDZ3
        mov     r12, r7, asr #1
        str     r4, [r6]
        add     r12, r7, r12, lsr #30
        mov     r12, r12, asr #2
        cmp     r12, #1
        movle   r0, #0
        ble     LGDZ2
        mov     r0, #0
        mov     lr, #1
LGDZ1:
        mov     lr, lr, lsl #1
        cmp     lr, r12
        add     r0, r0, #1
        blt     LGDZ1
LGDZ2:
        add     r3, sp, #8
        str     r2, [sp]
        str     r5, [sp, #4]
        mov     r2, #0
        mov     r1, #8
        bl      _ippsFFTGetSize_C_32fc
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r8, pc}
        ldr     r2, [r6]
        ldr     r12, [sp, #8]
        add     r2, r12, r2
        add     r2, r2, #0x20
        str     r2, [r6]
        ldr     r2, [r5]
        add     r2, r2, #0x20
        str     r2, [r5]
        ldr     r12, [r6]
LGDZ3:
        cmp     r7, #0
        movlt   r4, r8
        add     r4, r7, r4
        mov     r2, #0x3C
        mov     lr, r4, asr #1
        mov     r0, #0
        add     lr, r12, lr, lsl #2
        add     lr, r2, lr
        add     r2, lr, #0x20
        str     r2, [r6]
        ldr     r1, [r5]
        add     r7, r1, r7, lsl #2
        add     r1, r7, #0x40
        str     r1, [r5]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LGDZ4:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LGDZ5:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}


