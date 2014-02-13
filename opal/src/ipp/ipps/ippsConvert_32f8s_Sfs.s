        .text
        .align  4
        .globl  _ippsConvert_32f8s_Sfs


_ippsConvert_32f8s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r11, [sp, #0x38]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r7, r2
        mov     r8, r3
        beq     LCWL24
        cmp     r5, #0
        beq     LCWL24
        cmp     r7, #0
        ble     LCWL25
        mov     r12, #0xFE, 12
        cmp     r11, #0
        orr     r4, r12, #3, 4
        mvn     r9, #0x7F
        mov     r10, #0
        bne     LCWL2
        ldr     r12, [pc, #0x480]
        ldr     r11, [pc, #0x480]
        cmp     r8, #1
        ldr     r8, [r12]
        mov     r12, #0x7F
        beq     LCWL9
LCWL0:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        movge   r3, #0x7F
        strgeb  r3, [r5]
        bge     LCWL1
        ldr     r1, [r11]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        strleb  r9, [r5]
        ble     LCWL1
        mov     r0, r4
        bl      __fixsfsi
        strb    r0, [r5]
LCWL1:
        add     r10, r10, #1
        cmp     r10, r7
        add     r5, r5, #1
        blt     LCWL0
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWL2:
        cmp     r11, #0
        ble     LCWL21
        cmp     r11, #6
        movlt   r0, r10
        addlt   r1, r4, #1, 12
        blt     LCWL4
        mov     r0, r10
        sub     r2, r11, #6
        str     r7, [sp, #0xC]
        add     r1, r4, #1, 12
        mov     r7, r2
LCWL3:
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
        ble     LCWL3
        ldr     r7, [sp, #0xC]
LCWL4:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r10, r10, #1
        cmp     r10, r11
        blt     LCWL4
LCWL5:
        ldr     r3, [pc, #0x380]
        cmp     r8, #1
        mov     r12, #0x7F
        beq     LCWL15
        cmp     r7, #0
        ble     LCWL8
        mov     lr, #0xFE, 12
        str     r9, [sp, #4]
        orr     lr, lr, #0xB, 4
        mov     r9, r5
        str     lr, [sp, #8]
        mov     r5, r0
        mov     r4, r1
        mov     r8, r3
        mov     r10, r6
        mov     r11, r7
LCWL6:
        ldr     r0, [r10], #4
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r2, #0
        mov     r3, r8
        bl      __gedf2
        cmp     r0, #0
        movge   r12, #0x7F
        strgeb  r12, [r9]
        bge     LCWL7
        ldr     r12, [sp, #8]
        mov     r0, r6
        mov     r1, r7
        add     r3, r12, #2, 10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp, #4]
        strleb  r12, [r9]
        ble     LCWL7
        mov     r0, r6
        mov     r1, r7
        bl      __fixdfsi
        strb    r0, [r9]
LCWL7:
        subs    r11, r11, #1
        add     r9, r9, #1
        bne     LCWL6
LCWL8:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWL9:
        ldr     lr, [pc, #0x2BC]
        str     r9, [sp, #4]
LCWL10:
        ldr     r9, [r6], #4
        mov     r1, r8
        mov     r0, r9
        bl      __gesf2
        cmp     r0, #0
        movge   r12, #0x7F
        strgeb  r12, [r5]
        bge     LCWL14
        ldr     r12, [pc, #0x28C]
        mov     r0, r9
        ldr     r1, [r12]
        bl      __lesf2
        cmp     r0, #0
        ldrle   r12, [sp, #4]
        strleb  r12, [r5]
        ble     LCWL14
        ldr     r12, [pc, #0x274]
        mov     r0, r9
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        bge     LCWL11
        mov     r12, #1
        sub     r11, r4, #2, 2
        str     r12, [sp]
        b       LCWL12
LCWL11:
        mov     r11, r4
        mvn     r12, #0
        str     r12, [sp]
LCWL12:
        mov     r0, r9
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r9, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWL13
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r9
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp]
        addeq   r11, r11, r12
LCWL13:
        strb    r11, [r5]
LCWL14:
        add     r10, r10, #1
        cmp     r10, r7
        add     r5, r5, #1
        blt     LCWL10
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWL15:
        cmp     r7, #0
        ble     LCWL8
        str     r9, [sp, #4]
        mov     r9, r7
        str     r4, [sp, #0x10]
        mov     r7, r5
        mov     r8, r6
        mov     r5, r0
        mov     r4, r1
        mov     r6, r3
LCWL16:
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
        movge   r12, #0x7F
        strgeb  r12, [r7]
        bge     LCWL20
        mov     r0, r11
        mov     r12, #0xFE, 12
        orr     r12, r12, #0xB, 4
        add     r3, r12, #2, 10
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp, #4]
        strleb  r12, [r7]
        ble     LCWL20
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LCWL17
        ldr     r12, [sp, #0x10]
        sub     r3, r12, #2, 2
        mov     r12, #1
        str     r12, [sp]
        b       LCWL18
LCWL17:
        ldr     r3, [sp, #0x10]
        mvn     r12, #0
        str     r12, [sp]
LCWL18:
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWL19
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp]
        addeq   r11, r11, r12
LCWL19:
        strb    r11, [r7]
LCWL20:
        subs    r9, r9, #1
        add     r7, r7, #1
        bne     LCWL16
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWL21:
        cmp     r11, #0
        movge   r0, r10
        addge   r1, r4, #1, 12
        bge     LCWL5
        rsb     r12, r11, #0
        cmp     r12, #6
        movlt   r0, r10
        addlt   r1, r4, #1, 12
        blt     LCWL23
        mov     r0, r10
        add     r1, r4, #1, 12
LCWL22:
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
        blt     LCWL22
LCWL23:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r11, r11, #1
        bmi     LCWL23
        b       LCWL5
LCWL24:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWL25:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWL__2il0floatpacket.1
        .long   LCWL__2il0floatpacket.2
        .long   0x405fc000
        .long   LCWL__2il0floatpacket.3


        .data
        .align  4


LCWL__2il0floatpacket.1:
        .byte   0x00,0x00,0xFE,0x42
LCWL__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC3
LCWL__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00


