        .text
        .align  4
        .globl  _ippsConvert_24u32f


_ippsConvert_24u32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r5, r1
        mov     r4, r2
        beq     LCXE3
        cmp     r5, #0
        beq     LCXE3
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r4, #5
        mov     r6, #0
        movlt   r11, r6
        blt     LCXE1
        mov     r11, r6
        sub     r10, r4, #5
        sub     r9, r7, #1
        add     r8, r5, #4
LCXE0:
        ldrb    r12, [r9, #1]
        ldrb    lr, [r9, #2]
        ldrb    r3, [r9, #3]
        add     r11, r11, #0xC
        add     r6, r6, #4
        orr     lr, r12, lr, lsl #8
        orr     r0, lr, r3, lsl #16
        bl      __floatsisf
        str     r0, [r8, #-4]
        ldrb    lr, [r9, #5]
        ldrb    r12, [r9, #4]
        ldrb    r3, [r9, #6]
        orr     lr, r12, lr, lsl #8
        orr     r0, lr, r3, lsl #16
        bl      __floatsisf
        str     r0, [r8]
        ldrb    lr, [r9, #8]
        ldrb    r12, [r9, #7]
        ldrb    r3, [r9, #9]
        orr     lr, r12, lr, lsl #8
        orr     r0, lr, r3, lsl #16
        bl      __floatsisf
        str     r0, [r8, #4]
        ldrb    lr, [r9, #0xB]
        ldrb    r12, [r9, #0xA]
        ldrb    r3, [r9, #0xC]!
        orr     lr, r12, lr, lsl #8
        orr     r0, lr, r3, lsl #16
        bl      __floatsisf
        str     r0, [r8, #8]
        cmp     r6, r10
        add     r8, r8, #0x10
        ble     LCXE0
LCXE1:
        sub     r11, r11, #1
        add     r7, r11, r7
        add     r5, r5, r6, lsl #2
LCXE2:
        ldrb    r1, [r7, #2]
        ldrb    r3, [r7, #1]
        ldrb    r0, [r7, #3]!
        add     r6, r6, #1
        orr     r1, r3, r1, lsl #8
        orr     r0, r1, r0, lsl #16
        bl      __floatsisf
        str     r0, [r5], #4
        cmp     r6, r4
        blt     LCXE2
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LCXE3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


