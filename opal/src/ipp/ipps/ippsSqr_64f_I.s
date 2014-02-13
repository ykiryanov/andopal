        .text
        .align  4
        .globl  _ippsSqr_64f_I


_ippsSqr_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        subs    r11, r4, #4
        bmi     LAWL1
        mov     r10, #0
        sub     r9, r5, #4
        sub     r8, r5, #0xC
        sub     r7, r5, #0x14
        sub     r6, r5, #0x1C
LAWL0:
        ldr     r2, [r6, #0x1C]
        ldr     r3, [r6, #0x20]
        add     r10, r10, #4
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r6, #0x1C]
        str     r1, [r6, #0x20]!
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r7, #0x1C]
        str     r1, [r7, #0x20]!
        ldr     r2, [r8, #0x1C]
        ldr     r3, [r8, #0x20]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r8, #0x1C]
        str     r1, [r8, #0x20]!
        ldr     r2, [r9, #0x1C]
        ldr     r3, [r9, #0x20]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]!
        cmp     r10, r11
        ble     LAWL0
LAWL1:
        and     r2, r4, #3
        sub     r7, r4, r2
        cmp     r7, r4
        bge     LAWL5
        sub     r2, r4, r7
        cmp     r2, #6
        blt     LAWL3
        mov     r2, r7, lsl #3
        sub     r2, r2, #4
        add     r6, r2, r5
        sub     r8, r4, #6
LAWL2:
        ldr     r2, [r6, #4]
        ldr     r3, [r6, #8]
        add     r7, r7, #5
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #0x10]
        str     r0, [r6, #4]
        str     r1, [r6, #8]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [r6, #0x14]
        ldr     r3, [r6, #0x18]
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [r6, #0x1C]
        ldr     r3, [r6, #0x20]
        str     r0, [r6, #0x14]
        str     r1, [r6, #0x18]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [r6, #0x24]
        ldr     r3, [r6, #0x28]
        str     r0, [r6, #0x1C]
        str     r1, [r6, #0x20]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r6, #0x24]
        str     r1, [r6, #0x28]!
        cmp     r7, r8
        ble     LAWL2
LAWL3:
        mov     r2, r7, lsl #3
        sub     r2, r2, #4
        add     r5, r2, r5
LAWL4:
        ldr     r2, [r5, #4]
        ldr     r3, [r5, #8]
        add     r7, r7, #1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        cmp     r7, r4
        blt     LAWL4
LAWL5:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


