        .text
        .align  4
        .globl  _ippsLSPQuant_G729E_32f


_ippsLSPQuant_G729E_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4F, 30
        ldr     r7, [sp, #0x160]
        mov     r8, r0
        cmp     r8, #0
        mov     r6, r1
        mov     r4, r2
        mov     r5, r3
        beq     LDHW21
        cmp     r6, #0
        beq     LDHW21
        cmp     r5, #0
        beq     LDHW21
        cmp     r7, #0
        beq     LDHW21
        cmp     r4, #0
        beq     LDHW21
        mov     r9, #0
LDHW0:
        ldr     r0, [r8], #4
        bl      __extendsfdf2
        bl      acos
        bl      __truncdfsf2
        add     r12, sp, #0x88
        str     r0, [r12, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, #0xA
        blt     LDHW0
        add     r0, sp, #0x88
        ldr     r0, [r0, #4]
        mov     r12, #0xFF, 12
        orr     r8, r12, #3, 4
        bl      __extendsfdf2
        ldr     r2, [pc, #0xB2C]
        ldr     r3, [pc, #0xB2C]
        bl      __subdf3
        mov     r3, r8
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        ldr     lr, [pc, #0xB18]
        ldr     r12, [pc, #0xB18]
        mov     r10, r0
        ldr     r9, [lr]
        ldr     r8, [r12]
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        add     r11, sp, #0x34
        strgt   r8, [r11]
        bgt     LDHW1
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        ldr     r12, [pc, #0xAE8]
        ldr     r1, [r12]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r11]
LDHW1:
        ldr     r2, [pc, #0xAD0]
        mov     r1, #1
        mov     r0, #8
        str     r7, [sp, #8]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x14]
        add     r10, sp, #0x90
        add     r11, sp, #0x88
        str     r4, [sp, #0x10]
        mov     r5, r0
        mov     r6, r1
        mov     r7, r2
LDHW2:
        ldr     r0, [r10], #4
        mov     r1, r8
        bl      __subsf3
        ldr     r1, [r11], #4
        bl      __subsf3
        mov     r4, r0
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        movgt   r0, r8
        bgt     LDHW3
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r7]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
LDHW3:
        add     r3, sp, #0x34
        str     r0, [r3, +r6, lsl #2]
        subs    r5, r5, #1
        add     r6, r6, #1
        bne     LDHW2
        ldr     r7, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        add     r12, sp, #0x88
        ldr     r0, [r12, #0x20]
        bl      __extendsfdf2
        ldr     r10, [pc, #0xA2C]
        ldr     r11, [pc, #0xA2C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        bl      __truncdfsf2
        mov     r10, r0
        mov     r1, r9
        add     r11, sp, #0x34
        bl      __gtsf2
        cmp     r0, #0
        bgt     LDHW4
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        ldr     r12, [pc, #0x9E4]
        ldr     r1, [r12]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
LDHW4:
        ldr     r12, [pc, #0x9D8]
        add     r0, sp, #0x34
        ldr     r0, [r0, #0x10]
        ldr     r9, [r12]
        str     r8, [r11, #0x24]
        mov     r11, #0
        mov     r1, r9
        bl      __mulsf3
        add     r12, sp, #0x34
        str     r0, [r12, #0x10]
        add     r8, sp, #0x34
        ldr     r0, [r8, #0x14]
        mov     r1, r9
        mov     r10, r11
        bl      __mulsf3
        ldr     r12, [pc, #0x9A0]
        str     r0, [r8, #0x14]
        add     r1, sp, #0xBC
        add     r3, sp, #0xE4
        add     r0, sp, #0x34
        str     r11, [sp, #0x18]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x10]
        add     r2, sp, #0xB0
        add     lr, sp, #0xB8
        add     r8, r12, #5, 26
        add     r9, r12, #0x63, 30
        str     r12, [sp, #0x20]
        str     r7, [sp, #8]
        str     r6, [sp, #0x14]
        mov     r4, r0
        mov     r11, r1
        mov     r5, r3
LDHW5:
        ldr     r2, [sp, #0x20]
        mov     r0, #0
        mov     r7, r8
        add     r1, r2, #0x74
        ldr     r2, [sp, #0x14]
        str     r10, [sp, #0x1C]
        mov     r5, r0
        mov     r4, r1
        add     r6, r2, #0x74
LDHW6:
        ldr     r1, [r4, #-0x74]
        ldr     r0, [r6, #-0x74]
        add     r2, sp, #0x88
        ldr     r11, [r2, +r5, lsl #2]
        add     r10, sp, #0xE4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r6, #-0x4C]
        ldr     r2, [r4, #-0x4C]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r4, #-0x24]
        ldr     r2, [r6, #-0x24]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r6, #4]!
        ldr     r2, [r4, #4]!
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r7], #4
        bl      __mulsf3
        str     r0, [r10, +r5, lsl #2]
        add     r5, r5, #1
        cmp     r5, #0xA
        blt     LDHW6
        ldr     r10, [sp, #0x1C]
        add     r2, sp, #0xB8
        add     r1, sp, #0x84
        add     r0, sp, #0xE4
        add     r4, sp, #0x34
        add     r5, sp, #0xE4
        add     r11, sp, #0xBC
        bl      _ippsLSPSelect1stStage_G729_32f
        ldr     r1, [sp, #0xB8]
        add     lr, sp, #0x7C
        add     r3, sp, #0x2C
        str     r1, [lr, +r10, lsl #2]
        add     r2, sp, #0x34
        add     r0, sp, #0xE4
        add     r12, sp, #0xB0
        str     r12, [sp]
        bl      _ippsLSPSelect2ndStage_G729_32f
        add     lr, sp, #0xB0
        ldr     r0, [sp, #0xB8]
        ldr     lr, [lr]
        add     r7, sp, #0xB0
        ldr     r3, [r7, #4]
        add     r12, sp, #0x6C
        add     r2, sp, #0xBC
        add     r1, sp, #0xB0
        add     r6, sp, #0x74
        str     r3, [r12, +r10, lsl #2]
        str     lr, [r6, +r10, lsl #2]
        bl      _ippsBuildQuantLSPVector_G729_32f
        ldr     r2, [pc, #0x804]
        mov     r0, #1
        add     r12, sp, #0xB8
        ldr     r6, [r2]
        ldr     r2, [pc, #0x810]
        add     r3, r12, #4
        mov     r11, r0
        ldr     r7, [r2]
        ldr     r2, [pc, #0x804]
        ldr     r1, [r2]
        mov     r2, r0
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x28]
        mov     r5, r1
        mov     r10, r2
        mov     r9, r3
LDHW7:
        add     r12, sp, #0xBC
        ldr     r1, [r12, +r10, lsl #2]
        ldr     r8, [r9]
        mov     r0, r8
        bl      __subsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHW8
        mov     r0, r8
        mov     r1, r4
        bl      __subsf3
        str     r0, [r9]
        add     r12, sp, #0xBC
        ldr     r0, [r12, +r11, lsl #2]
        mov     r1, r4
        bl      __addsf3
        add     r12, sp, #0xBC
        str     r0, [r12, +r11, lsl #2]
LDHW8:
        add     r10, r10, #1
        cmp     r10, #0xA
        add     r11, r11, #1
        add     r9, r9, #4
        blt     LDHW7
        mov     r1, r5
        ldr     r2, [pc, #0x76C]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        ldr     r0, [r2]
        ldr     r10, [sp, #0x1C]
        mov     r2, #1
        add     r5, sp, #0xE4
        add     r11, sp, #0xBC
        mov     r3, r2
        add     r12, sp, #0xB8
        str     r8, [sp, #0x28]
        str     r10, [sp, #0x1C]
        add     r4, sp, #0x34
        add     r7, r12, #4
        str     r9, [sp, #0x24]
        mov     r8, r0
        mov     r5, r1
        mov     r11, r2
        mov     r10, r3
LDHW9:
        add     r12, sp, #0xBC
        ldr     r1, [r12, +r10, lsl #2]
        ldr     r9, [r7]
        mov     r0, r9
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHW10
        mov     r0, r9
        mov     r1, r4
        bl      __subsf3
        str     r0, [r7]
        add     r12, sp, #0xBC
        ldr     r0, [r12, +r11, lsl #2]
        mov     r1, r4
        bl      __addsf3
        add     r12, sp, #0xBC
        str     r0, [r12, +r11, lsl #2]
LDHW10:
        add     r10, r10, #1
        cmp     r10, #0xA
        add     r11, r11, #1
        add     r7, r7, #4
        blt     LDHW9
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x28]
        ldr     r7, [r9, #4]
        add     r4, sp, #0x34
        add     r5, sp, #0xE4
        ldr     r1, [r5]
        add     r11, sp, #0xBC
        ldr     r0, [r11]
        add     r8, r8, #0x28
        add     r10, r10, #1
        bl      __subsf3
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [sp, #0x20]
        ldr     r1, [r4]
        mov     r7, r0
        add     r2, r2, #0xA0
        str     r2, [sp, #0x20]
        bl      __mulsf3
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [r11, #4]
        ldr     r1, [r5, #4]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #8]
        bl      __mulsf3
        ldr     r1, [r4, #4]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [r11, #8]
        ldr     r1, [r5, #8]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0xC]
        bl      __mulsf3
        ldr     r1, [r4, #8]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r5, #0xC]
        ldr     r2, [r11, #0xC]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x10]
        bl      __mulsf3
        ldr     r1, [r4, #0xC]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r5, #0x10]
        ldr     r2, [r11, #0x10]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x14]
        bl      __mulsf3
        ldr     r1, [r4, #0x10]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [r11, #0x14]
        ldr     r1, [r5, #0x14]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x18]
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r5, #0x18]
        ldr     r2, [r11, #0x18]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x1C]
        bl      __mulsf3
        ldr     r1, [r4, #0x18]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r5, #0x1C]
        ldr     r2, [r11, #0x1C]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x20]
        bl      __mulsf3
        ldr     r1, [r4, #0x1C]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r5, #0x20]
        ldr     r2, [r11, #0x20]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x24]
        bl      __mulsf3
        ldr     r1, [r4, #0x20]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [r5, #0x24]
        ldr     r2, [r11, #0x24]
        mov     r7, r0
        mov     r0, r2
        bl      __subsf3
        ldr     r1, [r9, #0x28]!
        bl      __mulsf3
        ldr     r1, [r4, #0x24]
        mov     r6, r0
        bl      __mulsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        add     r12, sp, #0x4D, 30
        str     r0, [r12, +r2, lsl #2]
        add     r2, r2, #1
        cmp     r10, #2
        str     r2, [sp, #0x18]
        blt     LDHW5
        ldr     r7, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        add     r0, sp, #0x4D, 30
        add     r12, sp, #0x4D, 30
        ldr     r1, [r12]
        ldr     r0, [r0, #4]
        mov     r9, #1
        bl      __ltsf2
        cmp     r0, #0
        movge   r8, #0
        movlt   r8, r9
        add     r0, sp, #0x7C
        ldr     r0, [r0, +r8, lsl #2]
        add     r12, sp, #0x74
        add     r10, sp, #0x5C
        ldr     r12, [r12, +r8, lsl #2]
        str     r0, [r10, #4]
        add     lr, sp, #0x6C
        ldr     lr, [lr, +r8, lsl #2]
        add     r10, sp, #0x5C
        orr     r0, r0, r8, lsl #7
        str     r0, [r7]
        str     r12, [r10, #8]
        add     r11, sp, #0x5C
        ldr     r0, [r11, #4]
        orr     r12, lr, r12, lsl #5
        str     r12, [r7, #4]
        add     r12, sp, #0x5C
        add     r2, sp, #0x43, 30
        str     lr, [r12, #0xC]
        add     r1, r10, #8
        add     r11, sp, #0x5C
        str     r8, [r11]
        bl      _ippsBuildQuantLSPVector_G729_32f
        ldr     r0, [pc, #0x384]
        ldr     r7, [pc, #0x39C]
        ldr     lr, [pc, #0x39C]
        ldr     r0, [r0]
        add     r12, sp, #0x42, 30
        ldr     r2, [r7]
        ldr     r1, [lr]
        str     r8, [sp, #0x18]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x14]
        mov     r10, r9
        add     r7, r12, #4
        str     r4, [sp, #0x10]
        mov     r6, r0
        mov     r5, r1
        mov     r8, r2
LDHW11:
        add     r3, sp, #0x43, 30
        ldr     r1, [r3, +r10, lsl #2]
        ldr     r11, [r7]
        mov     r0, r11
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHW12
        mov     r0, r11
        mov     r1, r4
        add     r11, sp, #0x43, 30
        bl      __subsf3
        str     r0, [r7]
        ldr     r0, [r11, +r9, lsl #2]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r11, +r9, lsl #2]
LDHW12:
        add     r10, r10, #1
        cmp     r10, #0xA
        add     r9, r9, #1
        add     r7, r7, #4
        blt     LDHW11
        mov     r1, r5
        mov     r0, r6
        ldr     lr, [pc, #0x2F0]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        ldr     r7, [lr]
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0x10]
        add     r12, sp, #0x42, 30
        mov     r11, #1
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x14]
        add     r9, r12, #4
        mov     r10, r11
        str     r8, [sp, #0x18]
        str     r4, [sp, #0x10]
        mov     r6, r0
        mov     r5, r1
LDHW13:
        add     r2, sp, #0x43, 30
        ldr     r1, [r2, +r10, lsl #2]
        ldr     r8, [r9]
        mov     r0, r8
        bl      __subsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHW14
        mov     r0, r8
        mov     r1, r4
        add     r8, sp, #0x43, 30
        bl      __subsf3
        str     r0, [r9]
        ldr     r0, [r8, +r11, lsl #2]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8, +r11, lsl #2]
LDHW14:
        add     r10, r10, #1
        cmp     r10, #0xA
        add     r11, r11, #1
        add     r9, r9, #4
        blt     LDHW13
        ldr     r4, [sp, #0x10]
        ldr     r8, [sp, #0x18]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        add     r0, sp, #0x43, 30
        mov     r1, r4
        mov     r2, #0xA
        bl      _ippsCopy_32f
        ldr     r0, [pc, #0x214]
        add     r8, r8, r8, lsl #2
        mov     r4, #0
        add     r2, r0, #0x19, 28
        add     r0, r0, r8, lsl #5
        add     r8, r2, r8, lsl #3
        add     r7, r0, #0x74
        add     r6, r6, #0x74
        mov     r9, r4
LDHW15:
        add     r10, sp, #0x43, 30
        ldr     r0, [r10, +r9, lsl #2]
        ldr     r1, [r8], #4
        bl      __mulsf3
        ldr     r2, [r6, #-0x74]
        ldr     r1, [r7, #-0x74]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r7, #-0x4C]
        ldr     r2, [r6, #-0x4C]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r7, #-0x24]
        ldr     r2, [r6, #-0x24]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r7, #4]!
        ldr     r2, [r6, #4]!
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r10, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, #0xA
        blt     LDHW15
        ldr     r0, [pc, #0x148]
        add     r10, sp, #0x11, 28
        mov     r9, r4
        ldr     r6, [r0]
        mov     r8, r9
        mov     r7, r10
        str     r5, [sp, #0xC]
LDHW16:
        add     r2, sp, #0x43, 30
        ldr     r5, [r2, +r9, lsl #2]
        ldr     r11, [r7]
        mov     r1, r5
        mov     r0, r11
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHW17
        str     r5, [r7]
        add     r2, sp, #0x43, 30
        str     r11, [r2, +r8, lsl #2]
LDHW17:
        add     r9, r9, #1
        cmp     r9, #9
        add     r8, r8, #1
        add     r7, r7, #4
        blt     LDHW16
        ldr     r0, [pc, #0x10C]
        ldr     r5, [sp, #0xC]
        add     r1, sp, #0x43, 30
        ldr     r9, [r1]
        ldr     r8, [r0]
        mov     r7, r4
        mov     r1, r9
        mov     r0, r8
        bl      __gtsf2
        ldr     r2, [pc, #0xEC]
        cmp     r0, #0
        ldr     r6, [r2]
        add     r12, sp, #0x43, 30
        movgt   r9, r8
        str     r9, [r12]
LDHW18:
        add     r2, sp, #0x43, 30
        ldr     r0, [r10]
        ldr     r8, [r2, +r7, lsl #2]
        mov     r1, r8
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHW19
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10]
LDHW19:
        add     r7, r7, #1
        cmp     r7, #9
        add     r10, r10, #4
        blt     LDHW18
        ldr     r0, [pc, #0x94]
        add     r7, sp, #0x43, 30
        ldr     r6, [r7, #0x24]
        ldr     r8, [r0]
        mov     r1, r6
        mov     r0, r8
        bl      __ltsf2
        cmp     r0, #0
        movlt   r6, r8
        str     r6, [r7, #0x24]
LDHW20:
        add     r0, sp, #0x43, 30
        ldr     r0, [r0, +r4, lsl #2]
        add     r4, r4, #1
        bl      __extendsfdf2
        bl      cos
        bl      __truncdfsf2
        str     r0, [r5], #4
        cmp     r4, #0xA
        blt     LDHW20
        mov     r0, #0
        add     sp, sp, #0x4F, 30
        ldmia   sp!, {r4 - r11, pc}
LDHW21:
        mvn     r0, #7
        add     sp, sp, #0x4F, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x8c0eff43
        .long   0x3fc015bf
        .long   LDHW__2il0floatpacket.1
        .long   LDHW__2il0floatpacket.2
        .long   LDHW__2il0floatpacket.3
        .long   0xd215980a
        .long   0x3ffe3e86
        .long   LDHW__2il0floatpacket.4
        .long   LDHW_fg
        .long   LDHW__2il0floatpacket.5
        .long   LDHW__2il0floatpacket.6
        .long   LDHW__2il0floatpacket.7
        .long   LDHW__2il0floatpacket.8
        .long   LDHW__2il0floatpacket.9
        .long   LDHW__2il0floatpacket.10


        .data
        .align  4


LDHW__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDHW__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F
LDHW__2il0floatpacket.3:
        .byte   0x00,0x00,0x20,0x41
LDHW__2il0floatpacket.4:
        .byte   0x9A,0x99,0x99,0x3F
LDHW__2il0floatpacket.5:
        .byte   0x52,0x49,0x9D,0x3A
LDHW__2il0floatpacket.6:
        .byte   0x00,0x00,0x00,0x3F
LDHW__2il0floatpacket.7:
        .byte   0x52,0x49,0x1D,0x3A
LDHW__2il0floatpacket.8:
        .byte   0x0A,0xD7,0xA3,0x3B
LDHW__2il0floatpacket.9:
        .byte   0x2E,0x90,0x20,0x3D
LDHW__2il0floatpacket.10:
        .byte   0xD7,0xA3,0x48,0x40


        .data
        .align  4


LDHW_fg:
        .byte   0x81,0x95,0x83,0x3E,0x04,0x56,0x8E,0x3E,0x29,0x5C,0x8F,0x3E,0x4D,0x15,0x8C,0x3E
        .byte   0x8D,0x28,0x8D,0x3E,0x4D,0x84,0x8D,0x3E,0xC3,0xF5,0x88,0x3E,0x15,0x1D,0x89,0x3E
        .byte   0xE9,0x48,0x8E,0x3E,0xC2,0x86,0x87,0x3E,0x3F,0x57,0x5B,0x3E,0x65,0xAA,0x60,0x3E
        .byte   0xC4,0xB1,0x6E,0x3E,0x1D,0x5A,0x64,0x3E,0x1E,0xA7,0x68,0x3E,0xD4,0x9A,0x66,0x3E
        .byte   0x88,0xF4,0x5B,0x3E,0x2C,0x65,0x59,0x3E,0x75,0x93,0x58,0x3E,0x62,0xA1,0x56,0x3E
        .byte   0x0C,0x02,0x2B,0x3E,0x88,0xF4,0x1B,0x3E,0xF7,0x75,0x20,0x3E,0xC1,0xCA,0x21,0x3E
        .byte   0x41,0xF1,0x23,0x3E,0x65,0xAA,0x20,0x3E,0xAE,0xB6,0x22,0x3E,0x64,0x3B,0x1F,0x3E
        .byte   0x07,0xF0,0x16,0x3E,0xD3,0xDE,0x20,0x3E,0xDB,0x8A,0xFD,0x3D,0xA4,0x70,0xBD,0x3D
        .byte   0x2F,0x6E,0xA3,0x3D,0xC8,0x07,0xBD,0x3D,0xA2,0x45,0xB6,0x3D,0x0C,0x93,0xA9,0x3D
        .byte   0x17,0xD9,0xCE,0x3D,0xA8,0x57,0xCA,0x3D,0xEA,0x95,0xB2,0x3D,0x87,0x16,0xD9,0x3D
        .byte   0xFC,0xA9,0x71,0x3E,0xA2,0x45,0x76,0x3E,0xC9,0xE5,0x7F,0x3E,0xEE,0x7C,0x7F,0x3E
        .byte   0xD3,0xDE,0x80,0x3E,0xC1,0xA8,0x84,0x3E,0x94,0xF6,0x86,0x3E,0x66,0x66,0x86,0x3E
        .byte   0x78,0x9C,0x82,0x3E,0x44,0x8B,0x6C,0x3E,0x81,0x95,0x03,0x3E,0xA4,0x70,0xBD,0x3D
        .byte   0x09,0x8A,0x9F,0x3D,0x87,0x16,0xD9,0x3D,0x45,0x47,0xF2,0x3D,0x45,0xD8,0xF0,0x3D
        .byte   0xCA,0xC3,0x02,0x3E,0xDC,0xD7,0x01,0x3E,0x8F,0x53,0xF4,0x3D,0x47,0x03,0xF8,0x3D
        .byte   0xA7,0xE8,0xC8,0x3D,0x20,0x41,0x71,0x3D,0xE6,0x3F,0x24,0x3D,0x6F,0xF0,0x85,0x3D
        .byte   0x51,0xDA,0x9B,0x3D,0x2B,0x18,0x95,0x3D,0x9F,0x3C,0xAC,0x3D,0x30,0x2A,0xA9,0x3D
        .byte   0xC0,0xEC,0x9E,0x3D,0x10,0x7A,0xB6,0x3D,0xC8,0x07,0xBD,0x3D,0xCB,0x10,0x47,0x3D
        .byte   0x43,0x1C,0xEB,0x3C,0x16,0xFB,0x4B,0x3D,0x19,0x73,0x57,0x3D,0x5D,0x6D,0x45,0x3D
        .byte   0x92,0x5C,0x7E,0x3D,0xB8,0x40,0x82,0x3D,0xD7,0x34,0x6F,0x3D,0x78,0x9C,0xA2,0x3D
LDHW_fg_sum_inv:
        .byte   0x2B,0x74,0x86,0x40,0x24,0x41,0x78,0x40,0x4F,0x97,0x7F,0x40,0x4C,0xDD,0x7C,0x40
        .byte   0x42,0x08,0x81,0x40,0x09,0x64,0x77,0x40,0x27,0x41,0x78,0x40,0xBE,0xF6,0x70,0x40
        .byte   0x50,0xE2,0x67,0x40,0x7C,0xB7,0x73,0x40,0xB4,0xC9,0x0F,0x40,0x93,0xC6,0xE4,0x3F
        .byte   0x99,0x21,0xD4,0x3F,0x2F,0xD4,0xF1,0x3F,0x0F,0x56,0xFF,0x3F,0xE9,0xD3,0xFE,0x3F
        .byte   0xDD,0x60,0x0A,0x40,0x56,0xC8,0x09,0x40,0x0E,0xB8,0x02,0x40,0x0E,0x80,0x05,0x40
LDHW_fg_sum:
        .byte   0x46,0xB6,0x73,0x3E,0x5D,0xFE,0x83,0x3E,0x6E,0x34,0x80,0x3E,0x54,0x96,0x81,0x3E
        .byte   0xB7,0xF3,0x7D,0x3E,0x55,0x74,0x84,0x3E,0x5B,0xFE,0x83,0x3E,0xBA,0xFC,0x87,0x3E
        .byte   0xE0,0x4F,0x8D,0x3E,0x80,0x73,0x86,0x3E,0x26,0xE4,0xE3,0x3E,0x65,0x3B,0x0F,0x3F
        .byte   0x6D,0x78,0x1A,0x3F,0x34,0x80,0x07,0x3F,0x31,0x55,0x00,0x3F,0xBC,0x96,0x00,0x3F
        .byte   0xCE,0xCC,0xEC,0x3E,0xF2,0xD2,0xED,0x3E,0xD9,0xAC,0xFA,0x3E,0xEA,0x73,0xF5,0x3E


