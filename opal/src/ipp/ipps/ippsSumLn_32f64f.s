        .text
        .align  4
        .globl  _ippsSumLn_32f64f


_ippsSumLn_32f64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        beq     LASK13
        cmp     r2, #0
        beq     LASK13
        cmp     r7, #0
        ble     LASK14
        cmp     r7, #0
        ble     LASK12
        mov     r6, #0
        mov     r5, r6
        mov     r3, #0xFF, 10
        mov     r12, r5
        orr     lr, r3, #1, 2
        mov     r4, r12
        mov     r9, #2, 24
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r2, [sp, #8]
LASK0:
        mov     r9, #2, 24
        cmp     r7, #2, 24
        movlt   r9, r7
        mov     r2, #0xFF, 12
        cmp     r9, #0
        orr     r1, r2, #3, 4
        movle   r11, #0
        movle   r10, r11
        ble     LASK2
        str     r7, [sp, #0xC]
        ldr     r7, [sp, #4]
        mov     r0, #0
        mov     r11, r0
        str     r5, [sp, #0x18]
        str     r4, [sp, #0x10]
        mov     r10, r11
        str     r6, [sp, #0x14]
        mov     r5, r0
        mov     r4, r1
LASK1:
        ldr     r6, [r8, +r5, lsl #2]
        cmp     r6, #0
        str     r6, [sp, #0x1C]
        blt     LASK11
        cmp     r6, #0
        beq     LASK10
        mov     r12, #0xFF, 10
        orr     r12, r12, #1, 2
        and     r12, r6, r12
        cmp     r7, r12
        beq     LASK9
        mvn     lr, #0xFE, 10
        bic     lr, lr, #3, 2
        and     lr, r6, lr
        orr     r0, lr, #0x3F, 8
        str     r0, [sp, #0x1C]
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r4
        bl      __muldf3
        add     r5, r5, #1
        sub     r6, r6, #0x3F, 8
        cmp     r5, r9
        add     r10, r10, r6, asr #23
        mov     r11, r0
        mov     r4, r1
        blt     LASK1
        mov     r1, r4
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0xC]
LASK2:
        mov     r0, r11
        bl      log
        mov     r4, r0
        mov     r0, r10
        mov     r11, r1
        bl      __floatsidf
        ldr     r2, [pc, #0x15C]
        ldr     r3, [pc, #0x15C]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r11
        bl      __adddf3
        mov     r10, #0
        str     r0, [sp]
        mov     r4, r1
LASK3:
        cmp     r10, #0
        bne     LASK8
        ldr     r2, [sp]
        mov     r0, r6
        mov     r1, r5
        mov     r3, r4
        bl      __adddf3
        sub     r7, r7, r9
        cmp     r7, #0
        add     r8, r8, r9, lsl #2
        mov     r6, r0
        mov     r5, r1
        bgt     LASK0
        ldr     r2, [sp, #8]
LASK4:
        subs    r10, r10, #8
        beq     LASK7
        adds    r10, r10, #4
        beq     LASK6
        adds    r10, r10, #2
        beq     LASK5
        mov     r0, #0
        str     r6, [r2]
        str     r5, [r2, #4]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LASK5:
        ldr     r3, [pc, #0xDC]
        mov     r0, #7
        ldr     r1, [r3]
        ldr     r3, [r3, #4]
        str     r1, [r2]
        str     r3, [r2, #4]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LASK6:
        ldr     r3, [pc, #0xC0]
        mov     r0, #8
        ldr     r1, [r3]
        ldr     r3, [r3, #4]
        str     r1, [r2]
        str     r3, [r2, #4]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LASK7:
        ldr     r1, [pc, #0xA0]
        mov     r0, #0
        ldr     r3, [r1, #4]
        ldr     r1, [r1]
        eor     r3, r3, #2, 2
        str     r3, [r2, #4]
        str     r1, [r2]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LASK8:
        ldr     r2, [sp, #8]
        b       LASK4
LASK9:
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        mov     r10, #8
        b       LASK3
LASK10:
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        mov     r10, #2
        b       LASK3
LASK11:
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        mov     r10, #4
        b       LASK3
LASK12:
        mov     r6, #0
        mov     r5, r6
        mov     r10, r5
        b       LASK4
LASK13:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LASK14:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0xfefa39ef
        .long   0x3fe62e42
        .long   ippConstantOfINF_64f
        .long   ippConstantOfNAN_64f


