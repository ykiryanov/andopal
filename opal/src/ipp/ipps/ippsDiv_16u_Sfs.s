        .text
        .align  4
        .globl  _ippsDiv_16u_Sfs


_ippsDiv_16u_Sfs:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x18]
        cmp     r0, #0
        beq     LDAL7
        cmp     r1, #0
        beq     LDAL7
        cmp     r2, #0
        beq     LDAL7
        cmp     r3, #0
        ble     LDAL8
        cmn     r12, #0x1F
        mov     lr, #0
        blt     LDAL1
        cmp     r12, #0x10
        bgt     LDAL1
        str     r12, [sp]
        bl      ownps_Div_16u_Sfs
        cmp     r0, #0
        bne     LDAL0
        mov     r4, #0
        mov     r0, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LDAL0:
        mov     r4, #6
        mov     r0, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LDAL1:
        cmp     r12, #0
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        ble     LDAL4
        mov     r4, #0
        mov     r5, r4
LDAL2:
        ldrh    r6, [r0], #2
        cmp     r6, #0
        strneh  lr, [r2]
        bne     LDAL3
        ldrh    r4, [r1]
        cmp     r4, #0
        moveq   r4, #0
        movne   r4, r12
        strh    r4, [r2]
        mov     r4, #6
LDAL3:
        add     r5, r5, #1
        cmp     r5, r3
        add     r1, r1, #2
        add     r2, r2, #2
        blt     LDAL2
        mov     r0, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LDAL4:
        mov     r4, #0
        mov     lr, r4
LDAL5:
        ldrh    r5, [r0], #2
        cmp     r5, #0
        strneh  r12, [r2]
        bne     LDAL6
        ldrh    r4, [r1]
        cmp     r4, #0
        moveq   r4, #0
        movne   r4, r12
        strh    r4, [r2]
        mov     r4, #6
LDAL6:
        add     lr, lr, #1
        cmp     lr, r3
        add     r1, r1, #2
        add     r2, r2, #2
        blt     LDAL5
        mov     r0, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LDAL7:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LDAL8:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}


