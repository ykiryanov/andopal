        .text
        .align  4
        .globl  _ippsConvert_24u32u


_ippsConvert_24u32u:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LCWC3
        cmp     r1, #0
        beq     LCWC3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #5
        mov     r5, #0
        movlt   r4, r5
        blt     LCWC1
        mov     r4, r5
        sub     lr, r2, #5
        sub     r12, r0, #1
        add     r3, r1, #4
LCWC0:
        ldrb    r8, [r12, #2]
        ldrb    r7, [r12, #1]
        ldrb    r6, [r12, #3]
        add     r5, r5, #4
        cmp     r5, lr
        orr     r8, r7, r8, lsl #8
        orr     r6, r8, r6, lsl #16
        str     r6, [r3, #-4]
        ldrb    r8, [r12, #5]
        ldrb    r7, [r12, #4]
        ldrb    r6, [r12, #6]
        add     r4, r4, #0xC
        orr     r8, r7, r8, lsl #8
        orr     r6, r8, r6, lsl #16
        str     r6, [r3]
        ldrb    r8, [r12, #8]
        ldrb    r7, [r12, #7]
        ldrb    r6, [r12, #9]
        orr     r8, r7, r8, lsl #8
        orr     r6, r8, r6, lsl #16
        str     r6, [r3, #4]
        ldrb    r8, [r12, #0xB]
        ldrb    r7, [r12, #0xA]
        ldrb    r6, [r12, #0xC]!
        orr     r8, r7, r8, lsl #8
        orr     r6, r8, r6, lsl #16
        str     r6, [r3, #8]
        add     r3, r3, #0x10
        ble     LCWC0
LCWC1:
        sub     r4, r4, #1
        add     r0, r4, r0
        add     r1, r1, r5, lsl #2
LCWC2:
        ldrb    lr, [r0, #2]
        ldrb    r12, [r0, #1]
        ldrb    r3, [r0, #3]!
        add     r5, r5, #1
        orr     lr, r12, lr, lsl #8
        orr     r3, lr, r3, lsl #16
        str     r3, [r1], #4
        cmp     r5, r2
        blt     LCWC2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LCWC3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


