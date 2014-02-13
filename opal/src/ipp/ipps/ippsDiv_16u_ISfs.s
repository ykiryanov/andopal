        .text
        .align  4
        .globl  _ippsDiv_16u_ISfs


_ippsDiv_16u_ISfs:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LDAM7
        cmp     r1, #0
        beq     LDAM7
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmn     r3, #0x1F
        mov     r12, #0
        blt     LDAM1
        cmp     r3, #0x10
        bgt     LDAM1
        bl      ownps_Div_16u_ISfs
        cmp     r0, #0
        bne     LDAM0
        mov     r4, #0
        mov     r0, r4
        ldmia   sp!, {r4, r5, pc}
LDAM0:
        mov     r4, #6
        mov     r0, r4
        ldmia   sp!, {r4, r5, pc}
LDAM1:
        cmp     r3, #0
        mov     r3, #0xFF
        orr     r3, r3, #0xFF, 24
        ble     LDAM4
        mov     r4, #0
        mov     lr, r4
LDAM2:
        ldrh    r5, [r0], #2
        cmp     r5, #0
        strneh  r12, [r1]
        bne     LDAM3
        ldrh    r4, [r1]
        cmp     r4, #0
        moveq   r4, #0
        movne   r4, r3
        strh    r4, [r1]
        mov     r4, #6
LDAM3:
        add     lr, lr, #1
        cmp     lr, r2
        add     r1, r1, #2
        blt     LDAM2
        mov     r0, r4
        ldmia   sp!, {r4, r5, pc}
LDAM4:
        mov     r4, #0
        mov     r12, r4
LDAM5:
        ldrh    lr, [r0], #2
        cmp     lr, #0
        strneh  r3, [r1]
        bne     LDAM6
        ldrh    lr, [r1]
        cmp     lr, #0
        moveq   lr, #0
        movne   lr, r3
        strh    lr, [r1]
        mov     r4, #6
LDAM6:
        add     r12, r12, #1
        cmp     r12, r2
        add     r1, r1, #2
        blt     LDAM5
        mov     r0, r4
        ldmia   sp!, {r4, r5, pc}
LDAM7:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


