        .text
        .align  4
        .globl  _ippsMagnitude_32fc


_ippsMagnitude_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mov     r6, r2
        beq     LBIP3
        cmp     r5, #0
        beq     LBIP3
        cmp     r6, #0
        ble     LBIP4
        cmp     r6, #5
        mov     r7, #0
        blt     LBIP1
        sub     r12, r6, #5
        sub     r3, r4, #0x1C
        mov     lr, r5
        str     lr, [sp, #8]
        str     r3, [sp, #0xC]
        str     r12, [sp, #4]
        str     r6, [sp]
LBIP0:
        ldr     r2, [sp, #0xC]
        add     r8, r7, #1
        ldr     r0, [r2, #0x1C]
        bl      __extendsfdf2
        ldr     r12, [sp, #0xC]
        mov     r10, r1
        mov     r11, r0
        ldr     r1, [r12, #0x20]!
        str     r12, [sp, #0xC]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r6, r1
        mov     r9, r0
        mov     r1, r10
        mov     r3, r10
        mov     r0, r11
        mov     r2, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r1, r6
        mov     r3, r6
        mov     r0, r9
        mov     r2, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r2, [sp, #8]
        add     r6, r4, r8, lsl #3
        str     r0, [r2], #0x10
        ldr     r0, [r4, +r8, lsl #3]
        str     r2, [sp, #8]
        bl      __extendsfdf2
        ldr     r2, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        add     r6, r7, #3
        mov     r0, r2
        bl      __extendsfdf2
        str     r0, [sp, #0x10]
        mov     r9, r1
        mov     r1, r11
        mov     r3, r11
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x10]
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
        str     r0, [r5, +r8, lsl #2]
        add     r9, r7, #2
        ldr     r0, [r4, +r9, lsl #3]
        add     r2, r4, r6, lsl #3
        str     r2, [sp, #0x10]
        add     r8, r4, r9, lsl #3
        bl      __extendsfdf2
        ldr     r8, [r8, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        bl      __extendsfdf2
        str     r0, [sp, #0x14]
        mov     r8, r1
        mov     r1, r11
        mov     r3, r11
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x14]
        mov     r11, r1
        mov     r3, r8
        mov     r2, r0
        mov     r1, r8
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r5, +r9, lsl #2]
        ldr     r0, [r4, +r6, lsl #3]
        add     r7, r7, #4
        bl      __extendsfdf2
        ldr     r12, [sp, #0x10]
        mov     r11, r1
        mov     r10, r0
        ldr     r2, [r12, #4]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r2, [sp, #4]
        str     r0, [r5, +r6, lsl #2]
        cmp     r7, r2
        ble     LBIP0
        ldr     r6, [sp]
LBIP1:
        mov     r3, r7, lsl #3
        sub     r3, r3, #4
        add     r4, r3, r4
        add     r9, r5, r7, lsl #2
LBIP2:
        ldr     r0, [r4, #4]
        add     r7, r7, #1
        bl      __extendsfdf2
        ldr     r2, [r4, #8]!
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r8, r0
        mov     r5, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        mov     r1, r5
        mov     r2, r8
        mov     r3, r5
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r9], #4
        cmp     r7, r6
        blt     LBIP2
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBIP3:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBIP4:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


