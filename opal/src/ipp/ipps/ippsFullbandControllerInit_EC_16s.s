        .text
        .align  4
        .globl  _ippsFullbandControllerInit_EC_16s


_ippsFullbandControllerInit_EC_16s:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        mov     r6, r1
        mov     r4, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r6, #0
        ble     LDKN1
        cmp     r2, #0
        ble     LDKN1
        cmp     r4, #0x7D, 26
        beq     LDKN0
        cmp     r4, #0xFA, 26
        mvnne   r0, #6
        ldmneia sp!, {r4 - r9, pc}
LDKN0:
        and     r12, r0, #0xF
        rsb     r12, r12, #0
        and     lr, r12, #0xF
        ldr     r12, [pc, #0xB8]
        add     r5, r0, lr
        str     r6, [r5, #0x30]
        smull   r7, r12, r12, r2
        str     r2, [r5, #0x34]
        mov     r2, #0
        str     r2, [lr, +r0]
        add     r0, r6, r6, lsl #2
        str     r2, [r5, #0xC]
        mov     r0, r0, lsl #16
        str     r2, [r5, #4]
        str     r2, [r5, #8]
        str     r2, [r5, #0x10]
        str     r2, [r5, #0x14]
        adds    r7, r7, #0x80
        mov     r1, r4
        adc     r8, r12, #0
        bl      __intel_idiv
        rsb     r0, r0, #1, 18
        rsb     r9, r6, r6, lsl #2
        str     r0, [r5, #0x18]
        add     r6, r6, r9, lsl #3
        mov     r1, r4
        mov     r0, r6, lsl #15
        bl      __intel_idiv
        mov     r1, r0
        rsb     r1, r1, #1, 18
        mov     r0, r6, lsl #16
        str     r1, [r5, #0x20]
        mov     r1, r4
        bl      __intel_idiv
        rsb     r0, r0, #1, 18
        str     r0, [r5, #0x28]
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        mov     r8, r8, lsl #24
        str     r0, [r5, #0x38]
        orr     r1, r8, r7, lsr #8
        mov     r0, #1, 18
        str     r1, [r5, #0x40]
        str     r0, [r5, #0x3C]
        mov     r0, #1, 2
        bl      __intel_idiv
        str     r0, [r5, #0x44]
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDKN1:
        mvn     r0, #4
        ldmia   sp!, {r4 - r9, pc}
        .long   0x0016e360


