        .text
        .align  4
        .globl  _ippsSubCRev_16sc_Sfs


_ippsSubCRev_16sc_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #4
        ldr     r12, [sp, #0x24]
        cmp     r12, #0x10
        str     r1, [sp]
        ble     LATV0
        cmp     r0, #0
        beq     LATV15
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
LATV0:
        cmp     r0, #0
        beq     LATV15
        cmp     r2, #0
        beq     LATV15
        cmp     r3, #0
        ble     LATV14
        mvn     lr, #0xFF
        bic     r5, lr, #0x7F, 24
        cmn     r12, #0xF
        mov     lr, #0
        bge     LATV3
        cmp     r3, #0
        ble     LATV2
        ldrsh   r4, [sp]
        ldrsh   r12, [sp, #2]
        sub     lr, lr, #2, 18
LATV1:
        ldrsh   r6, [r0]
        ldrsh   r7, [r0, #2]
        sub     r6, r4, r6
        cmp     r6, #0
        sub     r7, r12, r7
        mvngt   r6, r5
        cmp     r7, #0
        mvngt   r7, r5
        cmp     r6, #0
        strlth  lr, [r2]
        strgeh  r6, [r2]
        cmp     r7, #0
        strlth  lr, [r2, #2]
        strgeh  r7, [r2, #2]
        subs    r3, r3, #1
        add     r2, r2, #4
        add     r0, r0, #4
        bne     LATV1
LATV2:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATV3:
        cmp     r12, #0
        bne     LATV7
        cmp     r3, #0
        ble     LATV11
        ldrsh   r4, [sp]
        ldrsh   r12, [sp, #2]
        sub     r2, r2, #2
        mov     r6, lr
LATV4:
        ldrsh   r8, [r0]
        ldrsh   r7, [r0, #2]
        cmp     r4, #0
        sub     r8, r4, r8
        sub     r7, r12, r7
        ble     LATV13
        mvn     r9, r5
        cmp     r8, r9
        movlt   r9, r8
LATV5:
        cmp     r12, #0
        strh    r9, [r2, #2]
        ble     LATV12
        mvn     r8, r5
        cmp     r7, r8
        movlt   r8, r7
LATV6:
        add     r6, r6, #1
        strh    r8, [r2, #4]!
        cmp     r6, r3
        add     r0, r0, #4
        blt     LATV4
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATV7:
        cmp     r12, #0
        ble     LATV9
        sub     r4, r12, #1
        mov     r6, #1
        mov     r4, r6, lsl r4
        cmp     r3, #0
        sub     r4, r4, #1
        ble     LATV11
        ldrsh   r7, [sp]
        ldrsh   r6, [sp, #2]
        mvn     r5, r5
        sub     r2, r2, #2
        sub     r8, r0, #2
LATV8:
        ldrsh   r9, [r8, #2]
        ldrsh   r0, [r8, #4]!
        sub     r10, r7, r9
        mov     r9, r10, asr r12
        and     r9, r9, #1
        add     r10, r4, r10
        add     r9, r10, r9
        mov     r10, r9, asr r12
        cmp     r10, r5
        mov     r9, r5
        sub     r0, r6, r0
        movlt   r9, r10
        mov     r10, r0, asr r12
        and     r10, r10, #1
        add     r0, r4, r0
        add     r10, r0, r10
        mov     r0, r10, asr r12
        cmp     r0, r5
        mov     r10, r5
        movlt   r10, r0
        add     lr, lr, #1
        strh    r9, [r2, #2]
        strh    r10, [r2, #4]!
        cmp     lr, r3
        blt     LATV8
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATV9:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LATV11
        ldrsh   r6, [sp]
        ldrsh   r4, [sp, #2]
        mvn     r5, r5
        sub     r2, r2, #2
        sub     r0, r0, #2
        sub     r7, lr, #2, 18
LATV10:
        ldrsh   r8, [r0, #2]
        ldrsh   r9, [r0, #4]!
        sub     r8, r6, r8
        mov     r8, r8, lsl r12
        sub     r9, r4, r9
        cmp     r8, r5
        mov     r10, r9, lsl r12
        mov     r9, r5
        movlt   r9, r8
        cmp     r10, r5
        mov     r8, r5
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
        blt     LATV10
LATV11:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATV12:
        sub     r8, lr, #2, 18
        cmp     r7, r8
        movgt   r8, r7
        b       LATV6
LATV13:
        sub     r9, lr, #2, 18
        cmp     r8, r9
        movgt   r9, r8
        b       LATV5
LATV14:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATV15:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}


