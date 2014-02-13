        .text
        .align  4
        .globl  _ippsISFToISP_AMRWB_16s


_ippsISFToISP_AMRWB_16s:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        beq     LDIO5
        cmp     r1, #0
        beq     LDIO5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        ldr     r6, [pc, #0x15C]
        sub     r5, r2, #1
        cmp     r5, #0
        ble     LDIO3
        sub     r3, r2, #1
        cmp     r3, #4
        mov     r4, #0
        blt     LDIO1
        sub     lr, r2, #5
        mov     r12, r0
        mov     r3, r1
LDIO0:
        ldrsh   r7, [r12]
        add     r4, r4, #3
        cmp     r4, lr
        mov     r8, r7, asr #7
        and     r7, r7, #0x7F
        mov     r9, r8, lsl #1
        ldrsh   r8, [r6, +r9]
        add     r9, r6, r9
        ldrsh   r9, [r9, #2]
        sub     r9, r9, r8
        mul     r7, r9, r7
        add     r7, r8, r7, asr #7
        strh    r7, [r3]
        ldrsh   r7, [r12, #2]
        mov     r8, r7, asr #7
        mov     r9, r8, lsl #1
        ldrsh   r8, [r6, +r9]
        add     r9, r6, r9
        ldrsh   r9, [r9, #2]
        and     r7, r7, #0x7F
        sub     r9, r9, r8
        mul     r7, r9, r7
        add     r7, r8, r7, asr #7
        strh    r7, [r3, #2]
        ldrsh   r7, [r12, #4]
        add     r12, r12, #6
        mov     r8, r7, asr #7
        and     r7, r7, #0x7F
        mov     r9, r8, lsl #1
        ldrsh   r8, [r6, +r9]
        add     r9, r6, r9
        ldrsh   r9, [r9, #2]
        sub     r9, r9, r8
        mul     r7, r9, r7
        add     r7, r8, r7, asr #7
        strh    r7, [r3, #4]
        add     r3, r3, #6
        ble     LDIO0
LDIO1:
        add     r7, r0, r4, lsl #1
        add     lr, r1, r4, lsl #1
LDIO2:
        ldrsh   r3, [r7], #2
        add     r4, r4, #1
        mov     r12, r3, asr #7
        cmp     r4, r5
        and     r3, r3, #0x7F
        mov     r8, r12, lsl #1
        ldrsh   r12, [r6, +r8]
        add     r8, r6, r8
        ldrsh   r8, [r8, #2]
        sub     r8, r8, r12
        mul     r3, r8, r3
        add     r3, r12, r3, asr #7
        strh    r3, [lr], #2
        blt     LDIO2
LDIO3:
        sub     r0, r0, #2
        mov     r2, r2, lsl #1
        ldrsh   r0, [r0, +r2]
        cmn     r0, #7, 2
        mvngt   r3, #2, 2
        bgt     LDIO4
        cmp     r0, #3, 2
        movge   r3, r0, lsl #1
        movlt   r3, #2, 2
LDIO4:
        mov     r0, r3, asr #7
        and     r3, r3, #0x7F
        mov     r0, r0, lsl #1
        ldrsh   r12, [r6, +r0]
        add     r0, r6, r0
        ldrsh   lr, [r0, #2]
        sub     r1, r1, #2
        mov     r0, #0
        sub     lr, lr, r12
        mul     r3, lr, r3
        add     r3, r12, r3, asr #7
        strh    r3, [r1, +r2]
        ldmia   sp!, {r4 - r9, pc}
LDIO5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}
        .long   cosTbl


