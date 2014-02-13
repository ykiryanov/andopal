        .text
        .align  4
        .globl  _ippsConvert_32s64f


_ippsConvert_32s64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        cmp     r0, #0
        mov     r4, r2
        beq     LCWI7
        cmp     r1, #0
        beq     LCWI7
        cmp     r4, #0
        ble     LCWI6
        subs    r3, r4, #4
        mov     r11, #0
        bmi     LCWI1
        add     r2, r0, #4
        sub     r12, r1, #0x1C
        str     r4, [sp, #8]
        add     r10, r0, #8
        add     r9, r0, #0xC
        sub     r8, r1, #4
        sub     r7, r1, #0xC
        sub     r6, r1, #0x14
        mov     r5, r0
        str     r12, [sp]
        str     r3, [sp, #4]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r4, r2
LCWI0:
        ldr     r0, [r5], #0x10
        add     r11, r11, #4
        bl      __floatsidf
        ldr     r3, [sp]
        str     r0, [r3, #0x1C]
        str     r1, [r3, #0x20]!
        str     r3, [sp]
        ldr     r0, [r4], #0x10
        bl      __floatsidf
        str     r0, [r6, #0x1C]
        str     r1, [r6, #0x20]!
        ldr     r0, [r10], #0x10
        bl      __floatsidf
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]!
        ldr     r0, [r9], #0x10
        bl      __floatsidf
        str     r0, [r8, #0x1C]
        str     r1, [r8, #0x20]!
        ldr     r0, [sp, #4]
        cmp     r11, r0
        ble     LCWI0
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LCWI1:
        cmp     r11, r4
        bge     LCWI5
        sub     r3, r4, r11
        cmp     r3, #6
        blt     LCWI3
        mov     r3, r11, lsl #3
        sub     r3, r3, #0x24
        sub     r6, r4, #6
        str     r4, [sp, #8]
        add     r5, r3, r1
        add     r7, r0, r11, lsl #2
        mov     r8, r0
        mov     r4, r1
LCWI2:
        ldr     r0, [r7], #0x14
        add     r9, r11, #1
        bl      __floatsidf
        str     r0, [r5, #0x24]
        str     r1, [r5, #0x28]!
        ldr     r0, [r8, +r9, lsl #2]
        bl      __floatsidf
        str     r0, [r4, +r9, lsl #3]
        add     r9, r4, r9, lsl #3
        str     r1, [r9, #4]
        add     r9, r11, #2
        ldr     r0, [r8, +r9, lsl #2]
        add     r10, r4, r9, lsl #3
        bl      __floatsidf
        str     r0, [r4, +r9, lsl #3]
        str     r1, [r10, #4]
        add     r9, r11, #3
        ldr     r0, [r8, +r9, lsl #2]
        add     r10, r4, r9, lsl #3
        bl      __floatsidf
        str     r0, [r4, +r9, lsl #3]
        str     r1, [r10, #4]
        add     r9, r11, #4
        ldr     r0, [r8, +r9, lsl #2]
        add     r11, r11, #5
        bl      __floatsidf
        str     r0, [r4, +r9, lsl #3]
        add     r9, r4, r9, lsl #3
        cmp     r11, r6
        str     r1, [r9, #4]
        ble     LCWI2
        mov     r1, r4
        mov     r0, r8
        ldr     r4, [sp, #8]
LCWI3:
        mov     r3, r11, lsl #3
        sub     r3, r3, #4
        add     r5, r3, r1
        add     r6, r0, r11, lsl #2
LCWI4:
        ldr     r0, [r6], #4
        add     r11, r11, #1
        bl      __floatsidf
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        cmp     r11, r4
        blt     LCWI4
LCWI5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWI6:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWI7:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


