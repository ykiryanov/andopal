        .text
        .align  4
        .globl  _ippsWTHaarFwd_16s


_ippsWTHaarFwd_16s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LAJR3
        cmp     r2, #0
        beq     LAJR3
        cmp     r3, #0
        beq     LAJR3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        sub     r6, r1, #1
        cmp     r6, #0
        mov     r8, #0
        movle   r7, r8
        ble     LAJR1
        mov     r7, r8
        add     r4, r0, #2
        mov     r5, r2
        mov     lr, r0
LAJR0:
        ldrsh   r9, [r4], #4
        ldrsh   r12, [lr], #4
        sub     r10, r9, r12
        and     r9, r10, #1
        and     r11, r9, r10, asr #1
        add     r12, r12, r10, asr #1
        add     r10, r11, r10, asr #1
        and     r9, r9, r12
        cmp     r10, #2, 18
        add     r9, r12, r9
        moveq   r12, #0xFF
        orreq   r10, r12, #0x7F, 24
        strh    r9, [r5], #2
        add     r8, r8, #2
        strh    r10, [r3], #2
        cmp     r8, r6
        add     r7, r7, #1
        blt     LAJR0
LAJR1:
        tst     r1, #1
        beq     LAJR2
        mov     r8, r8, lsl #1
        ldrsh   r8, [r0, +r8]
        mov     r7, r7, lsl #1
        strh    r8, [r2, +r7]
LAJR2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAJR3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


