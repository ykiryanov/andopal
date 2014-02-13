        .text
        .align  4
        .globl  _ippsDotProd_32f64f


_ippsDotProd_32f64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        mov     r6, r2
        beq     LCGZ4
        cmp     r1, #0
        beq     LCGZ4
        cmp     r3, #0
        beq     LCGZ4
        cmp     r6, #0
        ble     LCGZ5
        cmp     r6, #0
        mov     r10, #0
        movle   r5, r10
        movle   r4, r5
        ble     LCGZ3
        cmp     r6, #6
        movlt   r5, r10
        movlt   r4, r5
        blt     LCGZ1
        mov     r5, r10
        mov     r4, r5
        sub     r9, r6, #6
        add     r8, r0, #4
        add     r7, r1, #4
        str     r3, [sp]
        str     r6, [sp, #0xC]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
LCGZ0:
        ldr     r0, [r8, #-4]
        add     r10, r10, #5
        bl      __extendsfdf2
        mov     r11, r1
        mov     r6, r0
        ldr     r0, [r7, #-4]
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, r6
        bl      __muldf3
        mov     r3, r4
        mov     r2, r5
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [r8]
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [r7]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        mov     r2, r6
        mov     r3, r11
        bl      __adddf3
        mov     r11, r1
        mov     r6, r0
        ldr     r0, [r8, #4]
        bl      __extendsfdf2
        ldr     r2, [r7, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [r8, #8]
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [r7, #8]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r6
        mov     r3, r11
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [r8, #0xC]
        mov     r11, r1
        add     r8, r8, #0x14
        bl      __extendsfdf2
        mov     r4, r0
        ldr     r0, [r7, #0xC]
        mov     r5, r1
        add     r7, r7, #0x14
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r6
        mov     r3, r11
        bl      __adddf3
        cmp     r10, r9
        mov     r5, r0
        mov     r4, r1
        ble     LCGZ0
        ldr     r3, [sp]
        ldr     r6, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
LCGZ1:
        add     r11, r0, r10, lsl #2
        add     r9, r1, r10, lsl #2
        str     r3, [sp]
LCGZ2:
        ldr     r0, [r11], #4
        add     r10, r10, #1
        bl      __extendsfdf2
        ldr     r2, [r9], #4
        mov     r7, r0
        mov     r8, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r10, r6
        mov     r5, r0
        mov     r4, r1
        blt     LCGZ2
        ldr     r3, [sp]
LCGZ3:
        mov     r0, #0
        str     r5, [r3]
        str     r4, [r3, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCGZ4:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCGZ5:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


