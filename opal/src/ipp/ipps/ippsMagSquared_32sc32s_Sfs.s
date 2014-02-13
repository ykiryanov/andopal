        .text
        .align  4
        .globl  _ippsMagSquared_32sc32s_Sfs


_ippsMagSquared_32sc32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        mov     r9, r3
        beq     LBIJ13
        cmp     r4, #0
        beq     LBIJ13
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r9, #0x3F
        bgt     LBIJ12
        cmn     r9, #0x1F
        mvn     r8, #2, 2
        mov     r7, #0
        bgt     LBIJ4
        cmp     r5, #0
        ble     LBIJ3
LBIJ0:
        ldr     r3, [r6]
        cmp     r3, #0
        bne     LBIJ1
        ldr     r3, [r6, #4]
        cmp     r3, #0
        streq   r7, [r4]
        beq     LBIJ2
LBIJ1:
        str     r8, [r4]
LBIJ2:
        subs    r5, r5, #1
        add     r6, r6, #8
        add     r4, r4, #4
        bne     LBIJ0
LBIJ3:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBIJ4:
        cmp     r9, #0
        bne     LBIJ6
        cmp     r5, #0
        ble     LBIJ11
LBIJ5:
        ldr     r3, [r6, #4]
        ldr     lr, [r6], #8
        smull   r12, r3, r3, r3
        smull   r9, lr, lr, lr
        adds    r12, r9, r12
        adc     r3, lr, r3
        cmp     r3, #0
        cmpeq   r12, r8
        movhi   r12, r8
        add     r7, r7, #1
        str     r12, [r4], #4
        cmp     r7, r5
        blt     LBIJ5
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBIJ6:
        cmp     r9, #0
        ble     LBIJ8
        cmp     r5, #0
        ble     LBIJ11
LBIJ7:
        ldr     r12, [r6, #4]
        ldr     r10, [r6], #8
        smull   lr, r12, r12, r12
        mov     r2, r9
        smull   r11, r10, r10, r10
        mov     r3, #0
        adds    r0, r11, lr
        adc     r1, r10, r12
        bl      __lshrdi3
        cmp     r1, #0
        cmpeq   r0, r8
        movhi   r0, r8
        add     r7, r7, #1
        str     r0, [r4], #4
        cmp     r7, r5
        blt     LBIJ7
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBIJ8:
        cmp     r5, #0
        rsb     r9, r9, #0
        ble     LBIJ11
LBIJ9:
        ldr     r3, [r6, #4]
        ldr     lr, [r6], #8
        smull   r12, r3, r3, r3
        smull   r10, lr, lr, lr
        adds    r0, r10, r12
        adc     r1, lr, r3
        cmp     r1, #0
        cmpeq   r0, r8
        strhi   r8, [r4]
        bhi     LBIJ10
        mov     r2, r9
        mov     r3, #0
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r8
        strls   r0, [r4]
        strhi   r8, [r4]
LBIJ10:
        add     r7, r7, #1
        cmp     r7, r5
        add     r4, r4, #4
        blt     LBIJ9
LBIJ11:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBIJ12:
        mov     r0, r4
        mov     r1, r5
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LBIJ13:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


