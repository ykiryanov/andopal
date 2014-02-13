        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_G729_16s


_ippsAdaptiveCodebookSearch_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        add     lr, sp, #0x10
        ldr     r11, [sp, #0x98]
        and     lr, lr, #7
        ldr     r9, [sp, #0x9C]
        ldr     r8, [sp, #0xA0]
        rsb     lr, lr, #0
        add     r12, sp, #0x10
        and     lr, lr, #7
        cmp     r1, #0
        add     r6, r12, lr
        mov     r4, r3
        beq     LDPS4
        cmp     r2, #0
        beq     LDPS4
        cmp     r4, #0
        beq     LDPS4
        cmp     r11, #0
        beq     LDPS4
        cmp     r9, #0
        beq     LDPS4
        cmp     r0, #0x12
        blt     LDPS0
        cmp     r0, #0x91
        bgt     LDPS0
        cmp     r8, #0
        blt     LDPS0
        cmp     r8, #1
        ble     LDPS1
LDPS0:
        mvn     r0, #6
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LDPS1:
        cmp     r8, #0
        mov     r12, #0x14
        bne     LDPS2
        sub     r7, r0, #3
        cmp     r7, #0x14
        movlt   r7, r12
        add     r10, r7, #6
        cmp     r10, #0x8F
        movgt   r10, #0x8F
        movgt   r7, #0x89
        b       LDPS3
LDPS2:
        sub     r7, r0, #5
        cmp     r7, #0x14
        movlt   r7, r12
        add     r10, r7, #9
        cmp     r10, #0x8F
        movgt   r10, #0x8F
        movgt   r7, #0x86
LDPS3:
        mov     r12, #0x28
        sub     r3, r7, #4
        str     r12, [sp, #8]
        sub     r12, r6, r3, lsl #1
        str     r12, [sp, #4]
        add     r12, r10, #4
        str     r12, [sp]
        add     r5, r4, #0x4D, 30
        mov     r0, r5
        bl      _ippsMeanSquareWeightedError_16s
        add     lr, sp, #0x70
        add     r12, sp, #0x6C
        str     lr, [sp, #4]
        str     r12, [sp]
        mov     r0, r6
        mov     r1, r8
        mov     r2, r7
        mov     r3, r10
        bl      _ippsClosedLoopPitchSearch_G729_16s
        ldr     r2, [sp, #0x70]
        ldr     lr, [sp, #0x6C]
        add     r12, sp, #0x68
        add     r0, sp, #0x68
        add     r6, sp, #0x68
        strh    r2, [r12]
        strh    lr, [r6, #2]
        mov     r1, r4
        bl      _ippsDecodeAdaptiveVector_G729_16s_I
        mov     r0, r5
        mov     r1, r9
        mov     r2, #0x28
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x70]
        ldr     r2, [sp, #0x6C]
        mov     r0, #0
        strh    r1, [r11]
        strh    r2, [r11, #2]
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LDPS4:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}


