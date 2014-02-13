        .text
        .align  4
        .globl  _ippsAndC_32u


_ippsAndC_32u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r1, #0
        bne     LBKG0
        cmp     r0, #0
        beq     LBKG4
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsZero_32s
LBKG0:
        cmp     r0, #0
        beq     LBKG4
        cmp     r2, #0
        beq     LBKG4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r3, #6
        mov     r5, #0
        blt     LBKG2
        sub     r4, r3, #6
        add     lr, r0, #4
        add     r12, r2, #4
LBKG1:
        ldr     r6, [lr, #-4]
        add     r5, r5, #5
        cmp     r5, r4
        and     r6, r1, r6
        str     r6, [r12, #-4]
        ldr     r6, [lr]
        and     r6, r1, r6
        str     r6, [r12]
        ldr     r6, [lr, #4]
        and     r6, r1, r6
        str     r6, [r12, #4]
        ldr     r6, [lr, #8]
        and     r6, r1, r6
        str     r6, [r12, #8]
        ldr     r6, [lr, #0xC]
        add     lr, lr, #0x14
        and     r6, r1, r6
        str     r6, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LBKG1
LBKG2:
        add     r0, r0, r5, lsl #2
        add     r2, r2, r5, lsl #2
LBKG3:
        ldr     r12, [r0], #4
        add     r5, r5, #1
        and     r12, r1, r12
        str     r12, [r2], #4
        cmp     r5, r3
        blt     LBKG3
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBKG4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


