        .text
        .align  4
        .globl  _ippsSqr_64f


_ippsSqr_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        cmp     r0, #0
        mov     r4, r2
        beq     LAWM7
        cmp     r1, #0
        beq     LAWM7
        cmp     r4, #0
        ble     LAWM6
        subs    r3, r4, #4
        mov     r11, #0
        bmi     LAWM1
        sub     r2, r1, #4
        sub     r12, r1, #0x1C
        str     r4, [sp, #8]
        sub     r10, r0, #4
        sub     r9, r1, #0xC
        sub     r8, r0, #0xC
        sub     r7, r1, #0x14
        sub     r6, r0, #0x14
        sub     r5, r0, #0x1C
        str     r12, [sp]
        str     r3, [sp, #4]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r4, r2
LAWM0:
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0x20]!
        add     r11, r11, #4
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r3, [sp]
        str     r0, [r3, #0x1C]
        str     r1, [r3, #0x20]!
        str     r3, [sp]
        ldr     r2, [r6, #0x1C]
        ldr     r3, [r6, #0x20]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]!
        ldr     r2, [r8, #0x1C]
        ldr     r3, [r8, #0x20]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]!
        ldr     r2, [r10, #0x1C]
        ldr     r3, [r10, #0x20]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r4, #0x1C]
        str     r1, [r4, #0x20]!
        ldr     r0, [sp, #4]
        cmp     r11, r0
        ble     LAWM0
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LAWM1:
        cmp     r11, r4
        bge     LAWM5
        sub     r3, r4, r11
        cmp     r3, #6
        blt     LAWM3
        mov     r3, r11, lsl #3
        sub     r3, r3, #4
        sub     r7, r4, #6
        add     r6, r3, r1
        add     r5, r3, r0
        mov     r9, r0
        mov     r8, r1
LAWM2:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]
        add     r11, r11, #5
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]
        ldr     r2, [r5, #0xC]
        ldr     r3, [r5, #0x10]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]
        ldr     r2, [r5, #0x14]
        ldr     r3, [r5, #0x18]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r6, #0x14]
        str     r1, [r6, #0x18]
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0x20]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r6, #0x1C]
        str     r1, [r6, #0x20]
        ldr     r2, [r5, #0x24]
        ldr     r3, [r5, #0x28]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r6, #0x24]
        str     r1, [r6, #0x28]!
        cmp     r11, r7
        ble     LAWM2
        mov     r1, r8
        mov     r0, r9
LAWM3:
        mov     r3, r11, lsl #3
        sub     r3, r3, #4
        add     r5, r3, r1
        add     r6, r3, r0
LAWM4:
        ldr     r2, [r6, #4]
        ldr     r3, [r6, #8]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        add     r11, r11, #1
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        cmp     r11, r4
        blt     LAWM4
LAWM5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAWM6:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAWM7:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


