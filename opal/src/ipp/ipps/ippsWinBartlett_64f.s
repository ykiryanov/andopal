        .text
        .align  4
        .globl  _ippsWinBartlett_64f


_ippsWinBartlett_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r11, r0
        cmp     r11, #0
        mov     r6, r1
        mov     r7, r2
        beq     LALD6
        cmp     r6, #0
        beq     LALD6
        cmp     r7, #3
        blt     LALD4
        sub     r9, r7, #1
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        add     r12, r6, r7, lsl #3
        add     r3, r11, r7, lsl #3
        cmp     r7, #3
        mov     r5, r0
        sub     r8, r3, #0x10
        sub     lr, r12, #8
        add     r10, r11, #8
        mov     r4, #0
        beq     LALD7
        cmp     r9, #0
        str     r4, [r12, #-8]
        str     r4, [r12, #-4]
        mov     r12, r4
        mov     r9, #1
        movlt   r12, r9
        add     r12, r7, r12
        sub     r2, r12, #1
        str     r4, [r6]
        mov     r12, r2, asr #1
        cmp     r12, #1
        str     r4, [r6, #4]
        add     r11, r6, #8
        sub     r7, lr, #8
        movle   r6, r4
        ble     LALD3
        sub     r2, r12, #1
        cmp     r2, #4
        movlt   r6, r4
        blt     LALD1
        mov     r6, r4
        str     r9, [sp, #0xC]
        sub     lr, r12, #4
        mov     r9, r6
        str     lr, [sp, #8]
        str     r12, [sp, #4]
        mov     r6, r1
LALD0:
        ldr     r12, [sp, #0xC]
        mov     r0, r5
        mov     r1, r6
        add     r12, r12, #3
        str     r12, [sp, #0xC]
        mov     r2, r9
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r4, r0
        mov     r9, r1
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r9
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, r5
        mov     r1, r6
        mov     r2, r4
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        mov     r4, r0
        mov     r9, r1
        bl      __muldf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r2, [r8, #-8]
        ldr     r3, [r8, #-4]
        mov     r0, r4
        mov     r1, r9
        bl      __muldf3
        str     r0, [r7, #-8]
        str     r1, [r7, #-4]
        mov     r2, r4
        mov     r3, r9
        mov     r0, r5
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r10, #0x10]
        ldr     r3, [r10, #0x14]
        mov     r9, r0
        mov     r4, r1
        bl      __muldf3
        str     r0, [r11, #0x10]
        str     r1, [r11, #0x14]
        ldr     r2, [r8, #-0x10]
        ldr     r3, [r8, #-0xC]
        mov     r0, r9
        mov     r1, r4
        bl      __muldf3
        str     r0, [r7, #-0x10]
        str     r1, [r7, #-0xC]
        sub     r8, r8, #8
        sub     lr, r7, #8
        sub     r12, r8, #8
        ldr     r8, [sp, #8]
        ldr     r7, [sp, #0xC]
        sub     lr, lr, #8
        add     r10, r10, #0x18
        add     r11, r11, #0x18
        cmp     r7, r8
        sub     r8, r12, #8
        sub     r7, lr, #8
        ble     LALD0
        mov     r1, r6
        mov     r6, r9
        ldr     r12, [sp, #4]
        ldr     r9, [sp, #0xC]
LALD1:
        str     r12, [sp, #4]
        str     r1, [sp]
LALD2:
        mov     r0, r5
        ldr     r1, [sp]
        mov     r2, r6
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r6, r0
        mov     r4, r1
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r6
        mov     r1, r4
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r12, [sp, #4]
        add     r9, r9, #1
        add     r10, r10, #8
        cmp     r9, r12
        add     r11, r11, #8
        sub     r8, r8, #8
        sub     r7, r7, #8
        blt     LALD2
        ldr     r1, [sp]
LALD3:
        cmp     r11, r7
        beq     LALD5
        mov     r0, r5
        mov     r2, r6
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LALD4:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LALD5:
        ldr     r0, [r10]
        ldr     r10, [r10, #4]
        str     r0, [r11]
        str     r10, [r11, #4]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LALD6:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LALD7:
        str     r4, [r6]
        str     r4, [r6, #4]
        ldr     r2, [r11, #8]
        ldr     r11, [r11, #0xC]
        mov     r0, #0
        str     r2, [r6, #8]
        str     r11, [r6, #0xC]
        str     r4, [r12, #-8]
        str     r4, [r12, #-4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


