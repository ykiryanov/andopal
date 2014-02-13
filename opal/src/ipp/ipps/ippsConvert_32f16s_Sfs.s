        .text
        .align  4
        .globl  _ippsConvert_32f16s_Sfs


_ippsConvert_32f16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r11, [sp, #0x40]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r8, r3
        beq     LCWO24
        cmp     r6, #0
        beq     LCWO24
        cmp     r5, #0
        ble     LCWO25
        mov     r12, #0xFE, 12
        cmp     r11, #0
        orr     r4, r12, #3, 4
        mvn     r10, #0
        mov     r9, #0
        bne     LCWO2
        ldr     r12, [pc, #0x4A0]
        ldr     r11, [pc, #0x4A0]
        cmp     r8, #1
        ldr     r8, [r12]
        add     r0, r10, #2, 18
        sub     r12, r9, #2, 18
        beq     LCWO9
        mov     r10, r9
        str     r12, [sp, #0x10]
        mov     r9, r0
LCWO0:
        ldr     r4, [r7], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        strgeh  r9, [r6]
        bge     LCWO1
        ldr     r1, [r11]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        ldrle   r3, [sp, #0x10]
        strleh  r3, [r6]
        ble     LCWO1
        mov     r0, r4
        bl      __fixsfsi
        strh    r0, [r6]
LCWO1:
        add     r10, r10, #1
        cmp     r10, r5
        add     r6, r6, #2
        blt     LCWO0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWO2:
        cmp     r11, #0
        ble     LCWO21
        cmp     r11, #6
        movlt   r0, r9
        addlt   r1, r4, #1, 12
        blt     LCWO4
        mov     r0, r9
        sub     r2, r11, #6
        str     r5, [sp, #0x18]
        add     r1, r4, #1, 12
        mov     r5, r2
LCWO3:
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
        add     r9, r9, #5
        cmp     r9, r5
        ble     LCWO3
        ldr     r5, [sp, #0x18]
LCWO4:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r9, r9, #1
        cmp     r9, r11
        blt     LCWO4
LCWO5:
        ldr     r3, [pc, #0x390]
        mvn     r12, #0xFF
        cmp     r8, #1
        bic     r12, r12, #0x7F, 24
        beq     LCWO15
        cmp     r5, #0
        ble     LCWO8
        mov     r10, r10, lsl #15
        mvn     r12, r12
        str     r10, [sp, #0x10]
        str     r4, [sp, #0x14]
        mov     r9, r5
        str     r12, [sp, #8]
        mov     r5, r0
        mov     r4, r1
        mov     r8, r3
        mov     r10, r6
        mov     r11, r7
LCWO6:
        ldr     r0, [r11], #4
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
        ldrge   r12, [sp, #8]
        strgeh  r12, [r10]
        bge     LCWO7
        mov     r0, r7
        ldr     r12, [sp, #0x14]
        mov     r1, r6
        mov     r2, #0
        sub     r3, r12, #0x7F, 8
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp, #0x10]
        strleh  r12, [r10]
        ble     LCWO7
        mov     r0, r7
        mov     r1, r6
        bl      __fixdfsi
        strh    r0, [r10]
LCWO7:
        subs    r9, r9, #1
        add     r10, r10, #2
        bne     LCWO6
LCWO8:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWO9:
        ldr     lr, [pc, #0x2C4]
        str     r12, [sp, #0x10]
        str     r0, [sp]
        str     r10, [sp, #0xC]
LCWO10:
        ldr     r10, [r7], #4
        mov     r1, r8
        mov     r0, r10
        bl      __gesf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strgeh  r12, [r6]
        bge     LCWO14
        ldr     r12, [pc, #0x28C]
        mov     r0, r10
        ldr     r1, [r12]
        bl      __lesf2
        cmp     r0, #0
        ldrle   r12, [sp, #0x10]
        strleh  r12, [r6]
        ble     LCWO14
        ldr     r12, [pc, #0x274]
        mov     r0, r10
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        bge     LCWO11
        mov     r12, #1
        sub     r11, r4, #2, 2
        str     r12, [sp, #4]
        b       LCWO12
LCWO11:
        mov     r11, r4
        ldr     r12, [sp, #0xC]
        str     r12, [sp, #4]
LCWO12:
        mov     r0, r10
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWO13
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #4]
        addeq   r11, r11, r12
LCWO13:
        strh    r11, [r6]
LCWO14:
        add     r9, r9, #1
        cmp     r9, r5
        add     r6, r6, #2
        blt     LCWO10
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWO15:
        cmp     r5, #0
        ble     LCWO8
        mov     lr, r10, lsl #15
        str     r10, [sp, #0xC]
        mov     r10, r6
        mvn     r12, r12
        mov     r9, r5
        mov     r6, r4
        str     lr, [sp, #0x10]
        str     r12, [sp]
        mov     r5, r0
        mov     r4, r1
        mov     r11, r7
LCWO16:
        ldr     r0, [r11], #4
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [pc, #0x188]
        mov     r8, r0
        mov     r7, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strgeh  r12, [r10]
        bge     LCWO20
        mov     r0, r8
        sub     r3, r6, #0x7F, 8
        mov     r1, r7
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrle   r12, [sp, #0x10]
        strleh  r12, [r10]
        ble     LCWO20
        mov     r0, r8
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LCWO17
        mov     r12, #1
        sub     r3, r6, #2, 2
        str     r12, [sp, #4]
        b       LCWO18
LCWO17:
        mov     r3, r6
        ldr     r12, [sp, #0xC]
        str     r12, [sp, #4]
LCWO18:
        mov     r0, r8
        mov     r1, r7
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r7, r0
        bl      __fixdfsi
        mov     r8, r0
        tst     r8, #1
        beq     LCWO19
        mov     r0, r8
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r7
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #4]
        addeq   r8, r8, r12
LCWO19:
        strh    r8, [r10]
LCWO20:
        subs    r9, r9, #1
        add     r10, r10, #2
        bne     LCWO16
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWO21:
        cmp     r11, #0
        movge   r0, r9
        addge   r1, r4, #1, 12
        bge     LCWO5
        rsb     r12, r11, #0
        cmp     r12, #6
        movlt   r0, r9
        addlt   r1, r4, #1, 12
        blt     LCWO23
        mov     r0, r9
        add     r1, r4, #1, 12
LCWO22:
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
        blt     LCWO22
LCWO23:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r11, r11, #1
        bmi     LCWO23
        b       LCWO5
LCWO24:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWO25:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWO__2il0floatpacket.1
        .long   LCWO__2il0floatpacket.2
        .long   0x40dfffc0
        .long   LCWO__2il0floatpacket.3


        .data
        .align  4


LCWO__2il0floatpacket.1:
        .byte   0x00,0xFE,0xFF,0x46
LCWO__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC7
LCWO__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00


