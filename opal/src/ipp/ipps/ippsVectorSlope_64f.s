        .text
        .align  4
        .globl  _ippsVectorSlope_64f


_ippsVectorSlope_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x30]
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r5, r2
        mov     r4, r3
        beq     LAXU4
        cmp     r9, #0
        ble     LAXU3
        cmp     r9, #6
        mov     r8, #0
        blt     LAXU1
        sub     r12, r9, #6
        sub     r11, r10, #0x24
        str     r12, [sp, #4]
        str     r9, [sp]
LAXU0:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [r11, #0x24]
        add     r9, r8, #1
        str     r1, [r11, #0x28]!
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [r10, +r9, lsl #3]
        add     r9, r10, r9, lsl #3
        str     r1, [r9, #4]
        add     r9, r8, #2
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [r10, +r9, lsl #3]
        add     r9, r10, r9, lsl #3
        str     r1, [r9, #4]
        add     r9, r8, #3
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [r10, +r9, lsl #3]
        add     r9, r10, r9, lsl #3
        str     r1, [r9, #4]
        add     r9, r8, #4
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #4]
        str     r0, [r10, +r9, lsl #3]
        add     r8, r8, #5
        add     r9, r10, r9, lsl #3
        cmp     r8, r12
        str     r1, [r9, #4]
        ble     LAXU0
        ldr     r9, [sp]
LAXU1:
        mov     r12, r8, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r10
LAXU2:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        add     r8, r8, #1
        str     r0, [r10, #4]
        str     r1, [r10, #8]!
        cmp     r8, r9
        blt     LAXU2
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAXU3:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAXU4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


