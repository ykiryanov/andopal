        .text
        .align  4
        .globl  _ippsSubCRev_16s_ISfs


_ippsSubCRev_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #4
        cmp     r3, #0x10
        bgt     LATY14
        cmp     r1, #0
        beq     LATY20
        cmp     r2, #0
        ble     LATY19
        mvn     r12, #0xFF
        cmn     r3, #0xF
        bic     r12, r12, #0x7F, 24
        mov     r4, #0
        bge     LATY2
        cmp     r2, #0
        ble     LATY1
LATY0:
        ldrsh   r3, [r1]
        sub     r3, r0, r3
        cmp     r3, #0
        mvngt   r3, r12
        cmp     r3, #0
        sublt   r3, r4, #2, 18
        strh    r3, [r1], #2
        subs    r2, r2, #1
        bne     LATY0
LATY1:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LATY2:
        cmp     r3, #0
        bne     LATY6
        cmp     r0, #0
        blt     LATY15
        cmp     r2, #6
        blt     LATY4
        sub     r6, r2, #6
        mvn     r5, r12
        mov     lr, r1
LATY3:
        ldrsh   r8, [lr]
        ldrsh   r7, [lr, #2]
        ldrsh   r3, [lr, #4]
        sub     r8, r0, r8
        cmp     r8, r5
        mov     r9, r5
        movlt   r9, r8
        sub     r7, r0, r7
        cmp     r7, r5
        mov     r8, r5
        movlt   r8, r7
        ldrsh   r7, [lr, #6]
        sub     r3, r0, r3
        strh    r8, [lr, #2]
        cmp     r3, r5
        mov     r8, r5
        movlt   r8, r3
        ldrsh   r3, [lr, #8]
        sub     r7, r0, r7
        strh    r8, [lr, #4]
        cmp     r7, r5
        mov     r8, r5
        movlt   r8, r7
        sub     r3, r0, r3
        cmp     r3, r5
        mov     r7, r5
        movlt   r7, r3
        add     r4, r4, #5
        strh    r9, [lr]
        strh    r8, [lr, #6]
        strh    r7, [lr, #8]
        cmp     r4, r6
        add     lr, lr, #0xA
        ble     LATY3
LATY4:
        mvn     r12, r12
        add     r1, r1, r4, lsl #1
LATY5:
        ldrsh   r3, [r1]
        add     r4, r4, #1
        mov     lr, r12
        sub     r3, r0, r3
        cmp     r3, r12
        movlt   lr, r3
        strh    lr, [r1], #2
        cmp     r4, r2
        blt     LATY5
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LATY6:
        cmp     r3, #0
        ble     LATY10
        sub     lr, r3, #1
        mov     r5, #1
        mov     lr, r5, lsl lr
        cmp     r2, #5
        sub     lr, lr, #1
        blt     LATY8
        sub     r7, r2, #5
        mvn     r6, r12
        mov     r5, r1
        str     r2, [sp]
LATY7:
        ldrsh   r2, [r5]
        ldrsh   r9, [r5, #2]
        add     r4, r4, #4
        sub     r8, r0, r2
        ldrsh   r2, [r5, #4]
        mov     r11, r8, asr r3
        sub     r10, r0, r9
        and     r11, r11, #1
        add     r9, lr, r8
        ldrsh   r8, [r5, #6]
        add     r11, r9, r11
        mov     r11, r11, asr r3
        cmp     r11, r6
        mov     r9, r6
        movlt   r9, r11
        mov     r11, r10, asr r3
        and     r11, r11, #1
        add     r10, lr, r10
        add     r11, r10, r11
        mov     r11, r11, asr r3
        cmp     r11, r6
        mov     r10, r6
        sub     r2, r0, r2
        movlt   r10, r11
        mov     r11, r2, asr r3
        and     r11, r11, #1
        add     r2, lr, r2
        add     r11, r2, r11
        mov     r11, r11, asr r3
        cmp     r11, r6
        mov     r2, r6
        sub     r8, r0, r8
        movlt   r2, r11
        mov     r11, r8, asr r3
        and     r11, r11, #1
        add     r8, lr, r8
        add     r11, r8, r11
        mov     r8, r11, asr r3
        cmp     r8, r6
        mov     r11, r6
        movlt   r11, r8
        strh    r9, [r5]
        strh    r10, [r5, #2]
        strh    r2, [r5, #4]
        strh    r11, [r5, #6]
        cmp     r4, r7
        add     r5, r5, #8
        ble     LATY7
        ldr     r2, [sp]
LATY8:
        mvn     r12, r12
        add     r1, r1, r4, lsl #1
LATY9:
        ldrsh   r5, [r1]
        add     r4, r4, #1
        sub     r5, r0, r5
        mov     r6, r5, asr r3
        and     r6, r6, #1
        add     r5, lr, r5
        add     r6, r5, r6
        mov     r5, r6, asr r3
        cmp     r5, r12
        mov     r6, r12
        movlt   r6, r5
        strh    r6, [r1], #2
        cmp     r4, r2
        blt     LATY9
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LATY10:
        cmp     r2, #5
        rsb     r3, r3, #0
        movlt   r8, r4
        blt     LATY12
        mov     r8, r4
        sub     r7, r2, #5
        sub     r6, r4, #2, 18
        mvn     r5, r12
        mov     lr, r1
LATY11:
        ldrsh   r9, [lr]
        ldrsh   r10, [lr, #2]
        add     r8, r8, #4
        sub     r9, r0, r9
        mov     r11, r9, lsl r3
        cmp     r11, r5
        mov     r9, r5
        movlt   r9, r11
        cmp     r9, r6
        mov     r11, r6
        sub     r10, r0, r10
        movgt   r11, r9
        mov     r10, r10, lsl r3
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        ldrsh   r9, [lr, #4]
        strh    r11, [lr]
        strh    r10, [lr, #2]
        ldrsh   r10, [lr, #6]
        sub     r9, r0, r9
        mov     r11, r9, lsl r3
        cmp     r11, r5
        mov     r9, r5
        movlt   r9, r11
        cmp     r9, r6
        mov     r11, r6
        sub     r10, r0, r10
        movgt   r11, r9
        mov     r10, r10, lsl r3
        cmp     r10, r5
        mov     r9, r5
        movlt   r9, r10
        cmp     r9, r6
        mov     r10, r6
        movgt   r10, r9
        strh    r11, [lr, #4]
        strh    r10, [lr, #6]
        cmp     r8, r7
        add     lr, lr, #8
        ble     LATY11
LATY12:
        sub     r4, r4, #2, 18
        mvn     r12, r12
        add     r1, r1, r8, lsl #1
LATY13:
        ldrsh   lr, [r1]
        add     r8, r8, #1
        sub     lr, r0, lr
        mov     r5, lr, lsl r3
        cmp     r5, r12
        mov     lr, r12
        movlt   lr, r5
        cmp     lr, r4
        mov     r5, r4
        movgt   r5, lr
        strh    r5, [r1], #2
        cmp     r8, r2
        blt     LATY13
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LATY14:
        mov     r0, r1
        mov     r1, r2
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LATY15:
        cmp     r2, #6
        movlt   r12, r4
        blt     LATY17
        mov     r12, r4
        sub     r6, r2, #6
        sub     r5, r4, #2, 18
        mov     lr, r1
LATY16:
        ldrsh   r8, [lr]
        ldrsh   r7, [lr, #2]
        ldrsh   r3, [lr, #4]
        sub     r8, r0, r8
        cmp     r8, r5
        mov     r9, r5
        movgt   r9, r8
        sub     r7, r0, r7
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        ldrsh   r7, [lr, #6]
        sub     r3, r0, r3
        strh    r8, [lr, #2]
        cmp     r3, r5
        mov     r8, r5
        movgt   r8, r3
        ldrsh   r3, [lr, #8]
        sub     r7, r0, r7
        strh    r8, [lr, #4]
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        sub     r3, r0, r3
        cmp     r3, r5
        mov     r7, r5
        movgt   r7, r3
        add     r12, r12, #5
        strh    r9, [lr]
        strh    r8, [lr, #6]
        strh    r7, [lr, #8]
        cmp     r12, r6
        add     lr, lr, #0xA
        ble     LATY16
LATY17:
        sub     r4, r4, #2, 18
        add     r1, r1, r12, lsl #1
LATY18:
        ldrsh   r3, [r1]
        add     r12, r12, #1
        mov     lr, r4
        sub     r3, r0, r3
        cmp     r3, r4
        movgt   lr, r3
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LATY18
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LATY19:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LATY20:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}


