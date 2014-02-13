        .text
        .align  4
        .globl  _ippsSubCRev_8u_Sfs


_ippsSubCRev_8u_Sfs:
        stmdb   sp!, {r4, r5, lr}
        ldr     r12, [sp, #0xC]
        cmp     r1, #0
        beq     LATP4
        cmp     r12, #8
        bgt     LATP4
        cmp     r0, #0
        beq     LATP9
        cmp     r2, #0
        beq     LATP9
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r12, #0
        mov     lr, #0
        bne     LATP1
        cmp     r3, #0
        ble     LATP3
LATP0:
        ldrb    r12, [r0], #1
        mov     r4, lr
        sub     r12, r1, r12
        cmp     r12, #0
        movgt   r4, r12
        strb    r4, [r2], #1
        subs    r3, r3, #1
        bne     LATP0
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LATP1:
        cmp     r12, #0
        ble     LATP5
        sub     lr, r12, #1
        mov     r4, #1
        mov     lr, r4, lsl lr
        cmp     r3, #0
        sub     lr, lr, #1
        ble     LATP3
LATP2:
        ldrb    r4, [r0], #1
        sub     r4, r1, r4
        cmp     r4, #0
        movle   r4, #0
        mov     r5, r4, asr r12
        and     r5, r5, #1
        add     r4, lr, r4
        add     r5, r4, r5
        mov     r4, r5, asr r12
        strb    r4, [r2], #1
        subs    r3, r3, #1
        bne     LATP2
LATP3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LATP4:
        cmp     r0, #0
        beq     LATP9
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4, r5, lr}
        b       _ippsZero_8u
LATP5:
        cmn     r12, #7
        mov     lr, #0xFF
        bge     LATP7
        cmp     r3, #0
        ble     LATP3
LATP6:
        ldrb    r12, [r0], #1
        cmp     r12, r1
        movge   r12, #0
        movlt   r12, #0xFF
        strb    r12, [r2], #1
        subs    r3, r3, #1
        bne     LATP6
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LATP7:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LATP3
LATP8:
        ldrb    r4, [r0], #1
        sub     r4, r1, r4
        cmp     r4, #0
        movle   r4, #0
        mov     r4, r4, lsl r12
        cmp     r4, #0xFF
        mov     r5, lr
        movlt   r5, r4
        strb    r5, [r2], #1
        subs    r3, r3, #1
        bne     LATP8
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LATP9:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


