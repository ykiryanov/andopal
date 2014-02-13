        .text
        .align  4
        .globl  _ippsConvert_32f16f


_ippsConvert_32f16f:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        beq     LCWP24
        cmp     r1, #0
        beq     LCWP24
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mov     r12, #0xFE, 10
        cmp     r3, #1
        orr     r3, r12, #1, 2
        mov     r12, #0xFF
        orr     r12, r12, #0xF, 24
        mvn     r5, #2, 2
        mov     r4, #0
        sub     lr, r3, #0xE, 6
        beq     LCWP7
LCWP0:
        ldr     r7, [r0], #4
        and     r6, r7, r3
        cmp     lr, r6
        ble     LCWP3
        cmp     r6, #0xE, 6
        ble     LCWP1
        bic     r6, r7, r5
        sub     r7, r7, #0xE, 6
        mov     r6, r6, asr #16
        mov     r7, r7, asr #13
        b       LCWP5
LCWP1:
        cmp     r6, #0x33, 8
        movle   r6, #0
        ble     LCWP2
        mvn     r6, #0xFF, 8
        and     r8, r7, r6
        mov     r6, r7, asr #23
        rsb     r6, r6, #0x7E
        orr     r8, r8, #2, 10
        mov     r6, r8, asr r6
LCWP2:
        bic     r7, r7, r5
        mov     r7, r7, lsr #16
        b       LCWP5
LCWP3:
        cmp     r3, r6
        mov     r6, #0x1F, 22
        beq     LCWP6
LCWP4:
        bic     r7, r7, r5
        mov     r7, r7, lsr #16
LCWP5:
        orr     r6, r7, r6
        add     r4, r4, #1
        strh    r6, [r1], #2
        cmp     r4, r2
        blt     LCWP0
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCWP6:
        mvn     r8, #0xFF, 8
        sub     r8, r8, #2, 10
        tst     r7, r8
        addne   r6, r12, #0x6E, 24
        b       LCWP4
LCWP7:
        mov     r7, #2, 20
LCWP8:
        ldr     r6, [r0], #4
        and     r9, r6, r3
        cmp     r9, #0xCA, 10
        ble     LCWP16
        cmp     r3, r9
        beq     LCWP23
        cmp     r9, #0xE, 6
        ble     LCWP12
        and     r9, r6, #2, 20
        mov     r8, #0xFF
        add     r6, r6, r9, asr #13
        orr     r8, r8, #0xF, 24
        add     r6, r6, r8
        mov     r8, #0xFE, 10
        orr     r9, r8, #1, 2
        and     r8, r6, r9
        sub     r9, r9, #0xE, 6
        cmp     r9, r8
        ble     LCWP11
        cmp     r8, #0xE, 6
        ble     LCWP10
LCWP9:
        bic     r8, r6, r5
        sub     r6, r6, #0xE, 6
        mov     r8, r8, asr #16
        mov     r6, r6, asr #13
        b       LCWP21
LCWP10:
        cmp     r8, #0xCA, 10
        bgt     LCWP15
        b       LCWP17
LCWP11:
        cmp     r3, r8
        bne     LCWP19
        b       LCWP22
LCWP12:
        rsb     r8, r9, #0xE, 6
        mov     r10, #0xFF
        mov     r8, r8, asr #23
        add     r8, r8, #1
        orr     r10, r10, #0xF, 24
        tst     r6, r7, lsl r8
        orr     r10, r10, r12, lsl r8
        bne     LCWP13
        cmp     r8, #0xA
        blt     LCWP14
LCWP13:
        add     r10, r10, #1
LCWP14:
        cmp     lr, r9
        add     r6, r6, r10
        ble     LCWP19
LCWP15:
        mvn     r8, #0xFF, 8
        and     r8, r6, r8
        mov     r9, r6, asr #23
        orr     r8, r8, #2, 10
        rsb     r9, r9, #0x7E
        mov     r8, r8, asr r9
        b       LCWP18
LCWP16:
        cmp     lr, r9
        ble     LCWP19
LCWP17:
        mov     r8, #0
LCWP18:
        bic     r6, r6, r5
        mov     r6, r6, lsr #16
        b       LCWP21
LCWP19:
        mov     r8, #0x1F, 22
LCWP20:
        bic     r6, r6, r5
        mov     r6, r6, lsr #16
LCWP21:
        orr     r8, r6, r8
        add     r4, r4, #1
        strh    r8, [r1], #2
        cmp     r4, r2
        blt     LCWP8
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCWP22:
        mvn     r8, #0xFF, 8
        sub     r8, r8, #2, 10
        tst     r6, r8
        moveq   r8, #0x1F, 22
        beq     LCWP20
        mov     r8, #0xFF
        orr     r8, r8, #0xF, 24
        add     r8, r8, #0x6E, 24
        b       LCWP20
LCWP23:
        cmp     lr, r9
        bgt     LCWP9
        b       LCWP22
LCWP24:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


