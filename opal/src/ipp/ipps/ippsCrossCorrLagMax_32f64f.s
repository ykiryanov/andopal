        .text
        .align  4
        .globl  _ippsCrossCorrLagMax_32f64f


_ippsCrossCorrLagMax_32f64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     lr, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r11, r2
        mov     r6, r3
        beq     LDHK9
        cmp     r9, #0
        beq     LDHK9
        cmp     lr, #0
        beq     LDHK9
        cmp     r12, #0
        beq     LDHK9
        cmp     r11, #0
        ble     LDHK8
        cmp     r6, #0
        blt     LDHK10
        mvn     r4, #0x81, 12
        cmp     r6, #0
        bic     r8, r4, #3, 4
        mov     r7, #0xE, 4
        movlt   r4, #0
        blt     LDHK6
        mov     r4, #0
        sub     r5, r11, #6
        str     r4, [sp, #0x20]
        str     r5, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
LDHK0:
        cmp     r11, #0
        movle   r5, #0
        movle   r4, r5
        ble     LDHK4
        cmp     r11, #6
        blt     LDHK7
        mov     r5, #0
        add     r0, r9, r6, lsl #2
        str     r11, [sp, #8]
        ldr     r11, [sp, #0x1C]
        mov     r4, r5
        add     r3, r10, #4
        mov     r1, r4
        add     r2, r0, #4
        str     r8, [sp, #0x18]
        str     r6, [sp, #0xC]
        str     r9, [sp, #4]
        str     r10, [sp]
        mov     r9, r0
        mov     r10, r1
        mov     r6, r2
        mov     r8, r3
LDHK1:
        ldr     r1, [r6, #-4]
        ldr     r0, [r8, #-4]
        add     r10, r10, #5
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r6]
        ldr     r3, [r8]
        mov     r4, r1
        mov     r5, r0
        mov     r1, r2
        mov     r0, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r8, #4]
        ldr     r3, [r6, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [r8, #8]
        ldr     r2, [r6, #8]
        mov     r4, r1
        mov     r5, r0
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r8, #0xC]
        ldr     r3, [r6, #0xC]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r10, r11
        mov     r5, r0
        mov     r4, r1
        add     r8, r8, #0x14
        add     r6, r6, #0x14
        ble     LDHK1
        mov     r0, r9
        mov     r1, r10
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r10, [sp]
LDHK2:
        add     r2, r10, r1, lsl #2
        str     r6, [sp, #0xC]
        str     r9, [sp, #4]
        str     r10, [sp]
        mov     r9, r0
        mov     r10, r1
        mov     r6, r2
LDHK3:
        ldr     r1, [r9, +r10, lsl #2]
        ldr     r0, [r6], #4
        add     r10, r10, #1
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r10, r11
        mov     r5, r0
        mov     r4, r1
        blt     LDHK3
        ldr     r6, [sp, #0xC]
        ldr     r9, [sp, #4]
        ldr     r10, [sp]
LDHK4:
        mov     r0, r5
        mov     r1, r4
        mov     r2, r7
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        ble     LDHK5
        mov     r7, r5
        mov     r8, r4
        str     r6, [sp, #0x20]
LDHK5:
        subs    r6, r6, #1
        bpl     LDHK0
        ldr     r4, [sp, #0x20]
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x10]
LDHK6:
        str     r7, [lr]
        str     r8, [lr, #4]
        mov     r0, #0
        str     r4, [r12]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDHK7:
        mov     r5, #0
        mov     r4, r5
        mov     r1, r4
        add     r0, r9, r6, lsl #2
        b       LDHK2
LDHK8:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDHK9:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDHK10:
        mvn     r0, #6
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


