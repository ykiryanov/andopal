        .text
        .align  4
        .globl  _ippsWTHaarInv_8s_Sfs


_ippsWTHaarInv_8s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        cmp     r12, #0
        beq     LAIY16
        cmp     r0, #0
        beq     LAIY23
        cmp     r1, #0
        beq     LAIY23
        cmp     r2, #0
        beq     LAIY23
        cmp     r3, #0
        ble     LAIY24
        cmp     r12, #1
        mov     r4, #0
        mov     r5, #0x7F
        beq     LAIY20
        cmp     r12, #8
        ble     LAIY3
        cmp     r3, #6
        movlt   r0, r4
        blt     LAIY1
        mov     r0, r4
        sub     r1, r3, #6
        mov     r12, r0
        sub     lr, r2, #1
LAIY0:
        add     r0, r0, #5
        strb    r12, [lr, #1]
        strb    r12, [lr, #2]
        strb    r12, [lr, #3]
        strb    r12, [lr, #4]
        strb    r12, [lr, #5]!
        cmp     r0, r1
        ble     LAIY0
LAIY1:
        add     r2, r0, r2
LAIY2:
        add     r0, r0, #1
        strb    r4, [r2], #1
        cmp     r0, r3
        blt     LAIY2
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAIY3:
        cmn     r12, #8
        bgt     LAIY9
        sub     r5, r3, #1
        cmp     r5, #0
        movle   r6, r4
        ble     LAIY7
        mov     r6, r4
        mov     lr, r0
        sub     r12, r2, #1
LAIY4:
        ldrsb   r8, [lr], #1
        ldrsb   r9, [r1], #1
        sub     r7, r8, r9
        cmp     r7, #0
        add     r8, r8, r9
        movgt   r7, #0x7F
        ble     LAIY19
LAIY5:
        cmp     r8, #0
        strb    r7, [r12, #1]
        movgt   r7, #0x7F
        ble     LAIY18
LAIY6:
        add     r4, r4, #2
        strb    r7, [r12, #2]!
        cmp     r4, r5
        add     r6, r6, #1
        blt     LAIY4
LAIY7:
        tst     r3, #1
        beq     LAIY15
        ldrsb   r0, [r6, +r0]
        cmp     r0, #0
        movgt   r0, #0x7F
        ble     LAIY17
LAIY8:
        strb    r0, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAIY9:
        cmp     r12, #0
        sub     lr, r3, #1
        ble     LAIY12
        sub     r5, r12, #1
        mov     r6, #1
        mov     r5, r6, lsl r5
        cmp     lr, #0
        sub     r5, r5, #1
        movle   r9, r4
        ble     LAIY11
        mov     r9, r4
        mov     r8, r0
        sub     r7, r2, #1
LAIY10:
        ldrsb   r6, [r8], #1
        ldrsb   r10, [r1], #1
        add     r4, r4, #2
        sub     r11, r6, r10
        add     r6, r6, r10
        mov     r10, r11, asr r12
        and     r10, r10, #1
        add     r11, r5, r11
        add     r10, r11, r10
        mov     r10, r10, asr r12
        strb    r10, [r7, #1]
        mov     r10, r6, asr r12
        and     r10, r10, #1
        add     r6, r5, r6
        add     r10, r6, r10
        mov     r6, r10, asr r12
        strb    r6, [r7, #2]!
        cmp     r4, lr
        add     r9, r9, #1
        blt     LAIY10
LAIY11:
        tst     r3, #1
        beq     LAIY15
        ldrsb   r9, [r9, +r0]
        mov     r0, r9, asr r12
        and     r0, r0, #1
        add     r9, r5, r9
        add     r0, r9, r0
        mov     r12, r0, asr r12
        strb    r12, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAIY12:
        cmp     lr, #0
        rsb     r12, r12, #0
        movle   r9, r4
        ble     LAIY14
        mov     r9, r4
        mvn     r8, #0x7F
        mov     r7, r0
        sub     r6, r2, #1
        str     r2, [sp, #4]
        str     r0, [sp]
LAIY13:
        ldrsb   r0, [r1], #1
        ldrsb   r2, [r7], #1
        add     r4, r4, #2
        sub     r10, r2, r0
        mov     r11, r10, lsl r12
        cmp     r11, r8
        mov     r10, r8
        movgt   r10, r11
        add     r0, r2, r0
        cmp     r10, #0x7F
        mov     r2, r5
        movlt   r2, r10
        strb    r2, [r6, #1]
        mov     r2, r0, lsl r12
        cmp     r2, r8
        mov     r0, r8
        movgt   r0, r2
        cmp     r0, #0x7F
        mov     r2, r5
        movlt   r2, r0
        strb    r2, [r6, #2]!
        cmp     r4, lr
        add     r9, r9, #1
        blt     LAIY13
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LAIY14:
        tst     r3, #1
        beq     LAIY15
        ldrsb   r9, [r9, +r0]
        mvn     r0, #0x7F
        mov     r1, #0x7F
        mov     r12, r9, lsl r12
        cmp     r12, r0
        movgt   r0, r12
        cmp     r0, #0x7F
        movlt   r1, r0
        strb    r1, [r4, +r2]
LAIY15:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAIY16:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsWTHaarInv_8s
LAIY17:
        cmp     r0, #0
        mvnlt   r0, #0x7F
        movge   r0, #0
        b       LAIY8
LAIY18:
        cmp     r8, #0
        mvnlt   r7, #0x7F
        movge   r7, #0
        b       LAIY6
LAIY19:
        cmp     r7, #0
        mvnlt   r7, #0x7F
        movge   r7, #0
        b       LAIY5
LAIY20:
        sub     r6, r3, #1
        cmp     r6, #0
        movle   r7, r4
        ble     LAIY22
        mov     r7, r4
        mov     lr, r0
        sub     r5, r2, #1
LAIY21:
        ldrsb   r8, [lr], #1
        ldrsb   r12, [r1], #1
        sub     r9, r8, r12
        and     r8, r9, #1
        and     r10, r8, r9, asr #1
        add     r12, r12, r9, asr #1
        add     r9, r10, r9, asr #1
        and     r8, r12, r8
        cmp     r9, #0x80
        add     r8, r12, r8
        moveq   r9, #0x7F
        add     r4, r4, #2
        strb    r9, [r5, #1]
        strb    r8, [r5, #2]!
        cmp     r4, r6
        add     r7, r7, #1
        blt     LAIY21
LAIY22:
        tst     r3, #1
        beq     LAIY15
        ldrsb   r0, [r7, +r0]
        and     r1, r0, r0, asr #1
        and     r1, r1, #1
        add     r0, r1, r0, asr #1
        strb    r0, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAIY23:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAIY24:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


