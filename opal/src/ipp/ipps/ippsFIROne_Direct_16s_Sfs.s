        .text
        .align  4
        .globl  _ippsFIROne_Direct_16s_Sfs


_ippsFIROne_Direct_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        cmp     r1, #0
        beq     LCRS9
        cmp     r2, #0
        beq     LCRS9
        cmp     lr, #0
        beq     LCRS9
        cmp     r12, #0
        beq     LCRS9
        cmp     r3, #0
        ble     LCRS8
        ldr     r5, [r12]
        cmp     r5, r3
        blt     LCRS1
LCRS0:
        mvn     r0, #0x17
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCRS1:
        cmp     r5, #0
        blt     LCRS0
        mov     r5, r5, lsl #1
        add     r6, lr, r3, lsl #1
        strh    r0, [r6, +r5]
        ldr     r5, [r12]
        mov     r6, #0
        add     r7, r4, #0xF
        mov     r5, r5, lsl #1
        strh    r0, [lr, +r5]
        ldr     r8, [r12]
        add     r0, r4, #0xE
        mov     r5, #1
        add     r8, r8, #1
        cmp     r8, r3
        strlt   r8, [r12]
        movge   r8, r6
        strge   r8, [r12]
        cmp     r3, #6
        add     r12, lr, r8, lsl #1
        sublt   r2, r2, #2
        movlt   r8, r6
        blt     LCRS3
        sub     r2, r2, #2
        mov     r8, r6
        sub     r4, r3, #6
        mov     lr, r12
        str     r7, [sp, #4]
        str     r1, [sp]
LCRS2:
        sub     r1, r3, r6
        ldrsh   r11, [lr, #2]
        mov     r7, r1, lsl #1
        ldrsh   r9, [r2, +r7]
        ldrsh   r1, [lr]
        ldrsh   r10, [lr, #4]
        add     r6, r6, #5
        mla     r9, r9, r1, r8
        sub     r1, r7, #2
        ldrsh   r1, [r2, +r1]
        sub     r8, r7, #4
        ldrsh   r8, [r2, +r8]
        mla     r11, r1, r11, r9
        ldrsh   r9, [lr, #6]
        sub     r1, r7, #6
        ldrsh   r1, [r2, +r1]
        cmp     r6, r4
        mla     r11, r8, r10, r11
        ldrsh   r8, [lr, #8]
        sub     r7, r7, #8
        ldrsh   r7, [r2, +r7]
        add     lr, lr, #0xA
        mla     r11, r1, r9, r11
        mla     r8, r7, r8, r11
        ble     LCRS2
        ldr     r7, [sp, #4]
        ldr     r1, [sp]
LCRS3:
        add     r12, r12, r6, lsl #1
LCRS4:
        ldrsh   lr, [r12], #2
        sub     r4, r3, r6
        add     r6, r6, #1
        mov     r4, r4, lsl #1
        ldrsh   r4, [r2, +r4]
        cmp     r6, r3
        mla     r8, r4, lr, r8
        blt     LCRS4
        cmp     r7, #0
        ble     LCRS7
        mov     r2, r8, asr r7
        and     r2, r2, #1
        add     r2, r8, r2
        add     r0, r2, r5, lsl r0
        sub     r0, r0, #1
        mov     r8, r0, asr r7
LCRS5:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r2, r0
        cmp     r2, r8
        mvnlt   r8, r0
        blt     LCRS6
        cmn     r8, #2, 18
        movlt   r0, #0
        sublt   r8, r0, #2, 18
LCRS6:
        mov     r0, #0
        strh    r8, [r1]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCRS7:
        cmp     r7, #0
        rsblt   r7, r7, #0
        movlt   r8, r8, lsl r7
        b       LCRS5
LCRS8:
        mvn     r0, #0x19
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCRS9:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


