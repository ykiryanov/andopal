        .text
        .align  4
        .globl  _ippsAbs_32f


_ippsAbs_32f:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LDDP6
        cmp     r1, #0
        beq     LDDP6
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        subs    r10, r2, #4
        mov     r3, #0
        bmi     LDDP1
        add     r9, r1, #4
        add     r8, r0, #4
        add     r7, r1, #8
        add     r6, r0, #8
        add     r5, r1, #0xC
        add     r4, r0, #0xC
        mov     lr, r0
        mov     r12, r1
LDDP0:
        ldr     r11, [lr], #0x10
        add     r3, r3, #4
        cmp     r3, r10
        bic     r11, r11, #2, 2
        str     r11, [r12], #0x10
        ldr     r11, [r8], #0x10
        bic     r11, r11, #2, 2
        str     r11, [r9], #0x10
        ldr     r11, [r6], #0x10
        bic     r11, r11, #2, 2
        str     r11, [r7], #0x10
        ldr     r11, [r4], #0x10
        bic     r11, r11, #2, 2
        str     r11, [r5], #0x10
        ble     LDDP0
LDDP1:
        cmp     r3, r2
        bge     LDDP5
        sub     r12, r2, r3
        cmp     r12, #6
        blt     LDDP3
        mov     r12, r3, lsl #2
        add     r12, r12, #4
        add     lr, r12, r0
        sub     r4, r2, #6
        add     r12, r12, r1
LDDP2:
        ldr     r5, [lr, #-4]
        add     r3, r3, #5
        cmp     r3, r4
        bic     r5, r5, #2, 2
        str     r5, [r12, #-4]
        ldr     r5, [lr]
        bic     r5, r5, #2, 2
        str     r5, [r12]
        ldr     r5, [lr, #4]
        bic     r5, r5, #2, 2
        str     r5, [r12, #4]
        ldr     r5, [lr, #8]
        bic     r5, r5, #2, 2
        str     r5, [r12, #8]
        ldr     r5, [lr, #0xC]
        add     lr, lr, #0x14
        bic     r5, r5, #2, 2
        str     r5, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LDDP2
LDDP3:
        add     r0, r0, r3, lsl #2
        add     r1, r1, r3, lsl #2
LDDP4:
        ldr     r12, [r0], #4
        add     r3, r3, #1
        bic     r12, r12, #2, 2
        str     r12, [r1], #4
        cmp     r3, r2
        blt     LDDP4
LDDP5:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDDP6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


