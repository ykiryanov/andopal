        .text
        .align  4
        .globl  _ippsNorm_L2_16s32s_Sfs


_ippsNorm_L2_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LBBY7
        cmp     r5, #0
        beq     LBBY7
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r1, #6
        mov     r6, #0
        blt     LBBY6
        mov     r7, #0
        mov     r2, r7
        mov     r8, r2
        sub     r10, r1, #6
        mov     r9, r0
LBBY0:
        ldrsh   lr, [r9]
        ldrsh   r12, [r9, #2]
        ldrsh   r3, [r9, #6]
        mul     r11, lr, lr
        ldrsh   lr, [r9, #4]
        mul     r12, r12, r12
        mul     r3, r3, r3
        mul     lr, lr, lr
        adds    r7, r7, r11
        ldrsh   r11, [r9, #8]
        adc     r2, r2, #0
        adds    r12, r7, r12
        adc     r2, r2, #0
        mul     r11, r11, r11
        adds    lr, r12, lr
        adc     r2, r2, #0
        adds    r3, lr, r3
        adc     r2, r2, #0
        adds    r7, r3, r11
        add     r8, r8, #5
        adc     r2, r2, #0
        cmp     r8, r10
        add     r9, r9, #0xA
        ble     LBBY0
LBBY1:
        add     r0, r0, r8, lsl #1
LBBY2:
        ldrsh   r12, [r0], #2
        add     r8, r8, #1
        mul     r12, r12, r12
        adds    r7, r7, r12
        adc     r2, r2, #0
        cmp     r8, r1
        blt     LBBY2
        mov     r0, r7
        mov     r1, r2
        bl      __floatdidf
        bl      sqrt
        cmp     r4, #0
        mov     r7, r0
        mov     r8, r1
        mov     r12, #1
        ble     LBBY5
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __divdf3
        mov     r7, r0
        mov     r8, r1
LBBY3:
        mov     r0, r7
        mvn     r12, #0xE2, 12
        bic     r3, r12, #0xB, 4
        sub     r2, r6, #1, 10
        mov     r1, r8
        bl      __gtdf2
        cmp     r0, #0
        mvngt   r0, #2, 2
        bgt     LBBY4
        mov     r0, r7
        mov     r1, r8
        bl      __fixdfsi
LBBY4:
        str     r0, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBBY5:
        cmp     r4, #0
        bge     LBBY3
        rsb     r4, r4, #0
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        b       LBBY3
LBBY6:
        mov     r7, #0
        mov     r2, r7
        mov     r8, r2
        b       LBBY1
LBBY7:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


