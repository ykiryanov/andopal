        .text
        .align  4
        .globl  _ippsMagnitude_16sc32f


_ippsMagnitude_16sc32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        cmp     r0, #0
        mov     r4, r2
        beq     LBIR3
        cmp     r1, #0
        beq     LBIR3
        cmp     r4, #0
        ble     LBIR4
        cmp     r4, #5
        mov     r8, #0
        blt     LBIR1
        sub     r7, r4, #5
        sub     r6, r0, #2
        add     r5, r1, #4
        str     r4, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBIR0:
        ldrsh   r0, [r6, #2]
        add     r8, r8, #4
        bl      __floatsidf
        ldrsh   r2, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r9, r0
        mov     r4, r1
        mov     r3, r11
        mov     r1, r11
        mov     r2, r10
        mov     r0, r10
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r5, #-4]
        ldrsh   r0, [r6, #6]
        bl      __floatsidf
        ldrsh   r2, [r6, #8]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r9, r0
        mov     r4, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r1, r4
        mov     r3, r4
        mov     r0, r9
        mov     r2, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r5]
        ldrsh   r0, [r6, #0xA]
        bl      __floatsidf
        ldrsh   r2, [r6, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r4, r1
        mov     r9, r0
        mov     r1, r11
        mov     r3, r11
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        mov     r11, r1
        mov     r10, r0
        mov     r2, r9
        mov     r0, r9
        mov     r3, r4
        mov     r1, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r5, #4]
        ldrsh   r0, [r6, #0xE]
        bl      __floatsidf
        ldrsh   r2, [r6, #0x10]!
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r9, r0
        mov     r4, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r5, #8]
        cmp     r8, r7
        add     r5, r5, #0x10
        ble     LBIR0
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBIR1:
        mov     r3, r8, lsl #2
        sub     r3, r3, #2
        add     r9, r3, r0
        add     r7, r1, r8, lsl #2
LBIR2:
        ldrsh   r0, [r9, #2]
        add     r8, r8, #1
        bl      __floatsidf
        ldrsh   r2, [r9, #4]!
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r6, r0
        mov     r5, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r6
        mov     r1, r5
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r7], #4
        cmp     r8, r4
        blt     LBIR2
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBIR3:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBIR4:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


