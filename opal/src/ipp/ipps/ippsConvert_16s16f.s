        .text
        .align  4
        .globl  _ippsConvert_16s16f


_ippsConvert_16s16f:
        stmdb   sp!, {r1, r4 - r8, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LCWS5
        cmp     r6, #0
        beq     LCWS5
        cmp     r5, #0
        ble     LCWS6
        cmp     r3, #1
        mov     r3, #0xFF
        orr     r7, r3, #3, 24
        beq     LCWS2
        mov     r8, #0
LCWS0:
        ldrsh   r0, [r4], #2
        bl      __floatsisf
        cmp     r0, #0
        str     r0, [sp]
        moveq   r0, #0
        beq     LCWS1
        mov     r3, r0, asr #23
        and     r12, r3, #0xFF
        sub     r12, r12, #0x70
        and     r3, r3, #2, 18
        and     r0, r7, r0, asr #13
        orr     r12, r3, r12, lsl #10
        orr     r0, r12, r0
LCWS1:
        add     r8, r8, #1
        strh    r0, [r6], #2
        cmp     r8, r5
        blt     LCWS0
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r8, pc}
LCWS2:
        mov     r8, #0
LCWS3:
        ldrsh   r0, [r4], #2
        bl      __floatsisf
        cmp     r0, #0
        str     r0, [sp]
        moveq   r0, #0
        beq     LCWS4
        mov     r3, r0, asr #13
        add     r12, r7, #3, 22
        and     r3, r3, #1
        add     r12, r3, r12
        add     r0, r12, r0
        mov     r3, r0, asr #23
        and     r12, r3, #0xFF
        sub     r12, r12, #0x70
        and     r3, r3, #2, 18
        and     r0, r7, r0, asr #13
        orr     r12, r3, r12, lsl #10
        orr     r0, r12, r0
LCWS4:
        add     r8, r8, #1
        strh    r0, [r6], #2
        cmp     r8, r5
        blt     LCWS3
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r8, pc}
LCWS5:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r8, pc}
LCWS6:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r8, pc}


