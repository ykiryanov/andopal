        .text
        .align  4
        .globl  _ippsNormalize_32fc


_ippsNormalize_32fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x54
        ldr     r3, [r11, #8]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        beq     LBBS12
        cmp     r7, #0
        beq     LBBS12
        cmp     r6, #1
        blt     LBBS11
        mov     r0, r3
        bl      __extendsfdf2
        mov     r5, r1
        mov     r12, #0xFF, 12
        orr     r9, r12, #3, 4
        mov     r4, r0
        bic     r1, r5, #2, 2
        sub     r3, r9, #0x7E, 12
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBBS10
        mov     r1, r9
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        cmp     r6, #8
        mov     r5, r0
        mov     r4, r1
        blt     LBBS5
        mov     r2, r6, asr #3
        cmp     r2, #0
        and     r1, r6, #7
        ble     LBBS1
        ldr     r12, [r11]
        ldr     r9, [r11, #4]
        sub     r3, r8, #0x24
        str     r3, [r11, #-0x64]
        sub     r3, r7, #0x24
        str     r3, [r11, #-0x44]
        sub     r3, r8, #0x2C
        str     r3, [r11, #-0x48]
        str     r12, [r11, #-0x5C]
        sub     r3, r7, #0x2C
        sub     r12, r7, #4
        str     r3, [r11, #-0x4C]
        str     r12, [r11, #-0x40]
        sub     r3, r8, #0x34
        sub     r12, r8, #0xC
        str     r3, [r11, #-0x50]
        str     r12, [r11, #-0x6C]
        sub     r3, r7, #0x34
        sub     r12, r7, #0xC
        str     r3, [r11, #-0x54]
        str     r12, [r11, #-0x68]
        sub     r3, r8, #0x3C
        sub     r12, r8, #0x1C
        str     r3, [r11, #-0x58]
        str     r12, [r11, #-0x7C]
        sub     r0, r8, #4
        sub     lr, r7, #0x14
        sub     r12, r7, #0x1C
        sub     r3, r7, #0x3C
        sub     r10, r8, #0x14
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x74]
        str     r8, [r11, #-0x70]
        ldr     r7, [r11, #-0x58]
        ldr     r8, [r11, #-0x48]
        ldr     r6, [r11, #-0x5C]
        str     r3, [r11, #-0x60]
        str     r12, [r11, #-0x34]
        str     lr, [r11, #-0x30]
        str     r0, [r11, #-0x2C]
        str     r1, [r11, #-0x3C]
        str     r2, [r11, #-0x38]
LBBS0:
        ldr     r0, [r7, #0x3C]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x60]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r0, [r7, #0x40]!
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x60]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        ldr     lr, [r11, #-0x50]
        ldr     r0, [lr, #0x3C]
        str     r12, [r11, #-0x60]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x54]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r12, [r11, #-0x50]
        ldr     r0, [r12, #0x40]!
        str     r12, [r11, #-0x50]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x54]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        ldr     r0, [r8, #0x3C]
        str     r12, [r11, #-0x54]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x4C]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r0, [r8, #0x40]!
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x4C]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        ldr     lr, [r11, #-0x64]
        ldr     r0, [lr, #0x3C]
        str     r12, [r11, #-0x4C]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x44]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r12, [r11, #-0x64]
        ldr     r0, [r12, #0x40]!
        str     r12, [r11, #-0x64]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x44]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        ldr     lr, [r11, #-0x7C]
        ldr     r0, [lr, #0x3C]
        str     r12, [r11, #-0x44]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x34]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r12, [r11, #-0x7C]
        ldr     r0, [r12, #0x40]!
        str     r12, [r11, #-0x7C]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x34]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        ldr     r0, [r10, #0x3C]
        str     r12, [r11, #-0x34]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x30]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r0, [r10, #0x40]!
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x30]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        str     r12, [r11, #-0x30]
        ldr     r12, [r11, #-0x6C]
        ldr     r0, [r12, #0x3C]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x68]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r12, [r11, #-0x6C]
        ldr     r0, [r12, #0x40]!
        str     r12, [r11, #-0x6C]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x68]
        mov     r1, r6
        str     r0, [r12, #0x40]!
        str     r12, [r11, #-0x68]
        ldr     r12, [r11, #-0x2C]
        ldr     r0, [r12, #0x3C]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x40]
        mov     r1, r9
        str     r0, [r12, #0x3C]
        ldr     r12, [r11, #-0x2C]
        ldr     r0, [r12, #0x40]!
        str     r12, [r11, #-0x2C]
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r11, #-0x40]
        str     r0, [r12, #0x40]!
        ldr     lr, [r11, #-0x38]
        str     r12, [r11, #-0x40]
        subs    lr, lr, #1
        str     lr, [r11, #-0x38]
        bne     LBBS0
        ldr     r1, [r11, #-0x3C]
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x74]
        ldr     r8, [r11, #-0x70]
LBBS1:
        sub     r10, r6, r1
        cmp     r10, r6
        bge     LBBS9
        sub     r12, r6, r10
        cmp     r12, #5
        ldrlt   r1, [r11]
        ldrlt   r9, [r11, #4]
        blt     LBBS3
        ldr     r1, [r11]
        ldr     r9, [r11, #4]
        mov     r12, r10, lsl #3
        sub     lr, r12, #4
        sub     r12, r6, #5
        add     r0, lr, r8
        add     r2, lr, r7
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x74]
        str     r8, [r11, #-0x70]
        str     r12, [r11, #-0x7C]
        mov     r8, r0
        mov     r6, r1
        mov     r7, r2
LBBS2:
        ldr     r0, [r8, #4]
        mov     r1, r6
        add     r10, r10, #4
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r8, #8]
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #8]
        ldr     r0, [r8, #0xC]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0xC]
        ldr     r0, [r8, #0x10]
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x10]
        ldr     r0, [r8, #0x14]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x14]
        ldr     r0, [r8, #0x18]
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x18]
        ldr     r0, [r8, #0x1C]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x1C]
        ldr     r0, [r8, #0x20]!
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x20]!
        ldr     r12, [r11, #-0x7C]
        cmp     r10, r12
        ble     LBBS2
        mov     r1, r6
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x74]
        ldr     r8, [r11, #-0x70]
LBBS3:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
        add     r7, r12, r7
        str     r1, [r11, #-0x40]
LBBS4:
        ldr     r0, [r8, #4]
        ldr     r1, [r11, #-0x40]
        add     r10, r10, #1
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r8, #8]!
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #8]!
        cmp     r10, r6
        blt     LBBS4
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBBS5:
        cmp     r6, #5
        mov     r10, #0
        ldrlt   r1, [r11]
        ldrlt   r9, [r11, #4]
        blt     LBBS7
        ldr     r1, [r11]
        ldr     r9, [r11, #4]
        sub     r12, r6, #5
        sub     r2, r8, #4
        sub     r0, r7, #4
        str     r6, [r11, #-0x78]
        str     r7, [r11, #-0x74]
        str     r8, [r11, #-0x70]
        str     r12, [r11, #-0x2C]
        mov     r7, r0
        mov     r6, r1
        mov     r8, r2
LBBS6:
        ldr     r0, [r8, #4]
        mov     r1, r6
        add     r10, r10, #4
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r8, #8]
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #8]
        ldr     r0, [r8, #0xC]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0xC]
        ldr     r0, [r8, #0x10]
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x10]
        ldr     r0, [r8, #0x14]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x14]
        ldr     r0, [r8, #0x18]
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x18]
        ldr     r0, [r8, #0x1C]
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x1C]
        ldr     r0, [r8, #0x20]!
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #0x20]!
        ldr     r12, [r11, #-0x2C]
        cmp     r10, r12
        ble     LBBS6
        mov     r1, r6
        ldr     r6, [r11, #-0x78]
        ldr     r7, [r11, #-0x74]
        ldr     r8, [r11, #-0x70]
LBBS7:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
        add     r7, r12, r7
        str     r1, [r11, #-0x7C]
LBBS8:
        ldr     r0, [r8, #4]
        ldr     r1, [r11, #-0x7C]
        add     r10, r10, #1
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r8, #8]!
        mov     r1, r9
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #8]!
        cmp     r10, r6
        blt     LBBS8
LBBS9:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBBS10:
        mvn     r0, #9
        ldmdb   r11, {r4 - r11, sp, pc}
LBBS11:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LBBS12:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


