        .text
        .align  4
        .globl  _ippsSqr_32f


_ippsSqr_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAWQ7
        cmp     r5, #0
        beq     LAWQ7
        cmp     r4, #0
        ble     LAWQ6
        cmp     r4, #4
        mov     r7, #0
        blt     LAWQ1
        add     r3, r5, #8
        add     r12, r6, #8
        add     lr, r5, #0xC
        mov     r11, #4
        add     r10, r5, #4
        add     r9, r6, #4
        add     r8, r6, #0xC
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r3, [sp, #8]
LAWQ0:
        ldr     r1, [r6, +r7, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r5, +r7, lsl #2]
        ldr     r1, [r9, +r7, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r10, +r7, lsl #2]
        ldr     r3, [sp, #4]
        ldr     r1, [r3, +r7, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        ldr     r3, [sp, #8]
        str     r0, [r3, +r7, lsl #2]
        ldr     r1, [r8, +r7, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        ldr     r3, [sp]
        str     r0, [r3, +r7, lsl #2]
        mov     r7, r11
        add     r11, r11, #4
        cmp     r4, r11
        bge     LAWQ0
LAWQ1:
        cmp     r7, r4
        bge     LAWQ5
        sub     r3, r4, r7
        cmp     r3, #6
        blt     LAWQ3
        mov     r3, r7, lsl #2
        add     r3, r3, #4
        sub     r10, r4, #6
        add     r9, r3, r6
        add     r8, r3, r5
LAWQ2:
        ldr     r0, [r9, #-4]
        add     r7, r7, #5
        mov     r1, r0
        bl      __mulsf3
        str     r0, [r8, #-4]
        ldr     r1, [r9]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r8]
        ldr     r1, [r9, #4]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r8, #4]
        ldr     r1, [r9, #8]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r8, #8]
        ldr     r1, [r9, #0xC]
        add     r9, r9, #0x14
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r8, #0xC]
        cmp     r7, r10
        add     r8, r8, #0x14
        ble     LAWQ2
LAWQ3:
        add     r6, r6, r7, lsl #2
        add     r5, r5, r7, lsl #2
LAWQ4:
        ldr     r1, [r6], #4
        add     r7, r7, #1
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r5], #4
        cmp     r7, r4
        blt     LAWQ4
LAWQ5:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAWQ6:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAWQ7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


