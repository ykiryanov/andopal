        .text
        .align  4
        .globl  _ippsThreshold_64f


_ippsThreshold_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x2C
        ldr     r5, [r11, #4]
        ldr     r12, [r11, #8]
        cmp     r0, #0
        mov     r4, r3
        beq     LARL8
        cmp     r1, #0
        beq     LARL8
        cmp     r2, #0
        ble     LARL9
        cmp     r12, #4
        mov     r6, #0
        sub     r12, r2, #4
        beq     LARL4
        cmp     r12, #0
        blt     LARL1
        add     r9, r0, #8
        add     r10, r1, #8
        add     r8, r0, #0x10
        add     r7, r0, #0x18
        str     r0, [r11, #-0x4C]
        add     lr, r1, #0x10
        sub     r3, r1, #4
        str     r10, [r11, #-0x2C]
        ldr     r10, [r11, #-0x4C]
        str     r1, [r11, #-0x50]
        str     lr, [r11, #-0x30]
        str     r3, [r11, #-0x3C]
        str     r12, [r11, #-0x40]
        str     r2, [r11, #-0x54]
        str     r1, [r11, #-0x44]
        str     r0, [r11, #-0x48]
LARL0:
        ldr     r0, [r10]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r11, #-0x38]
        ldr     r1, [r10, #4]
        str     r1, [r11, #-0x34]
        bl      __gedf2
        cmp     r0, #0
        strlt   r4, [r11, #-0x38]
        strlt   r5, [r11, #-0x34]
        ldr     r1, [r11, #-0x38]
        ldr     r0, [r11, #-0x50]
        mov     r2, r4
        mov     r3, r5
        str     r1, [r0]
        ldr     r1, [r11, #-0x34]
        str     r1, [r0, #4]
        ldr     r0, [r9]
        str     r0, [r11, #-0x38]
        ldr     r1, [r9, #4]
        str     r1, [r11, #-0x34]
        bl      __gedf2
        cmp     r0, #0
        strlt   r4, [r11, #-0x38]
        strlt   r5, [r11, #-0x34]
        ldr     r1, [r11, #-0x38]
        ldr     r0, [r11, #-0x2C]
        mov     r2, r4
        mov     r3, r5
        str     r1, [r0]
        ldr     r1, [r11, #-0x34]
        str     r1, [r0, #4]
        ldr     r0, [r8]
        str     r0, [r11, #-0x38]
        ldr     r1, [r8, #4]
        str     r1, [r11, #-0x34]
        bl      __gedf2
        cmp     r0, #0
        strlt   r4, [r11, #-0x38]
        strlt   r5, [r11, #-0x34]
        ldr     r1, [r11, #-0x38]
        ldr     r0, [r11, #-0x30]
        mov     r2, r4
        mov     r3, r5
        str     r1, [r0]
        ldr     r1, [r11, #-0x34]
        str     r1, [r0, #4]
        ldr     r0, [r7]
        str     r0, [r11, #-0x38]
        ldr     r1, [r7, #4]
        str     r1, [r11, #-0x34]
        bl      __gedf2
        cmp     r0, #0
        strlt   r4, [r11, #-0x38]
        strlt   r5, [r11, #-0x34]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x38]
        add     r6, r6, #4
        add     r7, r7, #0x20
        add     r8, r8, #0x20
        str     r1, [r0, #0x1C]
        ldr     r1, [r11, #-0x34]
        add     r9, r9, #0x20
        add     r10, r10, #0x20
        str     r1, [r0, #0x20]!
        ldr     r1, [r11, #-0x40]
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x30]
        cmp     r6, r1
        add     r0, r0, #0x20
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x50]
        ble     LARL0
        ldr     r2, [r11, #-0x54]
        ldr     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x48]
LARL1:
        cmp     r6, r2
        bge     LARL3
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r1
        add     r8, r0, r6, lsl #3
        str     r2, [r11, #-0x54]
LARL2:
        ldr     r10, [r8]
        ldr     r9, [r8, #4]
        mov     r2, r4
        mov     r0, r10
        mov     r3, r5
        mov     r1, r9
        bl      __gedf2
        cmp     r0, #0
        movlt   r10, r4
        movlt   r9, r5
        str     r10, [r7, #4]
        str     r9, [r7, #8]!
        ldr     r0, [r11, #-0x54]
        add     r6, r6, #1
        cmp     r6, r0
        add     r8, r8, #8
        blt     LARL2
LARL3:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LARL4:
        cmp     r12, #0
        blt     LARL6
        add     r7, r0, #0x10
        str     r7, [r11, #-0x50]
        mov     r10, r1
        str     r10, [r11, #-0x3C]
        ldr     r10, [r11, #-0x50]
        add     r7, r1, #0x10
        add     lr, r1, #8
        str     r7, [r11, #-0x4C]
        sub     r3, r1, #4
        add     r8, r0, #8
        add     r7, r0, #0x18
        mov     r9, r0
        str     lr, [r11, #-0x38]
        str     r3, [r11, #-0x2C]
        str     r12, [r11, #-0x40]
        str     r2, [r11, #-0x54]
        str     r1, [r11, #-0x44]
        str     r0, [r11, #-0x48]
LARL5:
        ldr     r0, [r9]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r11, #-0x30]
        ldr     r1, [r9, #4]
        str     r1, [r11, #-0x34]
        bl      __ledf2
        cmp     r0, #0
        strgt   r4, [r11, #-0x30]
        strgt   r5, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x3C]
        mov     r2, r4
        mov     r3, r5
        str     r1, [r0]
        ldr     r1, [r11, #-0x34]
        str     r1, [r0, #4]
        ldr     r0, [r8]
        str     r0, [r11, #-0x30]
        ldr     r1, [r8, #4]
        str     r1, [r11, #-0x34]
        bl      __ledf2
        cmp     r0, #0
        strgt   r4, [r11, #-0x30]
        strgt   r5, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x38]
        mov     r2, r4
        mov     r3, r5
        str     r1, [r0]
        ldr     r1, [r11, #-0x34]
        str     r1, [r0, #4]
        ldr     r0, [r10]
        str     r0, [r11, #-0x30]
        ldr     r1, [r10, #4]
        str     r1, [r11, #-0x34]
        bl      __ledf2
        cmp     r0, #0
        strgt   r4, [r11, #-0x30]
        strgt   r5, [r11, #-0x34]
        ldr     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x4C]
        mov     r2, r4
        mov     r3, r5
        str     r1, [r0]
        ldr     r1, [r11, #-0x34]
        str     r1, [r0, #4]
        ldr     r0, [r7]
        str     r0, [r11, #-0x30]
        ldr     r1, [r7, #4]
        str     r1, [r11, #-0x34]
        bl      __ledf2
        cmp     r0, #0
        strgt   r4, [r11, #-0x30]
        strgt   r5, [r11, #-0x34]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        add     r6, r6, #4
        add     r7, r7, #0x20
        add     r10, r10, #0x20
        str     r1, [r0, #0x1C]
        ldr     r1, [r11, #-0x34]
        add     r8, r8, #0x20
        add     r9, r9, #0x20
        str     r1, [r0, #0x20]!
        ldr     r1, [r11, #-0x40]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x4C]
        cmp     r6, r1
        add     r0, r0, #0x20
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x3C]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x3C]
        ble     LARL5
        ldr     r2, [r11, #-0x54]
        ldr     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x48]
LARL6:
        cmp     r6, r2
        bge     LARL3
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r1
        add     r8, r0, r6, lsl #3
        str     r2, [r11, #-0x54]
LARL7:
        ldr     r10, [r8]
        ldr     r9, [r8, #4]
        mov     r2, r4
        mov     r0, r10
        mov     r3, r5
        mov     r1, r9
        bl      __ledf2
        cmp     r0, #0
        movgt   r10, r4
        movgt   r9, r5
        str     r10, [r7, #4]
        str     r9, [r7, #8]!
        ldr     r0, [r11, #-0x54]
        add     r6, r6, #1
        cmp     r6, r0
        add     r8, r8, #8
        blt     LARL7
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LARL8:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LARL9:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}


