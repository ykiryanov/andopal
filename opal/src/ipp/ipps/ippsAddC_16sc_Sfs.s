        .text
        .align  4
        .globl  _ippsAddC_16sc_Sfs


_ippsAddC_16sc_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #4
        ldr     r12, [sp, #0x24]
        cmp     r12, #0x10
        str     r1, [sp]
        ble     LDCO0
        cmp     r0, #0
        beq     LDCO15
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
LDCO0:
        cmp     r0, #0
        beq     LDCO15
        cmp     r2, #0
        beq     LDCO15
        cmp     r3, #0
        ble     LDCO14
        mvn     lr, #0xFF
        bic     r6, lr, #0x7F, 24
        cmn     r12, #0xF
        mov     lr, #0
        bge     LDCO3
        cmp     r3, #0
        ble     LDCO2
        ldrsh   r4, [sp]
        ldrsh   r12, [sp, #2]
        sub     lr, lr, #2, 18
LDCO1:
        ldrsh   r5, [r0]
        ldrsh   r7, [r0, #2]
        add     r5, r4, r5
        cmp     r5, #0
        add     r7, r12, r7
        mvngt   r5, r6
        cmp     r7, #0
        mvngt   r7, r6
        cmp     r5, #0
        strlth  lr, [r2]
        strgeh  r5, [r2]
        cmp     r7, #0
        strlth  lr, [r2, #2]
        strgeh  r7, [r2, #2]
        subs    r3, r3, #1
        add     r2, r2, #4
        add     r0, r0, #4
        bne     LDCO1
LDCO2:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LDCO3:
        cmp     r12, #0
        bne     LDCO7
        cmp     r3, #0
        ble     LDCO11
        ldrsh   r4, [sp]
        ldrsh   r12, [sp, #2]
        sub     r2, r2, #2
        mov     r5, lr
LDCO4:
        ldrsh   r8, [r0]
        ldrsh   r7, [r0, #2]
        cmp     r4, #0
        add     r8, r4, r8
        add     r7, r12, r7
        ble     LDCO13
        mvn     r9, r6
        cmp     r8, r9
        movlt   r9, r8
LDCO5:
        cmp     r12, #0
        strh    r9, [r2, #2]
        ble     LDCO12
        mvn     r8, r6
        cmp     r7, r8
        movlt   r8, r7
LDCO6:
        add     r5, r5, #1
        strh    r8, [r2, #4]!
        cmp     r5, r3
        add     r0, r0, #4
        blt     LDCO4
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LDCO7:
        cmp     r12, #0
        ble     LDCO9
        sub     r4, r12, #1
        mov     r5, #1
        mov     r4, r5, lsl r4
        cmp     r3, #0
        sub     r4, r4, #1
        ble     LDCO11
        ldrsh   r6, [sp]
        ldrsh   r5, [sp, #2]
        sub     r2, r2, #2
        sub     r7, r0, #2
LDCO8:
        ldrsh   r8, [r7, #2]
        ldrsh   r0, [r7, #4]!
        add     r8, r6, r8
        mov     r10, r8, asr r12
        add     r0, r5, r0
        mov     r9, r0, asr r12
        and     r10, r10, #1
        and     r9, r9, #1
        add     r8, r4, r8
        add     r0, r4, r0
        add     r10, r8, r10
        add     r9, r0, r9
        mov     r10, r10, asr r12
        mov     r9, r9, asr r12
        add     lr, lr, #1
        strh    r10, [r2, #2]
        strh    r9, [r2, #4]!
        cmp     lr, r3
        blt     LDCO8
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LDCO9:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LDCO11
        ldrsh   r5, [sp]
        ldrsh   r4, [sp, #2]
        mvn     r6, r6
        sub     r2, r2, #2
        sub     r0, r0, #2
        sub     r7, lr, #2, 18
LDCO10:
        ldrsh   r8, [r0, #2]
        ldrsh   r9, [r0, #4]!
        add     r8, r5, r8
        mov     r8, r8, lsl r12
        add     r9, r4, r9
        cmp     r8, r6
        mov     r10, r9, lsl r12
        mov     r9, r6
        movlt   r9, r8
        cmp     r10, r6
        mov     r8, r6
        movlt   r8, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        cmp     r8, r7
        mov     r9, r7
        movgt   r9, r8
        add     lr, lr, #1
        strh    r10, [r2, #2]
        strh    r9, [r2, #4]!
        cmp     lr, r3
        blt     LDCO10
LDCO11:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LDCO12:
        sub     r8, lr, #2, 18
        cmp     r7, r8
        movgt   r8, r7
        b       LDCO6
LDCO13:
        sub     r9, lr, #2, 18
        cmp     r8, r9
        movgt   r9, r8
        b       LDCO5
LDCO14:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LDCO15:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}


