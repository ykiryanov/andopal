        .text
        .align  4
        .globl  _ippsConvert_32s32f_Sfs


_ippsConvert_32s32f_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r12, sp
        mov     r6, r1
        mov     r5, r2
        beq     LCWZ9
        cmp     r6, #0
        beq     LCWZ9
        cmp     r5, #0
        ble     LCWZ10
        cmp     r3, #0
        mov     r8, #0
        bne     LCWZ3
        cmp     r5, #6
        blt     LCWZ1
        sub     r10, r5, #6
        add     r9, r7, #4
        add     r4, r6, #4
LCWZ0:
        ldr     r0, [r9, #-4]
        add     r8, r8, #5
        bl      __floatsisf
        str     r0, [r4, #-4]
        ldr     r0, [r9]
        bl      __floatsisf
        str     r0, [r4]
        ldr     r0, [r9, #4]
        bl      __floatsisf
        str     r0, [r4, #4]
        ldr     r0, [r9, #8]
        bl      __floatsisf
        str     r0, [r4, #8]
        ldr     r0, [r9, #0xC]
        add     r9, r9, #0x14
        bl      __floatsisf
        str     r0, [r4, #0xC]
        cmp     r8, r10
        add     r4, r4, #0x14
        ble     LCWZ0
LCWZ1:
        add     r7, r7, r8, lsl #2
        add     r6, r6, r8, lsl #2
LCWZ2:
        ldr     r0, [r7], #4
        add     r8, r8, #1
        bl      __floatsisf
        str     r0, [r6], #4
        cmp     r8, r5
        blt     LCWZ2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCWZ3:
        cmp     r3, #0
        ble     LCWZ8
        mov     lr, #0x7E
        cmp     r3, #0x7E
        movlt   lr, r3
LCWZ4:
        rsb     lr, lr, #0x7F
        cmp     r5, #6
        mov     lr, lr, lsl #23
        str     lr, [r12]
        ldrlt   r4, [sp]
        blt     LCWZ6
        ldr     r4, [sp]
        sub     r11, r5, #6
        add     r10, r7, #4
        add     r9, r6, #4
LCWZ5:
        ldr     r0, [r10, #-4]
        add     r8, r8, #5
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r9, #-4]
        ldr     r0, [r10]
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r9]
        ldr     r0, [r10, #4]
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r9, #4]
        ldr     r0, [r10, #8]
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r9, #8]
        ldr     r0, [r10, #0xC]
        add     r10, r10, #0x14
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r9, #0xC]
        cmp     r8, r11
        add     r9, r9, #0x14
        ble     LCWZ5
LCWZ6:
        add     r7, r7, r8, lsl #2
        add     r6, r6, r8, lsl #2
LCWZ7:
        ldr     r0, [r7], #4
        add     r8, r8, #1
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r6], #4
        cmp     r8, r5
        blt     LCWZ7
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCWZ8:
        mvn     lr, #0x5F
        cmp     r3, lr
        movgt   lr, r3
        b       LCWZ4
LCWZ9:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LCWZ10:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


