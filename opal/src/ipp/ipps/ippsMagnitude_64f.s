        .text
        .align  4
        .globl  _ippsMagnitude_64f


_ippsMagnitude_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        cmp     r0, #0
        beq     LBIO3
        cmp     r1, #0
        beq     LBIO3
        cmp     r2, #0
        beq     LBIO3
        cmp     r3, #0
        ble     LBIO4
        cmp     r3, #5
        mov     r4, #0
        blt     LBIO1
        sub     r12, r3, #5
        sub     r7, r2, #4
        sub     r6, r1, #4
        sub     r5, r0, #4
        str     r12, [sp, #0x10]
        str     r3, [sp]
        str     r2, [sp, #0xC]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
LBIO0:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]
        ldr     r8, [r6, #4]
        ldr     r9, [r6, #8]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        str     r0, [r7, #4]
        str     r1, [r7, #8]
        ldr     r9, [r6, #0xC]
        ldr     r8, [r6, #0x10]
        ldr     r2, [r5, #0xC]
        ldr     r3, [r5, #0x10]
        add     r4, r4, #4
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]
        ldr     r0, [r5, #0x14]
        ldr     r1, [r5, #0x18]
        ldr     r10, [r6, #0x14]
        ldr     r11, [r6, #0x18]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r2, r10
        mov     r3, r11
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        str     r0, [r7, #0x14]
        str     r1, [r7, #0x18]
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0x20]!
        ldr     r10, [r6, #0x1C]
        ldr     r11, [r6, #0x20]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]!
        ldr     r0, [sp, #0x10]
        cmp     r4, r0
        ble     LBIO0
        ldr     r3, [sp]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
LBIO1:
        mov     r12, r4, lsl #3
        sub     r12, r12, #4
        add     r6, r12, r2
        add     r5, r12, r1
        add     r11, r12, r0
        str     r3, [sp]
LBIO2:
        ldr     r2, [r11, #4]
        ldr     r3, [r11, #8]!
        ldr     r9, [r5, #4]
        ldr     r10, [r5, #8]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        str     r0, [r6, #4]
        str     r1, [r6, #8]!
        ldr     r0, [sp]
        add     r4, r4, #1
        cmp     r4, r0
        blt     LBIO2
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIO3:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBIO4:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


