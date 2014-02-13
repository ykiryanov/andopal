        .text
        .align  4
        .globl  _ippsRandUniform_32f


_ippsRandUniform_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r3, r0
        cmp     r3, #0
        mov     r5, r1
        beq     LAYX4
        cmp     r2, #0
        beq     LAYX4
        cmp     r5, #0
        ble     LAYX5
        ldr     r12, [r2]
        cmp     r12, #0x25
        beq     LAYX0
        mvn     r0, #0x10
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAYX0:
        ldr     lr, [r2, #0x10]
        ldr     r12, [r2, #0x14]
        ldr     r7, [r2, #0x18]
        ldr     r1, [r2, #0x1C]
        ldr     r6, [r2, #0x20]
        ldr     r9, [r2, #0x24]
        ldr     r0, [r2, #0x28]
        ldr     r4, [r2, #0x2C]
        ldr     r10, [r2, #0x30]
        cmp     r5, #4
        movlt   r8, #0
        blt     LAYX2
        sub     r11, r5, #4
        mov     r8, #0
        str     r6, [sp]
        str     r11, [sp, #0x18]
        str     r8, [sp, #4]
        str     r10, [sp, #8]
        str     r5, [sp, #0x10]
        mov     r6, r7
        add     r11, r3, #4
        str     r2, [sp, #0xC]
        str     r3, [sp, #0x14]
        mov     r10, r0
        mov     r5, r1
        mov     r7, r12
        mov     r8, lr
LAYX1:
        ldr     r0, [pc, #0x21C]
        ldr     r1, [sp]
        sub     r4, r10, r4
        sub     r10, r9, r10
        mul     r0, r1, r0
        ldr     r1, [sp, #8]
        str     r10, [sp, #8]
        add     r4, r4, r1
        mov     r10, r4, asr #31
        and     r1, r10, #0x12
        sub     r4, r4, r1
        ldr     r1, [pc, #0x1F4]
        sub     r9, r4, r9
        add     r0, r0, r1
        ldr     r1, [pc, #0x1E4]
        mul     r1, r0, r1
        add     r0, r0, r4
        str     r1, [sp]
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #8]
        add     r10, r2, r10
        bl      __truncdfsf2
        str     r0, [r11, #-4]
        ldr     r1, [sp]
        mov     r0, r10, asr #31
        str     r0, [sp, #8]
        and     r0, r0, #0x12
        sub     r10, r10, r0
        ldr     r0, [pc, #0x198]
        add     r0, r1, r0
        ldr     r1, [pc, #0x18C]
        mul     r1, r0, r1
        add     r0, r0, r10
        str     r1, [sp]
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        ldr     r12, [sp, #8]
        add     r9, r9, r12
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r3, [sp]
        ldr     r2, [pc, #0x154]
        mov     r1, r9, asr #31
        str     r1, [sp, #8]
        and     r1, r1, #0x12
        add     r2, r3, r2
        str     r2, [sp]
        sub     r9, r9, r1
        ldr     r1, [sp]
        str     r0, [r11]
        add     r1, r1, r9
        mov     r0, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #4]
        add     r1, r1, #3
        str     r1, [sp, #4]
        str     r0, [r11, #4]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #4]
        add     r11, r11, #0xC
        cmp     r1, r0
        ble     LAYX1
        mov     r1, r5
        mov     r12, r7
        mov     r7, r6
        mov     lr, r8
        mov     r0, r10
        ldr     r8, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r6, [sp]
        ldr     r2, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r3, [sp, #0x14]
LAYX2:
        add     r11, r3, r8, lsl #2
        str     r1, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x1C]
        str     r2, [sp, #0xC]
LAYX3:
        ldr     r3, [pc, #0x9C]
        ldr     r2, [pc, #0x9C]
        sub     r4, r0, r4
        mul     r6, r6, r3
        add     r3, r4, r10
        mov     r4, r0
        mov     r10, r3, asr #31
        and     r0, r10, #0x12
        sub     r7, r3, r0
        add     r6, r6, r2
        add     r0, r6, r7
        bl      __floatsidf
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        bl      __adddf3
        bl      __truncdfsf2
        mov     r1, r0
        add     r8, r8, #1
        mov     r0, r9
        str     r1, [r11], #4
        cmp     r8, r5
        mov     r9, r7
        blt     LAYX3
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #0x28]
        mov     r0, #0
        str     r6, [r2, #0x20]
        str     r7, [r2, #0x24]
        str     r4, [r2, #0x2C]
        str     r10, [r2, #0x30]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAYX4:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAYX5:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373


