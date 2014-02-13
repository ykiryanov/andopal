        .text
        .align  4
        .globl  _ipps_vbFftMerge_32s


_ipps_vbFftMerge_32s:
        stmdb   sp!, {r4 - r9, lr}
        mov     r12, #1
        mov     r3, r12, lsl r3
        cmp     r3, #0
        ble     LBZY3
        cmp     r3, #5
        mov     r6, #0
        blt     LBZY1
        sub     r5, r3, #5
        sub     r4, r0, #0x1C
        mov     lr, r1
        mov     r12, r2
LBZY0:
        ldr     r7, [lr], #0x10
        add     r9, r6, #2
        str     r7, [r4, #0x1C]
        ldr     r7, [r12], #0x10
        str     r7, [r4, #0x20]!
        add     r7, r6, #1
        ldr     r8, [r1, +r7, lsl #2]
        str     r8, [r0, +r7, lsl #3]
        ldr     r8, [r2, +r7, lsl #2]
        add     r7, r0, r7, lsl #3
        str     r8, [r7, #4]
        ldr     r8, [r1, +r9, lsl #2]
        add     r7, r0, r9, lsl #3
        str     r8, [r0, +r9, lsl #3]
        ldr     r9, [r2, +r9, lsl #2]
        add     r8, r6, #3
        add     r6, r6, #4
        str     r9, [r7, #4]
        ldr     r7, [r1, +r8, lsl #2]
        cmp     r6, r5
        str     r7, [r0, +r8, lsl #3]
        ldr     r7, [r2, +r8, lsl #2]
        add     r8, r0, r8, lsl #3
        str     r7, [r8, #4]
        ble     LBZY0
LBZY1:
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r0, r12, r0
        add     r1, r1, r6, lsl #2
        add     r2, r2, r6, lsl #2
LBZY2:
        ldr     r12, [r1], #4
        add     r6, r6, #1
        str     r12, [r0, #4]
        ldr     r12, [r2], #4
        cmp     r6, r3
        str     r12, [r0, #8]!
        blt     LBZY2
LBZY3:
        ldmia   sp!, {r4 - r9, pc}


