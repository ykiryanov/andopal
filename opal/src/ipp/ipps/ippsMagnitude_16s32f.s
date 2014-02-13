        .text
        .align  4
        .globl  _ippsMagnitude_16s32f


_ippsMagnitude_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        beq     LBIS3
        cmp     r5, #0
        beq     LBIS3
        cmp     r2, #0
        beq     LBIS3
        cmp     r3, #0
        ble     LBIS4
        cmp     r3, #5
        mov     r6, #0
        blt     LBIS1
        sub     r7, r3, #5
        mov     lr, r4
        mov     r12, r5
        mov     r8, r2
        str     r8, [sp, #8]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r7, [sp, #4]
        str     r3, [sp]
        str     r2, [sp, #0x14]
LBIS0:
        ldr     r2, [sp, #0x10]
        add     r8, r6, #1
        ldrsh   r0, [r2], #8
        str     r2, [sp, #0x10]
        bl      __floatsidf
        ldr     r12, [sp, #0xC]
        mov     r10, r1
        mov     r11, r0
        ldrsh   r1, [r12], #8
        str     r12, [sp, #0xC]
        mov     r0, r1
        bl      __floatsidf
        mov     r9, r0
        mov     r7, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r11
        mov     r2, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r2, [sp, #8]
        mov     r9, r8, lsl #1
        str     r0, [r2], #0x10
        str     r2, [sp, #8]
        ldrsh   r0, [r4, +r9]
        add     r7, r6, #2
        bl      __floatsidf
        ldrsh   r9, [r5, +r9]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        bl      __floatsidf
        str     r0, [sp, #0x18]
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r2, [sp, #0x14]
        mov     r9, r7, lsl #1
        str     r0, [r2, +r8, lsl #2]
        ldrsh   r0, [r4, +r9]
        add     r8, r6, #3
        add     r6, r6, #4
        bl      __floatsidf
        ldrsh   r9, [r5, +r9]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        bl      __floatsidf
        str     r0, [sp, #0x18]
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x18]
        mov     r11, r1
        mov     r3, r9
        mov     r2, r0
        mov     r1, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r2, [sp, #0x14]
        str     r0, [r2, +r7, lsl #2]
        mov     r7, r8, lsl #1
        ldrsh   r0, [r4, +r7]
        bl      __floatsidf
        ldrsh   r7, [r5, +r7]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        bl      __floatsidf
        mov     r9, r0
        mov     r7, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r2, [sp, #4]
        cmp     r6, r2
        ldr     r2, [sp, #0x14]
        str     r0, [r2, +r8, lsl #2]
        ble     LBIS0
        ldr     r3, [sp]
        ldr     r2, [sp, #0x14]
LBIS1:
        add     r4, r4, r6, lsl #1
        add     r9, r5, r6, lsl #1
        add     r8, r2, r6, lsl #2
        str     r3, [sp]
LBIS2:
        ldrsh   r0, [r4], #2
        add     r6, r6, #1
        bl      __floatsidf
        ldrsh   r2, [r9], #2
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r7, r0
        mov     r5, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        mov     r1, r5
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r8], #4
        ldr     r0, [sp]
        cmp     r6, r0
        blt     LBIS2
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIS3:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIS4:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


