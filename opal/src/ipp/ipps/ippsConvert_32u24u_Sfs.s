        .text
        .align  4
        .globl  _ippsConvert_32u24u_Sfs


_ippsConvert_32u24u_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r2
        beq     LCVY9
        cmp     r1, #0
        beq     LCVY9
        cmp     r6, #0
        ble     LCVY8
        cmp     r3, #0
        mvn     r11, #0xFF, 8
        mov     r10, #0
        bne     LCVY3
        cmp     r6, #4
        movlt   r3, r10
        blt     LCVY1
        mov     r3, r10
        sub     r4, r6, #4
        sub     lr, r1, #1
        add     r12, r5, #4
LCVY0:
        ldr     r8, [r12, #-4]
        add     r10, r10, #3
        add     r3, r3, #9
        cmp     r11, r8
        movcc   r8, r11
        strb    r8, [lr, #1]
        mov     r7, r8, lsr #8
        mov     r8, r8, lsr #16
        strb    r8, [lr, #3]
        strb    r7, [lr, #2]
        ldr     r8, [r12]
        cmp     r11, r8
        movcc   r8, r11
        strb    r8, [lr, #4]
        mov     r7, r8, lsr #8
        mov     r8, r8, lsr #16
        strb    r8, [lr, #6]
        strb    r7, [lr, #5]
        ldr     r8, [r12, #4]
        add     r12, r12, #0xC
        cmp     r11, r8
        movcc   r8, r11
        strb    r8, [lr, #7]
        cmp     r10, r4
        mov     r7, r8, lsr #8
        mov     r8, r8, lsr #16
        strb    r7, [lr, #8]
        strb    r8, [lr, #9]!
        ble     LCVY0
LCVY1:
        sub     r3, r3, #1
        add     r1, r3, r1
        add     r5, r5, r10, lsl #2
LCVY2:
        ldr     r3, [r5], #4
        add     r10, r10, #1
        cmp     r11, r3
        movcc   r3, r11
        strb    r3, [r1, #1]
        cmp     r10, r6
        mov     r0, r3, lsr #8
        mov     r3, r3, lsr #16
        strb    r0, [r1, #2]
        strb    r3, [r1, #3]!
        blt     LCVY2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVY3:
        cmp     r3, #0
        ble     LCVY5
        mov     r4, #0x1F
        cmp     r3, #0x1F
        movlt   r4, r3
        sub     r12, r4, #1
        mov     r3, #1
        mov     r12, r3, lsl r12
        cmp     r6, #0
        sub     r8, r12, #1
        ble     LCVY7
        sub     r7, r1, #1
        mov     r1, r4, asr #31
        mov     r9, r8, asr #31
        str     r1, [sp]
LCVY4:
        ldr     lr, [r5], #4
        ldr     r3, [sp]
        adds    r12, r8, lr
        mov     lr, lr, lsr r4
        adc     r1, r9, #0
        and     lr, lr, #1
        adds    r0, r12, lr
        adc     r1, r1, #0
        mov     r2, r4
        bl      __lshrdi3
        cmp     r11, r0
        movcc   r0, r11
        strb    r0, [r7, #1]
        mov     r1, r0, lsr #8
        mov     r0, r0, lsr #16
        add     r10, r10, #1
        strb    r1, [r7, #2]
        strb    r0, [r7, #3]!
        cmp     r10, r6
        blt     LCVY4
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVY5:
        mvn     r12, #0x1E
        cmp     r3, r12
        movgt   r12, r3
        cmp     r6, #0
        rsb     r3, r12, #0
        ble     LCVY7
        sub     r1, r1, #1
LCVY6:
        ldr     r12, [r5], #4
        cmp     r12, r11, asr r3
        movls   r12, r12, lsl r3
        movhi   r12, r11
        mov     lr, r12, lsr #8
        strb    lr, [r1, #2]
        mov     lr, r12, lsr #16
        add     r10, r10, #1
        strb    r12, [r1, #1]
        strb    lr, [r1, #3]!
        cmp     r10, r6
        blt     LCVY6
LCVY7:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCVY8:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LCVY9:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


