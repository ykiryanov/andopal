        .text
        .align  4
        .globl  _ippsSumLn_64f


_ippsSumLn_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r4, r0
        cmp     r4, #0
        mov     r11, r1
        beq     LASJ14
        cmp     r2, #0
        beq     LASJ14
        cmp     r11, #0
        ble     LASJ15
        cmp     r11, #0
        ble     LASJ13
        mov     r9, #0
        mov     r8, r9
        mov     r3, #0xFE, 14
        mov     r12, r8
        orr     lr, r3, #0x1F, 6
        mov     r10, r12
        mov     r5, #2, 24
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r2, [sp, #8]
LASJ0:
        mov     r5, #2, 24
        cmp     r11, #2, 24
        movlt   r5, r11
        mov     r2, #0xFF, 12
        cmp     r5, #0
        orr     r1, r2, #3, 4
        movle   r0, #0
        movle   r6, r0
        ble     LASJ3
        mov     r7, r4
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #4]
        mov     r2, #0
        mov     r0, r2
        str     r8, [sp, #0x18]
        mov     r6, r0
        str     r9, [sp, #0x14]
        str     r10, [sp, #0x10]
        mov     r8, r2
LASJ1:
        ldr     r2, [r4, +r8, lsl #3]
        ldr     r10, [r7, #4]
        str     r2, [sp, #0x1C]
        cmp     r10, #0
        str     r10, [sp, #0x20]
        blt     LASJ12
        cmp     r10, #0
        bne     LASJ2
        ldr     r3, [sp, #0x1C]
        cmp     r3, #0
        beq     LASJ9
LASJ2:
        mov     r3, #0xFE, 14
        orr     r3, r3, #0x1F, 6
        and     r3, r10, r3
        cmp     r11, r3
        beq     LASJ11
        mvn     r3, #0xFF, 12
        bic     r3, r3, #0xF, 4
        mov     r12, #0xFF, 12
        and     r3, r10, r3
        orr     r9, r12, #3, 4
        orr     r3, r3, r9
        str     r3, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        bl      __muldf3
        add     r8, r8, #1
        sub     r10, r10, r9
        cmp     r8, r5
        add     r6, r6, r10, asr #20
        add     r7, r7, #8
        blt     LASJ1
        str     r11, [sp, #4]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r11, [sp, #0xC]
LASJ3:
        bl      log
        mov     r7, r0
        mov     r0, r6
        mov     r10, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x168]
        ldr     r3, [pc, #0x168]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r7
        bl      __adddf3
        mov     r6, #0
        str     r0, [sp]
        mov     r10, r1
LASJ4:
        cmp     r6, #0
        bne     LASJ10
        ldr     r2, [sp]
        mov     r0, r9
        mov     r1, r8
        mov     r3, r10
        bl      __adddf3
        sub     r11, r11, r5
        cmp     r11, #0
        add     r4, r4, r5, lsl #3
        mov     r9, r0
        mov     r8, r1
        bgt     LASJ0
        ldr     r2, [sp, #8]
LASJ5:
        subs    r6, r6, #8
        beq     LASJ8
        adds    r6, r6, #4
        beq     LASJ7
        adds    r6, r6, #2
        beq     LASJ6
        mov     r0, #0
        str     r9, [r2]
        str     r8, [r2, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LASJ6:
        ldr     r3, [pc, #0xE8]
        mov     r0, #7
        ldr     r1, [r3]
        ldr     r3, [r3, #4]
        str     r1, [r2]
        str     r3, [r2, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LASJ7:
        ldr     r3, [pc, #0xCC]
        mov     r0, #8
        ldr     r1, [r3]
        ldr     r3, [r3, #4]
        str     r1, [r2]
        str     r3, [r2, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LASJ8:
        ldr     r1, [pc, #0xAC]
        mov     r0, #0
        ldr     r3, [r1, #4]
        ldr     r1, [r1]
        eor     r3, r3, #2, 2
        str     r3, [r2, #4]
        str     r1, [r2]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LASJ9:
        str     r11, [sp, #4]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        mov     r6, #2
        b       LASJ4
LASJ10:
        ldr     r2, [sp, #8]
        b       LASJ5
LASJ11:
        str     r11, [sp, #4]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        mov     r6, #8
        b       LASJ4
LASJ12:
        str     r11, [sp, #4]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        mov     r6, #4
        b       LASJ4
LASJ13:
        mov     r9, #0
        mov     r8, r9
        mov     r6, r8
        b       LASJ5
LASJ14:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LASJ15:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0xfefa39ef
        .long   0x3fe62e42
        .long   ippConstantOfINF_64f
        .long   ippConstantOfNAN_64f


