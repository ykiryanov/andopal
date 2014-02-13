        .text
        .align  4
        .globl  _ippsDotProd_32fc64fc


_ippsDotProd_32fc64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        beq     LCGY3
        cmp     r1, #0
        beq     LCGY3
        cmp     r3, #0
        beq     LCGY3
        cmp     r2, #0
        ble     LCGY4
        cmp     r2, #0
        mov     r12, #0
        ble     LCGY2
        mov     lr, r12
        mov     r4, lr
        add     r11, r0, #4
        mov     r0, r4
        add     r10, r1, #4
        str     r4, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r0, [sp, #4]
        str     r12, [sp, #8]
        str     r3, [sp]
        str     r2, [sp, #0x14]
LCGY0:
        ldr     r0, [r10]
        bl      __extendsfdf2
        ldr     r2, [r10, #-4]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r9, r0
        ldr     r0, [r11]
        mov     r8, r1
        add     r10, r10, #8
        bl      __extendsfdf2
        mov     r7, r0
        ldr     r0, [r11, #-4]
        mov     r6, r1
        add     r11, r11, #8
        bl      __extendsfdf2
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r2, r5
        mov     r3, r4
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        bl      __subdf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        str     r0, [sp, #4]
        subs    r2, r2, #1
        str     r2, [sp, #0x14]
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #8]
        bne     LCGY0
        ldr     r4, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r3, [sp]
LCGY1:
        str     r0, [r3, #8]
        mov     r0, #0
        str     lr, [r3]
        str     r4, [r3, #4]
        str     r12, [r3, #0xC]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCGY2:
        mov     lr, r12
        mov     r4, lr
        mov     r0, r4
        b       LCGY1
LCGY3:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCGY4:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


