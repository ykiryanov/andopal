        .text
        .align  4
        .globl  _ippsConvPartial_16s32s


_ippsConvPartial_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        beq     LDVC8
        cmp     r1, #0
        beq     LDVC8
        cmp     r2, #0
        beq     LDVC8
        cmp     r3, #0
        ble     LDVC6
        cmp     r3, #0
        ble     LDVC5
        mvn     r4, #0
        mvn     r5, #3
        mvn     lr, #1
        mvn     r12, #2
        mov     r8, #0
        str     r5, [sp]
        str     r4, [sp, #4]
LDVC0:
        cmp     r8, #0
        movlt   r9, #0
        blt     LDVC4
        cmp     r8, #6
        blt     LDVC7
        mov     r9, #0
        mov     r5, r9
        add     r4, r1, r8, lsl #1
        sub     r7, r8, #6
        mov     r6, r0
        str     r8, [sp, #8]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LDVC1:
        rsb     r0, r5, #0
        ldrsh   r3, [r6]
        mov     r0, r0, lsl #1
        ldrsh   r8, [r4, +r0]
        ldr     r0, [sp, #4]
        ldrsh   r1, [r6, #4]
        ldrsh   r10, [r6, #6]
        mla     r3, r3, r8, r9
        rsb     r2, r5, r0
        ldrsh   r0, [r6, #2]
        ldrsh   r9, [r6, #8]
        mov     r2, r2, lsl #1
        ldrsh   r11, [r4, +r2]
        rsb     r8, r5, r12
        rsb     r2, r5, lr
        mov     r8, r8, lsl #1
        mla     r3, r0, r11, r3
        ldrsh   r0, [r4, +r8]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r4, +r2]
        ldr     r8, [sp]
        add     r6, r6, #0xA
        mla     r3, r1, r2, r3
        rsb     r8, r5, r8
        add     r5, r5, #5
        mov     r8, r8, lsl #1
        ldrsh   r1, [r4, +r8]
        mla     r3, r10, r0, r3
        cmp     r5, r7
        mla     r9, r9, r1, r3
        ble     LDVC1
        ldr     r8, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LDVC2:
        add     r6, r0, r5, lsl #1
LDVC3:
        rsb     r10, r5, #0
        ldrsh   r7, [r6], #2
        mov     r10, r10, lsl #1
        ldrsh   r10, [r4, +r10]
        add     r5, r5, #1
        cmp     r5, r8
        mla     r9, r7, r10, r9
        ble     LDVC3
LDVC4:
        add     r8, r8, #1
        str     r9, [r2], #4
        cmp     r8, r3
        blt     LDVC0
LDVC5:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDVC6:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDVC7:
        mov     r9, #0
        mov     r5, r9
        add     r4, r1, r8, lsl #1
        b       LDVC2
LDVC8:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


