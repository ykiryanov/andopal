        .text
        .align  4
        .globl  _ippsMDCTInv_32f


_ippsMDCTInv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x13, 28
        ldr     r4, [pc, #0xFCC]
        ldr     r12, [pc, #0xFCC]
        ldr     r5, [pc, #0xFCC]
        ldr     r4, [r4]
        add     r7, sp, #0x46, 30
        ldr     r6, [r12]
        ldr     r12, [pc, #0xFC0]
        str     r4, [sp, #0x118]
        ldr     r4, [r5]
        ldr     r5, [pc, #0xFB8]
        ldr     lr, [r12]
        ldr     r12, [pc, #0xFB4]
        ldr     r5, [r5]
        str     r6, [r7, #4]
        ldr     r12, [r12]
        add     r6, sp, #0x46, 30
        str     lr, [r6, #0xC]
        add     r7, sp, #0x46, 30
        str     r4, [r7, #8]
        mov     r10, r0
        ldr     r0, [pc, #0xF94]
        mov     r9, r2
        add     lr, sp, #0x46, 30
        str     r12, [lr, #0x14]
        add     r2, sp, #0x68
        add     r4, sp, #0x46, 30
        mov     r11, r1
        mov     r1, r0
        str     r5, [r4, #0x10]
        mov     r0, r2
        str     r3, [sp, #0x1C]
        mov     r2, #0x68
        bl      __intel_memcpy
        cmp     r9, #0
        beq     LGDW13
        ldr     r3, [r9]
        cmp     r3, #0x38
        beq     LGDW0
        mvn     r0, #0x10
        add     sp, sp, #0x13, 28
        ldmia   sp!, {r4 - r11, pc}
LGDW0:
        cmp     r10, #0
        beq     LGDW13
        cmp     r11, #0
        beq     LGDW13
        ldr     r3, [sp, #0x1C]
        cmp     r3, #0
        beq     LGDW12
        ldr     r3, [sp, #0x1C]
        and     r12, r3, #0x1F
        rsb     r12, r12, #0x20
        and     r12, r12, #0x1F
        add     r12, r3, r12
        str     r12, [sp, #0x24]
LGDW1:
        ldr     r5, [r9, #4]
        mov     r3, #0
        str     r3, [sp, #0x20]
        cmp     r5, #0xC
        beq     LGDW11
        cmp     r5, #0x24
        bne     LGDW2
        ldr     r1, [r10]
        add     r2, sp, #0xD0
        add     r6, sp, #0xD0
        str     r1, [sp, #0x28]
        ldr     r4, [r10, #4]
        str     r1, [r2]
        mov     r0, r4
        bl      __addsf3
        ldr     r7, [r10, #8]
        str     r0, [sp, #0x18]
        str     r0, [r6, #4]
        mov     r1, r4
        add     r5, sp, #0xD0
        mov     r0, r7
        bl      __addsf3
        str     r0, [sp, #0x14]
        ldr     r6, [r10, #0xC]
        str     r0, [r5, #8]
        mov     r2, #0
        mov     r1, r7
        str     r2, [sp, #0x20]
        add     r8, sp, #0xD0
        mov     r0, r6
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        str     r0, [sp, #0x10]
        ldr     r4, [r10, #0x10]
        str     r0, [r8, #0xC]
        mov     r1, r6
        mov     r0, r4
        add     r9, sp, #0xD0
        bl      __addsf3
        ldr     r8, [r10, #0x14]
        mov     r5, r0
        str     r5, [r9, #0x10]
        mov     r1, r4
        mov     r0, r8
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r6, [r10, #0x18]
        str     r0, [sp, #0xC]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x14]
        mov     r1, r8
        mov     r0, r6
        add     r9, sp, #0xD0
        bl      __addsf3
        ldr     r7, [r10, #0x1C]
        str     r0, [sp, #8]
        str     r0, [r9, #0x18]
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r8, [r10, #0x20]
        str     r0, [sp, #4]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x1C]
        mov     r0, r8
        mov     r1, r7
        bl      __addsf3
        ldr     r9, [r10, #0x24]
        mov     r4, r0
        add     r2, sp, #0xD0
        str     r4, [r2, #0x20]
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r6, [r10, #0x28]
        str     r0, [sp, #0x2C]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x24]
        mov     r1, r9
        mov     r0, r6
        bl      __addsf3
        ldr     r7, [r10, #0x2C]
        str     r0, [sp, #0x30]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x28]
        mov     r1, r6
        mov     r0, r7
        bl      __addsf3
        mov     r1, r9
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r8, [r10, #0x30]
        str     r0, [sp, #0x34]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x2C]
        mov     r1, r7
        mov     r0, r8
        bl      __addsf3
        ldr     r9, [r10, #0x34]
        str     r0, [sp, #0x38]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x30]
        mov     r1, r8
        mov     r0, r9
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r7, [r10, #0x38]
        str     r0, [sp, #0x3C]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x34]
        mov     r0, r7
        mov     r1, r9
        bl      __addsf3
        ldr     r6, [r10, #0x3C]
        str     r0, [sp, #0x40]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x38]
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        mov     r1, r9
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r9, [r10, #0x40]
        str     r0, [sp, #0x44]
        add     r2, sp, #0xD0
        str     r0, [r2, #0x3C]
        mov     r0, r9
        mov     r1, r6
        bl      __addsf3
        ldr     r10, [r10, #0x44]
        add     r2, sp, #0xD0
        mov     r8, r0
        str     r8, [r2, #0x40]
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        add     r2, sp, #0xD0
        mov     r10, r0
        str     r10, [r2, #0x44]
        ldr     r1, [sp, #0x28]
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        str     r0, [sp, #0x48]
        bl      __addsf3
        ldr     r12, [pc, #0xC6C]
        ldr     r2, [pc, #0xC6C]
        ldr     r3, [pc, #0xC6C]
        ldr     r9, [r12]
        str     r0, [sp, #0x4C]
        ldr     r7, [r3]
        ldr     r6, [r2]
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        str     r0, [sp, #0x50]
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r1, r7
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r0, r5
        mov     r1, r4
        bl      __subsf3
        ldr     r1, [sp, #0x38]
        bl      __subsf3
        ldr     r1, [sp, #0x38]
        bl      __subsf3
        mov     r1, r8
        bl      __subsf3
        ldr     r1, [sp, #0x48]
        bl      __addsf3
        str     r0, [sp, #0x48]
        mov     r0, r5
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x4C]
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x54]
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r1, r6
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        bl      __addsf3
        str     r0, [sp, #0x54]
        mov     r1, r6
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x4C]
        bl      __subsf3
        str     r0, [sp, #0x4C]
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        str     r0, [sp, #0x4C]
        mov     r1, r9
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x4C]
        bl      __subsf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x28]
        mov     r1, r5
        bl      __subsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [pc, #0xB20]
        str     r0, [sp, #0x38]
        ldr     r1, [r2]
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x28]
        bl      __mulsf3
        ldr     r12, [pc, #0xB0C]
        ldr     r3, [pc, #0xB0C]
        ldr     r2, [pc, #0xB0C]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x14]
        ldr     r5, [r12]
        ldr     r4, [r3]
        ldr     r8, [r2]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x30]
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x40]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        ldr     r1, [sp, #0x40]
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x14]
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x30]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x60]
        bl      __subsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x40]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r1, [sp, #8]
        bl      __subsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x14]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x40]
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        ldr     r1, [sp, #8]
        bl      __subsf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x18]
        mov     r1, r0
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0xC]
        mov     r1, r9
        bl      __mulsf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x2C]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        str     r0, [sp, #8]
        mov     r0, r10
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        bl      __subsf3
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0xC]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x14]
        bl      __subsf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x2C]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x64]
        mov     r1, r6
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0xC]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x14]
        bl      __subsf3
        mov     r6, r0
        ldr     r0, [sp, #0x2C]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        bl      __subsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [pc, #0x8A4]
        ldr     r1, [r2]
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #4]
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x10]
        mov     r1, r5
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x34]
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x10]
        mov     r1, r8
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r10
        bl      __subsf3
        mov     r6, r0
        ldr     r0, [sp, #0x10]
        mov     r1, r4
        bl      __mulsf3
        mov     r4, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        mov     r1, r10
        bl      __subsf3
        mov     r4, r0
        ldr     r1, [sp, #0x58]
        ldr     r0, [sp, #0x50]
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #8]
        mov     r1, r9
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2]
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r8
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #4]
        bl      __mulsf3
        str     r0, [r11, #0x68]
        str     r0, [r11, #0x6C]
        mov     r0, r8
        mov     r1, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #8]
        bl      __mulsf3
        eor     r2, r0, #2, 2
        str     r0, [r11, #0x20]
        str     r2, [r11, #0x24]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r7
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0xC]
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r8
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x10]
        bl      __mulsf3
        str     r0, [r11, #0x64]
        str     r0, [r11, #0x70]
        mov     r0, r8
        mov     r1, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x14]
        bl      __mulsf3
        str     r0, [r11, #0x1C]
        eor     r0, r0, #2, 2
        str     r0, [r11, #0x28]
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x54]
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [sp, #0x64]
        mov     r1, r6
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x18]
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r5
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x1C]
        bl      __mulsf3
        str     r0, [r11, #0x60]
        str     r0, [r11, #0x74]
        mov     r0, r5
        mov     r1, r8
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x20]
        bl      __mulsf3
        str     r0, [r11, #0x18]
        eor     r2, r0, #2, 2
        str     r2, [r11, #0x2C]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x4C]
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [sp, #0x14]
        mov     r1, r4
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x24]
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r5
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x28]
        bl      __mulsf3
        str     r0, [r11, #0x5C]
        str     r0, [r11, #0x78]
        mov     r1, r8
        mov     r0, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x2C]
        bl      __mulsf3
        eor     r2, r0, #2, 2
        str     r2, [r11, #0x30]
        str     r0, [r11, #0x14]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x30]
        bl      __mulsf3
        str     r0, [r11, #0x58]
        str     r0, [r11, #0x7C]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x34]
        bl      __mulsf3
        str     r0, [r11, #0x10]
        eor     r0, r0, #2, 2
        str     r0, [r11, #0x34]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x40]
        bl      __subsf3
        mov     r5, r0
        ldr     r0, [sp, #0x14]
        mov     r1, r4
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x38]
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r5
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x3C]
        bl      __mulsf3
        str     r0, [r11, #0x54]
        str     r0, [r11, #0x80]
        mov     r1, r4
        mov     r0, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x40]
        bl      __mulsf3
        str     r0, [r11, #0xC]
        eor     r0, r0, #2, 2
        str     r0, [r11, #0x38]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x60]
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x64]
        mov     r1, r6
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x44]
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x48]
        bl      __mulsf3
        str     r0, [r11, #0x50]
        str     r0, [r11, #0x84]
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x4C]
        bl      __mulsf3
        str     r0, [r11, #8]
        eor     r0, r0, #2, 2
        str     r0, [r11, #0x3C]
        ldr     r1, [sp, #0x5C]
        ldr     r0, [sp, #0x48]
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r7
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x50]
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r4
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x54]
        bl      __mulsf3
        str     r0, [r11, #0x4C]
        str     r0, [r11, #0x88]
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x58]
        bl      __mulsf3
        eor     r2, r0, #2, 2
        str     r2, [r11, #0x40]
        str     r0, [r11, #4]
        ldr     r1, [sp, #0x58]
        ldr     r0, [sp, #0x50]
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #8]
        mov     r1, r9
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x5C]
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r4
        bl      __addsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x60]
        bl      __mulsf3
        str     r0, [r11, #0x48]
        str     r0, [r11, #0x8C]
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        add     r2, sp, #0x68
        ldr     r1, [r2, #0x64]
        bl      __mulsf3
        eor     r2, r0, #2, 2
        str     r0, [r11]
        str     r2, [r11, #0x44]
        b       LGDW8
LGDW2:
        ldr     r3, [sp, #0x20]
        cmp     r5, #0
        ldr     r8, [r9, #0x14]
        mov     r12, #1
        movlt   r3, r12
        add     r12, r5, r3
        mov     lr, r5, asr #1
        add     r3, r5, lr, lsr #30
        mov     r12, r12, asr #1
        mov     r4, r3, asr #2
        cmp     r4, #0
        ble     LGDW4
        ldr     lr, [sp, #0x24]
        ldr     r6, [sp, #0x20]
        sub     r12, r12, #1
        str     r5, [sp, #8]
        ldr     r5, [sp, #0x20]
        add     r12, r10, r12, lsl #2
        sub     lr, lr, #4
        add     r7, r8, #4
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r4, [sp, #4]
        str     r3, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r11, [sp]
LGDW3:
        ldr     r4, [r10], #8
        ldr     r2, [sp, #0x14]
        ldr     r1, [r7]
        rsb     r3, r5, #0
        mov     r0, r4
        ldr     r9, [r2, +r3, lsl #2]
        bl      __mulsf3
        ldr     r1, [r8]
        mov     r11, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        add     r5, r5, #2
        str     r0, [r1, +r6, lsl #3]
        ldr     r1, [r7], #8
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [r8], #8
        mov     r9, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x18]
        add     r6, r6, #1
        str     r0, [r1, #8]!
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #4]
        cmp     r6, r1
        blt     LGDW3
        ldr     r4, [sp, #4]
        ldr     r3, [sp, #0x10]
        ldr     r5, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r11, [sp]
LGDW4:
        ldr     r1, [sp, #0x24]
        ldr     r2, [r9, #0x18]
        mvn     r0, #0xE, 2
        and     r3, r3, r0
        mov     r0, r1
        add     r3, r1, r3, lsl #1
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        str     r0, [sp, #0x20]
        bne     LGDW8
        ldr     r0, [r9, #0x14]
        adds    r12, r4, #1
        mov     r2, #0
        mov     r3, r2
        mov     lr, #1
        movmi   r3, lr
        add     r3, r4, r3
        add     r3, r3, #1
        mov     r8, r3, asr #1
        cmp     r8, #0
        ble     LGDW6
        ldr     lr, [sp, #0x24]
        sub     r12, r5, r4
        sub     r3, r12, #1
        mov     r1, r2
        add     r7, r11, r12, lsl #2
        add     r12, r11, r3, lsl #2
        sub     r3, r4, #1
        sub     r6, lr, #4
        mov     lr, r0
        add     r3, r11, r3, lsl #2
        str     r8, [sp, #0x28]
        str     r5, [sp, #8]
        add     r10, r0, #4
        add     r9, r11, r4, lsl #2
        str     lr, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r0, [sp, #0x18]
        str     r4, [sp, #4]
        str     r11, [sp]
        mov     r5, r1
        mov     r8, r2
LGDW5:
        ldr     r3, [r10], #8
        ldr     r11, [r6, #8]!
        str     r3, [sp, #0x64]
        ldr     r3, [sp, #0x24]
        ldr     r1, [sp, #0x64]
        ldr     r3, [r3, +r5, lsl #3]
        add     r5, r5, #1
        str     r3, [sp, #0x60]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x60]
        ldr     r4, [r3], #8
        str     r3, [sp, #0xC]
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        mov     r0, r11
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x5C]
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r3, [sp, #0x5C]
        eor     r12, r3, #2, 2
        str     r12, [r7], #8
        ldr     lr, [sp, #0x14]
        rsb     r3, r8, #0
        str     r12, [lr, +r3, lsl #2]
        str     r0, [r9], #8
        ldr     r12, [sp, #0x28]
        eor     r0, r0, #2, 2
        cmp     r5, r12
        ldr     r12, [sp, #0x10]
        add     r8, r8, #2
        str     r0, [r12, +r3, lsl #2]
        blt     LGDW5
        ldr     r8, [sp, #0x28]
        ldr     r0, [sp, #0x18]
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r11, [sp]
LGDW6:
        cmp     r8, r4
        bge     LGDW8
        ldr     lr, [sp, #0x24]
        sub     r2, r5, r4
        rsb     r3, r4, #0
        add     r5, r4, r5
        sub     r2, r2, #1
        add     r12, r11, r3, lsl #2
        mov     r1, r8, lsl #3
        add     r3, r11, r2, lsl #2
        sub     r5, r5, #1
        sub     r1, r1, #4
        add     r9, r1, lr
        add     r2, r11, r5, lsl #2
        add     r0, r0, r8, lsl #3
        add     r11, r11, r4, lsl #2
        mov     r1, #4
        add     r6, r12, r8, lsl #3
        add     r5, r11, r8, lsl #3
        add     r7, r1, r0
        mov     r10, r8, lsl #1
        str     r0, [sp]
        str     r2, [sp, #8]
        str     r3, [sp, #0xC]
        str     r4, [sp, #4]
LGDW7:
        ldr     r0, [r7], #8
        ldr     r1, [sp]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x24]
        ldr     r0, [r0, +r8, lsl #3]
        add     r8, r8, #1
        str     r0, [sp, #0x60]
        ldr     r4, [r1]
        ldr     r1, [sp, #0x64]
        ldr     r11, [r9, #8]!
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        mov     r0, r11
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x5C]
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r2, [sp, #0x5C]
        rsb     r1, r10, #0
        str     r2, [r6], #8
        ldr     r3, [sp, #0xC]
        eor     r2, r2, #2, 2
        str     r2, [r3, +r1, lsl #2]
        str     r0, [r5], #8
        ldr     r2, [sp, #4]
        add     r10, r10, #2
        cmp     r8, r2
        ldr     r2, [sp]
        add     r2, r2, #8
        str     r2, [sp]
        ldr     r2, [sp, #8]
        str     r0, [r2, +r1, lsl #2]
        blt     LGDW7
LGDW8:
        ldr     r0, [sp, #0x1C]
        cmp     r0, #0
        beq     LGDW10
LGDW9:
        ldr     r0, [sp, #0x20]
        add     sp, sp, #0x13, 28
        ldmia   sp!, {r4 - r11, pc}
LGDW10:
        ldr     r0, [sp, #0x24]
        bl      _ippsFree
        b       LGDW9
        .long   LGDW__2il0floatpacket.1
        .long   LGDW__2il0floatpacket.2
        .long   LGDW__2il0floatpacket.3
        .long   LGDW__2il0floatpacket.4
        .long   LGDW__2il0floatpacket.5
        .long   LGDW__2il0floatpacket.6
        .long   LGDW_twFact36.3929.0.0.2
        .long   LGDW__2cos_2pi_18
        .long   LGDW__2cos_4pi_18
        .long   LGDW__2cos_8pi_18
        .long   LGDW_sqrt_3
        .long   LGDW__2cos_pi_18
        .long   LGDW__2sin_2pi_18
        .long   LGDW__2sin_4pi_18
        .long   LGDW__cos_3pi_12
        .long   LGDW_S_1_3
        .long   LGDW_C_1_3
        .long   LGDW__2cos_pi_12
        .long   LGDW__2cos_5pi_12
LGDW11:
        ldr     r8, [r10, #4]
        ldr     r5, [r10]
        mov     r0, r8
        mov     r1, r5
        bl      __addsf3
        ldr     r4, [r10, #8]
        mov     r6, r0
        mov     r1, r8
        mov     r0, r4
        bl      __addsf3
        ldr     r7, [r10, #0xC]
        str     r0, [sp, #0x64]
        mov     r0, r7
        mov     r1, r4
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r9, [r10, #0x10]
        str     r0, [sp, #0x60]
        mov     r1, r7
        mov     r0, r9
        bl      __addsf3
        ldr     r10, [r10, #0x14]
        mov     r8, r0
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        mov     r7, r0
        mov     r1, r8
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [pc, #-0xAC]
        mov     r4, r0
        ldr     r0, [sp, #0x64]
        ldr     r1, [r2]
        str     r1, [sp, #0x64]
        bl      __mulsf3
        ldr     r2, [pc, #-0xC0]
        mov     r10, r0
        mov     r0, r8
        ldr     r1, [r2]
        str     r1, [sp, #0x5C]
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r5
        bl      __subsf3
        mov     r1, r8
        bl      __subsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r5
        bl      __addsf3
        mov     r1, r8
        bl      __subsf3
        mov     r5, r0
        mov     r1, r7
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x64]
        mov     r8, r0
        ldr     r0, [sp, #0x60]
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        mov     r10, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r6
        mov     r1, r10
        bl      __subsf3
        mov     r1, r7
        bl      __subsf3
        str     r0, [sp, #0x64]
        mov     r0, r6
        mov     r1, r10
        bl      __addsf3
        mov     r1, r7
        bl      __subsf3
        ldr     r2, [pc, #-0x164]
        ldr     r1, [r2]
        bl      __mulsf3
        ldr     r2, [pc, #-0x17C]
        mov     r6, r0
        mov     r0, r8
        ldr     r1, [r2]
        bl      __mulsf3
        ldr     r2, [pc, #-0x180]
        mov     r7, r0
        ldr     r0, [sp, #0x64]
        ldr     r1, [r2]
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r9
        bl      __addsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        mov     r9, r0
        mov     r1, r7
        mov     r0, r4
        bl      __addsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r4
        bl      __subsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r6
        bl      __addsf3
        mov     r7, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        add     r2, sp, #0x46, 30
        ldr     r1, [r2]
        mov     r5, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        add     r2, sp, #0x46, 30
        mov     r0, r10
        eor     r6, r1, #2, 2
        ldr     r1, [r2, #4]
        bl      __mulsf3
        mov     r1, r0
        add     r2, sp, #0x46, 30
        eor     r8, r1, #2, 2
        ldr     r1, [r2, #8]
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        add     r2, sp, #0x46, 30
        eor     r7, r1, #2, 2
        ldr     r1, [r2, #0xC]
        mov     r0, r5
        bl      __mulsf3
        add     r2, sp, #0x46, 30
        ldr     r1, [r2, #0x10]
        mov     r5, r0
        mov     r0, r4
        bl      __mulsf3
        add     r2, sp, #0x46, 30
        ldr     r1, [r2, #0x14]
        mov     r4, r0
        mov     r0, r9
        eor     r10, r5, #2, 2
        bl      __mulsf3
        eor     r2, r0, #2, 2
        str     r2, [r11, #0xC]
        eor     r2, r4, #2, 2
        str     r5, [r11]
        str     r10, [r11, #0x14]
        str     r0, [r11, #8]
        str     r4, [r11, #4]
        str     r2, [r11, #0x10]
        str     r7, [r11, #0x18]
        str     r7, [r11, #0x2C]
        str     r8, [r11, #0x1C]
        str     r8, [r11, #0x28]
        str     r6, [r11, #0x20]
        str     r6, [r11, #0x24]
        b       LGDW8
LGDW12:
        ldr     r0, [r9, #8]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        str     r0, [sp, #0x24]
        bne     LGDW1
        mvn     r0, #8
        add     sp, sp, #0x13, 28
        ldmia   sp!, {r4 - r11, pc}
LGDW13:
        mvn     r0, #7
        add     sp, sp, #0x13, 28
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LGDW__2il0floatpacket.1:
        .byte   0x74,0x23,0xAC,0x3D
LGDW__2il0floatpacket.2:
        .byte   0x41,0xBA,0xB8,0x3D
LGDW__2il0floatpacket.3:
        .byte   0xB0,0x1E,0xD7,0x3D
LGDW__2il0floatpacket.4:
        .byte   0xE4,0x2C,0x0C,0x3E
LGDW__2il0floatpacket.5:
        .byte   0xBD,0xFC,0x5E,0x3E
LGDW__2il0floatpacket.6:
        .byte   0xEF,0x70,0x23,0x3F
LGDW__2cos_2pi_18:
        .byte   0xB2,0x8F,0xF0,0x3F
LGDW__2cos_4pi_18:
        .byte   0x7D,0x1B,0xC4,0x3F
LGDW__2cos_8pi_18:
        .byte   0xD4,0xD0,0xB1,0x3E
LGDW_sqrt_3:
        .byte   0xD7,0xB3,0xDD,0x3F
LGDW__2cos_pi_18:
        .byte   0x5C,0x1C,0xFC,0x3F
LGDW__2sin_4pi_18:
        .byte   0xBB,0x8D,0xA4,0x3F
LGDW__2sin_2pi_18:
        .byte   0x44,0x1D,0x2F,0x3F
LGDW__cos_3pi_12:
        .byte   0xF3,0x04,0x35,0x3F
LGDW_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF
LGDW_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LGDW__2cos_pi_12:
        .byte   0xEA,0x46,0xF7,0x3F
LGDW__2cos_5pi_12:
        .byte   0xEE,0x83,0x04,0x3F
LGDW_twFact36.3929.0.0.2:
        .byte   0x2B,0x7D,0x00,0x3F,0x37,0xC5,0x63,0xBC,0xC4,0x06,0xA3,0x3E,0xED,0x83,0x04,0x3F
        .byte   0x01,0x86,0x65,0xBC,0xEA,0xEB,0xD9,0x3D,0x7D,0x3B,0x0D,0x3F,0x2B,0x14,0x69,0xBC
        .byte   0x90,0x6B,0x83,0x3D,0x57,0x42,0x1C,0x3F,0xA6,0x99,0x6E,0xBC,0xA1,0x2F,0x3D,0x3D
        .byte   0xF9,0x4C,0xF6,0xBC,0x7E,0xA8,0x94,0x3D,0x44,0x29,0x5F,0x3F,0x35,0x45,0x80,0xBC
        .byte   0x3C,0x68,0xF6,0x3C,0xD9,0x6F,0x97,0x3F,0xE6,0xE7,0x86,0xBC,0x48,0xC1,0xD3,0x3C
        .byte   0xEA,0x46,0xF7,0x3F,0xD7,0x6A,0x8F,0xBC,0x86,0xE6,0xBA,0x3C,0x54,0x94,0xB7,0x40
        .byte   0x26,0x52,0x9A,0xBC,0x40,0x69,0xA8,0x3C


