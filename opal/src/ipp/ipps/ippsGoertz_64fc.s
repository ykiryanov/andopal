        .text
        .align  4
        .globl  _ippsGoertz_64fc


_ippsGoertz_64fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x48
        ldr     r5, [r11, #4]
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r8, r2
        mov     r4, r3
        beq     LBSL5
        cmp     r8, #0
        beq     LBSL5
        cmp     r9, #0
        ble     LBSL6
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSL3
        mov     r0, r4
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r1, r5
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSL3
        ldr     r2, [pc, #0x3CC]
        ldr     r3, [pc, #0x3CC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        bl      sin
        str     r0, [r11, #-0x5C]
        str     r1, [r11, #-0x58]
        mov     r1, r4
        mov     r0, r5
        bl      cos
        mov     r2, r0
        mov     r3, r1
        str     r2, [r11, #-0x54]
        str     r3, [r11, #-0x50]
        bl      __adddf3
        cmp     r9, #4
        mov     r2, #0
        blt     LBSL4
        mov     r5, r2
        mov     r7, r5
        mov     r6, r7
        mov     r4, r6
        mov     r3, r4
        str     r3, [r11, #-0x34]
        str     r3, [r11, #-0x48]
        str     r3, [r11, #-0x38]
        str     r3, [r11, #-0x3C]
        sub     r3, r10, #4
        sub     r12, r9, #4
        str     r7, [r11, #-0x40]
        str     r4, [r11, #-0x44]
        str     r10, [r11, #-0x68]
        str     r12, [r11, #-0x6C]
        str     r2, [r11, #-0x4C]
        str     r8, [r11, #-0x60]
        str     r9, [r11, #-0x64]
        mov     r7, r0
        mov     r4, r1
        mov     r10, r3
LBSL0:
        mov     r0, r7
        mov     r1, r4
        mov     r2, r5
        ldr     r3, [r11, #-0x40]
        bl      __muldf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x48]
        bl      __subdf3
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]
        bl      __adddf3
        ldr     r3, [r11, #-0x44]
        mov     r8, r0
        mov     r9, r1
        mov     r2, r6
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x3C]
        bl      __subdf3
        ldr     r2, [r10, #0xC]
        ldr     r3, [r10, #0x10]
        bl      __adddf3
        str     r0, [r11, #-0x30]
        str     r1, [r11, #-0x2C]
        mov     r0, r7
        mov     r1, r4
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [r11, #-0x40]
        mov     r2, r5
        bl      __subdf3
        ldr     r2, [r10, #0x14]
        ldr     r3, [r10, #0x18]
        bl      __adddf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        str     r0, [r11, #-0x34]
        str     r1, [r11, #-0x48]
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        ldr     r3, [r11, #-0x44]
        mov     r2, r6
        bl      __subdf3
        ldr     r2, [r10, #0x1C]
        ldr     r3, [r10, #0x20]
        bl      __adddf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x48]
        str     r0, [r11, #-0x38]
        str     r1, [r11, #-0x3C]
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [r10, #0x24]
        ldr     r3, [r10, #0x28]
        bl      __adddf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x3C]
        str     r1, [r11, #-0x40]
        mov     r5, r0
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        bl      __subdf3
        ldr     r2, [r10, #0x2C]
        ldr     r3, [r10, #0x30]!
        bl      __adddf3
        ldr     r12, [r11, #-0x4C]
        ldr     lr, [r11, #-0x6C]
        mov     r6, r0
        add     r12, r12, #3
        cmp     r12, lr
        str     r12, [r11, #-0x4C]
        str     r1, [r11, #-0x44]
        ble     LBSL0
        mov     r1, r4
        mov     r0, r7
        ldr     r7, [r11, #-0x40]
        ldr     r4, [r11, #-0x44]
        ldr     r2, [r11, #-0x4C]
        ldr     r8, [r11, #-0x60]
        ldr     r9, [r11, #-0x64]
        ldr     r10, [r11, #-0x68]
LBSL1:
        mov     r12, r2, lsl #4
        sub     r12, r12, #4
        str     r8, [r11, #-0x60]
        str     r9, [r11, #-0x64]
        add     r10, r12, r10
        str     r0, [r11, #-0x70]
        mov     r8, r1
        mov     r9, r2
LBSL2:
        mov     r2, r5
        mov     r3, r7
        ldr     r0, [r11, #-0x70]
        mov     r1, r8
        add     r9, r9, #1
        bl      __muldf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x48]
        bl      __subdf3
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]
        bl      __adddf3
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x70]
        str     r1, [r11, #-0x68]
        mov     r2, r6
        mov     r3, r4
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x3C]
        bl      __subdf3
        ldr     r2, [r10, #0xC]
        ldr     r3, [r10, #0x10]!
        bl      __adddf3
        str     r5, [r11, #-0x34]
        str     r7, [r11, #-0x48]
        ldr     r12, [r11, #-0x64]
        ldr     r5, [r11, #-0x6C]
        ldr     r7, [r11, #-0x68]
        str     r6, [r11, #-0x38]
        str     r4, [r11, #-0x3C]
        cmp     r9, r12
        mov     r6, r0
        mov     r4, r1
        blt     LBSL2
        mov     r5, r0
        mov     r4, r1
        ldr     r3, [r11, #-0x68]
        ldr     r1, [r11, #-0x50]
        ldr     r7, [r11, #-0x6C]
        ldr     r10, [r11, #-0x54]
        ldr     r8, [r11, #-0x60]
        mov     r2, r7
        mov     r0, r10
        bl      __muldf3
        ldr     r6, [r11, #-0x5C]
        ldr     r9, [r11, #-0x58]
        str     r0, [r11, #-0x2C]
        str     r1, [r11, #-0x30]
        mov     r0, r6
        mov     r1, r9
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x30]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x48]
        bl      __subdf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r3, [r11, #-0x68]
        mov     r2, r7
        mov     r0, r6
        mov     r1, r9
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [r11, #-0x50]
        mov     r6, r0
        mov     r0, r10
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x3C]
        bl      __subdf3
        str     r0, [r8, #8]
        mov     r0, #0
        str     r1, [r8, #0xC]
        ldmdb   r11, {r4 - r11, sp, pc}
LBSL3:
        mvn     r0, #0x1A
        ldmdb   r11, {r4 - r11, sp, pc}
LBSL4:
        mov     r5, r2
        mov     r7, r5
        mov     r6, r7
        mov     r4, r6
        mov     r3, r4
        str     r3, [r11, #-0x34]
        str     r3, [r11, #-0x48]
        str     r3, [r11, #-0x38]
        str     r3, [r11, #-0x3C]
        b       LBSL1
LBSL5:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LBSL6:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
        .long   0x54442d18
        .long   0x401921fb


