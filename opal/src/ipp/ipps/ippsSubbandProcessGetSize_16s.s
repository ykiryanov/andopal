        .text
        .align  4
        .globl  _ippsSubbandProcessGetSize_16s


_ippsSubbandProcessGetSize_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0xC
        ldr     r7, [sp, #0x20]
        cmp     r0, #0
        mov     r4, r1
        mov     r5, r2
        ble     LDKC1
        cmp     r4, #0
        ble     LDKC1
        cmp     r5, #0
        beq     LDKC3
        cmp     r3, #0
        beq     LDKC3
        cmp     r7, #0
        beq     LDKC3
        mov     r12, #1
        mov     r6, r12, lsl r0
        sub     r12, r6, #1
        tst     r4, r12
        beq     LDKC0
        mvn     r0, #4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}
LDKC0:
        add     r1, sp, #8
        str     r3, [sp]
        mov     r3, r1
        str     r7, [sp, #4]
        mov     r2, #0
        mov     r1, #2
        bl      _ippsFFTGetSize_R_16s32s
        cmp     r0, #0
        beq     LDKC2
LDKC1:
        mvn     r0, #4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}
LDKC2:
        ldr     r3, [r7]
        ldr     r0, [sp, #8]
        mov     r4, r4, lsl #1
        add     r4, r4, #0x18
        add     r6, r3, r6, lsl #2
        add     r4, r0, r4
        add     r6, r6, #0x10
        str     r6, [r7]
        add     r4, r4, #0x10
        mov     r0, #0
        str     r4, [r5]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}
LDKC3:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}


