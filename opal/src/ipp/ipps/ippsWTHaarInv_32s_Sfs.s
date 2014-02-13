        .text
        .align  4
        .globl  _ippsWTHaarInv_32s_Sfs


_ippsWTHaarInv_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x3C]
        cmp     r12, #0
        beq     LAJD26
        cmp     r0, #0
        beq     LAJD39
        cmp     r1, #0
        beq     LAJD39
        cmp     r2, #0
        beq     LAJD39
        cmp     r3, #0
        ble     LAJD40
        cmp     r12, #2, 2
        mov     r4, #0
        beq     LAJD21
        cmp     r12, #1
        beq     LAJD35
        cmp     r12, #0x20
        bgt     LAJD21
        cmn     r12, #0x20
        bgt     LAJD5
        sub     r6, r3, #1
        cmp     r6, #0
        movle   r7, r4
        ble     LAJD3
        mov     r7, r4
        add     r5, r2, #4
        mov     lr, r0
        mov     r12, r2
LAJD0:
        ldr     r9, [lr], #4
        ldr     r8, [r1], #4
        cmp     r9, r8
        mvngt   r10, #2, 2
        bgt     LAJD1
        cmp     r9, r8
        movge   r10, #0
        movlt   r10, #2, 2
LAJD1:
        str     r10, [r12], #8
        mvn     r10, #0
        rsb     r10, r8, r10
        cmp     r9, r10
        movle   r8, #2, 2
        ble     LAJD2
        cmp     r9, r8
        mvnne   r8, #2, 2
        moveq   r8, #0
LAJD2:
        add     r4, r4, #2
        str     r8, [r5], #8
        cmp     r4, r6
        add     r7, r7, #1
        blt     LAJD0
