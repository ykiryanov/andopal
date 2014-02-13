        .text
        .align  4
        .globl  _ippsHighPassFilter_Direct_AMRWB_16s


_ippsHighPassFilter_Direct_AMRWB_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r1, #0
        beq     LDJI9
        cmp     r0, #0
        beq     LDJI9
        cmp     r2, #0
        beq     LDJI9
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        ldr     lr, [pc, #0x184]
        cmp     r12, #0
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        beq     LDJI2
        cmp     r3, #0
        ble     LDJI8
        mov     r6, #0
        add     r4, r1, #2
        sub     r5, r1, #2
LDJI0:
        ldrsh   r8, [r1], #2
        ldrsh   r9, [r0]
        ldrsh   r7, [r0, #2]
        mul     r8, r9, r8
        ldrsh   r9, [r4], #2
        rsb     r7, r7, #0
        mla     r8, r7, r9, r8
        ldrsh   r9, [r5], #2
        mla     r8, r7, r9, r8
        mov     r7, r8, lsl #1
        cmp     lr, r7
        movle   r7, r12
        ble     LDJI1
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
LDJI1:
        add     r6, r6, #1
        strh    r7, [r2], #2
        cmp     r6, r3
        blt     LDJI0
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDJI2:
        ldrsh   r6, [r1, #2]
        ldrsh   r5, [r0, #2]
        ldrsh   r4, [r1]
        mul     r6, r5, r6
        rsb     r4, r6, r4, lsl #15
        mov     r4, r4, lsl #1
        cmp     lr, r4
        ble     LDJI3
        add     r4, r4, #2, 18
        mov     r4, r4, asr #16
        mov     r4, r4, lsl #16
        mov     r12, r4, asr #16
LDJI3:
        sub     r4, r3, #1
        cmp     r4, #1
        strh    r12, [r2]
        suble   r12, r1, #2
        ble     LDJI6
        sub     r12, r1, #2
        sub     r4, r4, #1
        add     r7, r1, #2
        add     r8, r1, #4
        add     r9, r12, #2
        add     r10, r2, #2
LDJI4:
        ldrsh   r6, [r7], #2
        ldrsh   r5, [r0, #2]
        ldrsh   r11, [r8], #2
        mov     r6, r6, lsl #15
        rsb     r5, r5, #0
        mla     r6, r5, r11, r6
        ldrsh   r11, [r9], #2
        mla     r6, r5, r11, r6
        mov     r5, r6, lsl #1
        cmp     lr, r5
        movle   r5, #0xFF
        orrle   r5, r5, #0x7F, 24
        ble     LDJI5
        add     r5, r5, #2, 18
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDJI5:
        strh    r5, [r10], #2
        subs    r4, r4, #1
        bne     LDJI4
LDJI6:
        sub     r1, r1, #4
        mov     r3, r3, lsl #1
        ldrsh   r1, [r1, +r3]
        ldrsh   lr, [r0, #2]
        ldrsh   r12, [r12, +r3]
        ldr     r0, [pc, #0x40]
        mul     r1, lr, r1
        rsb     r12, r1, r12, lsl #15
        mov     r1, r12, lsl #1
        cmp     r0, r1
        movle   r0, #0xFF
        orrle   r0, r0, #0x7F, 24
        ble     LDJI7
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
LDJI7:
        sub     r2, r2, #2
        strh    r0, [r2, +r3]
LDJI8:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDJI9:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   0x7fff8000


