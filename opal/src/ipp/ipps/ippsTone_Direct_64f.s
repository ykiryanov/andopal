        .text
        .align  4
        .globl  _ippsTone_Direct_64f


_ippsTone_Direct_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r11, [sp, #0x70]
        ldr     r5, [sp, #0x68]
        ldr     r4, [sp, #0x6C]
        cmp     r11, #0
        mov     r9, r0
        mov     r8, r1
        mov     r7, r2
        mov     r10, r3
        beq     LAOF12
        mov     r0, r7
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ble     LAOF10
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOF9
        mov     r0, r5
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r1, r4
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LAOF9
        ldr     r0, [r11]
        mov     r2, #0
        mov     r3, #0
        str     r0, [sp]
        ldr     r6, [r11, #4]
        mov     r1, r6
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOF8
        ldr     r0, [sp]
        ldr     r2, [pc, #0x51C]
        ldr     r3, [pc, #0x51C]
        mov     r1, r6
        bl      __gedf2
        cmp     r0, #0
        bge     LAOF8
        cmp     r9, #0
        beq     LAOF12
        cmp     r8, #0
        ble     LAOF11
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [pc, #0x4EC]
        ldr     r3, [pc, #0x4EC]
        bl      __muldf3
        mov     r4, r0
        mov     r0, r8
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [pc, #0x4C0]
        ldr     r3, [pc, #0x4C0]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x34]
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x498]
        ldr     r3, [pc, #0x498]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        bl      __subdf3
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAOF0
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        ldr     r2, [pc, #0x454]
        ldr     r3, [pc, #0x454]
        bl      __gedf2
        cmp     r0, #0
        blt     LAOF1
LAOF0:
        mov     r12, #0
        str     r12, [r11]
        str     r12, [r11, #4]
        b       LAOF2
LAOF1:
        ldr     r12, [sp, #4]
        str     r12, [r11]
        ldr     r12, [sp, #8]
        str     r12, [r11, #4]
LAOF2:
        mov     r1, r6
        ldr     r0, [sp]
        bl      cos
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x30]
        cmp     r8, #1
        str     r0, [r9]
        str     r1, [r9, #4]
        beq     LAOF7
        ldr     r2, [sp]
        mov     r3, r6
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        bl      cos
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        cmp     r8, #2
        str     r6, [r9, #8]
        str     r7, [r9, #0xC]
        add     r10, r9, #8
        beq     LAOF7
        mov     r1, r5
        mov     r0, r4
        bl      cos
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r4, r0
        mov     r11, r1
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __subdf3
        str     r1, [sp, #0x34]
        mov     r5, r0
        cmp     r8, #3
        str     r5, [r9, #0x10]
        str     r1, [r9, #0x14]
        beq     LAOF7
        mov     r0, r5
        ldr     r1, [sp, #0x34]
        mov     r2, r4
        mov     r3, r11
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x28]
        str     r0, [r9, #0x18]
        str     r1, [r9, #0x1C]
        mov     r0, r4
        mov     r2, r4
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __subdf3
        bic     lr, r8, #1
        cmp     lr, #4
        mov     r4, r0
        str     r1, [sp, #8]
        ble     LAOF6
        sub     r12, lr, #4
        cmp     r12, #8
        movlt   r12, #4
        blt     LAOF4
        str     r7, [sp]
        ldr     r7, [sp, #8]
        mov     r12, #4
        sub     r1, lr, #8
        add     r0, r9, #0x1C
        str     r10, [sp, #0x20]
        add     r11, r9, #0x14
        str     r12, [sp, #0x18]
        str     r1, [sp, #0x24]
        str     lr, [sp, #4]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0xC]
        mov     r10, r0
LAOF3:
        mov     r2, r4
        mov     r3, r7
        mov     r0, r5
        ldr     r1, [sp, #0x34]
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __subdf3
        mov     r8, r0
        ldr     r0, [sp, #0x38]
        mov     r9, r1
        ldr     r1, [sp, #0x28]
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp]
        mov     r2, r6
        bl      __subdf3
        str     r8, [r11, #0xC]
        str     r9, [r11, #0x10]
        str     r0, [sp, #0x3C]
        str     r0, [r10, #0xC]
        str     r1, [sp, #0x40]
        str     r1, [r10, #0x10]
        mov     r2, r4
        mov     r3, r7
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, r5
        bl      __subdf3
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x40]
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x28]
        bl      __subdf3
        ldr     r12, [sp, #0x2C]
        str     r1, [sp]
        mov     r2, r4
        str     r12, [r11, #0x1C]
        ldr     r12, [sp, #0x30]
        mov     r6, r0
        mov     r3, r7
        str     r12, [r11, #0x20]
        str     r6, [r10, #0x1C]
        str     r1, [r10, #0x20]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        str     r1, [sp, #0x34]
        ldr     r1, [sp]
        mov     r5, r0
        mov     r0, r6
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        bl      __subdf3
        str     r5, [r11, #0x2C]
        ldr     r12, [sp, #0x34]
        str     r12, [r11, #0x30]!
        ldr     r12, [sp, #0x18]
        str     r0, [sp, #0x38]
        ldr     lr, [sp, #0x38]
        str     r1, [sp, #0x28]
        add     r12, r12, #6
        str     r12, [sp, #0x18]
        str     r1, [r10, #0x30]
        str     lr, [r10, #0x2C]
        ldr     r1, [sp, #0x24]
        add     r10, r10, #0x30
        cmp     r12, r1
        ble     LAOF3
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #4]
        ldr     r10, [sp, #0x20]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
LAOF4:
        mov     r11, r12, lsl #3
        sub     r0, r11, #0xC
        str     r4, [sp, #0x1C]
        str     r7, [sp]
        str     r6, [sp, #0x14]
        ldr     r6, [sp, #0x28]
        ldr     r4, [sp, #0x38]
        ldr     r7, [sp, #0x34]
        add     r11, r0, r10
        add     r10, r0, r9
        str     r12, [sp, #0x18]
        str     lr, [sp, #4]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0xC]
LAOF5:
        mov     r0, r5
        mov     r1, r7
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #8]
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #8]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp]
        bl      __subdf3
        str     r8, [r10, #0xC]
        str     r9, [r10, #0x10]!
        ldr     r3, [sp, #0x18]
        str     r5, [sp, #0x2C]
        str     r7, [sp, #0x30]
        add     r3, r3, #2
        str     r3, [sp, #0x18]
        str     r4, [sp, #0x14]
        str     r6, [sp]
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]!
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #0x18]
        mov     r5, r8
        mov     r7, r9
        mov     r4, r0
        cmp     r2, r3
        mov     r6, r1
        blt     LAOF5
        ldr     r4, [sp, #0x1C]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        str     r7, [sp, #0x34]
LAOF6:
        tst     r8, #1
        beq     LAOF7
        mov     r0, r5
        ldr     r1, [sp, #0x34]
        ldr     r3, [sp, #8]
        mov     r2, r4
        sub     r9, r9, #8
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __subdf3
        str     r0, [r9, +r8, lsl #3]
        add     r8, r9, r8, lsl #3
        str     r1, [r8, #4]
LAOF7:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAOF8:
        mvn     r0, #0x2B
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAOF9:
        mvn     r0, #0x2C
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAOF10:
        mvn     r0, #0x2D
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAOF11:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LAOF12:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


