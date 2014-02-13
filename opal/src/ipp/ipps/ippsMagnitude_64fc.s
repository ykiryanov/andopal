        .text
        .align  4
        .globl  _ippsMagnitude_64fc


_ippsMagnitude_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r7, r0
        cmp     r7, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBIN3
        cmp     r5, #0
        beq     LBIN3
        cmp     r4, #0
        ble     LBIN4
        cmp     r4, #5
        mov     r6, #0
        blt     LBIN1
        sub     r12, r4, #5
        sub     r3, r7, #0x34
        sub     lr, r5, #0x1C
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r12, [sp, #4]
        str     r4, [sp]
LBIN0:
        ldr     r12, [sp, #8]
        add     r11, r6, #1
        ldr     r8, [r12, #0x40]
        ldr     r4, [r12, #0x3C]
        ldr     r2, [r12, #0x34]
        ldr     r3, [r12, #0x38]
        add     r12, r12, #0x40
        str     r12, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r1, r8
        mov     r3, r8
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #0x1C]
        ldr     r2, [sp, #0xC]
        add     r12, r7, r11, lsl #4
        str     r1, [r2, #0x20]!
        str     r2, [sp, #0xC]
        ldr     r3, [r12, #4]
        ldr     r2, [r7, +r11, lsl #4]
        ldr     r10, [r12, #8]
        ldr     r4, [r12, #0xC]
        mov     r1, r3
        mov     r0, r2
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        str     r0, [r5, +r11, lsl #3]
        add     r11, r5, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r6, #2
        ldr     r0, [r7, +r11, lsl #4]
        add     r12, r7, r11, lsl #4
        ldr     r1, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r4, [r12, #0xC]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        str     r0, [r5, +r11, lsl #3]
        add     r11, r5, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r6, #3
        ldr     r2, [r7, +r11, lsl #4]
        add     r12, r7, r11, lsl #4
        ldr     r3, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r4, [r12, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        str     r0, [r5, +r11, lsl #3]
        ldr     r2, [sp, #4]
        add     r6, r6, #4
        add     r11, r5, r11, lsl #3
        cmp     r6, r2
        str     r1, [r11, #4]
        ble     LBIN0
        ldr     r4, [sp]
LBIN1:
        mov     r3, r6, lsl #4
        mov     r12, r6, lsl #3
        sub     r3, r3, #4
        sub     r12, r12, #4
        add     r7, r3, r7
        add     r11, r12, r5
LBIN2:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        ldr     r9, [r7, #0xC]
        ldr     r10, [r7, #0x10]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r5, r0
        mov     r8, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        add     r6, r6, #1
        str     r0, [r11, #4]
        str     r1, [r11, #8]!
        cmp     r6, r4
        blt     LBIN2
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIN3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBIN4:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


