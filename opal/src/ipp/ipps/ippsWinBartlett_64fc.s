        .text
        .align  4
        .globl  _ippsWinBartlett_64fc


_ippsWinBartlett_64fc:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r11, r0
        cmp     r11, #0
        mov     r10, r1
        mov     r9, r2
        beq     LALB4
        cmp     r10, #0
        beq     LALB4
        cmp     r9, #3
        blt     LALB2
        sub     r8, r9, #1
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        mov     r4, #0
        add     lr, r11, r9, lsl #4
        add     r12, r10, r9, lsl #4
        sub     r6, lr, #0x20
        cmp     r9, #3
        mov     r5, r0
        str     r4, [r10, #4]
        str     r4, [r10]
        str     r4, [r10, #0xC]
        str     r4, [r10, #8]
        add     r7, r11, #0x10
        sub     lr, r12, #0x10
        beq     LALB5
        cmp     r8, #0
        mov     r8, r4
        mov     r11, #1
        movlt   r8, r11
        add     r8, r9, r8
        sub     r2, r8, #1
        add     r11, r10, #0x10
        mov     r2, r2, asr #1
        cmp     r2, #1
        str     r4, [r12, #-8]
        str     r4, [r12, #-4]
        str     r4, [r12, #-0x10]
        str     r4, [r12, #-0xC]
        sub     r10, lr, #0x10
        movle   r8, r4
        ble     LALB1
        sub     r9, r2, #1
        mov     r8, r4
        str     r1, [sp]
LALB0:
        mov     r0, r5
        ldr     r1, [sp]
        mov     r2, r8
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r8, r0
        mov     r4, r1
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        mov     r0, r8
        mov     r1, r4
        bl      __muldf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        mov     r0, r8
        mov     r1, r4
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [r6, #8]
        ldr     r3, [r6, #0xC]
        mov     r0, r8
        mov     r1, r4
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        subs    r9, r9, #1
        add     r7, r7, #0x10
        add     r11, r11, #0x10
        sub     r6, r6, #0x10
        sub     r10, r10, #0x10
        bne     LALB0
        ldr     r1, [sp]
LALB1:
        cmp     r11, r10
        beq     LALB3
        mov     r0, r5
        mov     r2, r8
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [r6, #8]
        ldr     r3, [r6, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LALB2:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LALB3:
        ldr     r0, [r7, #4]
        ldr     r1, [r7]
        str     r0, [r11, #4]
        str     r1, [r11]
        ldr     r0, [r7, #8]
        ldr     r7, [r7, #0xC]
        str     r0, [r11, #8]
        str     r7, [r11, #0xC]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LALB4:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LALB5:
        ldr     r2, [r11, #0x14]
        ldr     lr, [r11, #0x10]
        mov     r0, #0
        str     r2, [r10, #0x14]
        str     lr, [r10, #0x10]
        ldr     r2, [r11, #0x18]
        ldr     r11, [r11, #0x1C]
        str     r2, [r10, #0x18]
        str     r11, [r10, #0x1C]
        str     r4, [r12, #-8]
        str     r4, [r12, #-4]
        str     r4, [r12, #-0x10]
        str     r4, [r12, #-0xC]
        ldmia   sp!, {r1, r4 - r11, pc}


