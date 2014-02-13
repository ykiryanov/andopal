        .text
        .align  4
        .globl  _ippiRangeMapping_VC1_8u_C1R


_ippiRangeMapping_VC1_8u_C1R:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        beq     LKAG6
        cmp     r2, #0
        beq     LKAG6
        cmp     r12, #0
        blt     LKAG5
        cmp     r12, #7
        bgt     LKAG5
        ldr     r4, [sp, #0x20]
        cmp     r4, #0
        ble     LKAG4
        ldr     lr, [sp, #0x1C]
        add     r12, r12, #9
LKAG0:
        cmp     lr, #0
        ble     LKAG3
        mov     r5, r0
        mov     r7, r2
        mov     r6, lr
LKAG1:
        ldrb    r8, [r5], #1
        sub     r8, r8, #0x80
        mul     r8, r12, r8
        add     r8, r8, #4
        mov     r8, r8, asr #3
        add     r8, r8, #0x80
        bics    r9, r8, #0xFF
        beq     LKAG2
        cmp     r8, #0
        movlt   r8, #0
        movge   r8, #0xFF
LKAG2:
        strb    r8, [r7], #1
        subs    r6, r6, #1
        bne     LKAG1
LKAG3:
        subs    r4, r4, #1
        add     r0, r0, r1
        add     r2, r2, r3
        bne     LKAG0
LKAG4:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LKAG5:
        mvn     r0, #0xA
        ldmia   sp!, {r4 - r9, pc}
LKAG6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


