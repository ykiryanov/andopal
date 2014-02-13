        .text
        .align  4
        .globl  _ippsWTHaarFwd_32s_Sfs


_ippsWTHaarFwd_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        cmp     r12, #0
        beq     LAJN38
        cmp     r0, #0
        beq     LAJN52
        cmp     r2, #0
        beq     LAJN52
        cmp     r3, #0
        beq     LAJN52
        cmp     r1, #0
        ble     LAJN53
        add     r7, r12, #1
        cmp     r7, #2, 2
        mov     r4, #0
        mov     r6, #1
        beq     LAJN29
        cmp     r7, #0
        bne     LAJN7
        sub     r6, r1, #1
        cmp     r6, #0
        movle   r7, r4
        ble     LAJN5
        mov     r7, r4
        add     lr, r0, #4
        mov     r5, r2
        mov     r12, r0
LAJN0:
        ldr     r11, [r12], #8
        ldr     r8, [lr], #8
        subs    r10, r8, r11
        add     r9, r11, r8
        ble     LAJN1
        cmp     r10, #0
        mvnlt   r10, #2, 2
        b       LAJN2
LAJN1:
        cmp     r10, #0
        movgt   r10, #2, 2
LAJN2:
        rsb     r11, r11, #0
        sub     r11, r11, #1
        cmp     r8, r11
        bgt     LAJN3
        cmp     r9, #0
        movge   r9, #2, 2
        b       LAJN4
LAJN3:
        cmp     r9, #0
        mvnlt   r9, #2, 2
LAJN4:
        str     r9, [r5], #4
        add     r4, r4, #2
        str     r10, [r3], #4
        cmp     r4, r6
        add     r7, r7, #1
        blt     LAJN0
