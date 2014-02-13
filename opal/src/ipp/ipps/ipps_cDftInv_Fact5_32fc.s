        .text
        .align  4
        .globl  _ipps_cDftInv_Fact5_32fc


_ipps_cDftInv_Fact5_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA8
        ldr     r12, [sp, #0xCC]
        cmp     r3, #0
        mov     r8, r0
        mov     r7, r1
        mov     r6, r2
        ble     LCLC3
        ldr     lr, [pc, #0xA0C]
        ldr     r4, [pc, #0xA0C]
        ldr     r5, [pc, #0xA0C]
        ldr     r9, [pc, #0xA0C]
        ldr     lr, [lr]
        ldr     r4, [r4]
        ldr     r5, [r5]
        ldr     r9, [r9]
        add     r12, r12, #0x20
        rsb     r11, r6, r6, lsl #2
        mov     r0, r6, lsl #1
        add     r10, r6, r6, lsl #2
        str     r10, [sp, #0x4C]
        str     r0, [sp, #0x50]
        str     r9, [sp, #0x7C]
        str     r5, [sp, #0x80]
        str     r4, [sp, #0x84]
        str     lr, [sp, #0x78]
        str     r12, [sp, #0x48]
        str     r11, [sp, #0x44]
        str     r3, [sp, #0x40]
LCLC0:
        ldr     r3, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        add     r4, r8, r6, lsl #3
        str     r3, [sp, #0x38]
        ldr     r0, [r8, +r6, lsl #3]
        add     r3, r7, r6, lsl #3
        add     r10, r8, r11, lsl #3
        str     r0, [sp, #0x74]
        ldr     r5, [r8, +r6, lsl #5]
        str     r3, [sp, #8]
        add     r3, r8, r6, lsl #4
        str     r3, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r4, [sp, #0x14]
        add     r9, r8, r6, lsl #5
        str     r9, [sp, #0x18]
        mov     r1, r5
        bl      __addsf3
        ldr     r4, [r4, #4]
        ldr     r9, [r9, #4]
        str     r0, [sp, #0x70]
        add     r3, r7, r6, lsl #4
        str     r3, [sp, #0x1C]
        mov     r1, r9
        mov     r0, r4
        bl      __addsf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x74]
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x74]
        mov     r1, r9
        mov     r0, r4
        bl      __subsf3
        ldr     r3, [r8, +r11, lsl #3]
        str     r3, [sp, #0x68]
        ldr     r3, [r8, +r6, lsl #4]
        str     r0, [sp, #0x60]
        ldr     r1, [sp, #0x68]
        str     r3, [sp, #0x64]
        ldr     r0, [sp, #0x64]
        add     r3, r7, r11, lsl #3
        str     r3, [sp, #4]
        bl      __addsf3
        ldr     r3, [sp, #0x10]
        ldr     r3, [r3, #4]
        str     r3, [sp, #0x5C]
        ldr     r10, [r10, #4]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x5C]
        add     r3, r7, r6, lsl #5
        str     r3, [sp]
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x68]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x5C]
        mov     r1, r10
        bl      __subsf3
        ldr     r3, [r8]
        ldr     r4, [sp, #0x78]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x70]
        str     r3, [sp, #0x64]
        mov     r1, r4
        bl      __mulsf3
        ldr     r5, [sp, #0x84]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x6C]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        bl      __mulsf3
        ldr     r3, [r8, #4]
        str     r0, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        str     r3, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        bl      __addsf3
        ldr     r9, [sp, #0x80]
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x60]
        mov     r1, r9
        bl      __mulsf3
        ldr     r10, [sp, #0x7C]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x5C]
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x20]
        bl      __addsf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x74]
        mov     r1, r9
        bl      __mulsf3
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x68]
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x34]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x70]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x30]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x6C]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        ldr     r1, [sp, #0x90]
        bl      __addsf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x5C]
        mov     r1, r9
        bl      __mulsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x60]
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x68]
        mov     r1, r9
        bl      __mulsf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x74]
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __subsf3
        str     r0, [sp, #0x74]
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x64]
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        str     r0, [r7]
        ldr     r0, [r8, #4]
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [r7, #4]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x20]
        bl      __addsf3
        str     r0, [r7, +r6, lsl #3]
        ldr     r1, [sp, #0x88]
        ldr     r0, [sp, #0x28]
        bl      __subsf3
        ldr     r3, [sp, #8]
        str     r0, [r3, #4]
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x8C]
        bl      __addsf3
        str     r0, [r7, +r6, lsl #4]
        ldr     r1, [sp, #0x74]
        ldr     r0, [sp, #0x90]
        bl      __subsf3
        ldr     r3, [sp, #0x1C]
        str     r0, [r3, #4]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x60]
        bl      __subsf3
        str     r0, [r7, +r11, lsl #3]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        ldr     r3, [sp, #4]
        str     r0, [r3, #4]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x20]
        bl      __subsf3
        str     r0, [r7, +r6, lsl #5]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r3, [sp, #0x50]
        cmp     r3, #2
        ldr     r3, [sp]
        str     r0, [r3, #4]
        ble     LCLC2
        mov     r3, #2
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp]
        add     r0, r8, #0xC
        add     r12, r3, #0xC
        add     r3, r3, #8
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x10]
        str     r12, [sp, #0x34]
        add     r11, r7, #0xC
        add     r12, r3, #0xC
        add     r3, r3, #8
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0xC]
        str     r12, [sp, #0x2C]
        add     r1, r2, #8
        add     r12, r3, #0xC
        add     r3, r3, #8
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        str     r12, [sp, #0x24]
        add     r2, r2, #0xC
        add     r12, r3, #0xC
        add     r4, r3, #8
        ldr     r3, [sp, #8]
        str     r12, [sp, #0x10]
        str     r1, [sp, #0x18]
        add     r10, r3, #8
        add     lr, r3, #0xC
        ldr     r3, [sp, #0x1C]
        str     r2, [sp, #0x1C]
        str     lr, [sp, #0x64]
        add     r9, r3, #8
        add     r12, r3, #0xC
        ldr     r3, [sp, #4]
        str     r9, [sp, #0x60]
        str     r8, [sp, #0x58]
        ldr     r9, [sp, #0x30]
        ldr     r8, [sp, #0x38]
        add     r5, r3, #8
        add     r3, r3, #0xC
        str     r3, [sp, #0xC]
        str     r5, [sp, #8]
        str     r12, [sp, #0x5C]
        str     r10, [sp, #0x6C]
        str     r11, [sp, #0x68]
        str     r0, [sp, #0x74]
        str     r4, [sp, #0x70]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x54]
LCLC1:
        ldr     r6, [r8]
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x34]
        ldr     r7, [r8, #4]
        mov     r1, r6
        ldr     r5, [r0]
        ldr     r4, [r2]
        mov     r0, r5
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x90]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x20]
        ldr     r10, [r8, #8]
        ldr     r11, [r8, #0xC]
        ldr     r5, [r2]
        ldr     r2, [sp, #0x2C]
        mov     r6, r0
        mov     r1, r10
        ldr     r4, [r2]
        mov     r0, r5
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x8C]
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        ldr     r10, [r8, #0x10]
        ldr     r11, [r8, #0x14]
        ldr     r4, [r1]
        ldr     r1, [sp, #0x14]
        ldr     r5, [r1]
        str     r0, [sp, #0x88]
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #4]
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        ldr     r11, [r8, #0x18]
        ldr     r10, [r8, #0x1C]
        ldr     r5, [r1]
        ldr     r1, [sp, #0x70]
        add     r8, r8, #0x20
        ldr     r4, [r1]
        str     r0, [sp]
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r5
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x90]
        mov     r1, r7
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x90]
        mov     r1, r7
        bl      __subsf3
        str     r0, [sp, #0x90]
        mov     r0, r6
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x8C]
        bl      __addsf3
        mov     r6, r0
        ldr     r1, [sp]
        ldr     r0, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #4]
        mov     r7, r0
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        str     r0, [sp, #0x8C]
        ldr     r1, [sp]
        ldr     r0, [sp, #0x88]
        bl      __subsf3
        ldr     r1, [sp, #0x78]
        mov     r11, r0
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x88]
        mov     r0, r6
        bl      __mulsf3
        ldr     r2, [sp, #0x58]
        ldr     r1, [sp, #0x88]
        ldr     r10, [r2, +r9, lsl #2]
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x88]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #4]
        mov     r0, r7
        bl      __mulsf3
        ldr     r2, [sp, #0x74]
        ldr     r1, [sp, #4]
        ldr     r2, [r2]
        str     r2, [sp]
        bl      __addsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x94]
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x98]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x9C]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0xA0]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0xA0]
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0xA0]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0xA4]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0xA4]
        bl      __addsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0xA4]
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        ldr     r1, [sp, #0x7C]
        ldr     r0, [sp, #0x94]
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __subsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r6
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x54]
        mov     r1, r7
        str     r0, [r2, +r9, lsl #2]
        mov     r0, r4
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        add     r9, r9, #2
        ldr     r1, [r2]
        bl      __addsf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r2, [sp, #0x6C]
        str     r0, [r2]
        ldr     r1, [sp, #0x9C]
        ldr     r0, [sp, #4]
        bl      __subsf3
        ldr     r2, [sp, #0x64]
        str     r0, [r2]
        ldr     r1, [sp, #0x94]
        ldr     r0, [sp, #0xA0]
        bl      __addsf3
        ldr     r2, [sp, #0x60]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0xA4]
        bl      __subsf3
        ldr     r2, [sp, #0x5C]
        str     r0, [r2]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0x94]
        bl      __subsf3
        ldr     r2, [sp, #8]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0xA4]
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x98]
        bl      __subsf3
        ldr     r1, [sp, #0x18]
        str     r0, [r1]
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        str     r0, [r1]
        ldr     r0, [sp, #0x50]
        cmp     r9, r0
        ldr     r0, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #8
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #8
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #8
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #8
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #8
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #8
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #8
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #8
        str     r0, [sp, #0x1C]
        blt     LCLC1
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x58]
LCLC2:
        ldr     r3, [sp, #0x40]
        ldr     r12, [sp, #0x4C]
        subs    r3, r3, #1
        str     r3, [sp, #0x40]
        add     r8, r8, r12, lsl #3
        add     r7, r7, r12, lsl #3
        bne     LCLC0
LCLC3:
        add     sp, sp, #0xA8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLC_C_1_5
        .long   LCLC_C_2_5
        .long   LCLC_S_1_5
        .long   LCLC_S_2_5


        .data
        .align  4


LCLC_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCLC_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCLC_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCLC_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


