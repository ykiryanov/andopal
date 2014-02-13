        .text
        .align  4
        .globl  _ippsFIRSetTaps_32s


_ippsFIRSetTaps_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r4, r1
        cmp     r4, #0
        mov     r1, r0
        beq     LBTD4
        cmp     r1, #0
        beq     LBTD4
        ldr     r11, [r4, #0xC]
        cmp     r11, #0
        ble     LBTD3
        cmp     r11, #6
        mov     r0, #0
        sub     r2, r11, #1
        addlt   r5, r1, r2, lsl #2
        movlt   r10, r0
        blt     LBTD1
        add     r5, r1, r2, lsl #2
        sub     r2, r11, #6
        mvn     r1, #0
        mvn     lr, #1
        mvn     r12, #2
        mvn     r3, #3
        str     r11, [sp]
        mov     r10, r0
        mov     r9, #8
        mov     r8, #0x10
        mov     r7, #0x18
        mov     r6, #0x20
        str     r2, [sp, #4]
        str     r3, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r1, [sp, #0x14]
        mov     r11, r0
LBTD0:
        rsb     r2, r10, #0
        ldr     r0, [r5, +r2, lsl #2]
        ldr     r2, [sp, #0x14]
        rsb     r2, r10, r2
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #8]
        rsb     r2, r10, r2
        str     r2, [sp, #0x1C]
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        ldr     r2, [r4, #4]
        rsb     r3, r10, r3
        str     r3, [sp, #0x20]
        str     r0, [r2, +r10, lsl #3]
        add     r3, r2, r11
        str     r1, [r3, #4]
        ldr     r2, [sp, #0x18]
        add     r11, r11, #0x28
        ldr     r0, [r5, +r2, lsl #2]
        ldr     r2, [sp, #0x10]
        rsb     r2, r10, r2
        str     r2, [sp, #0x18]
        bl      __floatsidf
        ldr     r2, [r4, #4]
        str     r0, [r2, +r9]
        add     r2, r2, r9
        str     r1, [r2, #4]
        ldr     r2, [sp, #0x1C]
        add     r10, r10, #5
        add     r9, r9, #0x28
        ldr     r0, [r5, +r2, lsl #2]
        bl      __floatsidf
        ldr     r2, [r4, #4]
        str     r0, [r2, +r8]
        add     r2, r2, r8
        str     r1, [r2, #4]
        ldr     r2, [sp, #0x20]
        add     r8, r8, #0x28
        ldr     r0, [r5, +r2, lsl #2]
        bl      __floatsidf
        ldr     r2, [r4, #4]
        str     r0, [r2, +r7]
        add     r2, r2, r7
        str     r1, [r2, #4]
        ldr     r2, [sp, #0x18]
        add     r7, r7, #0x28
        ldr     r0, [r5, +r2, lsl #2]
        bl      __floatsidf
        ldr     r2, [r4, #4]
        ldr     r3, [sp, #4]
        str     r0, [r2, +r6]
        add     r2, r2, r6
        cmp     r10, r3
        str     r1, [r2, #4]
        add     r6, r6, #0x28
        ble     LBTD0
        ldr     r11, [sp]
LBTD1:
        mov     r6, r10, lsl #3
LBTD2:
        rsb     r0, r10, #0
        ldr     r0, [r5, +r0, lsl #2]
        bl      __floatsidf
        ldr     r2, [r4, #4]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r10, #1
        add     r2, r2, r6
        cmp     r10, r11
        str     r1, [r2, #4]
        add     r6, r6, #8
        blt     LBTD2
LBTD3:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBTD4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


