        .text
        .align  4
        .globl  ownsUp2Conv_32f


ownsUp2Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r6, [r0, #0xC]
        ldr     r12, [sp, #0x60]
        ldr     r5, [r0, #0x14]
        ldr     r10, [r0, #8]
        ldr     r7, [r0, #0x10]
        sub     r0, r12, r6
        cmp     r12, #0
        add     r12, r0, #1
        rsb     r0, r5, #1
        add     r4, r1, r12, lsl #2
        mov     r8, r2
        add     r0, r1, r0, lsl #2
        mov     r11, #0
        add     r12, r8, #4
        sub     r1, r3, #1
        bne     LAJS14
        cmp     r1, #0
        movle   r9, r11
        ble     LAJS9
        mov     r9, r11
        sub     r2, r6, #6
        str     r2, [sp, #0x34]
        str     r4, [sp, #0x20]
        mov     r2, r8
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x20]
        sub     lr, r5, #6
        str     r4, [sp, #0x38]
        str     r2, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     r3, [sp, #0x30]
        mov     r4, r0
LAJS0:
        cmp     r6, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAJS4
        cmp     r6, #6
        blt     LAJS31
        mov     r1, #0
        add     r12, r8, #4
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x34]
        mov     r2, r1
        add     r3, r10, #4
        mov     r0, r2
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r6, r3
        mov     r7, r12
LAJS1:
        ldr     r1, [r6, #-4]
        ldr     r0, [r7, #-4]
        add     r5, r5, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r6]
        ldr     r3, [r7]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r2
        mov     r0, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7, #4]
        ldr     r3, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r3, [r7, #8]
        ldr     r2, [r6, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7, #0xC]
        ldr     r3, [r6, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r5, r8
        mov     r11, r0
        mov     r10, r1
        add     r7, r7, #0x14
        add     r6, r6, #0x14
        ble     LAJS1
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x20]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS2:
        add     r12, r8, r2, lsl #2
        add     r3, r10, r2, lsl #2
        str     r8, [sp, #0x20]
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r7, r3
        mov     r8, r12
LAJS3:
        ldr     r0, [r8], #4
        ldr     r1, [r7], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r5, r5, #1
        cmp     r5, r6
        mov     r11, r0
        mov     r10, r1
        blt     LAJS3
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x20]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS4:
        bl      __truncdfsf2
        ldr     r1, [sp, #0x18]
        cmp     r5, #0
        str     r0, [r1], #8
        str     r1, [sp, #0x18]
        movle   r1, #0
        movle   r0, r1
        ble     LAJS8
        cmp     r5, #6
        blt     LAJS30
        mov     r1, #0
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        mov     r2, r1
        add     r3, r7, #4
        mov     r0, r2
        add     r12, r4, #4
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r6, r3
        mov     r7, r12
LAJS5:
        ldr     r1, [r6, #-4]
        ldr     r0, [r7, #-4]
        add     r5, r5, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r6]
        ldr     r2, [r7]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r3
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r7, #4]
        ldr     r2, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r7, #8]
        ldr     r3, [r6, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r7, #0xC]
        ldr     r2, [r6, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r5, r8
        mov     r11, r0
        mov     r10, r1
        add     r7, r7, #0x14
        add     r6, r6, #0x14
        ble     LAJS5
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x20]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS6:
        str     r6, [sp, #0xC]
        add     r12, r7, r2, lsl #2
        add     r3, r4, r2, lsl #2
        str     r8, [sp, #0x20]
        str     r7, [sp, #0x10]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r6, r5
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r8, r3
        mov     r7, r12
LAJS7:
        ldr     r0, [r8], #4
        ldr     r1, [r7], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r5, r5, #1
        cmp     r5, r6
        mov     r11, r0
        mov     r10, r1
        blt     LAJS7
        mov     r5, r6
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x20]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS8:
        bl      __truncdfsf2
        ldr     r1, [sp, #0x2C]
        add     r11, r11, #2
        str     r0, [r1], #8
        ldr     r2, [sp, #0x28]
        str     r1, [sp, #0x2C]
        cmp     r11, r2
        add     r4, r4, #4
        add     r8, r8, #4
        add     r9, r9, #1
        blt     LAJS0
        ldr     r4, [sp, #0x38]
        ldr     r3, [sp, #0x30]
        ldr     r8, [sp, #4]
LAJS9:
        cmp     r11, r3
        bge     LAJS29
        cmp     r6, #0
        add     r9, r4, r9, lsl #2
        mov     r5, #0
        movle   r4, r5
        ble     LAJS13
        cmp     r6, #6
        movlt   r7, r5
        movlt   r4, r7
        blt     LAJS11
        mov     r7, r5
        add     r0, r10, #4
        sub     r2, r6, #6
        add     r1, r9, #4
        str     r10, [sp, #8]
        str     r8, [sp, #4]
        str     r11, [sp]
        mov     r4, r7
        mov     r8, r0
        mov     r10, r1
        mov     r11, r2
LAJS10:
        ldr     r1, [r8, #-4]
        ldr     r0, [r10, #-4]
        add     r7, r7, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r1, [r8]
        ldr     r0, [r10]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r10, #4]
        ldr     r1, [r8, #4]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r5, r1
        mov     r4, r0
        ldr     r0, [r10, #8]
        ldr     r1, [r8, #8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r10, #0xC]
        ldr     r1, [r8, #0xC]
        add     r10, r10, #0x14
        add     r8, r8, #0x14
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r7, r11
        mov     r4, r0
        mov     r5, r1
        ble     LAJS10
        ldr     r10, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r11, [sp]
LAJS11:
        add     r9, r9, r7, lsl #2
        add     r10, r10, r7, lsl #2
LAJS12:
        ldr     r0, [r9], #4
        ldr     r1, [r10], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        add     r7, r7, #1
        cmp     r7, r6
        mov     r4, r0
        mov     r5, r1
        blt     LAJS12
LAJS13:
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        str     r0, [r8, +r11, lsl #2]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAJS14:
        cmp     r1, #0
        movle   r9, r11
        ble     LAJS24
        mov     r9, r11
        sub     r2, r6, #6
        str     r2, [sp, #0x34]
        str     r0, [sp, #0x1C]
        mov     r2, r8
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x1C]
        sub     lr, r5, #6
        str     r2, [sp, #0x20]
        str     lr, [sp, #0x18]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     r3, [sp, #0x30]
LAJS15:
        cmp     r5, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAJS19
        cmp     r5, #6
        blt     LAJS33
        mov     r1, #0
        add     r3, r8, #4
        str     r8, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        mov     r2, r1
        add     r12, r7, #4
        mov     r0, r2
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r7, r3
        mov     r6, r12
LAJS16:
        ldr     r1, [r6, #-4]
        ldr     r0, [r7, #-4]
        add     r5, r5, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r6]
        ldr     r2, [r7]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r3
        mov     r0, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r7, #4]
        ldr     r2, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r7, #8]
        ldr     r3, [r6, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [r7, #0xC]
        ldr     r2, [r6, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r5, r8
        mov     r11, r0
        mov     r10, r1
        add     r7, r7, #0x14
        add     r6, r6, #0x14
        ble     LAJS16
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x1C]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS17:
        str     r6, [sp, #0xC]
        add     r3, r8, r2, lsl #2
        add     r12, r7, r2, lsl #2
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x10]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r6, r5
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r8, r3
        mov     r7, r12
LAJS18:
        ldr     r0, [r8], #4
        ldr     r1, [r7], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r5, r5, #1
        cmp     r5, r6
        mov     r11, r0
        mov     r10, r1
        blt     LAJS18
        mov     r5, r6
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS19:
        bl      __truncdfsf2
        ldr     r1, [sp, #0x20]
        cmp     r6, #0
        str     r0, [r1], #8
        str     r1, [sp, #0x20]
        movle   r1, #0
        movle   r0, r1
        ble     LAJS23
        cmp     r6, #6
        blt     LAJS32
        mov     r1, #0
        str     r8, [sp, #0x1C]
        ldr     r8, [sp, #0x34]
        mov     r2, r1
        add     r12, r10, #4
        mov     r0, r2
        add     r3, r4, #4
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r7, r3
        mov     r6, r12
LAJS20:
        ldr     r1, [r6, #-4]
        ldr     r0, [r7, #-4]
        add     r5, r5, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r6]
        ldr     r3, [r7]
        mov     r10, r1
        mov     r11, r0
        mov     r1, r2
        mov     r0, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7, #4]
        ldr     r3, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r3, [r7, #8]
        ldr     r2, [r6, #8]
        mov     r10, r1
        mov     r11, r0
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7, #0xC]
        ldr     r3, [r6, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        cmp     r5, r8
        mov     r11, r0
        mov     r10, r1
        add     r7, r7, #0x14
        add     r6, r6, #0x14
        ble     LAJS20
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x1C]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS21:
        add     r3, r10, r2, lsl #2
        add     r12, r4, r2, lsl #2
        str     r8, [sp, #0x1C]
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r10, [sp, #8]
        str     r11, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r5, r2
        mov     r7, r3
        mov     r8, r12
LAJS22:
        ldr     r0, [r8], #4
        ldr     r1, [r7], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        add     r5, r5, #1
        cmp     r5, r6
        mov     r11, r0
        mov     r10, r1
        blt     LAJS22
        mov     r1, r10
        mov     r0, r11
        ldr     r8, [sp, #0x1C]
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r10, [sp, #8]
        ldr     r11, [sp]
LAJS23:
        bl      __truncdfsf2
        ldr     r1, [sp, #0x2C]
        add     r11, r11, #2
        str     r0, [r1], #8
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x2C]
        cmp     r11, r0
        add     r4, r4, #4
        add     r8, r8, #4
        add     r9, r9, #1
        blt     LAJS15
        ldr     r0, [sp, #0x24]
        ldr     r3, [sp, #0x30]
        ldr     r8, [sp, #4]
LAJS24:
        cmp     r11, r3
        bge     LAJS29
        cmp     r5, #0
        add     r9, r0, r9, lsl #2
        mov     r6, #0
        movle   r4, r6
        ble     LAJS28
        cmp     r5, #6
        movlt   r10, r6
        movlt   r4, r10
        blt     LAJS26
        mov     r10, r6
        add     r0, r7, #4
        sub     r2, r5, #6
        add     r1, r9, #4
        str     r7, [sp, #0x10]
        str     r8, [sp, #4]
        str     r11, [sp]
        mov     r4, r10
        mov     r7, r0
        mov     r8, r1
        mov     r11, r2
LAJS25:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r10, r10, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        mov     r4, r0
        mov     r6, r1
        ldr     r1, [r7]
        ldr     r0, [r8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        mov     r4, r0
        mov     r6, r1
        ldr     r0, [r8, #4]
        ldr     r1, [r7, #4]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        mov     r6, r1
        mov     r4, r0
        ldr     r0, [r8, #8]
        ldr     r1, [r7, #8]
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        mov     r4, r0
        mov     r6, r1
        ldr     r0, [r8, #0xC]
        ldr     r1, [r7, #0xC]
        add     r8, r8, #0x14
        add     r7, r7, #0x14
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        cmp     r10, r11
        mov     r4, r0
        mov     r6, r1
        ble     LAJS25
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #4]
        ldr     r11, [sp]
LAJS26:
        add     r9, r9, r10, lsl #2
        add     r7, r7, r10, lsl #2
LAJS27:
        ldr     r0, [r9], #4
        ldr     r1, [r7], #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        add     r10, r10, #1
        cmp     r10, r5
        mov     r4, r0
        mov     r6, r1
        blt     LAJS27
LAJS28:
        mov     r0, r4
        mov     r1, r6
        bl      __truncdfsf2
        str     r0, [r8, +r11, lsl #2]
LAJS29:
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAJS30:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJS6
LAJS31:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJS2
LAJS32:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJS21
LAJS33:
        mov     r1, #0
        mov     r2, r1
        mov     r0, r2
        b       LAJS17


