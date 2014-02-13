        .text
        .align  4
        .globl  _ippsDotProd_32s_Sfs


_ippsDotProd_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r10, [sp, #0x38]
        cmp     r0, #0
        mov     r7, r2
        mov     r6, r3
        beq     LCGW12
        cmp     r1, #0
        beq     LCGW12
        cmp     r6, #0
        beq     LCGW12
        cmp     r7, #0
        ble     LCGW13
        cmp     r7, #6
        mov     r11, #0
        movlt   r4, r11
        movlt   r5, r4
        blt     LCGW1
        mov     r4, r11
        sub     r2, r7, #6
        str     r6, [sp]
        mov     r5, r4
        add     r8, r0, #4
        add     r9, r1, #4
        str     r10, [sp, #4]
        str     r7, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r0, [sp, #8]
        mov     r6, r2
LCGW0:
        ldr     r0, [r8, #-4]
        add     r11, r11, #5
        bl      __floatsidf
        mov     r7, r0
        ldr     r0, [r9, #-4]
        mov     r10, r1
        bl      __floatsidf
        mov     r3, r10
        mov     r2, r7
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [r8]
        mov     r10, r1
        bl      __floatsidf
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r3, r10
        mov     r2, r7
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [r8, #4]
        mov     r10, r1
        bl      __floatsidf
        ldr     r2, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r3, r10
        mov     r2, r7
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [r8, #8]
        mov     r10, r1
        bl      __floatsidf
        ldr     r2, [r9, #8]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r7
        mov     r3, r10
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [r8, #0xC]
        mov     r10, r1
        add     r8, r8, #0x14
        bl      __floatsidf
        ldr     r2, [r9, #0xC]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r7
        mov     r3, r10
        bl      __adddf3
        cmp     r11, r6
        add     r9, r9, #0x14
        mov     r4, r0
        mov     r5, r1
        ble     LCGW0
        ldr     r10, [sp, #4]
        ldr     r6, [sp]
        ldr     r7, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #8]
LCGW1:
        add     r9, r0, r11, lsl #2
        add     r8, r1, r11, lsl #2
        str     r10, [sp, #4]
        str     r6, [sp]
LCGW2:
        ldr     r0, [r9], #4
        add     r11, r11, #1
        bl      __floatsidf
        ldr     r2, [r8], #4
        mov     r6, r0
        mov     r10, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r11, r7
        mov     r4, r0
        mov     r5, r1
        blt     LCGW2
        ldr     r10, [sp, #4]
        ldr     r6, [sp]
        mov     r12, #0xFE, 12
        cmp     r10, #0
        orr     r7, r12, #3, 4
        mov     r9, #0
        ble     LCGW9
        cmp     r10, #6
        movlt   r11, #0
        blt     LCGW4
        mov     r11, #0
        sub     r8, r10, #6
LCGW3:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        add     r11, r11, #5
        cmp     r11, r8
        mov     r4, r0
        mov     r5, r1
        ble     LCGW3
LCGW4:
        mov     r0, r4
        mov     r1, r5
        mov     r3, r7
        mov     r2, #0
        bl      __muldf3
        add     r11, r11, #1
        cmp     r11, r10
        mov     r4, r0
        mov     r5, r1
        blt     LCGW4
LCGW5:
        mov     r0, r4
        mvn     r12, #0xE2, 12
        sub     r2, r9, #1, 10
        bic     r8, r12, #0xB, 4
        mov     r1, r5
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        subgt   r4, r9, #1, 10
        bgt     LCGW6
        sub     r10, r7, #0x7E, 8
        mov     r2, r4
        mov     r0, #0
        mov     r1, r10
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        mov     r8, r5
        movgt   r4, r9
        movgt   r8, r10
LCGW6:
        mov     r0, r4
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        mvnge   r5, #0
        sublt   r7, r7, #2, 2
        movlt   r5, #1
        mov     r0, r4
        mov     r1, r8
        mov     r3, r7
        mov     r2, #0
        bl      __adddf3
        mov     r8, r0
        mov     r7, r1
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        streq   r4, [r6]
        beq     LCGW7
        mov     r0, r4
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        beq     LCGW8
        str     r4, [r6]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGW7:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGW8:
        add     r4, r5, r4
        str     r4, [r6]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGW9:
        cmp     r10, #0
        bge     LCGW5
        rsb     r8, r10, #0
        cmp     r8, #0
        ble     LCGW5
        cmp     r8, #6
        movlt   r11, #0
        blt     LCGW11
        mvn     r12, #5
        rsb     r10, r10, r12
        mov     r11, #0
LCGW10:
        mov     r2, r4
        mov     r3, r5
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r11, r11, #5
        cmp     r11, r10
        mov     r4, r0
        mov     r5, r1
        ble     LCGW10
LCGW11:
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        add     r11, r11, #1
        cmp     r11, r8
        mov     r4, r0
        mov     r5, r1
        blt     LCGW11
        b       LCGW5
LCGW12:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGW13:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


