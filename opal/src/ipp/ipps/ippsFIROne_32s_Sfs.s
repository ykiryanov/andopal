        .text
        .align  4
        .globl  _ippsFIROne_32s_Sfs


_ippsFIROne_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r4, r2
        cmp     r4, #0
        mov     r7, r1
        mov     r6, r3
        beq     LBTE9
        cmp     r7, #0
        beq     LBTE9
        ldr     lr, [r4]
        ldr     r12, [pc, #0x2F4]
        cmp     r12, lr
        beq     LBTE0
        mvn     r0, #0x10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBTE0:
        ldr     r5, [r4, #8]
        ldr     r9, [r4, #0xC]
        ldr     r10, [r4, #4]
        bl      __floatsidf
        ldr     r12, [r4, #0x2C]
        add     lr, r5, r9, lsl #3
        str     r0, [lr, +r12, lsl #3]
        add     r12, lr, r12, lsl #3
        str     r1, [r12, #4]
        ldr     r12, [r4, #0x2C]
        mov     r11, #0
        str     r0, [r5, +r12, lsl #3]
        add     r12, r5, r12, lsl #3
        str     r1, [r12, #4]
        ldr     r0, [r4, #0x2C]
        add     r0, r0, #1
        cmp     r0, r9
        strlt   r0, [r4, #0x2C]
        movge   r0, r11
        strge   r0, [r4, #0x2C]
        cmp     r9, #0
        add     r8, r5, r0, lsl #3
        movle   r5, r11
        movle   r4, r5
        ble     LBTE4
        cmp     r9, #6
        movlt   r5, r11
        movlt   r4, r5
        blt     LBTE2
        mov     r5, r11
        sub     r2, r9, #6
        sub     r1, r8, #4
        sub     r0, r10, #4
        str     r9, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
        mov     r4, r5
        mov     r6, r0
        mov     r7, r1
        mov     r9, r2
LBTE1:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r7, #0x14]
        ldr     r0, [r6, #0x14]
        ldr     r1, [r6, #0x18]
        ldr     r3, [r7, #0x18]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r6, #0x1C]
        ldr     r1, [r6, #0x20]
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r6, #0x24]
        ldr     r1, [r6, #0x28]!
        ldr     r2, [r7, #0x24]
        ldr     r3, [r7, #0x28]!
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        add     r11, r11, #5
        cmp     r11, r9
        mov     r5, r0
        mov     r4, r1
        ble     LBTE1
        ldr     r9, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LBTE2:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
        add     r10, r12, r10
LBTE3:
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]!
        ldr     r2, [r8, #4]
        ldr     r3, [r8, #8]!
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        add     r11, r11, #1
        cmp     r11, r9
        mov     r5, r0
        mov     r4, r1
        blt     LBTE3
LBTE4:
        ldr     r12, [pc, #0x11C]
        cmp     r6, #0
        ldr     r12, [r12]
        str     r12, [sp, #0xC]
        andge   r6, r6, #0x7F
        subge   r0, r12, r6, lsl #23
        blt     LBTE8
LBTE5:
        str     r0, [sp, #0xC]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r6, r12, #3, 4
        mov     r5, r0
        mov     r4, r1
        sub     r3, r6, #0x7E, 8
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r8, #2, 2
        blt     LBTE7
        mov     r0, r5
        mvn     r12, #0xE2, 12
        mov     r8, #0
        bic     r3, r12, #0xB, 4
        sub     r2, r8, #1, 10
        mov     r1, r4
        bl      __gtdf2
        cmp     r0, #0
        mvngt   r8, #2, 2
        bgt     LBTE7
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBTE6
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LBTE7
        mov     r1, r6
        mov     r2, r5
        mov     r3, r4
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r8, r0
        b       LBTE7
LBTE6:
        mov     r0, r5
        mov     r1, r4
        mov     r3, r6
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r8, r0
LBTE7:
        mov     r0, #0
        str     r8, [r7]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBTE8:
        rsb     r6, r6, #0
        and     r6, r6, #0x7F
        add     r0, r12, r6, lsl #23
        b       LBTE5
LBTE9:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493231
        .long   LBTE__2il0floatpacket.1


        .data
        .align  4


LBTE__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


