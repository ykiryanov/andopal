        .text
        .align  4
        .globl  _ippsConvert_32f8u_Sfs


_ippsConvert_32f8u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r10, [sp, #0x34]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r7, r2
        mov     r8, r3
        beq     LCWK21
        cmp     r5, #0
        beq     LCWK21
        cmp     r7, #0
        ble     LCWK22
        mov     r12, #0xFE, 12
        cmp     r10, #0
        orr     r4, r12, #3, 4
        mov     r9, #0
        bne     LCWK2
        ldr     r12, [pc, #0x3FC]
        ldr     r10, [pc, #0x3FC]
        cmp     r8, #1
        ldr     r8, [r12]
        mov     r12, r9
        mov     r11, #0xFF
        beq     LCWK9
LCWK0:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        strgeb  r11, [r5]
        bge     LCWK1
        ldr     r1, [r10]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movle   r3, #0
        strleb  r3, [r5]
        ble     LCWK1
        mov     r0, r4
        bl      __fixunssfsi
        strb    r0, [r5]
LCWK1:
        add     r9, r9, #1
        cmp     r9, r7
        add     r5, r5, #1
        blt     LCWK0
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCWK2:
        cmp     r10, #0
        ble     LCWK18
        cmp     r10, #6
        blt     LCWK17
        mov     r0, r9
        sub     r2, r10, #6
        str     r7, [sp, #0xC]
        add     r1, r4, #1, 12
        mov     r11, r0
        mov     r7, r2
LCWK3:
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
        add     r11, r11, #5
        cmp     r11, r7
        ble     LCWK3
        ldr     r7, [sp, #0xC]
LCWK4:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r11, r11, #1
        cmp     r11, r10
        blt     LCWK4
LCWK5:
        ldr     r3, [pc, #0x2FC]
        cmp     r8, #1
        mov     r12, #0xFF
        beq     LCWK13
        cmp     r7, #0
        ble     LCWK8
        str     r9, [sp, #8]
        mov     r9, r5
        mov     r5, r0
        mov     r4, r1
        mov     r8, r3
        mov     r10, r6
        mov     r11, r7
LCWK6:
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
        movge   r12, #0xFF
        strgeb  r12, [r9]
        bge     LCWK7
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp, #8]
        strleb  r12, [r9]
        ble     LCWK7
        mov     r0, r7
        mov     r1, r6
        bl      __fixunsdfsi
        strb    r0, [r9]
LCWK7:
        subs    r11, r11, #1
        add     r9, r9, #1
        bne     LCWK6
LCWK8:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCWK9:
        str     r4, [sp]
LCWK10:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        movge   r3, #0xFF
        strgeb  r3, [r5]
        bge     LCWK12
        ldr     r1, [r10]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movle   r3, #0
        strleb  r3, [r5]
        ble     LCWK12
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r3, [sp]
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #4]
        mov     r4, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWK11
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #4]
        mov     r2, r4
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCWK11:
        strb    r11, [r5]
LCWK12:
        add     r9, r9, #1
        cmp     r9, r7
        add     r5, r5, #1
        blt     LCWK10
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCWK13:
        cmp     r7, #0
        ble     LCWK8
        str     r9, [sp, #8]
        mov     r9, r7
        str     r4, [sp]
        mov     r7, r5
        mov     r8, r6
        mov     r5, r0
        mov     r4, r1
        mov     r6, r3
LCWK14:
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
        movge   r12, #0xFF
        strgeb  r12, [r7]
        bge     LCWK16
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp, #8]
        strleb  r12, [r7]
        ble     LCWK16
        mov     r2, r11
        mov     r3, r10
        ldr     r1, [sp]
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #4]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWK15
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #4]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCWK15:
        strb    r11, [r7]
LCWK16:
        subs    r9, r9, #1
        add     r7, r7, #1
        bne     LCWK14
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCWK17:
        mov     r0, r9
        add     r1, r4, #1, 12
        mov     r11, r0
        b       LCWK4
LCWK18:
        cmp     r10, #0
        movge   r0, r9
        addge   r1, r4, #1, 12
        bge     LCWK5
        rsb     r12, r10, #0
        cmp     r12, #6
        movlt   r0, r9
        addlt   r1, r4, #1, 12
        blt     LCWK20
        mov     r0, r9
        add     r1, r4, #1, 12
LCWK19:
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
        add     r10, r10, #5
        cmn     r10, #6
        blt     LCWK19
LCWK20:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r10, r10, #1
        bmi     LCWK20
        b       LCWK5
LCWK21:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCWK22:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWK__2il0floatpacket.1
        .long   LCWK__2il0floatpacket.2
        .long   0x406fe000


        .data
        .align  4


LCWK__2il0floatpacket.1:
        .byte   0x00,0x00,0x7F,0x43
LCWK__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


