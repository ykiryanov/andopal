        .text
        .align  4
        .globl  _ippsMagnitude_32f


_ippsMagnitude_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        cmp     r0, #0
        beq     LBIQ3
        cmp     r1, #0
        beq     LBIQ3
        cmp     r2, #0
        beq     LBIQ3
        cmp     r3, #0
        ble     LBIQ4
        cmp     r3, #5
        mov     r7, #0
        blt     LBIQ1
        sub     r12, r3, #5
        add     r6, r0, #4
        add     r5, r1, #4
        add     r4, r2, #4
        str     r12, [sp, #0x10]
        str     r3, [sp]
        str     r2, [sp, #0xC]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
LBIQ0:
        ldr     r0, [r6, #-4]
        add     r7, r7, #4
        bl      __extendsfdf2
        mov     r10, r0
        ldr     r0, [r5, #-4]
        mov     r11, r1
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r3, r11
        mov     r1, r11
        mov     r2, r10
        mov     r0, r10
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
        str     r0, [r4, #-4]
        ldr     r0, [r6]
        bl      __extendsfdf2
        mov     r10, r0
        ldr     r0, [r5]
        mov     r11, r1
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r3, r11
        mov     r1, r11
        mov     r2, r10
        mov     r0, r10
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
        str     r0, [r4]
        ldr     r0, [r6, #4]
        bl      __extendsfdf2
        mov     r11, r1
        mov     r10, r0
        ldr     r0, [r5, #4]
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r1, r11
        mov     r3, r11
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        mov     r11, r1
        mov     r10, r0
        mov     r2, r9
        mov     r3, r8
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r4, #4]
        ldr     r0, [r6, #8]
        add     r6, r6, #0x10
        bl      __extendsfdf2
        mov     r10, r1
        ldr     r1, [r5, #8]
        mov     r11, r0
        add     r5, r5, #0x10
        mov     r0, r1
        bl      __extendsfdf2
        mov     r9, r0
        mov     r8, r1
        mov     r2, r11
        mov     r0, r11
        mov     r3, r10
        mov     r1, r10
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
        str     r0, [r4, #8]
        ldr     r0, [sp, #0x10]
        add     r4, r4, #0x10
        cmp     r7, r0
        ble     LBIQ0
        ldr     r3, [sp]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
LBIQ1:
        add     r9, r0, r7, lsl #2
        add     r8, r1, r7, lsl #2
        add     r6, r2, r7, lsl #2
        str     r3, [sp]
LBIQ2:
        ldr     r0, [r9], #4
        add     r7, r7, #1
        bl      __extendsfdf2
        ldr     r2, [r8], #4
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        mov     r2, r10
        mov     r0, r10
        mov     r3, r11
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r5
        mov     r1, r4
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r6], #4
        ldr     r0, [sp]
        cmp     r7, r0
        blt     LBIQ2
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIQ3:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIQ4:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