LAJD3:
        tst     r3, #1
        beq     LAJD25
        ldr     r7, [r0, +r7, lsl #2]
        cmp     r7, #0
        mvngt   r0, #2, 2
        ble     LAJD27
LAJD4:
        str     r0, [r2, +r4, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD5:
        cmp     r12, #0x20
        beq     LAJD28
        cmp     r12, #0x1D
        mov     r6, #1
        blt     LAJD8
        sub     lr, r12, #3
        sub     r12, lr, #1
        mov     r6, r6, lsl r12
        sub     r9, r3, #1
        cmp     r9, #0
        sub     r12, r6, #1
        movle   r8, r4
        ble     LAJD7
        mov     r8, r4
        add     r7, r2, #4
        mov     r6, r0
        mov     r5, r2
        str     r0, [sp, #4]
        str     r9, [sp]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
LAJD6:
        ldr     r3, [r1], #4
        ldr     r0, [sp]
        ldr     r2, [r6], #4
        add     r4, r4, #2
        bic     r9, r3, #7
        cmp     r4, r0
        mov     r0, r3, asr #3
        sub     r11, r3, r9
        bic     r10, r2, #7
        sub     r10, r2, r10
        rsb     r9, r0, r2, asr #3
        add     r3, r0, r2, asr #3
        sub     r0, r10, r11
        add     r10, r10, r11
        add     r0, r0, #7
        mov     r2, r9, asr lr
        and     r0, r0, #8
        add     r10, r10, #7
        mov     r11, r3, asr lr
        and     r2, r2, #1
        add     r0, r2, r0, asr #3
        and     r10, r10, #8
        add     r9, r12, r9
        and     r11, r11, #1
        add     r3, r12, r3
        add     r0, r9, r0
        add     r10, r11, r10, asr #3
        add     r3, r3, r10
        mov     r0, r0, asr lr
        str     r0, [r5], #8
        mov     r3, r3, asr lr
        str     r3, [r7], #8
        add     r8, r8, #1
        blt     LAJD6
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
LAJD7:
        tst     r3, #1
        beq     LAJD25
        ldr     r8, [r0, +r8, lsl #2]
        and     r1, r8, #8
        mov     r0, r8, asr #3
        sub     r8, r8, r1
        mov     r1, r0, asr lr
        add     r12, r12, r0
        add     r3, r8, #7
        and     r0, r3, #8
        and     r1, r1, #1
        add     r0, r1, r0, asr #3
        add     r0, r12, r0
        mov     lr, r0, asr lr
        str     lr, [r2, +r4, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD8:
        cmp     r12, #1
        sub     r8, r3, #1
        ble     LAJD11
        sub     lr, r12, #1
        mov     lr, r6, lsl lr
        cmp     r8, #0
        sub     lr, lr, #1
        add     r9, r12, #1
        movle   r7, r4
        ble     LAJD10
        mov     r7, r4
        add     r10, r2, #4
        mov     r6, r0
        mov     r5, r2
        str     r0, [sp, #4]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x10]
        str     r8, [sp]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
LAJD9:
        ldr     r0, [sp]
        ldr     r3, [sp, #0x10]
        ldr     r2, [r6], #4
        add     r4, r4, #2
        cmp     r4, r0
        ldr     r0, [r1], #4
        mov     r9, r2, asr r3
        sub     r2, r2, r9, lsl r3
        add     r7, r7, #1
        mov     r8, r0, asr r3
        sub     r3, r0, r8, lsl r3
        sub     r0, r2, r3
        mov     r10, r0, asr r12
        add     r2, r2, r3
        add     r0, lr, r0
        and     r11, r10, #1
        sub     r3, r9, r8
        add     r0, r0, r11
        mov     r10, r2, asr r12
        mov     r3, r3, lsl #1
        add     r0, r3, r0, asr r12
        str     r0, [r5], #8
        ldr     r0, [sp, #0x14]
        and     r10, r10, #1
        add     r8, r9, r8
        add     r2, lr, r2
        add     r10, r2, r10
        mov     r8, r8, lsl #1
        add     r10, r8, r10, asr r12
        str     r10, [r0], #8
        str     r0, [sp, #0x14]
        blt     LAJD9
        ldr     r0, [sp, #4]
        ldr     r9, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
LAJD10:
        tst     r3, #1
        beq     LAJD25
        ldr     r7, [r0, +r7, lsl #2]
        mov     r0, r7, asr r9
        sub     r9, r7, r0, lsl r9
        mov     r1, r9, asr r12
        and     r1, r1, #1
        add     lr, lr, r9
        add     r1, lr, r1
        mov     r0, r0, lsl #1
        add     r12, r0, r1, asr r12
        str     r12, [r2, +r4, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD11:
        rsb     r5, r12, #0
        rsb     r12, r5, #0x1F
        mov     r12, r6, lsl r12
        rsb     lr, r12, #0
        mvn     r12, #0
        cmp     r8, #0
        rsb     r12, lr, r12
        movle   r10, r4
        ble     LAJD19
        mov     r10, r4
        add     r9, r2, #4
        mov     r6, r0
        mov     r7, r2
        str     r0, [sp, #4]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
LAJD12:
        ldr     r0, [r6], #4
        ldr     r11, [r1], #4
        subs    r3, r0, r11
        add     r2, r0, r11
        ble     LAJD13
        cmp     r3, #0
        mvnlt   r3, #2, 2
        b       LAJD14
LAJD13:
        cmp     r3, #0
        movgt   r3, #2, 2
LAJD14:
        rsb     r11, r11, #0
        sub     r11, r11, #1
        cmp     r0, r11
        bgt     LAJD15
        cmp     r2, #0
        movge   r2, #2, 2
        b       LAJD16
LAJD15:
        cmp     r2, #0
        mvnlt   r2, #2, 2
LAJD16:
        cmp     r2, lr
        movle   r2, #2, 2
        ble     LAJD17
        cmp     r2, r12
        mvnge   r2, #2, 2
        movlt   r2, r2, lsl r5
LAJD17:
        cmp     r3, lr
        movle   r3, #2, 2
        ble     LAJD18
        cmp     r3, r12
        mvnge   r3, #2, 2
        movlt   r3, r3, lsl r5
LAJD18:
        str     r2, [r9], #8
        add     r4, r4, #2
        str     r3, [r7], #8
        cmp     r4, r8
        add     r10, r10, #1
        blt     LAJD12
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
LAJD19:
        tst     r3, #1
        beq     LAJD25
        ldr     r10, [r0, +r10, lsl #2]
        cmp     r10, lr
        movle   r5, #2, 2
        ble     LAJD20
        cmp     r10, r12
        mvnge   r5, #2, 2
        movlt   r5, r10, lsl r5
LAJD20:
        str     r5, [r2, +r4, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD21:
        cmp     r3, #6
        movlt   r0, r4
        blt     LAJD23
        mov     r0, r4
        sub     r1, r3, #6
        mov     r12, r0
        add     lr, r2, #4
LAJD22:
        add     r0, r0, #5
        str     r12, [lr, #-4]
        str     r12, [lr]
        str     r12, [lr, #4]
        str     r12, [lr, #8]
        str     r12, [lr, #0xC]
        cmp     r0, r1
        add     lr, lr, #0x14
        ble     LAJD22
LAJD23:
        add     r2, r2, r0, lsl #2
LAJD24:
        add     r0, r0, #1
        str     r4, [r2], #4
        cmp     r0, r3
        blt     LAJD24
LAJD25:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD26:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsWTHaarInv_32s
LAJD27:
        cmp     r7, #0
        movlt   r0, #2, 2
        movge   r0, #0
        b       LAJD4
LAJD28:
        sub     r5, r3, #1
        cmp     r5, #0
        ble     LAJD34
        add     lr, r2, #4
        mov     r12, r2
LAJD29:
        ldr     r6, [r0], #4
        ldr     r10, [r1], #4
        subs    r8, r6, r10
        add     r7, r6, r10
        ble     LAJD30
        cmp     r8, #0
        movlt   r9, #1
        movge   r9, #0
        b       LAJD31
LAJD30:
        cmp     r8, #0
        movle   r9, #0
        mvngt   r9, #0
LAJD31:
        mvn     r8, #0
        rsb     r10, r10, r8
        cmp     r6, r10
        bgt     LAJD32
        cmp     r7, #0
        movlt   r8, #0
        b       LAJD33
LAJD32:
        cmp     r7, #0
        movlt   r8, #1
        movge   r8, #0
LAJD33:
        str     r9, [r12], #8
        add     r4, r4, #2
        str     r8, [lr], #8
        cmp     r4, r5
        blt     LAJD29
LAJD34:
        tst     r3, #1
        beq     LAJD25
        mov     r0, #0
        str     r0, [r2, +r4, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD35:
        sub     r8, r3, #1
        cmp     r8, #0
        movle   r6, r4
        movle   r7, r6
        ble     LAJD38
        ldr     r9, [pc, #0xD8]
        ldr     r10, [pc, #0xD8]
        mov     r6, r4
        mov     r7, r6
        add     r5, r2, #4
        mov     r12, r0
        mov     lr, r2
        str     r8, [sp]
        str     r0, [sp, #4]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
LAJD36:
        ldr     r0, [r1], #4
        ldr     r8, [r12], #4
        mov     r10, r0, asr #1
        rsb     r9, r10, r8, asr #1
        cmn     r9, #6, 2
        moveq   r8, r4
        mvneq   r2, #2, 2
        beq     LAJD37
        ldr     r2, [pc, #0x90]
        and     r3, r8, #3
        ldr     r11, [pc, #0x84]
        and     r0, r0, #3
        add     r2, r2, r3, lsl #2
        ldr     r2, [r2, +r0, lsl #4]
        add     r3, r11, r3, lsl #2
        ldr     r0, [r3, +r0, lsl #4]
        add     r8, r10, r8, asr #1
        add     r2, r9, r2
        add     r8, r0, r8
LAJD37:
        str     r2, [lr], #8
        str     r8, [r5], #8
        ldr     r0, [sp]
        add     r7, r7, #2
        cmp     r7, r0
        add     r6, r6, #1
        blt     LAJD36
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
LAJD38:
        tst     r3, #1
        beq     LAJD25
        ldr     r6, [r0, +r6, lsl #2]
        and     r0, r6, r6, asr #1
        and     r0, r0, #1
        add     r6, r0, r6, asr #1
        str     r6, [r2, +r7, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD39:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJD40:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LAJD_sumCorrect
        .long   LAJD_subCorrect


        .data
        .align  4


LAJD_subCorrect:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAJD_sumCorrect:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00


