        .text
        .align  4
        .globl  _ippsConvert_16s32f


_ippsConvert_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r9, r2
        beq     LCWR7
        cmp     r4, #0
        beq     LCWR7
        cmp     r9, #0
        ble     LCWR6
        cmp     r9, #4
        mov     r8, #0
        blt     LCWR1
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
LCWR0:
        mov     r6, r8, lsl #1
        ldrsh   r0, [r5, +r6]
        bl      __floatsisf
        str     r0, [r4, +r8, lsl #2]
        ldrsh   r0, [r7, +r6]
        bl      __floatsisf
        str     r0, [r10, +r8, lsl #2]
        ldr     r3, [sp, #8]
        ldrsh   r0, [r3, +r6]
        bl      __floatsisf
        ldr     r3, [sp, #0xC]
        str     r0, [r3, +r8, lsl #2]
        ldr     r3, [sp]
        ldrsh   r0, [r3, +r6]
        bl      __floatsisf
        ldr     r3, [sp, #4]
        str     r0, [r3, +r8, lsl #2]
        mov     r8, r11
        add     r11, r11, #4
        cmp     r9, r11
        bge     LCWR0
LCWR1:
        cmp     r8, r9
        bge     LCWR5
        sub     r3, r9, r8
        cmp     r3, #6
        blt     LCWR3
        sub     r3, r9, #6
        add     r7, r5, r8, lsl #1
        add     r6, r4, r8, lsl #2
        str     r3, [sp, #0xC]
        str     r9, [sp, #0x10]
LCWR2:
        ldrsh   r0, [r7], #0xA
        add     r10, r8, #1
        bl      __floatsisf
        str     r0, [r6], #0x14
        mov     r2, r10, lsl #1
        ldrsh   r0, [r5, +r2]
        add     r9, r8, #2
        bl      __floatsisf
        str     r0, [r4, +r10, lsl #2]
        mov     r11, r9, lsl #1
        ldrsh   r0, [r5, +r11]
        add     r10, r8, #3
        bl      __floatsisf
        str     r0, [r4, +r9, lsl #2]
        mov     r2, r10, lsl #1
        ldrsh   r0, [r5, +r2]
        add     r9, r8, #4
        add     r8, r8, #5
        bl      __floatsisf
        str     r0, [r4, +r10, lsl #2]
        mov     r2, r9, lsl #1
        ldrsh   r0, [r5, +r2]
        bl      __floatsisf
        ldr     r2, [sp, #0xC]
        str     r0, [r4, +r9, lsl #2]
        cmp     r8, r2
        ble     LCWR2
        ldr     r9, [sp, #0x10]
LCWR3:
        add     r5, r5, r8, lsl #1
        add     r4, r4, r8, lsl #2
LCWR4:
        ldrsh   r0, [r5], #2
        add     r8, r8, #1
        bl      __floatsisf
        str     r0, [r4], #4
        cmp     r8, r9
        blt     LCWR4
LCWR5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWR6:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWR7:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


