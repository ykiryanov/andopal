        .text
        .align  4
        .globl  _ippsAddC_16sc_ISfs


_ippsAddC_16sc_ISfs:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #4
        str     r0, [sp]
        cmp     r3, #0x10
        mov     r0, r1
        bgt     LDCP13
        cmp     r0, #0
        beq     LDCP17
        cmp     r2, #0
        ble     LDCP16
        mvn     r12, #0xFF
        bic     r5, r12, #0x7F, 24
        cmp     r3, #0
        mov     r12, #0
        bne     LDCP0
        ldrsh   r3, [sp]
        cmp     r3, #0
        bne     LDCP4
        ldrsh   r3, [sp, #2]
        cmp     r3, #0
        bne     LDCP4
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LDCP0:
        cmn     r3, #0xF
        bge     LDCP3
        cmp     r2, #0
        ble     LDCP2
        ldrsh   lr, [sp]
        ldrsh   r3, [sp, #2]
        sub     r0, r0, #2
LDCP1:
        ldrsh   r4, [r0, #2]
        ldrsh   r6, [r0, #4]
        add     r4, lr, r4
        cmp     r4, #0
        add     r6, r3, r6
        mvngt   r4, r5
        cmp     r6, #0
        mvngt   r6, r5
        cmp     r4, #0
        sublt   r4, r12, #2, 18
        cmp     r6, #0
        strh    r4, [r0, #2]
        sublt   r6, r12, #2, 18
        strh    r6, [r0, #4]!
        subs    r2, r2, #1
        bne     LDCP1
LDCP2:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LDCP3:
        cmp     r3, #0
        bne     LDCP8
LDCP4:
        cmp     r2, #0
        ble     LDCP12
        ldrsh   lr, [sp]
        ldrsh   r3, [sp, #2]
        sub     r0, r0, #2
        mov     r4, r12
LDCP5:
        ldrsh   r7, [r0, #2]
        ldrsh   r6, [r0, #4]
        cmp     lr, #0
        add     r7, lr, r7
        add     r6, r3, r6
        ble     LDCP15
        mvn     r8, r5
        cmp     r7, r8
        movlt   r8, r7
LDCP6:
        cmp     r3, #0
        strh    r8, [r0, #2]
        ble     LDCP14
        mvn     r7, r5
        cmp     r6, r7
        movlt   r7, r6
LDCP7:
        add     r4, r4, #1
        strh    r7, [r0, #4]!
        cmp     r4, r2
        blt     LDCP5
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LDCP8:
        cmp     r3, #0
        ble     LDCP10
        sub     lr, r3, #1
        mov     r4, #1
        mov     lr, r4, lsl lr
        cmp     r2, #0
        sub     lr, lr, #1
        ble     LDCP12
        ldrsh   r5, [sp]
        ldrsh   r4, [sp, #2]
        sub     r0, r0, #2
LDCP9:
        ldrsh   r7, [r0, #2]
        ldrsh   r6, [r0, #4]
        add     r12, r12, #1
        add     r7, r5, r7
        mov     r9, r7, asr r3
        add     r6, r4, r6
        mov     r8, r6, asr r3
        and     r9, r9, #1
        and     r8, r8, #1
        add     r7, lr, r7
        add     r6, lr, r6
        add     r9, r7, r9
        add     r8, r6, r8
        mov     r9, r9, asr r3
        mov     r8, r8, asr r3
        strh    r9, [r0, #2]
        strh    r8, [r0, #4]!
        cmp     r12, r2
        blt     LDCP9
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LDCP10:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LDCP12
        ldrsh   r4, [sp]
        ldrsh   lr, [sp, #2]
        mvn     r5, r5
        sub     r0, r0, #2
        sub     r6, r12, #2, 18
LDCP11:
        ldrsh   r7, [r0, #2]
        ldrsh   r8, [r0, #4]
        add     r12, r12, #1
        add     r7, r4, r7
        mov     r7, r7, lsl r3
        add     r8, lr, r8
        cmp     r7, r5
        mov     r9, r8, lsl r3
        mov     r8, r5
        movlt   r8, r7
        cmp     r9, r5
        mov     r7, r5
        movlt   r7, r9
        cmp     r8, r6
        mov     r9, r6
        movgt   r9, r8
        cmp     r7, r6
        mov     r8, r6
        movgt   r8, r7
        strh    r9, [r0, #2]
        strh    r8, [r0, #4]!
        cmp     r12, r2
        blt     LDCP11
LDCP12:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LDCP13:
        mov     r1, r2
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, lr}
        b       _ippsZero_16sc
LDCP14:
        sub     r7, r12, #2, 18
        cmp     r6, r7
        movgt   r7, r6
        b       LDCP7
LDCP15:
        sub     r8, r12, #2, 18
        cmp     r7, r8
        movgt   r8, r7
        b       LDCP6
LDCP16:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LDCP17:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}


