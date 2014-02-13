        .text
        .align  4
        .globl  _ippsTone_Direct_64fc


_ippsTone_Direct_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r11, [sp, #0x64]
        ldr     r9, [sp, #0x5C]
        ldr     r8, [sp, #0x60]
        cmp     r11, #0
        mov     r7, r0
        mov     r6, r1
        mov     r10, r2
        mov     r5, r3
        beq     LAOE11
        mov     r0, r10
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ble     LAOE9
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOE8
        mov     r0, r9
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r1, r8
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LAOE8
        ldr     r0, [r11]
        mov     r2, #0
        mov     r3, #0
        str     r0, [sp]
        ldr     r4, [r11, #4]
        mov     r1, r4
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOE7
        ldr     r0, [sp]
        ldr     r2, [pc, #0x4A0]
        ldr     r3, [pc, #0x4A0]
        mov     r1, r4
        bl      __gedf2
        cmp     r0, #0
        bge     LAOE7
        cmp     r7, #0
        beq     LAOE11
        cmp     r6, #0
        ble     LAOE10
        mov     r0, r9
        mov     r1, r8
        ldr     r2, [pc, #0x470]
        ldr     r3, [pc, #0x470]
        bl      __muldf3
        mov     r8, r0
        mov     r0, r6
        mov     r9, r1
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [pc, #0x444]
        ldr     r3, [pc, #0x444]
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x24]
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x41C]
        ldr     r3, [pc, #0x41C]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        bl      __subdf3
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOE0
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        ldr     r2, [pc, #0x3D8]
        ldr     r3, [pc, #0x3D8]
        bl      __gedf2
        cmp     r0, #0
        blt     LAOE1
LAOE0:
        mov     r12, #0
        str     r12, [r11]
        str     r12, [r11, #4]
        b       LAOE2
LAOE1:
        ldr     r12, [sp, #4]
        str     r12, [r11]
        ldr     r12, [sp, #8]
        str     r12, [r11, #4]
LAOE2:
        mov     r1, r4
        ldr     r11, [sp]
        mov     r0, r11
        bl      cos
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        mov     r0, r11
        mov     r1, r4
        bl      sin
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r0, r10
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
        mov     r11, r1
        str     r11, [sp, #0x28]
        mov     r0, r10
        mov     r1, r5
        bl      __muldf3
        ldr     r12, [sp, #0x20]
        str     r0, [sp, #8]
        str     r1, [sp, #0x24]
        cmp     r6, #1
        str     r12, [r7]
        str     r11, [r7, #4]
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        beq     LAOE6
        ldr     r2, [sp]
        mov     r3, r4
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        mov     r4, r1
        mov     r11, r0
        bl      cos
        mov     r3, r5
        mov     r2, r10
        bl      __muldf3
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r1, r4
        mov     r0, r11
        bl      sin
        mov     r3, r5
        mov     r2, r10
        bl      __muldf3
        ldr     r12, [sp, #4]
        mov     r4, r0
        mov     r5, r1
        str     r12, [r7, #0x10]
        ldr     r12, [sp]
        cmp     r6, #2
        str     r4, [r7, #0x18]
        str     r12, [r7, #0x14]
        str     r5, [r7, #0x1C]
        beq     LAOE6
        mov     r1, r9
        mov     r0, r8
        bl      cos
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        cmp     r6, #2
        mov     r9, r0
        mov     r8, r1
        ble     LAOE6
        sub     r12, r6, #2
        cmp     r12, #4
        movlt   r10, #2
        blt     LAOE4
        mov     r10, #2
        sub     r12, r6, #4
        add     r11, r7, #0x1C
        str     r10, [sp, #0x18]
        str     r6, [sp, #0xC]
        str     r7, [sp, #0x10]
        ldr     r6, [sp]
        ldr     r7, [sp, #4]
        ldr     r10, [sp, #8]
        str     r12, [sp, #0x14]
        str     r5, [sp, #0x1C]
LAOE3:
        mov     r2, r9
        mov     r3, r8
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        bl      __subdf3
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x1C]
        str     r0, [sp, #0x2C]
        mov     r0, r4
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0x24]
        mov     r2, r10
        bl      __subdf3
        ldr     r12, [sp, #0x2C]
        mov     r5, r0
        str     r1, [sp, #0x34]
        str     r12, [r11, #4]
        ldr     r12, [sp, #0x30]
        str     r1, [r11, #0x10]
        str     r5, [r11, #0xC]
        str     r12, [r11, #8]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r3, r6
        mov     r2, r7
        bl      __subdf3
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x20]
        mov     r0, r5
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0x1C]
        mov     r2, r4
        bl      __subdf3
        mov     r10, r0
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        mov     r2, r9
        str     r0, [r11, #0x14]
        ldr     r12, [sp, #0x28]
        str     r1, [r11, #0x20]
        str     r10, [r11, #0x1C]
        str     r12, [r11, #0x18]
        ldr     r1, [sp, #0x28]
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __subdf3
        mov     r6, r1
        ldr     r1, [sp, #0x24]
        mov     r7, r0
        mov     r0, r10
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, r5
        bl      __subdf3
        ldr     r12, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r4, r0
        add     r12, r12, #3
        str     r12, [sp, #0x18]
        str     r7, [r11, #0x24]
        str     r6, [r11, #0x28]
        str     r4, [r11, #0x2C]
        str     r1, [r11, #0x30]!
        ldr     lr, [sp, #0x14]
        cmp     r12, lr
        ble     LAOE3
        str     r6, [sp]
        str     r7, [sp, #4]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #0x10]
LAOE4:
        mov     r12, r10, lsl #4
        str     r6, [sp, #0xC]
        ldr     r6, [sp]
        sub     r12, r12, #4
        add     r7, r12, r7
LAOE5:
        ldr     r0, [sp, #4]
        mov     r1, r6
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        bl      __subdf3
        str     r0, [sp, #0x34]
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x24]
        bl      __subdf3
        ldr     r12, [sp, #4]
        add     r10, r10, #1
        str     r12, [sp, #0x20]
        ldr     r12, [sp, #0x34]
        str     r6, [sp, #0x28]
        str     r4, [sp, #8]
        str     r5, [sp, #0x24]
        str     r12, [r7, #4]
        str     r11, [r7, #8]
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        ldr     r12, [sp, #0xC]
        mov     r6, r11
        mov     r4, r0
        cmp     r10, r12
        ldr     r12, [sp, #0x34]
        mov     r5, r1
        str     r12, [sp, #4]
        blt     LAOE5
LAOE6:
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOE7:
        mvn     r0, #0x2B
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOE8:
        mvn     r0, #0x2C
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOE9:
        mvn     r0, #0x2D
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOE10:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAOE11:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


