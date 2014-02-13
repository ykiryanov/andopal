        .text
        .align  4
        .globl  _ippsFIR_32s_ISfs


_ippsFIR_32s_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        mov     r5, r2
        cmp     r5, #0
        mov     r4, r0
        mov     r7, r1
        mov     r6, r3
        beq     LBTC4
        cmp     r4, #0
        beq     LBTC4
        cmp     r7, #0
        ble     LBTC5
        ldr     lr, [r5]
        ldr     r12, [pc, #0xA4]
        cmp     r12, lr
        beq     LBTC0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBTC0:
        ldr     r12, [r5, #0x50]
        cmp     r7, #0
        add     r8, r12, #1, 18
        ble     LBTC3
        mov     r10, #1, 20
LBTC1:
        cmp     r7, #1, 20
        mov     r9, r7
        movgt   r9, r10
        mov     r2, r9
        mov     r1, r8
        mov     r0, r4
        bl      _ippsCopy_32s
        sub     r7, r7, r9
        str     r6, [sp]
        mov     r0, r8
        mov     r3, r5
        mov     r2, r9
        mov     r1, r4
        bl      _ippsFIR_32s_Sfs
        cmp     r0, #0
        bne     LBTC2
        cmp     r7, #0
        add     r4, r4, r9, lsl #2
        bgt     LBTC1
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBTC2:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBTC3:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBTC4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LBTC5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
        .long   0x46493231


