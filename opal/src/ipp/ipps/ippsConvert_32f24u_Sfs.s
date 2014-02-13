        .text
        .align  4
        .globl  _ippsConvert_32f24u_Sfs


_ippsConvert_32f24u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r2
        beq     LCXD9
        cmp     r1, #0
        beq     LCXD9
        cmp     r6, #0
        ble     LCXD8
        mvn     lr, #0xE9, 12
        mov     r12, #0xFE, 12
        bic     r4, lr, #0xB, 4
        cmp     r3, #0
        add     r7, sp, #0xC
        orr     r12, r12, #3, 4
        mvn     lr, #0xFF, 8
        bne     LCXD2
        cmp     r6, #0
        ble     LCXD6
        ldr     r9, [pc, #0x1F0]
        sub     r7, r1, #1
        mov     r8, #0
        str     lr, [sp]
        str     r12, [sp, #8]
LCXD0:
        ldr     r11, [r5], #4
        mov     r0, r11
        bl      __extendsfdf2
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0xE, 4
        mov     r3, r4
        bl      __gedf2
        cmp     r0, #0
        ldrge   r11, [sp]
        bge     LCXD1
        ldr     r12, [pc, #0x1B0]
        mov     r0, r11
        ldr     r1, [r12]
        bl      __lesf2
        cmp     r0, #0
        movle   r11, #0
        ble     LCXD1
        mov     r2, r10
        mov     r3, r9
        ldr     r1, [sp, #8]
        mov     r0, #0
        bl      __adddf3
        mov     r9, r0
        mov     r10, r1
        bl      __fixunsdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCXD1
        mov     r0, r11
        bl      __floatunssidf
        mov     r2, r9
        mov     r3, r10
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCXD1:
        mov     r1, r11, lsr #8
        strb    r1, [r7, #2]
        mov     r1, r11, lsr #16
        add     r8, r8, #1
        strb    r11, [r7, #1]
        strb    r1, [r7, #3]!
        cmp     r8, r6
        blt     LCXD0
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCXD2:
        cmp     r3, #0
        ble     LCXD7
        mov     r8, #0x7F
        cmp     r3, #0x7F
        movlt   r8, r3
LCXD3:
        rsb     r8, r8, #0x7F
        cmp     r6, #0
        mov     r8, r8, lsl #23
        str     r8, [r7]
        ble     LCXD6
        ldr     r7, [sp, #0xC]
        sub     r8, r1, #1
        mov     r9, #0
        str     lr, [sp]
        str     r12, [sp, #8]
LCXD4:
        ldr     r0, [r5], #4
        mov     r1, r7
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0xE, 4
        mov     r3, r4
        bl      __gedf2
        cmp     r0, #0
        ldrge   r11, [sp]
        bge     LCXD5
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r11, #0
        ble     LCXD5
        mov     r2, r11
        mov     r3, r10
        ldr     r1, [sp, #8]
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #4]
        mov     r10, r0
        bl      __fixunsdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCXD5
        mov     r0, r11
        bl      __floatunssidf
        ldr     r3, [sp, #4]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCXD5:
        mov     r12, r11, lsr #8
        strb    r12, [r8, #2]
        mov     r12, r11, lsr #16
        add     r9, r9, #1
        strb    r11, [r8, #1]
        strb    r12, [r8, #3]!
        cmp     r9, r6
        blt     LCXD4
LCXD6:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCXD7:
        mvn     r8, #0x7E
        cmp     r3, r8
        movgt   r8, r3
        b       LCXD3
LCXD8:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCXD9:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCXD__2il0floatpacket.1


        .data
        .align  4


LCXD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


