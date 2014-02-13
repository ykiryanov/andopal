        .text
        .align  4
        .globl  _ippsDotProd_32f32fc64fc


_ippsDotProd_32f32fc64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LCHA6
        cmp     r4, #0
        beq     LCHA6
        cmp     r3, #0
        beq     LCHA6
        cmp     r2, #0
        ble     LCHA7
        cmp     r2, #0
        mov     r7, #0
        ble     LCHA5
        cmp     r2, #5
        blt     LCHA4
        mov     r8, r7
        mov     r12, r8
        mov     r10, r12
        mov     r9, r10
        sub     lr, r2, #5
        mov     r11, r5
        sub     r6, r4, #0x1C
        str     r12, [sp]
        str     r8, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
LCHA0:
        ldr     r2, [sp, #0x10]
        add     r10, r7, #2
        add     r9, r7, #1
        ldr     r0, [r2], #0x10
        str     r2, [sp, #0x10]
        bl      __extendsfdf2
        mov     r8, r0
        ldr     r0, [r6, #0x1C]
        mov     r11, r1
        add     r12, r4, r9, lsl #3
        str     r12, [sp, #0x20]
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r2, [r6, #0x20]!
        str     r0, [sp, #0x14]
        add     r12, r4, r10, lsl #3
        str     r12, [sp, #0x24]
        str     r1, [sp]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [r5, +r9, lsl #2]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        add     r8, r7, #3
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [r4, +r9, lsl #3]
        mov     r9, r0
        mov     r11, r1
        add     r12, r4, r8, lsl #3
        str     r12, [sp, #0x28]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x14]
        add     r7, r7, #4
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [r5, +r10, lsl #2]
        str     r0, [sp, #0x1C]
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [r4, +r10, lsl #3]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x20]
        bl      __adddf3
        ldr     r12, [sp, #0x24]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x20]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r5, +r8, lsl #2]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [r4, +r8, lsl #3]
        mov     r8, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x14]
        str     r1, [sp]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r11
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        cmp     r7, r2
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        ble     LCHA0
        ldr     r12, [sp]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
LCHA1:
        mov     lr, r7, lsl #3
        sub     lr, lr, #4
        add     r4, lr, r4
        add     r5, r5, r7, lsl #2
        str     r12, [sp]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
LCHA2:
        ldr     r0, [r5], #4
        add     r7, r7, #1
        bl      __extendsfdf2
        ldr     r2, [r4, #4]
        mov     r6, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r11
        bl      __muldf3
        ldr     r3, [sp]
        mov     r2, r8
        bl      __adddf3
        str     r1, [sp]
        mov     r8, r0
        ldr     r0, [r4, #8]!
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r11
        bl      __muldf3
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #4]
        mov     r10, r0
        mov     r9, r1
        cmp     r7, r12
        blt     LCHA2
        ldr     r12, [sp]
        ldr     r3, [sp, #8]
LCHA3:
        mov     r0, #0
        str     r8, [r3]
        str     r12, [r3, #4]
        str     r10, [r3, #8]
        str     r9, [r3, #0xC]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCHA4:
        mov     r8, r7
        mov     r12, r8
        mov     r10, r12
        mov     r9, r10
        b       LCHA1
LCHA5:
        mov     r8, r7
        mov     r12, r8
        mov     r10, r12
        mov     r9, r10
        b       LCHA3
LCHA6:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCHA7:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


