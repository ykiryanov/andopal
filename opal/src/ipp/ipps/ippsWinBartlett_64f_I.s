        .text
        .align  4
        .globl  _ippsWinBartlett_64f_I


_ippsWinBartlett_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r4, r0
        cmp     r4, #0
        mov     r8, r1
        beq     LALC6
        cmp     r8, #3
        blt     LALC4
        sub     r9, r8, #1
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        add     r12, r4, r8, lsl #3
        cmp     r8, #3
        mov     r7, r0
        mov     r6, r1
        sub     r2, r12, #8
        mov     r5, #0
        beq     LALC5
        str     r5, [r12, #-8]
        str     r5, [r12, #-4]
        cmp     r9, #0
        mov     r12, r5
        mov     r11, #1
        movlt   r12, r11
        add     r12, r8, r12
        sub     r12, r12, #1
        str     r5, [r4]
        mov     r10, r12, asr #1
        cmp     r10, #1
        str     r5, [r4, #4]
        add     r9, r4, #8
        sub     r8, r2, #8
        movle   r4, r5
        ble     LALC2
        sub     r2, r10, #1
        cmp     r2, #5
        movlt   r4, r5
        blt     LALC1
        mov     r4, r5
        sub     r12, r10, #5
        str     r12, [sp, #4]
        str     r10, [sp]
LALC0:
        mov     r2, r4
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ldr     r2, [r8, #-8]
        ldr     r3, [r8, #-4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8, #-8]
        str     r1, [r8, #-4]
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r9, #0x10]
        ldr     r3, [r9, #0x14]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r9, #0x10]
        str     r1, [r9, #0x14]
        ldr     r2, [r8, #-0x10]
        ldr     r3, [r8, #-0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8, #-0x10]
        str     r1, [r8, #-0xC]
        mov     r2, r4
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r9, #0x18]
        ldr     r3, [r9, #0x1C]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r9, #0x18]
        str     r1, [r9, #0x1C]
        ldr     r2, [r8, #-0x18]
        ldr     r3, [r8, #-0x14]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        sub     r10, r8, #8
        str     r0, [r8, #-0x18]
        str     r1, [r8, #-0x14]
        ldr     r12, [sp, #4]
        sub     r10, r10, #8
        add     r11, r11, #4
        sub     r10, r10, #8
        cmp     r11, r12
        add     r9, r9, #0x20
        sub     r8, r10, #8
        ble     LALC0
        ldr     r10, [sp]
LALC1:
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        add     r11, r11, #1
        str     r0, [r8]
        str     r1, [r8, #4]
        cmp     r11, r10
        add     r9, r9, #8
        sub     r8, r8, #8
        blt     LALC1
LALC2:
        cmp     r9, r8
        beq     LALC3
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
LALC3:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LALC4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LALC5:
        str     r5, [r4]
        str     r5, [r4, #4]
        mov     r0, #0
        str     r5, [r12, #-8]
        str     r5, [r12, #-4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LALC6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


