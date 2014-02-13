        .text
        .align  4
        .globl  _ippsWTHaarInv_16s


_ippsWTHaarInv_16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LAJH3
        cmp     r1, #0
        beq     LAJH3
        cmp     r2, #0
        beq     LAJH3
        cmp     r3, #0
        ble     LAJH4
        sub     r7, r3, #1
        cmp     r7, #0
        mov     r9, #0
        movle   r8, r9
        ble     LAJH1
        mvn     lr, #0xFF
        sub     r12, r9, #2, 18
        bic     lr, lr, #0x7F, 24
        mvn     r12, r12
        mov     r8, r9
        add     r6, r2, #2
        mov     r5, r0
        mov     r4, r2
        str     r0, [sp]
LAJH0:
        ldrsh   r11, [r1], #2
        ldrsh   r10, [r5], #2
        add     r8, r8, #2
        sub     r0, r10, r11
        cmp     r12, r0
        movlt   r0, r12
        cmn     r0, #2, 18
        movlt   r0, lr
        add     r11, r10, r11
        cmp     r12, r11
        movlt   r11, r12
        cmn     r11, #2, 18
        strh    r0, [r4], #4
        movlt   r11, lr
        strh    r11, [r6], #4
        cmp     r8, r7
        add     r9, r9, #1
        blt     LAJH0
        ldr     r0, [sp]
LAJH1:
        tst     r3, #1
        beq     LAJH2
        mov     r9, r9, lsl #1
        ldrsh   r9, [r0, +r9]
        mov     r8, r8, lsl #1
        strh    r9, [r2, +r8]
LAJH2:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAJH3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LAJH4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


