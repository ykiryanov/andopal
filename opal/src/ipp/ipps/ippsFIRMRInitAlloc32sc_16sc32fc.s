        .text
        .align  4
        .globl  _ippsFIRMRInitAlloc32sc_16sc32fc


_ippsFIRMRInitAlloc32sc_16sc32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r11, [sp, #0x40]
        ldr     r9, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r8, [sp, #0x4C]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r4, r2
        mov     r5, r3
        beq     LBTS6
        cmp     r6, #0
        beq     LBTS6
        cmp     r4, #0
        ble     LBTS5
        cmp     r5, #1
        blt     LBTS3
        cmp     r11, #0
        blt     LBTS2
        cmp     r5, r11
        ble     LBTS2
        cmp     r9, #1
        blt     LBTS3
        cmp     r10, #0
        blt     LBTS2
        cmp     r9, r10
        ble     LBTS2
        cmp     r5, #1
        bne     LBTS0
        cmp     r9, #1
        beq     LBTS4
LBTS0:
        add     r3, sp, #0x18
        mov     r0, r4
        mov     r2, r9
        mov     r1, r5
        bl      _ippsFIRMRGetStateSize32sc_16sc32fc
        cmp     r0, #0
        addne   sp, sp, #0x1C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x18]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        bne     LBTS1
        mvn     r0, #8
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBTS1:
        str     r0, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r10, [sp, #8]
        str     r9, [sp, #4]
        str     r11, [sp]
        mov     r0, r7
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRMRInit32sc_16sc32fc
        ldr     r7, [r7]
        mov     r1, #1
        str     r1, [r7, #0x50]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBTS2:
        mvn     r0, #0x1B
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBTS3:
        mvn     r0, #0x1C
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBTS4:
        mov     r0, r7
        mov     r3, r8
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRInitAlloc32sc_16sc32fc
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBTS5:
        mvn     r0, #0x19
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBTS6:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


