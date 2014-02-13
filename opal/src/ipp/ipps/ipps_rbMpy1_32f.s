        .text
        .align  4
        .globl  _ipps_rbMpy1_32f


_ipps_rbMpy1_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r5, r2
        sub     r3, r5, #3
        cmp     r3, #0
        mov     r4, r0
        mov     r6, r1
        mov     r7, #0
        ble     LBYQ1
        add     r11, r6, #4
        add     r10, r6, #8
        add     r9, r6, #0xC
        mov     r8, r6
        str     r3, [sp]
        str     r5, [sp, #4]
        str     r6, [sp, #8]
LBYQ0:
        ldr     r0, [r8]
        mov     r1, r4
        add     r7, r7, #4
        bl      __mulsf3
        str     r0, [sp, #0xC]
        ldr     r0, [r11]
        mov     r1, r4
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [r10]
        mov     r1, r4
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [r9]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0xC]
        str     r2, [r8], #0x10
        str     r5, [r11], #0x10
        str     r6, [r10], #0x10
        str     r0, [r9], #0x10
        ldr     r2, [sp]
        cmp     r7, r2
        blt     LBYQ0
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #8]
LBYQ1:
        cmp     r7, r5
        bge     LBYQ5
        sub     r3, r5, r7
        cmp     r3, #6
        blt     LBYQ3
        mov     r3, r7, lsl #2
        add     r3, r3, #4
        add     r8, r3, r6
        sub     r9, r5, #6
LBYQ2:
        ldr     r0, [r8, #-4]
        mov     r1, r4
        add     r7, r7, #5
        bl      __mulsf3
        ldr     r2, [r8]
        str     r0, [r8, #-4]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r8, #4]
        str     r0, [r8]
        mov     r0, r1
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r8, #8]
        str     r0, [r8, #4]
        mov     r0, r1
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r8, #0xC]
        str     r0, [r8, #8]
        mov     r0, r1
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r8, #0xC]
        cmp     r7, r9
        add     r8, r8, #0x14
        ble     LBYQ2
LBYQ3:
        add     r6, r6, r7, lsl #2
LBYQ4:
        ldr     r0, [r6]
        mov     r1, r4
        add     r7, r7, #1
        bl      __mulsf3
        str     r0, [r6], #4
        cmp     r7, r5
        blt     LBYQ4
LBYQ5:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


