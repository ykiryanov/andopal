        .text
        .align  4
        .globl  _ippsConvert_32f16u_Sfs


_ippsConvert_32f16u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r11, [sp, #0x38]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r7, r2
        mov     r8, r3
        beq     LCWN20
        cmp     r5, #0
        beq     LCWN20
        cmp     r7, #0
        ble     LCWN21
        mov     lr, #0xFE, 12
        mov     r12, #0xFF
        cmp     r11, #0
        orr     r4, lr, #3, 4
        orr     r9, r12, #0xFF, 24
        mov     r10, #0
        bne     LCWN2
        ldr     r12, [pc, #0x3E8]
        ldr     r11, [pc, #0x3E8]
        cmp     r8, #1
        ldr     r8, [r12]
        mov     r12, r10
        beq     LCWN9
LCWN0:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        strgeh  r9, [r5]
        bge     LCWN1
        ldr     r1, [r11]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movle   r3, #0
        strleh  r3, [r5]
        ble     LCWN1
        mov     r0, r4
        bl      __fixunssfsi
        strh    r0, [r5]
LCWN1:
        add     r10, r10, #1
        cmp     r10, r7
        add     r5, r5, #2
        blt     LCWN0
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWN2:
        cmp     r11, #0
        ble     LCWN17
        cmp     r11, #6
        movlt   r0, r10
        addlt   r1, r4, #1, 12
        blt     LCWN4
        mov     r0, r10
        sub     r2, r11, #6
        str     r7, [sp, #0x10]
        add     r1, r4, #1, 12
        mov     r7, r2
LCWN3:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r10, r10, #5
        cmp     r10, r7
        ble     LCWN3
        ldr     r7, [sp, #0x10]
LCWN4:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r10, r10, #1
        cmp     r10, r11
        blt     LCWN4
LCWN5:
        ldr     r3, [pc, #0x2E8]
        cmp     r8, #1
        mov     r12, #0
        beq     LCWN13
        cmp     r7, #0
        ble     LCWN8
        str     r9, [sp, #0xC]
        mov     r9, r5
        mov     r5, r0
        mov     r4, r1
        mov     r8, r3
        mov     r10, r6
        mov     r11, r7
LCWN6:
        ldr     r0, [r10], #4
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        mov     r3, r8
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #0xC]
        strgeh  r12, [r9]
        bge     LCWN7
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #0
        strleh  r12, [r9]
        ble     LCWN7
        mov     r0, r7
        mov     r1, r6
        bl      __fixunsdfsi
        strh    r0, [r9]
LCWN7:
        subs    r11, r11, #1
        add     r9, r9, #2
        bne     LCWN6
LCWN8:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWN9:
        str     r4, [sp, #4]
LCWN10:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        strgeh  r9, [r5]
        bge     LCWN12
        ldr     r1, [r11]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movle   r3, #0
        strleh  r3, [r5]
        ble     LCWN12
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        str     r0, [sp]
        str     r1, [sp, #8]
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        beq     LCWN11
        mov     r0, r4
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r3, [sp, #8]
        bl      __eqdf2
        cmp     r0, #0
        subeq   r4, r4, #1
LCWN11:
        strh    r4, [r5]
LCWN12:
        add     r10, r10, #1
        cmp     r10, r7
        add     r5, r5, #2
        blt     LCWN10
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWN13:
        cmp     r7, #0
        ble     LCWN8
        str     r9, [sp, #0xC]
        mov     r9, r7
        str     r4, [sp, #4]
        mov     r7, r5
        mov     r8, r6
        mov     r5, r0
        mov     r4, r1
        mov     r6, r3
LCWN14:
        ldr     r0, [r8], #4
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, r6
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #0xC]
        strgeh  r12, [r7]
        bge     LCWN16
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #0
        strleh  r12, [r7]
        ble     LCWN16
        mov     r2, r11
        mov     r3, r10
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWN15
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCWN15:
        strh    r11, [r7]
LCWN16:
        subs    r9, r9, #1
        add     r7, r7, #2
        bne     LCWN14
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWN17:
        cmp     r11, #0
        movge   r0, r10
        addge   r1, r4, #1, 12
        bge     LCWN5
        rsb     r12, r11, #0
        cmp     r12, #6
        movlt   r0, r10
        addlt   r1, r4, #1, 12
        blt     LCWN19
        mov     r0, r10
        add     r1, r4, #1, 12
LCWN18:
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
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r11, r11, #5
        cmn     r11, #6
        blt     LCWN18
LCWN19:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r11, r11, #1
        bmi     LCWN19
        b       LCWN5
LCWN20:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWN21:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWN__2il0floatpacket.1
        .long   LCWN__2il0floatpacket.2
        .long   0x40efffe0


        .data
        .align  4


LCWN__2il0floatpacket.1:
        .byte   0x00,0xFF,0x7F,0x47
LCWN__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


