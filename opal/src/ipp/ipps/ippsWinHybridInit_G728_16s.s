        .text
        .align  4
        .globl  _ippsWinHybridInit_G728_16s


_ippsWinHybridInit_G728_16s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r4, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        mov     r7, r3
        beq     LDEN3
        cmp     r8, #0
        beq     LDEN3
        cmp     r12, #3, 20
        strh    r6, [r8, #4]
        strh    r5, [r8, #6]
        strh    r7, [r8, #8]
        moveq   r12, #0xE
        streqh  r12, [r8, #0x10]
        beq     LDEN0
        cmp     r12, #2, 20
        moveq   r12, #0xF
        streqh  r12, [r8, #0x10]
LDEN0:
        cmp     r4, #0
        str     r0, [r8]
        add     r9, r6, r5
        addle   r9, r7, r9
        movle   r0, #0
        ble     LDEN1
        mov     r0, r5
        mov     r1, r4
        bl      __intel_idiv
        strh    r0, [r8, #0xA]
        add     r0, r6, r7
        mov     r1, r4
        bl      __intel_idiv
        strh    r0, [r8, #0xC]
        add     r9, r7, r9
        mov     r0, r9
        mov     r1, r4
        bl      __intel_idiv
LDEN1:
        add     r12, r8, #0x18
        and     lr, r12, #0xF
        rsb     lr, lr, #0
        strh    r0, [r8, #0xE]
        and     lr, lr, #0xF
        add     r0, r12, lr
        str     r0, [r8, #0x14]
        add     r4, r6, #1
        mov     r1, r4
        bl      _ippsZero_16s
        ldr     r12, [r8, #0x14]
        mov     lr, #0x1F
        mov     r4, r4, lsl #1
        strh    lr, [r12, +r4]
        ldr     r12, [r8, #0x14]
        add     lr, r6, #2
        mov     r1, r9
        add     r0, r12, lr, lsl #1
        bl      _ippsZero_16s
        ldrsh   r2, [r8, #0xE]
        cmp     r2, #0
        ble     LDEN2
        ldr     r8, [r8, #0x14]
        add     r7, r7, #2
        add     r6, r5, r6, lsl #1
        add     r7, r6, r7
        mov     r0, #0x10
        add     r1, r8, r7, lsl #1
        bl      _ippsSet_16s
LDEN2:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDEN3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


