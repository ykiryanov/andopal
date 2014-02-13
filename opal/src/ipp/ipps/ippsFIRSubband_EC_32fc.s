        .text
        .align  4
        .globl  _ippsFIRSubband_EC_32fc


_ippsFIRSubband_EC_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r5, [sp, #0xA8]
        cmp     r0, #0
        beq     LDKU17
        cmp     r1, #0
        beq     LDKU17
        cmp     r2, #0
        beq     LDKU17
        cmp     r5, #0
        ble     LDKU16
        mov     r12, #1
        orr     r12, r12, #1, 20
        cmp     r12, r5
        blt     LDKU16
        cmp     r3, #0
        ble     LDKU15
        cmp     r3, #0xFF
        bgt     LDKU15
        sub     r4, r5, #4
        cmp     r4, #0
        mov     r12, #0
        ble     LDKU14
        ldr     lr, [pc, #0xAA4]
        ldr     lr, [lr]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x28]
        str     lr, [sp, #0x20]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LDKU0:
        ldr     lr, [sp, #0x20]
        cmp     r3, #0
        str     lr, [sp, #0x10]
        mov     r9, lr
        mov     r1, r9
        mov     r0, r1
        str     r0, [sp]
        mov     r4, r0
        str     r4, [sp, #0x18]
        str     r4, [sp, #4]
        ble     LDKU13
        ldr     r4, [sp, #0x38]
        ldr     r10, [sp, #0x34]
        mov     r8, r12, lsl #3
        add     r7, r8, #8
        add     r5, r8, #0x10
        add     r6, r8, #0x18
        mov     r11, r3
        str     r8, [sp, #0x58]
        str     r7, [sp, #0x4C]
        str     r5, [sp, #0x54]
        str     r6, [sp, #0x50]
        str     r11, [sp, #0x44]
        str     r10, [sp, #0x48]
        str     r4, [sp, #0x40]
        str     r0, [sp, #0x14]
        str     r1, [sp, #8]
        str     r9, [sp, #0xC]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x24]
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x30]
LDKU1:
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x54]
        ldr     r4, [r0], #4
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x58]
        add     r1, r4, r1
        add     r0, r0, r4
        ldr     r0, [r0, #4]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x4C]
        add     r1, r1, r4
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x50]
        add     r1, r4, r1
        str     r1, [sp, #0x64]
        bl      __extendsfdf2
        ldr     r2, [sp, #0x58]
        mov     r6, r1
        mov     r5, r0
        ldr     r2, [r4, +r2]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x48]
        mov     r11, r0
        mov     r10, r1
        ldr     r7, [r12]
        ldr     r12, [sp, #0x48]
        add     r12, r12, #4
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0x58]
        add     r12, r12, r7
        ldr     r0, [r12, #4]
        ldr     r12, [sp, #0x4C]
        add     r12, r12, r7
        str     r12, [sp, #0x68]
        ldr     r12, [sp, #0x50]
        add     r12, r7, r12
        str     r12, [sp, #0x6C]
        ldr     r12, [sp, #0x54]
        add     r12, r7, r12
        str     r12, [sp, #0x70]
        bl      __extendsfdf2
        ldr     r12, [sp, #0x58]
        mov     r9, r1
        ldr     r2, [r7, +r12]
        str     r0, [sp, #0x74]
        mov     r0, r2
        bl      __extendsfdf2
        str     r1, [sp, #0x78]
        mov     r8, r0
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        str     r1, [sp, #0x80]
        str     r0, [sp, #0x7C]
        mov     r0, r5
        mov     r3, r9
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x7C]
        mov     r3, r1
        ldr     r1, [sp, #0x80]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        str     r0, [sp, #0x10]
        mov     r3, r9
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r3, [sp, #0x78]
        mov     r10, r1
        mov     r9, r0
        mov     r1, r6
        mov     r0, r5
        mov     r2, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        ldr     r1, [sp, #0x60]
        ldr     r1, [r1, #4]
        str     r0, [sp, #0x3C]
        mov     r0, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x4C]
        mov     r6, r1
        mov     r5, r0
        ldr     r2, [r4, +r2]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x68]
        mov     r9, r0
        mov     r10, r1
        ldr     r2, [r12, #4]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x4C]
        mov     r11, r1
        ldr     r2, [r7, +r12]
        str     r0, [sp, #0x80]
        mov     r0, r2
        bl      __extendsfdf2
        str     r1, [sp, #0x7C]
        mov     r8, r0
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r0, r5
        mov     r1, r6
        mov     r3, r11
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x74]
        mov     r2, r0
        ldr     r0, [sp, #0x78]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0xC]
        mov     r1, r10
        mov     r3, r11
        mov     r0, r9
        bl      __muldf3
        ldr     r3, [sp, #0x7C]
        mov     r9, r0
        mov     r10, r1
        mov     r1, r6
        mov     r0, r5
        mov     r2, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        ldr     r1, [r1, #4]
        str     r0, [sp, #8]
        mov     r0, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x54]
        mov     r5, r1
        ldr     r2, [r7, +r2]
        str     r0, [sp, #0x80]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x54]
        mov     r9, r0
        mov     r11, r1
        ldr     r2, [r12, +r4]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x5C]
        mov     r6, r0
        mov     r8, r1
        ldr     r2, [r12, #4]
        mov     r0, r2
        bl      __extendsfdf2
        str     r0, [sp, #0x7C]
        mov     r10, r1
        mov     r3, r11
        mov     r2, r9
        mov     r0, r6
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x7C]
        str     r1, [sp, #0x74]
        mov     r1, r10
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x78]
        mov     r3, r1
        ldr     r1, [sp, #0x74]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp]
        mov     r0, r6
        mov     r3, r5
        mov     r1, r8
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x7C]
        mov     r6, r1
        mov     r1, r10
        mov     r3, r11
        mov     r2, r9
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        ldr     r1, [r1, #4]
        str     r0, [sp, #0x14]
        mov     r0, r1
        bl      __extendsfdf2
        ldr     r12, [sp, #0x50]
        mov     r5, r1
        mov     r6, r0
        ldr     r7, [r7, +r12]
        mov     r0, r7
        bl      __extendsfdf2
        ldr     r12, [sp, #0x50]
        mov     r8, r0
        mov     r10, r1
        ldr     r4, [r12, +r4]
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r12, [sp, #0x64]
        mov     r4, r0
        mov     r7, r1
        ldr     r2, [r12, #4]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r11, r0
        mov     r9, r1
        mov     r0, r4
        mov     r2, r8
        mov     r3, r10
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r3, r5
        mov     r0, r11
        mov     r1, r9
        mov     r2, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x7C]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        str     r0, [sp, #0x18]
        mov     r3, r5
        mov     r0, r4
        mov     r2, r6
        mov     r1, r7
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r9
        mov     r2, r8
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        str     r0, [sp, #4]
        subs    r1, r1, #1
        str     r1, [sp, #0x44]
        ldr     r0, [sp, #0x44]
        bne     LDKU1
        ldr     r8, [sp, #0x58]
        ldr     r7, [sp, #0x4C]
        ldr     r5, [sp, #0x54]
        ldr     r6, [sp, #0x50]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
LDKU2:
        ldr     r10, [sp, #0x10]
        add     r4, r2, r8
        str     lr, [r4, #4]
        str     r10, [r8, +r2]
        add     lr, r2, r7
        str     r9, [r7, +r2]
        str     r1, [lr, #4]
        ldr     r7, [sp]
        add     lr, r2, r5
        str     r0, [lr, #4]
        str     r7, [r5, +r2]
        ldr     r0, [sp, #0x18]
        add     r12, r12, #4
        str     r0, [r6, +r2]
        ldr     r0, [sp, #0x1C]
        add     r6, r2, r6
        cmp     r12, r0
        ldr     r0, [sp, #4]
        str     r0, [r6, #4]
        blt     LDKU0
        ldr     r5, [sp, #0x28]
        ldr     lr, [sp, #0x20]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        sub     r4, r5, #2
        cmp     r12, r4
        bge     LDKU7
LDKU3:
        str     r5, [sp, #0x28]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LDKU4:
        mov     r7, lr
        mov     r6, r7
        mov     r5, r6
        cmp     r3, #0
        mov     r1, r5
        ble     LDKU12
        ldr     r0, [sp, #0x38]
        ldr     r10, [sp, #0x34]
        mov     r9, r12, lsl #3
        mov     r11, r3
        add     r8, r9, #8
        str     r11, [sp, #4]
        str     r10, [sp]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x30]
LDKU5:
        ldr     r0, [sp, #8]
        ldr     r11, [r0], #4
        str     r0, [sp, #8]
        add     r0, r9, r11
        ldr     r0, [r0, #4]
        add     r1, r8, r11
        str     r1, [sp, #0x80]
        bl      __extendsfdf2
        ldr     r2, [r11, +r9]
        mov     r6, r0
        mov     r10, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp]
        mov     r4, r1
        ldr     r7, [r2]
        ldr     r2, [sp]
        str     r0, [sp, #0x7C]
        add     r2, r2, #4
        str     r2, [sp]
        add     r2, r9, r7
        ldr     r0, [r2, #4]
        add     r2, r8, r7
        str     r2, [sp, #0x78]
        bl      __extendsfdf2
        ldr     r2, [r7, +r9]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #0x7C]
        str     r1, [sp, #0x6C]
        mov     r5, r0
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r1, r10
        mov     r0, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x68]
        mov     r3, r1
        ldr     r1, [sp, #0x64]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x7C]
        mov     r1, r4
        bl      __muldf3
        ldr     r3, [sp, #0x6C]
        str     r0, [sp, #0x7C]
        mov     r4, r1
        mov     r1, r10
        mov     r0, r6
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        ldr     r1, [r1, #4]
        str     r0, [sp, #0x18]
        mov     r0, r1
        bl      __extendsfdf2
        ldr     r11, [r11, +r8]
        mov     r4, r0
        mov     r6, r1
        mov     r0, r11
        bl      __extendsfdf2
        ldr     r2, [sp, #0x78]
        mov     r5, r1
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x80]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [r7, +r8]
        mov     r7, r0
        mov     r10, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r11, r0
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r2, r7
        mov     r0, r4
        mov     r1, r6
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x80]
        mov     r2, r7
        mov     r1, r5
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0x7C]
        mov     r5, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r6
        mov     r2, r11
        bl      __muldf3
        mov     r2, r5
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0xC]
        subs    r1, r1, #1
        str     r1, [sp, #4]
        ldr     r0, [sp, #4]
        bne     LDKU5
        ldr     r1, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r4, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
LDKU6:
        add     r0, r2, r9
        str     r7, [r9, +r2]
        str     r6, [r0, #4]
        str     r5, [r8, +r2]
        add     r12, r12, #2
        add     r8, r2, r8
        cmp     r12, r4
        str     r1, [r8, #4]
        blt     LDKU4
        ldr     r5, [sp, #0x28]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
LDKU7:
        cmp     r12, r5
        bge     LDKU11
        ldr     lr, [pc, #0x224]
        ldr     lr, [lr]
LDKU8:
        mov     r7, lr
        cmp     r3, #0
        mov     r6, r7
        movle   r4, r12, lsl #3
        ble     LDKU10
        mov     r9, r0
        mov     r10, r1
        mov     r8, r3
        mov     r4, r12, lsl #3
        str     r8, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x38]
LDKU9:
        ldr     r0, [sp, #0x14]
        ldr     r5, [r0], #4
        str     r0, [sp, #0x14]
        add     r0, r4, r5
        ldr     r0, [r0, #4]
        bl      __extendsfdf2
        ldr     r5, [r5, +r4]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r5
        bl      __extendsfdf2
        ldr     r12, [sp, #0xC]
        mov     r8, r1
        mov     r7, r0
        ldr     r9, [r12]
        ldr     r12, [sp, #0xC]
        add     r12, r12, #4
        str     r12, [sp, #0xC]
        add     r12, r4, r9
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        ldr     r9, [r9, +r4]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r9
        bl      __extendsfdf2
        mov     r9, r0
        str     r1, [sp, #0x80]
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        mov     r2, r5
        mov     r3, r6
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x78]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        str     r0, [sp, #0x18]
        mov     r2, r5
        mov     r3, r6
        mov     r0, r7
        mov     r1, r8
        bl      __muldf3
        ldr     r3, [sp, #0x80]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0x1C]
        subs    r1, r1, #1
        str     r1, [sp, #0x10]
        ldr     r0, [sp, #0x10]
        bne     LDKU9
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
LDKU10:
        str     r7, [r4, +r2]
        add     r12, r12, #1
        add     r4, r2, r4
        cmp     r12, r5
        str     r6, [r4, #4]
        blt     LDKU8
LDKU11:
        mov     r0, #0
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LDKU12:
        add     r0, r12, #1
        mov     r9, r12, lsl #3
        mov     r8, r0, lsl #3
        b       LDKU6
LDKU13:
        add     r6, r12, #1
        add     r5, r12, #2
        add     r4, r12, #3
        mov     r7, r6, lsl #3
        mov     r8, r12, lsl #3
        mov     r5, r5, lsl #3
        mov     r6, r4, lsl #3
        b       LDKU2
LDKU14:
        sub     r4, r5, #2
        cmp     r4, #0
        ldrgt   lr, [pc, #0x2C]
        ldrgt   lr, [lr]
        bgt     LDKU3
        b       LDKU7
LDKU15:
        mvn     r0, #6
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LDKU16:
        mvn     r0, #0x76
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LDKU17:
        mvn     r0, #7
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   LDKU__2il0floatpacket.1


        .data
        .align  4


LDKU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


