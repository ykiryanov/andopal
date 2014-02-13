        .text
        .align  4
        .globl  _ippsConvert_NR_32s16s_Sfs


_ippsConvert_NR_32s16s_Sfs:
        stmdb   sp!, {r4 - r8, lr}
        mvn     r12, #0xFF
        cmp     r3, #0
        bic     r12, r12, #0x7F, 24
        mov     r7, #0
        ble     LDSG2
        cmp     r2, #0
        sub     r6, r3, #1
        mov     r5, #1
        ble     LDSG5
        mov     r4, #0
        mvn     lr, r12
LDSG0:
        ldr     r8, [r0], #4
        add     r8, r8, r5, lsl r6
        mov     r8, r8, asr r3
        cmp     lr, r8
        mvnlt   r8, r12
        blt     LDSG1
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        sublt   r8, r7, #2, 18
LDSG1:
        add     r4, r4, #1
        strh    r8, [r1], #2
        cmp     r4, r2
        blt     LDSG0
        ldmia   sp!, {r4 - r8, pc}
LDSG2:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LDSG5
        mov     r4, #0
        mvn     lr, r12
LDSG3:
        ldr     r5, [r0], #4
        mov     r5, r5, lsl r3
        cmp     lr, r5
        sublt   r5, r7, #2, 18
        mvnlt   r5, r5
        blt     LDSG4
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        movlt   r5, r12
LDSG4:
        add     r4, r4, #1
        strh    r5, [r1], #2
        cmp     r4, r2
        blt     LDSG3
LDSG5:
        ldmia   sp!, {r4 - r8, pc}


