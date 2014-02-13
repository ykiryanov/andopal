        .text
        .align  4
        .globl  _ippsConvert_16s32f_Sfs


_ippsConvert_16s32f_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r8, r2
        beq     LCXC9
        cmp     r4, #0
        beq     LCXC9
        cmp     r8, #0
        ble     LCXC10
        cmp     r3, #0
        add     r12, sp, #0xC
        mov     r6, #0
        bne     LCXC3
        cmp     r8, #6
        blt     LCXC1
        sub     r3, r8, #6
        mov     r9, r5
        mov     r7, r4
        str     r3, [sp, #4]
        str     r8, [sp, #8]
LCXC0:
        ldrsh   r0, [r9], #0xA
        add     r10, r6, #1
        bl      __floatsisf
        str     r0, [r7], #0x14
        mov     r2, r10, lsl #1
        ldrsh   r0, [r5, +r2]
        add     r8, r6, #2
        bl      __floatsisf
        str     r0, [r4, +r10, lsl #2]
        mov     r11, r8, lsl #1
        ldrsh   r0, [r5, +r11]
        add     r10, r6, #3
        bl      __floatsisf
        str     r0, [r4, +r8, lsl #2]
        mov     r2, r10, lsl #1
        ldrsh   r0, [r5, +r2]
        add     r8, r6, #4
        add     r6, r6, #5
        bl      __floatsisf
        str     r0, [r4, +r10, lsl #2]
        mov     r2, r8, lsl #1
        ldrsh   r0, [r5, +r2]
        bl      __floatsisf
        ldr     r2, [sp, #4]
        str     r0, [r4, +r8, lsl #2]
        cmp     r6, r2
        ble     LCXC0
        ldr     r8, [sp, #8]
LCXC1:
        add     r5, r5, r6, lsl #1
        add     r4, r4, r6, lsl #2
LCXC2:
        ldrsh   r0, [r5], #2
        add     r6, r6, #1
        bl      __floatsisf
        str     r0, [r4], #4
        cmp     r6, r8
        blt     LCXC2
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCXC3:
        cmp     r3, #0
        ble     LCXC8
        mov     lr, #0x7E
        cmp     r3, #0x7E
        movlt   lr, r3
LCXC4:
        rsb     lr, lr, #0x7F
        cmp     r8, #6
        mov     lr, lr, lsl #23
        str     lr, [r12]
        ldrlt   r7, [sp, #0xC]
        blt     LCXC6
        ldr     r7, [sp, #0xC]
        sub     r3, r8, #6
        mov     r12, r4
        mov     r9, r5
        str     r12, [sp]
        str     r3, [sp, #4]
        str     r8, [sp, #8]
LCXC5:
        ldrsh   r0, [r9], #0xA
        add     r11, r6, #1
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [sp]
        add     r8, r6, #2
        str     r0, [r2], #0x14
        str     r2, [sp]
        mov     r2, r11, lsl #1
        ldrsh   r0, [r5, +r2]
        add     r10, r6, #3
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        str     r0, [r4, +r11, lsl #2]
        mov     r2, r8, lsl #1
        ldrsh   r0, [r5, +r2]
        mov     r11, r10, lsl #1
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        str     r0, [r4, +r8, lsl #2]
        ldrsh   r0, [r5, +r11]
        add     r8, r6, #4
        add     r6, r6, #5
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        str     r0, [r4, +r10, lsl #2]
        mov     r2, r8, lsl #1
        ldrsh   r0, [r5, +r2]
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [sp, #4]
        str     r0, [r4, +r8, lsl #2]
        cmp     r6, r2
        ble     LCXC5
        ldr     r8, [sp, #8]
LCXC6:
        add     r5, r5, r6, lsl #1
        add     r4, r4, r6, lsl #2
LCXC7:
        ldrsh   r0, [r5], #2
        add     r6, r6, #1
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        str     r0, [r4], #4
        cmp     r6, r8
        blt     LCXC7
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCXC8:
        mvn     lr, #0x6F
        cmp     r3, lr
        movgt   lr, r3
        b       LCXC4
LCXC9:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCXC10:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


