        .text
        .align  4
        .globl  ownGmed_n


ownGmed_n:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     lr, sp
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        add     r3, sp, #0x24
        mov     r12, sp
        and     lr, lr, #0xF
        mov     r4, r1
        mov     r5, r0
        add     r6, r12, lr
        and     r3, r3, #0xF
        mov     r2, r4
        mov     r1, r6
        rsb     r8, r3, #0
        add     r7, sp, #0x24
        bl      _ippsCopy_16s
        and     r8, r8, #0xF
        cmp     r4, #0
        add     r7, r7, r8
        ble     LDNB3
        mvn     r3, #0xFE
        bic     r3, r3, #0x7F, 24
        mov     r9, #0
        sub     r8, r3, #1
        mov     lr, r7
        mov     r12, r4
LDNB0:
        cmp     r4, #0
        ble     LDNB2
        mov     r0, r3
        mov     r11, #0
        mov     r10, r6
LDNB1:
        ldrsh   r1, [r10], #2
        cmp     r1, r0
        movge   r0, r1
        movge   r9, r11
        add     r11, r11, #1
        cmp     r11, r4
        blt     LDNB1
LDNB2:
        mov     r10, r9, lsl #16
        strh    r9, [lr], #2
        mov     r10, r10, asr #15
        subs    r12, r12, #1
        strh    r8, [r6, +r10]
        bne     LDNB0
LDNB3:
        bic     r4, r4, #1
        ldrsh   r4, [r7, +r4]
        mov     r1, r4, lsl #1
        ldrsh   r0, [r5, +r1]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


