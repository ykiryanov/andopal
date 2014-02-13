        .text
        .align  4
        .globl  _ippsSub_8u_Sfs


_ippsSub_8u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r12, #8
        ble     LASS0
        cmp     r0, #0
        beq     LASS15
        cmp     r1, #0
        beq     LASS15
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_8u
LASS0:
        cmp     r0, #0
        beq     LASS15
        cmp     r1, #0
        beq     LASS15
        cmp     r2, #0
        beq     LASS15
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r12, #0
        mov     lr, #0
        bne     LASS4
        cmp     r3, #5
        movlt   r8, #0
        blt     LASS2
        mov     r8, #0
        sub     r7, r3, #5
        mov     r6, r8
        sub     r5, r1, #1
        sub     r4, r0, #1
        sub     r12, r2, #1
LASS1:
        ldrb    r9, [r5, #1]
        ldrb    r10, [r4, #1]
        add     r8, r8, #4
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strb    r10, [r12, #1]
        ldrb    r9, [r5, #2]
        ldrb    r10, [r4, #2]
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strb    r10, [r12, #2]
        ldrb    r9, [r5, #3]
        ldrb    r10, [r4, #3]
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strb    r10, [r12, #3]
        ldrb    r9, [r5, #4]!
        ldrb    r10, [r4, #4]!
        sub     r9, r9, r10
        cmp     r9, #0
        mov     r10, r6
        movgt   r10, r9
        strb    r10, [r12, #4]!
        cmp     r8, r7
        ble     LASS1
LASS2:
        add     r1, r8, r1
        add     r0, r8, r0
        add     r2, r8, r2
LASS3:
        ldrb    r12, [r1], #1
        ldrb    r4, [r0], #1
        add     r8, r8, #1
        sub     r12, r12, r4
        cmp     r12, #0
        mov     r4, lr
        movgt   r4, r12
        strb    r4, [r2], #1
        cmp     r8, r3
        blt     LASS3
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LASS4:
        cmp     r12, #0
        ble     LASS9
        sub     r5, r12, #1
        mov     r4, #1
        mov     r5, r4, lsl r5
        cmp     r3, #5
        sub     r4, r5, #1
        movlt   r9, #0
        blt     LASS6
        mov     r9, #0
        sub     r8, r3, #5
        sub     r7, r1, #1
        sub     r6, r0, #1
        sub     r5, r2, #1
LASS5:
        ldrb    r11, [r7, #1]
        ldrb    r10, [r6, #1]
        add     r9, r9, #4
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r10, r11, #0xFF
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r5, #1]
        ldrb    r10, [r6, #2]
        ldrb    r11, [r7, #2]
        sub     r10, r11, r10
        mov     r11, lr
        cmp     r10, #0
        movgt   r11, r10
        and     r10, r11, #0xFF
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r5, #2]
        ldrb    r10, [r6, #3]
        ldrb    r11, [r7, #3]
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r10, r11, #0xFF
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r5, #3]
        ldrb    r10, [r6, #4]!
        ldrb    r11, [r7, #4]!
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r10, r11, #0xFF
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r4, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r5, #4]!
        cmp     r9, r8
        ble     LASS5
LASS6:
        add     r1, r9, r1
        add     r0, r9, r0
        add     r2, r9, r2
        mov     lr, #0
LASS7:
        ldrb    r5, [r0], #1
        ldrb    r6, [r1], #1
        add     r9, r9, #1
        sub     r5, r6, r5
        cmp     r5, #0
        mov     r6, lr
        movgt   r6, r5
        and     r5, r6, #0xFF
        mov     r6, r5, asr r12
        and     r6, r6, #1
        add     r5, r4, r5
        add     r6, r5, r6
        mov     r5, r6, asr r12
        strb    r5, [r2], #1
        cmp     r9, r3
        blt     LASS7
LASS8:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LASS9:
        cmn     r12, #7
        mov     r5, #0xFF
        bge     LASS11
        cmp     r3, #0
        ble     LASS8
        mov     r12, #0
LASS10:
        ldrb    lr, [r1], #1
        ldrb    r4, [r0], #1
        cmp     lr, r4
        movle   lr, #0
        movgt   lr, #0xFF
        add     r12, r12, #1
        strb    lr, [r2], #1
        cmp     r12, r3
        blt     LASS10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LASS11:
        cmp     r3, #5
        rsb     r12, r12, #0
        movlt   r4, #0
        blt     LASS13
        mov     r4, #0
        sub     r9, r3, #5
        sub     r8, r1, #1
        sub     r7, r0, #1
        sub     r6, r2, #1
LASS12:
        ldrb    r10, [r7, #1]
        ldrb    r11, [r8, #1]
        add     r4, r4, #4
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r11, r11, #0xFF
        mov     r10, r11, lsl r12
        mov     r11, r5
        cmp     r10, #0xFF
        movlt   r11, r10
        strb    r11, [r6, #1]
        ldrb    r11, [r8, #2]
        ldrb    r10, [r7, #2]
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r11, r11, #0xFF
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #2]
        ldrb    r10, [r7, #3]
        ldrb    r11, [r8, #3]
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r11, r11, #0xFF
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #3]
        ldrb    r10, [r7, #4]!
        ldrb    r11, [r8, #4]!
        sub     r10, r11, r10
        cmp     r10, #0
        mov     r11, lr
        movgt   r11, r10
        and     r11, r11, #0xFF
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #4]!
        cmp     r4, r9
        ble     LASS12
LASS13:
        add     r1, r4, r1
        add     r0, r4, r0
        add     r2, r4, r2
        mov     r5, #0xFF
        mov     lr, #0
LASS14:
        ldrb    r6, [r1], #1
        ldrb    r7, [r0], #1
        add     r4, r4, #1
        sub     r6, r6, r7
        cmp     r6, #0
        mov     r7, lr
        movgt   r7, r6
        and     r7, r7, #0xFF
        mov     r6, r7, lsl r12
        cmp     r6, #0xFF
        mov     r7, r5
        movlt   r7, r6
        strb    r7, [r2], #1
        cmp     r4, r3
        blt     LASS14
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LASS15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


