        .text
        .align  4
        .globl  _ippsWTHaarInv_16s_Sfs


_ippsWTHaarInv_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        cmp     r12, #0
        beq     LAJG16
        cmp     r0, #0
        beq     LAJG24
        cmp     r1, #0
        beq     LAJG24
        cmp     r2, #0
        beq     LAJG24
        cmp     r3, #0
        ble     LAJG25
        cmp     r12, #1
        mov     lr, #0
        beq     LAJG20
        cmp     r12, #0x10
        ble     LAJG3
        cmp     r3, #6
        movlt   r0, lr
        blt     LAJG1
        mov     r0, lr
        sub     r1, r3, #6
        mov     r12, r0
        mov     r4, r2
LAJG0:
        add     r0, r0, #5
        strh    r12, [r4]
        strh    r12, [r4, #2]
        strh    r12, [r4, #4]
        strh    r12, [r4, #6]
        strh    r12, [r4, #8]
        cmp     r0, r1
        add     r4, r4, #0xA
        ble     LAJG0
LAJG1:
        add     r2, r2, r0, lsl #1
LAJG2:
        add     r0, r0, #1
        strh    lr, [r2], #2
        cmp     r0, r3
        blt     LAJG2
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJG3:
        cmn     r12, #0x10
        bgt     LAJG9
        sub     r8, r3, #1
        cmp     r8, #0
        movle   r9, lr
        ble     LAJG7
        mov     r9, lr
        add     r7, r2, #2
        mov     r5, r0
        mov     r6, r2
LAJG4:
        ldrsh   r4, [r5], #2
        ldrsh   r10, [r1], #2
        sub     r12, r4, r10
        cmp     r12, #0
        add     r4, r4, r10
        ble     LAJG19
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LAJG5:
        cmp     r4, #0
        ble     LAJG18
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
LAJG6:
        strh    r12, [r6], #4
        add     lr, lr, #2
        strh    r4, [r7], #4
        cmp     lr, r8
        add     r9, r9, #1
        blt     LAJG4
LAJG7:
        tst     r3, #1
        beq     LAJG15
        mov     r9, r9, lsl #1
        ldrsh   r9, [r0, +r9]
        cmp     r9, #0
        ble     LAJG17
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LAJG8:
        mov     lr, lr, lsl #1
        strh    r0, [r2, +lr]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJG9:
        cmp     r12, #0
        sub     r4, r3, #1
        ble     LAJG12
        sub     r5, r12, #1
        mov     r6, #1
        mov     r5, r6, lsl r5
        cmp     r4, #0
        sub     r5, r5, #1
        movle   r9, lr
        ble     LAJG11
        mov     r9, lr
        add     r8, r2, #2
        mov     r7, r0
        mov     r6, r2
        str     r2, [sp, #4]
        str     r0, [sp]
LAJG10:
        ldrsh   r0, [r7], #2
        ldrsh   r10, [r1], #2
        add     lr, lr, #2
        sub     r2, r0, r10
        add     r0, r0, r10
        mov     r11, r2, asr r12
        add     r10, r5, r2
        mov     r2, r0, asr r12
        and     r11, r11, #1
        and     r2, r2, #1
        add     r10, r10, r11
        add     r0, r5, r0
        add     r2, r0, r2
        mov     r10, r10, asr r12
        strh    r10, [r6], #4
        mov     r0, r2, asr r12
        strh    r0, [r8], #4
        cmp     lr, r4
        add     r9, r9, #1
        blt     LAJG10
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LAJG11:
        tst     r3, #1
        beq     LAJG15
        mov     r9, r9, lsl #1
        ldrsh   r0, [r0, +r9]
        mov     lr, lr, lsl #1
        mov     r1, r0, asr r12
        and     r1, r1, #1
        add     r0, r5, r0
        add     r1, r0, r1
        mov     r12, r1, asr r12
        strh    r12, [r2, +lr]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJG12:
        cmp     r4, #0
        rsb     r5, r12, #0
        movle   r10, lr
        ble     LAJG14
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        mov     r10, lr
        add     r9, r2, #2
        sub     r8, lr, #2, 18
        mov     r7, r0
        mov     r6, r2
        str     r2, [sp, #4]
        str     r0, [sp]
LAJG13:
        ldrsh   r2, [r1], #2
        ldrsh   r11, [r7], #2
        add     r10, r10, #2
        add     lr, lr, #1
        sub     r0, r11, r2
        mov     r0, r0, lsl r5
        cmp     r12, r0
        movlt   r0, r12
        cmn     r0, #2, 18
        add     r2, r11, r2
        movlt   r0, r8
        mov     r2, r2, lsl r5
        cmp     r12, r2
        movlt   r2, r12
        cmn     r2, #2, 18
        strh    r0, [r6], #4
        movlt   r2, r8
        strh    r2, [r9], #4
        cmp     r10, r4
        blt     LAJG13
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LAJG14:
        tst     r3, #1
        beq     LAJG15
        mov     lr, lr, lsl #1
        ldrsh   r1, [r0, +lr]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mov     r5, r1, lsl r5
        mvn     r0, r0
        cmp     r0, r5
        movlt   r5, r0
        mov     r0, #0
        cmn     r5, #2, 18
        sub     r0, r0, #2, 18
        movlt   r5, r0
        mov     r10, r10, lsl #1
        strh    r5, [r2, +r10]
LAJG15:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJG16:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsWTHaarInv_16s
LAJG17:
        cmp     r9, #0
        mov     r0, #0
        sublt   r0, r0, #2, 18
        b       LAJG8
LAJG18:
        cmp     r4, #0
        movlt   r4, #0
        sublt   r4, r4, #2, 18
        b       LAJG6
LAJG19:
        cmp     r12, #0
        mvnlt   r12, #0xFF
        biclt   r12, r12, #0x7F, 24
        b       LAJG5
LAJG20:
        sub     r8, r3, #1
        cmp     r8, #0
        movle   r9, lr
        ble     LAJG23
        mov     r9, lr
        add     r7, r2, #2
        mov     r5, r0
        mov     r6, r2
LAJG21:
        ldrsh   r4, [r5], #2
        ldrsh   r12, [r1], #2
        sub     r10, r4, r12
        and     r4, r10, #1
        and     r11, r4, r10, asr #1
        add     r12, r12, r10, asr #1
        add     r10, r11, r10, asr #1
        and     r4, r12, r4
        cmp     r10, #2, 18
        add     r12, r12, r4
        bne     LAJG22
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     r10, r4
LAJG22:
        strh    r10, [r6], #4
        add     lr, lr, #2
        strh    r12, [r7], #4
        cmp     lr, r8
        add     r9, r9, #1
        blt     LAJG21
LAJG23:
        tst     r3, #1
        beq     LAJG15
        mov     r9, r9, lsl #1
        ldrsh   r0, [r0, +r9]
        mov     lr, lr, lsl #1
        and     r1, r0, r0, asr #1
        and     r1, r1, #1
        add     r0, r1, r0, asr #1
        strh    r0, [r2, +lr]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJG24:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJG25:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


