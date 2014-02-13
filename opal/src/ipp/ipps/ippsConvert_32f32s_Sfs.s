        .text
        .align  4
        .globl  _ippsConvert_32f32s_Sfs


_ippsConvert_32f32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r10, [sp, #0x40]
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r5, r2
        mov     r8, r3
        beq     LCWM24
        cmp     r7, #0
        beq     LCWM24
        cmp     r5, #0
        ble     LCWM25
        mov     r12, #0xFE, 12
        cmp     r10, #0
        orr     r4, r12, #3, 4
        mvn     r9, #2, 2
        mov     r11, #0
        bne     LCWM2
        ldr     r12, [pc, #0x46C]
        ldr     r10, [pc, #0x46C]
        cmp     r8, #1
        ldr     r8, [r12]
        mov     r12, #2, 2
        beq     LCWM9
LCWM0:
        ldr     r4, [r6], #4
        mov     r1, r8
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        strge   r9, [r7]
        bge     LCWM1
        ldr     r1, [r10]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movle   r3, #2, 2
        strle   r3, [r7]
        ble     LCWM1
        mov     r0, r4
        bl      __fixsfsi
        str     r0, [r7]
LCWM1:
        add     r11, r11, #1
        cmp     r11, r5
        add     r7, r7, #4
        blt     LCWM0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWM2:
        cmp     r10, #0
        ble     LCWM21
        cmp     r10, #6
        movlt   r0, r11
        addlt   r1, r4, #1, 12
        blt     LCWM4
        mov     r0, r11
        sub     r2, r10, #6
        str     r5, [sp, #0x10]
        add     r1, r4, #1, 12
        mov     r5, r2
LCWM3:
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
        cmp     r11, r5
        ble     LCWM3
        ldr     r5, [sp, #0x10]
LCWM4:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r11, r11, #1
        cmp     r11, r10
        blt     LCWM4
LCWM5:
        mvn     r12, #0xE2, 12
        cmp     r8, #1
        mov     lr, #0xFF, 12
        bic     r10, r12, #0xB, 4
        orr     r8, lr, #3, 4
        mov     r12, #2, 2
        beq     LCWM15
        cmp     r5, #0
        ble     LCWM8
        str     r9, [sp]
        str     r4, [sp, #0xC]
        mov     r9, r7
        str     r0, [sp, #8]
        mov     r4, r1
        mov     r11, r5
        mov     r7, r6
LCWM6:
        ldr     r0, [r7], #4
        bl      __extendsfdf2
        ldr     r2, [sp, #8]
        mov     r3, r4
        bl      __muldf3
        mov     r6, r0
        mov     r5, r1
        mov     r2, r8, lsl #2
        mov     r3, r10
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strge   r12, [r9]
        bge     LCWM7
        mov     r0, r6
        ldr     r12, [sp, #0xC]
        mov     r1, r5
        mov     r2, #0
        sub     r3, r12, #0x7E, 8
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r9]
        ble     LCWM7
        mov     r0, r6
        mov     r1, r5
        bl      __fixdfsi
        str     r0, [r9]
LCWM7:
        subs    r11, r11, #1
        add     r9, r9, #4
        bne     LCWM6
LCWM8:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWM9:
        ldr     lr, [pc, #0x2A4]
        str     r9, [sp]
LCWM10:
        ldr     r9, [r6], #4
        mov     r1, r8
        mov     r0, r9
        bl      __gesf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strge   r12, [r7]
        bge     LCWM14
        ldr     r12, [pc, #0x278]
        mov     r0, r9
        ldr     r1, [r12]
        bl      __lesf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r7]
        ble     LCWM14
        ldr     r12, [pc, #0x25C]
        mov     r0, r9
        ldr     r1, [r12]
        bl      __ltsf2
        cmp     r0, #0
        bge     LCWM11
        mov     r12, #1
        sub     r10, r4, #2, 2
        str     r12, [sp, #4]
        b       LCWM12
LCWM11:
        mov     r10, r4
        mvn     r12, #0
        str     r12, [sp, #4]
LCWM12:
        mov     r0, r9
        bl      __extendsfdf2
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r9, r0
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCWM13
        mov     r0, r10
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r9
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #4]
        addeq   r10, r10, r12
LCWM13:
        str     r10, [r7]
LCWM14:
        add     r11, r11, #1
        cmp     r11, r5
        add     r7, r7, #4
        blt     LCWM10
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWM15:
        cmp     r5, #0
        ble     LCWM8
        str     r9, [sp]
        mov     r9, r5
        mov     r5, r4
        str     r0, [sp, #8]
        str     r10, [sp, #0x18]
        mov     r4, r1
LCWM16:
        ldr     r0, [r6], #4
        bl      __extendsfdf2
        ldr     r2, [sp, #8]
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [sp, #0x18]
        mov     r11, r0
        mov     r10, r1
        mov     r2, r8, lsl #2
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strge   r12, [r7]
        bge     LCWM20
        mov     r0, r11
        sub     r3, r5, #0x7E, 8
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r7]
        ble     LCWM20
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LCWM17
        mov     r12, #1
        sub     r3, r5, #2, 2
        str     r12, [sp, #0x14]
        b       LCWM18
LCWM17:
        mov     r3, r5
        mvn     r12, #0
        str     r12, [sp, #0x14]
LCWM18:
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #4]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWM19
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #4]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #0x14]
        addeq   r11, r11, r12
LCWM19:
        str     r11, [r7]
LCWM20:
        subs    r9, r9, #1
        add     r7, r7, #4
        bne     LCWM16
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWM21:
        cmp     r10, #0
        movge   r0, r11
        addge   r1, r4, #1, 12
        bge     LCWM5
        rsb     r12, r10, #0
        cmp     r12, #6
        movlt   r0, r11
        addlt   r1, r4, #1, 12
        blt     LCWM23
        mov     r0, r11
        add     r1, r4, #1, 12
LCWM22:
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
        blt     LCWM22
LCWM23:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r10, r10, #1
        bmi     LCWM23
        b       LCWM5
LCWM24:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCWM25:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWM__2il0floatpacket.1
        .long   LCWM__2il0floatpacket.2
        .long   LCWM__2il0floatpacket.3


        .data
        .align  4


LCWM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x4F
LCWM__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xCF
LCWM__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00


