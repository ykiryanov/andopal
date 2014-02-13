        .text
        .align  4
        .globl  _ippsSum_64fc


_ippsSum_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        mov     r9, r1
        mov     r8, r2
        beq     LASN4
        cmp     r8, #0
        beq     LASN4
        cmp     r9, #0
        ble     LASN5
        cmp     r9, #6
        mov     r11, #0
        blt     LASN3
        mov     r7, r11
        mov     r6, r7
        mov     r5, r6
        sub     r3, r9, #6
        mov     r4, r5
        sub     r10, r0, #4
        str     r3, [sp, #0xC]
        str     r8, [sp, #8]
        str     r9, [sp, #4]
        str     r0, [sp]
LASN0:
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r10, #0xC]
        ldr     r3, [r10, #0x10]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [r10, #0x14]
        ldr     r3, [r10, #0x18]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r10, #0x1C]
        ldr     r3, [r10, #0x20]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r10, #0x24]
        ldr     r3, [r10, #0x28]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        ldr     r2, [r10, #0x2C]
        ldr     r3, [r10, #0x30]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r10, #0x34]
        ldr     r3, [r10, #0x38]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        ldr     r2, [r10, #0x3C]
        ldr     r3, [r10, #0x40]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r10, #0x44]
        ldr     r3, [r10, #0x48]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        ldr     r2, [r10, #0x4C]
        ldr     r3, [r10, #0x50]!
        mov     r7, r0
        mov     r6, r1
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        add     r11, r11, #5
        mov     r5, r0
        cmp     r11, r2
        mov     r4, r1
        ble     LASN0
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r0, [sp]
LASN1:
        mov     r3, r11, lsl #4
        sub     r3, r3, #4
        add     r10, r3, r0
LASN2:
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r10, #0xC]
        ldr     r3, [r10, #0x10]!
        mov     r7, r0
        mov     r6, r1
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        add     r11, r11, #1
        cmp     r11, r9
        mov     r5, r0
        mov     r4, r1
        blt     LASN2
        mov     r0, #0
        str     r7, [r8]
        str     r6, [r8, #4]
        str     r5, [r8, #8]
        str     r4, [r8, #0xC]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASN3:
        mov     r7, r11
        mov     r6, r7
        mov     r5, r6
        mov     r4, r5
        b       LASN1
LASN4:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASN5:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


