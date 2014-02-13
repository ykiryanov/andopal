        .text
        .align  4
        .globl  _ippsTiltCompensation_G729E_16s


_ippsTiltCompensation_G729E_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        mov     r5, r1
        cmp     r5, #0
        mov     r4, r2
        beq     LDTS4
        cmp     r4, #0
        beq     LDTS4
        cmp     r0, #0
        ble     LDTS3
        mov     r3, #0x9A
        orr     r3, r3, #0x19, 24
        mul     r0, r0, r3
        mov     r3, #0xF
        mov     r7, #1, 18
LDTS0:
        add     r12, r0, #1, 18
        mov     lr, #0xFF
        mov     r12, r12, asr #15
        orr     r1, lr, #0x7F, 24
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mov     r6, r12
        cmp     r6, #0
        beq     LDTS2
        cmp     r6, #0
        bge     LDTS1
        cmn     r6, #2, 18
        moveq   r12, r1
        beq     LDTS1
        rsb     r12, r6, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDTS1:
        rsb     r12, r12, #2, 18
        mov     r12, r12, lsl #16
        mov     r1, r12, asr #16
LDTS2:
        mov     r0, r7, lsl #15
        str     r3, [sp]
        bl      __intel_idiv
        str     r7, [sp, #4]
        mov     r0, r0, lsl #16
        mov     r2, r6, asr #1
        mov     r3, r0, asr #16
        mov     r0, r5
        mov     r1, r4
        bl      ownTiltCompensateFilter_G729_16s
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LDTS3:
        mov     r3, #0x33
        orr     r3, r3, #0x73, 24
        mul     r0, r0, r3
        mov     r3, #0xC
        mov     r7, #2, 22
        b       LDTS0
LDTS4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}


