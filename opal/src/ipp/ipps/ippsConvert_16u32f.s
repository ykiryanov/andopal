        .text
        .align  4
        .globl  _ippsConvert_16u32f


_ippsConvert_16u32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r9, r2
        beq     LCWQ7
        cmp     r4, #0
        beq     LCWQ7
        cmp     r9, #0
        ble     LCWQ6
        cmp     r9, #4
        mov     r8, #0
        blt     LCWQ1
        add     r12, r4, #8
        add     lr, r5, #4
        add     r6, r4, #0xC
        add     r3, r5, #6
        mov     r11, #4
        add     r10, r4, #4
        add     r7, r5, #2
        str     r3, [sp]
        str     r6, [sp, #4]
        str     lr, [sp, #8]
        str     r12, [sp, #0xC]
LCWQ0:
        mov     r6, r8, lsl #1
        ldrh    r0, [r5, +r6]
        bl      __floatunssisf
        str     r0, [r4, +r8, lsl #2]
        ldrh    r0, [r7, +r6]
        bl      __floatunssisf
        str     r0, [r10, +r8, lsl #2]
        ldr     r3, [sp, #8]
        ldrh    r0, [r3, +r6]
        bl      __floatunssisf
        ldr     r3, [sp, #0xC]
        str     r0, [r3, +r8, lsl #2]
        ldr     r3, [sp]
        ldrh    r0, [r3, +r6]
        bl      __floatunssisf
        ldr     r3, [sp, #4]
        str     r0, [r3, +r8, lsl #2]
        mov     r8, r11
        add     r11, r11, #4
        cmp     r9, r11
        bge     LCWQ0
LCWQ1:
        cmp     r8, r9
        bge     LCWQ5
        sub     r3, r9, r8
        cmp     r3, #6
        blt     LCWQ3
        sub     r3, r9, #6
        add     r7, r5, r8, lsl #1
        add     r6, r4, r8, lsl #2
        str     r3, [sp, #0xC]
        str     r9, [sp, #0x10]
LCWQ2:
        ldrh    r0, [r7], #0xA
        add     r10, r8, #1
        bl      __floatunssisf
        str     r0, [r6], #0x14
        mov     r2, r10, lsl #1
        ldrh    r0, [r5, +r2]
        add     r9, r8, #2
        bl      __floatunssisf
        str     r0, [r4, +r10, lsl #2]
        mov     r11, r9, lsl #1
        ldrh    r0, [r5, +r11]
        add     r10, r8, #3
        bl      __floatunssisf
        str     r0, [r4, +r9, lsl #2]
        mov     r2, r10, lsl #1
        ldrh    r0, [r5, +r2]
        add     r9, r8, #4
        add     r8, r8, #5
        bl      __floatunssisf
        str     r0, [r4, +r10, lsl #2]
        mov     r2, r9, lsl #1
        ldrh    r0, [r5, +r2]
        bl      __floatunssisf
        ldr     r2, [sp, #0xC]
        str     r0, [r4, +r9, lsl #2]
        cmp     r8, r2
        ble     LCWQ2
        ldr     r9, [sp, #0x10]
LCWQ3:
        add     r5, r5, r8, lsl #1
        add     r4, r4, r8, lsl #2
LCWQ4:
        ldrh    r0, [r5], #2
        add     r8, r8, #1
        bl      __floatunssisf
        str     r0, [r4], #4
        cmp     r8, r9
        blt     LCWQ4
LCWQ5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWQ6:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWQ7:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


