        .text
        .align  4
        .globl  _ippsWTHaarFwd_8s_Sfs


_ippsWTHaarFwd_8s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r5, [sp, #0x2C]
        cmp     r5, #0
        beq     LAJI23
        cmp     r0, #0
        beq     LAJI28
        cmp     r2, #0
        beq     LAJI28
        cmp     r3, #0
        beq     LAJI28
        cmp     r1, #0
        ble     LAJI27
        add     r4, r5, #1
        cmp     r4, #2, 2
        mov     lr, #0
        mov     r8, #1
        beq     LAJI14
        cmp     r4, #0
        mvn     r7, #0x7F
        mov     r6, #0x7F
        bne     LAJI2
        sub     r10, r1, #1
        cmp     r10, #0
        movle   r11, lr
        ble     LAJI1
        mov     r11, lr
        mov     r9, r2
        sub     r8, r0, #1
LAJI0:
        ldrsb   r12, [r8, #2]
        ldrsb   r5, [r8, #1]
        add     r8, r8, #2
        add     r11, r11, #1
        add     lr, lr, #2
        add     r4, r5, r12
        sub     r12, r12, r5
        cmp     r4, r7
        mov     r5, r7
        movgt   r5, r4
        cmp     r5, #0x7F
        mov     r4, r6
        movlt   r4, r5
        strb    r4, [r9], #1
        cmp     r12, r7
        mov     r4, r7
        movgt   r4, r12
        cmp     r4, #0x7F
        mov     r12, r6
        movlt   r12, r4
        strb    r12, [r3], #1
        cmp     lr, r10
        blt     LAJI0
LAJI1:
        tst     r1, #1
        beq     LAJI22
        ldrsb   lr, [lr, +r0]
        mvn     r0, #0x7F
        mov     r1, lr, lsl #1
        cmp     r1, r0
        movgt   r0, r1
        mov     r1, #0x7F
        cmp     r0, #0x7F
        movlt   r1, r0
        strb    r1, [r11, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJI2:
        cmp     r4, #8
        bgt     LAJI14
        cmn     r4, #8
        bgt     LAJI8
        sub     r6, r1, #1
        cmp     r6, #0
        movle   r12, lr
        ble     LAJI6
        mov     r12, lr
        mov     r4, r2
        mov     r5, r0
LAJI3:
        ldrsb   r8, [r5]
        ldrsb   r9, [r5, #1]
        add     r7, r8, r9
        cmp     r7, #0
        sub     r8, r9, r8
        movgt   r7, #0x7F
        ble     LAJI26
LAJI4:
        strb    r7, [r4], #1
        cmp     r8, #0
        movgt   r7, #0x7F
        ble     LAJI25
LAJI5:
        add     lr, lr, #2
        strb    r7, [r3], #1
        cmp     lr, r6
        add     r12, r12, #1
        add     r5, r5, #2
        blt     LAJI3
LAJI6:
        tst     r1, #1
        beq     LAJI22
        ldrsb   r0, [lr, +r0]
        cmp     r0, #0
        movgt   r0, #0x7F
        ble     LAJI24
LAJI7:
        strb    r0, [r12, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJI8:
        cmp     r4, #0
        sub     r12, r1, #1
        ble     LAJI11
        mov     r5, r8, lsl r5
        cmp     r12, #0
        sub     r5, r5, #1
        movle   r9, lr
        ble     LAJI10
        mov     r9, lr
        mov     r8, r2
        sub     r7, r0, #1
LAJI9:
        ldrsb   r6, [r7, #2]
        ldrsb   r10, [r7, #1]
        add     r7, r7, #2
        add     r9, r9, #1
        add     lr, lr, #2
        add     r11, r10, r6
        sub     r6, r6, r10
        mov     r10, r11, asr r4
        and     r10, r10, #1
        add     r11, r5, r11
        add     r10, r11, r10
        mov     r10, r10, asr r4
        strb    r10, [r8], #1
        mov     r10, r6, asr r4
        and     r10, r10, #1
        add     r6, r5, r6
        add     r10, r6, r10
        mov     r6, r10, asr r4
        strb    r6, [r3], #1
        cmp     lr, r12
        blt     LAJI9
LAJI10:
        tst     r1, #1
        beq     LAJI22
        ldrsb   r0, [lr, +r0]
        mov     r1, r0, lsl #1
        mov     r0, r1, asr r4
        and     r0, r0, #1
        add     r1, r5, r1
        add     r0, r1, r0
        mov     r4, r0, asr r4
        strb    r4, [r9, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJI11:
        cmp     r12, #0
        rsb     r4, r4, #0
        movle   r9, lr
        ble     LAJI13
        mov     r9, lr
        mov     r8, r2
        sub     r5, r0, #1
        str     r1, [sp, #4]
        str     r0, [sp]
LAJI12:
        ldrsb   r0, [r5, #2]
        ldrsb   r1, [r5, #1]
        add     r9, r9, #1
        add     lr, lr, #2
        add     r5, r5, #2
        add     r10, r1, r0
        mov     r11, r10, lsl r4
        cmp     r11, r7
        mov     r10, r7
        movgt   r10, r11
        sub     r0, r0, r1
        cmp     r10, #0x7F
        mov     r1, r6
        movlt   r1, r10
        strb    r1, [r8], #1
        mov     r1, r0, lsl r4
        cmp     r1, r7
        mov     r0, r7
        movgt   r0, r1
        cmp     r0, #0x7F
        mov     r1, r6
        movlt   r1, r0
        strb    r1, [r3], #1
        cmp     lr, r12
        blt     LAJI12
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAJI13:
        tst     r1, #1
        beq     LAJI22
        ldrsb   lr, [lr, +r0]
        mvn     r0, #0x7F
        mov     r1, lr, lsl #1
        mov     r4, r1, lsl r4
        cmp     r4, r0
        movgt   r0, r4
        mov     r1, #0x7F
        cmp     r0, #0x7F
        movlt   r1, r0
        strb    r1, [r9, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJI14:
        adds    r0, r1, #1
        mov     r12, lr
        movmi   r12, r8
        add     r12, r1, r12
        add     r12, r12, #1
        mov     r0, r12, asr #1
        cmp     r0, #0
        ble     LAJI18
        cmp     r0, #6
        movlt   r12, lr
        blt     LAJI16
        mov     r12, lr
        sub     r4, r0, #6
        mov     r5, r12
        sub     r6, r2, #1
LAJI15:
        add     r12, r12, #5
        strb    r5, [r6, #1]
        strb    r5, [r6, #2]
        strb    r5, [r6, #3]
        strb    r5, [r6, #4]
        strb    r5, [r6, #5]!
        cmp     r12, r4
        ble     LAJI15
LAJI16:
        add     r2, r12, r2
LAJI17:
        add     r12, r12, #1
        strb    lr, [r2], #1
        cmp     r12, r0
        blt     LAJI17
LAJI18:
        cmp     r1, #0
        mov     r0, lr
        movlt   r0, r8
        add     r0, r1, r0
        mov     r0, r0, asr #1
        cmp     r0, #0
        ble     LAJI22
        cmp     r0, #6
        movlt   r1, lr
        blt     LAJI20
        mov     r1, lr
        sub     r2, r0, #6
        mov     r12, r1
        sub     r4, r3, #1
LAJI19:
        add     r1, r1, #5
        strb    r12, [r4, #1]
        strb    r12, [r4, #2]
        strb    r12, [r4, #3]
        strb    r12, [r4, #4]
        strb    r12, [r4, #5]!
        cmp     r1, r2
        ble     LAJI19
LAJI20:
        add     r3, r1, r3
LAJI21:
        add     r1, r1, #1
        strb    lr, [r3], #1
        cmp     r1, r0
        blt     LAJI21
LAJI22:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJI23:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsWTHaarFwd_8s
LAJI24:
        cmp     r0, #0
        mvnlt   r0, #0x7F
        movge   r0, #0
        b       LAJI7
LAJI25:
        cmp     r8, #0
        mvnlt   r7, #0x7F
        movge   r7, #0
        b       LAJI5
LAJI26:
        cmp     r7, #0
        mvnlt   r7, #0x7F
        movge   r7, #0
        b       LAJI4
LAJI27:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJI28:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


