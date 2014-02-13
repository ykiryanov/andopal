        .text
        .align  4
        .globl  _ippsFIROne_Direct_16s_ISfs


_ippsFIROne_Direct_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        cmp     r0, #0
        beq     LCRT9
        cmp     r1, #0
        beq     LCRT9
        cmp     r3, #0
        beq     LCRT9
        cmp     lr, #0
        beq     LCRT9
        cmp     r2, #0
        ble     LCRT8
        ldr     r5, [lr]
        cmp     r5, r2
        blt     LCRT1
LCRT0:
        mvn     r0, #0x17
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCRT1:
        cmp     r5, #0
        blt     LCRT0
        ldrsh   r4, [r0]
        mov     r5, r5, lsl #1
        add     r6, r3, r2, lsl #1
        strh    r4, [r6, +r5]
        ldr     r5, [lr]
        mov     r6, #0
        add     r7, r12, #0xF
        mov     r5, r5, lsl #1
        strh    r4, [r3, +r5]
        ldr     r4, [lr]
        add     r12, r12, #0xE
        mov     r5, #1
        add     r4, r4, #1
        cmp     r4, r2
        strlt   r4, [lr]
        movge   r4, r6
        strge   r4, [lr]
        cmp     r2, #6
        add     r3, r3, r4, lsl #1
        sublt   r1, r1, #2
        movlt   r8, r6
        blt     LCRT3
        sub     r1, r1, #2
        mov     r8, r6
        sub     r4, r2, #6
        mov     lr, r3
        str     r7, [sp, #4]
        str     r0, [sp]
LCRT2:
        sub     r0, r2, r6
        ldrsh   r11, [lr, #2]
        mov     r7, r0, lsl #1
        ldrsh   r9, [r1, +r7]
        ldrsh   r0, [lr]
        ldrsh   r10, [lr, #4]
        add     r6, r6, #5
        mla     r9, r9, r0, r8
        sub     r0, r7, #2
        ldrsh   r0, [r1, +r0]
        sub     r8, r7, #4
        ldrsh   r8, [r1, +r8]
        mla     r11, r0, r11, r9
        ldrsh   r9, [lr, #6]
        sub     r0, r7, #6
        ldrsh   r0, [r1, +r0]
        cmp     r6, r4
        mla     r11, r8, r10, r11
        ldrsh   r8, [lr, #8]
        sub     r7, r7, #8
        ldrsh   r7, [r1, +r7]
        add     lr, lr, #0xA
        mla     r11, r0, r9, r11
        mla     r8, r7, r8, r11
        ble     LCRT2
        ldr     r7, [sp, #4]
        ldr     r0, [sp]
LCRT3:
        add     r3, r3, r6, lsl #1
LCRT4:
        ldrsh   lr, [r3], #2
        sub     r4, r2, r6
        add     r6, r6, #1
        mov     r4, r4, lsl #1
        ldrsh   r4, [r1, +r4]
        cmp     r6, r2
        mla     r8, r4, lr, r8
        blt     LCRT4
        cmp     r7, #0
        ble     LCRT7
        mov     r1, r8, asr r7
        and     r1, r1, #1
        add     r1, r8, r1
        add     r12, r1, r5, lsl r12
        sub     r1, r12, #1
        mov     r8, r1, asr r7
LCRT5:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r2, r1
        cmp     r2, r8
        mvnlt   r8, r1
        blt     LCRT6
        cmn     r8, #2, 18
        movlt   r1, #0
        sublt   r8, r1, #2, 18
LCRT6:
        strh    r8, [r0]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCRT7:
        cmp     r7, #0
        rsblt   r7, r7, #0
        movlt   r8, r8, lsl r7
        b       LCRT5
LCRT8:
        mvn     r0, #0x19
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCRT9:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