LAJN5:
        tst     r1, #1
        beq     LAJN37
        ldr     r4, [r0, +r4, lsl #2]
        cmp     r4, #3, 2
        movle   r0, #2, 2
        ble     LAJN6
        cmn     r4, #7, 2
        movle   r0, r4, lsl #1
        mvngt   r0, #2, 2
LAJN6:
        str     r0, [r2, +r7, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN7:
        cmp     r7, #0x20
        bgt     LAJN29
        cmn     r7, #0x20
        mvn     r5, #0
        bgt     LAJN13
        sub     r7, r1, #1
        cmp     r7, #0
        movle   r8, r4
        ble     LAJN11
        mov     r8, r4
        add     r6, r0, #4
        mov     r12, r2
        mov     lr, r0
LAJN8:
        ldr     r10, [lr], #8
        ldr     r9, [r6], #8
        rsb     r11, r10, r5
        cmp     r9, r11
        movle   r11, #2, 2
        ble     LAJN9
        cmp     r9, r10
        mvnne   r11, #2, 2
        moveq   r11, #0
LAJN9:
        str     r11, [r12], #4
        cmp     r9, r10
        mvngt   r9, #2, 2
        bgt     LAJN10
        cmp     r9, r10
        movge   r9, #0
        movlt   r9, #2, 2
LAJN10:
        add     r4, r4, #2
        str     r9, [r3], #4
        cmp     r4, r7
        add     r8, r8, #1
        blt     LAJN8
LAJN11:
        tst     r1, #1
        beq     LAJN37
        ldr     r4, [r0, +r4, lsl #2]
        cmp     r4, #0
        mvngt   r0, #2, 2
        ble     LAJN39
LAJN12:
        str     r0, [r2, +r8, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN13:
        cmp     r7, #0x20
        beq     LAJN41
        cmp     r7, #0x1D
        blt     LAJN16
        sub     lr, r12, #2
        sub     r9, lr, #1
        sub     r10, r1, #1
        mov     r6, r6, lsl r9
        cmp     r10, #0
        sub     r12, r6, #1
        movle   r8, r4
        ble     LAJN15
        mov     r8, r4
        add     r7, r0, #4
        mov     r6, r2
        mov     r5, r0
        str     r10, [sp]
        str     r9, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LAJN14:
        ldr     r0, [sp]
        ldr     r9, [r7], #8
        add     r4, r4, #2
        cmp     r4, r0
        ldr     r0, [r5], #8
        bic     r10, r9, #7
        sub     r11, r9, r10
        add     r8, r8, #1
        bic     r2, r0, #7
        mov     r1, r9, asr #3
        sub     r10, r0, r2
        add     r9, r1, r0, asr #3
        sub     r2, r1, r0, asr #3
        add     r0, r10, r11
        sub     r10, r11, r10
        add     r0, r0, #7
        mov     r1, r9, asr lr
        and     r0, r0, #8
        add     r10, r10, #7
        mov     r11, r2, asr lr
        and     r1, r1, #1
        add     r0, r1, r0, asr #3
        and     r10, r10, #8
        add     r9, r12, r9
        and     r11, r11, #1
        add     r2, r12, r2
        add     r0, r9, r0
        add     r10, r11, r10, asr #3
        add     r2, r2, r10
        mov     r0, r0, asr lr
        str     r0, [r6], #4
        mov     r2, r2, asr lr
        str     r2, [r3], #4
        blt     LAJN14
        ldr     r9, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LAJN15:
        tst     r1, #1
        beq     LAJN37
        ldr     r4, [r0, +r4, lsl #2]
        sub     r0, r9, #1
        mov     r1, #1
        mov     r0, r1, lsl r0
        and     r3, r4, #8
        mov     r1, r4, asr #3
        sub     r4, r4, r3
        add     r3, r4, #7
        mov     r12, r1, asr r9
        and     r3, r3, #8
        and     r12, r12, #1
        sub     r0, r0, #1
        add     r3, r0, r3, asr #3
        add     r12, r1, r12
        add     r3, r12, r3
        mov     r9, r3, asr r9
        str     r9, [r2, +r8, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN16:
        cmp     r7, #1
        sub     r9, r1, #1
        ble     LAJN19
        mov     r6, r6, lsl r12
        cmp     r9, #0
        sub     lr, r6, #1
        add     r10, r12, #2
        movle   r8, r4
        ble     LAJN18
        mov     r8, r4
        mov     r11, r2
        add     r6, r0, #4
        mov     r5, r0
        str     r11, [sp, #0x18]
        str     r10, [sp, #0x14]
        str     r9, [sp]
        str     r12, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LAJN17:
        ldr     r2, [sp, #0x14]
        ldr     r1, [r5], #8
        ldr     r0, [r6], #8
        mov     r9, r1, asr r2
        mov     r12, r0, asr r2
        sub     r1, r1, r9, lsl r2
        sub     r2, r0, r12, lsl r2
        add     r0, r1, r2
        mov     r10, r0, asr r7
        sub     r1, r2, r1
        and     r11, r10, #1
        mov     r10, r1, asr r7
        and     r10, r10, #1
        add     r1, lr, r1
        add     r0, lr, r0
        add     r10, r1, r10
        ldr     r1, [sp, #0x18]
        add     r2, r9, r12
        add     r0, r0, r11
        sub     r12, r12, r9
        mov     r2, r2, lsl #1
        add     r0, r2, r0, asr r7
        str     r0, [r1], #4
        mov     r12, r12, lsl #1
        str     r1, [sp, #0x18]
        add     r10, r12, r10, asr r7
        str     r10, [r3], #4
        ldr     r0, [sp]
        add     r4, r4, #2
        cmp     r4, r0
        add     r8, r8, #1
        blt     LAJN17
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LAJN18:
        tst     r1, #1
        beq     LAJN37
        ldr     r4, [r0, +r4, lsl #2]
        sub     r3, r12, #1
        add     r1, r12, #1
        mov     lr, #1
        mov     r3, lr, lsl r3
        mov     r0, r4, asr r1
        sub     r1, r4, r0, lsl r1
        sub     lr, r3, #1
        mov     r3, r1, asr r12
        and     r3, r3, #1
        add     r1, lr, r1
        add     r3, r1, r3
        mov     r0, r0, lsl #1
        add     r12, r0, r3, asr r12
        str     r12, [r2, +r8, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN19:
        rsb     lr, r12, r5
        rsb     r12, lr, #0x1F
        mov     r12, r6, lsl r12
        rsb     r12, r12, #0
        cmp     r9, #0
        rsb     r5, r12, r5
        movle   r10, r4
        ble     LAJN27
        mov     r10, r4
        add     r7, r0, #4
        mov     r8, r2
        mov     r6, r0
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LAJN20:
        ldr     r11, [r6], #8
        ldr     r0, [r7], #8
        subs    r2, r0, r11
        add     r1, r11, r0
        ble     LAJN21
        cmp     r2, #0
        mvnlt   r2, #2, 2
        b       LAJN22
LAJN21:
        cmp     r2, #0
        movgt   r2, #2, 2
LAJN22:
        rsb     r11, r11, #0
        sub     r11, r11, #1
        cmp     r0, r11
        bgt     LAJN23
        cmp     r1, #0
        movge   r1, #2, 2
        b       LAJN24
LAJN23:
        cmp     r1, #0
        mvnlt   r1, #2, 2
LAJN24:
        cmp     r1, r12
        movle   r1, #2, 2
        ble     LAJN25
        cmp     r1, r5
        mvnge   r1, #2, 2
        movlt   r1, r1, lsl lr
LAJN25:
        cmp     r2, r12
        movle   r2, #2, 2
        ble     LAJN26
        cmp     r2, r5
        mvnge   r2, #2, 2
        movlt   r2, r2, lsl lr
LAJN26:
        str     r1, [r8], #4
        add     r4, r4, #2
        str     r2, [r3], #4
        cmp     r4, r9
        add     r10, r10, #1
        blt     LAJN20
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LAJN27:
        tst     r1, #1
        beq     LAJN37
        cmp     lr, #0x1F
        mvn     r1, #2, 2
        mov     r3, #2, 2
        beq     LAJN40
        ldr     r4, [r0, +r4, lsl #2]
        add     lr, lr, #1
        rsb     r0, lr, #0x1F
        mov     r3, #1
        mov     r0, r3, lsl r0
        rsb     r0, r0, #0
        mvn     r3, #0
        cmp     r4, r0
        rsb     r3, r0, r3
        movle   r1, #2, 2
        ble     LAJN28
        cmp     r4, r3
        movlt   r1, r4, lsl lr
LAJN28:
        str     r1, [r2, +r10, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN29:
        adds    r12, r1, #1
        mov     r0, r4
        movmi   r0, r6
        add     r0, r1, r0
        add     r0, r0, #1
        mov     r0, r0, asr #1
        cmp     r0, #0
        ble     LAJN33
        cmp     r0, #6
        movlt   r12, r4
        blt     LAJN31
        mov     r12, r4
        sub     lr, r0, #6
        mov     r5, r12
        add     r7, r2, #4
LAJN30:
        add     r12, r12, #5
        str     r5, [r7, #-4]
        str     r5, [r7]
        str     r5, [r7, #4]
        str     r5, [r7, #8]
        str     r5, [r7, #0xC]
        cmp     r12, lr
        add     r7, r7, #0x14
        ble     LAJN30
LAJN31:
        add     r2, r2, r12, lsl #2
LAJN32:
        add     r12, r12, #1
        str     r4, [r2], #4
        cmp     r12, r0
        blt     LAJN32
LAJN33:
        cmp     r1, #0
        mov     r0, r4
        movlt   r0, r6
        add     r0, r1, r0
        mov     r0, r0, asr #1
        cmp     r0, #0
        ble     LAJN37
        cmp     r0, #6
        movlt   r1, r4
        blt     LAJN35
        mov     r1, r4
        sub     r2, r0, #6
        mov     r12, r1
        add     lr, r3, #4
LAJN34:
        add     r1, r1, #5
        str     r12, [lr, #-4]
        str     r12, [lr]
        str     r12, [lr, #4]
        str     r12, [lr, #8]
        str     r12, [lr, #0xC]
        cmp     r1, r2
        add     lr, lr, #0x14
        ble     LAJN34
LAJN35:
        add     r3, r3, r1, lsl #2
LAJN36:
        add     r1, r1, #1
        str     r4, [r3], #4
        cmp     r1, r0
        blt     LAJN36
LAJN37:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN38:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsWTHaarFwd_32s
LAJN39:
        cmp     r4, #0
        movlt   r0, #2, 2
        movge   r0, #0
        b       LAJN12
LAJN40:
        ldr     r4, [r0, +r4, lsl #2]
        cmp     r4, #0
        ble     LAJN50
        str     r1, [r2, +r10, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN41:
        sub     r6, r1, #1
        cmp     r6, #0
        movle   r7, r4
        ble     LAJN47
        mov     r7, r4
        add     lr, r0, #4
        mov     r5, r2
        mov     r12, r0
        str     r0, [sp, #0x10]
LAJN42:
        ldr     r0, [r12], #8
        ldr     r8, [lr], #8
        subs    r9, r8, r0
        add     r10, r0, r8
        ble     LAJN43
        cmp     r9, #0
        movlt   r9, #1
        movge   r9, #0
        b       LAJN44
LAJN43:
        cmp     r9, #0
        movle   r9, #0
        mvngt   r9, #0
LAJN44:
        mvn     r11, #0
        rsb     r11, r0, r11
        cmp     r8, r11
        bgt     LAJN45
        cmp     r10, #0
        movlt   r0, #0
        mvnge   r0, #0
        b       LAJN46
LAJN45:
        cmp     r10, #0
        movlt   r0, #1
        movge   r0, #0
LAJN46:
        str     r0, [r5], #4
        add     r4, r4, #2
        str     r9, [r3], #4
        cmp     r4, r6
        add     r7, r7, #1
        blt     LAJN42
        ldr     r0, [sp, #0x10]
LAJN47:
        tst     r1, #1
        beq     LAJN37
        ldr     r4, [r0, +r4, lsl #2]
        cmp     r4, #1, 2
        ble     LAJN48
        mov     r0, #1
        str     r0, [r2, +r7, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN48:
        cmp     r4, #3, 2
        bge     LAJN49
        mvn     r0, #0
        str     r0, [r2, +r7, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN49:
        mov     r0, #0
        str     r0, [r2, +r7, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN50:
        cmp     r4, #0
        blt     LAJN51
        mov     r0, #0
        str     r0, [r2, +r10, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN51:
        str     r3, [r2, +r10, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN52:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJN53:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


