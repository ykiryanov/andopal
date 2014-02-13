        .text
        .align  4
        .globl  _ippsDCTInvGetSize_16s


_ippsDCTInvGetSize_16s:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x18]
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r2
        ble     LCSV2
        cmp     r5, #0
        beq     LCSV1
        cmp     r3, #0
        beq     LCSV1
        cmp     r6, #0
        beq     LCSV1
        cmp     r4, #1
        mov     r1, #0
        beq     LCSV0
        str     r6, [sp]
        mov     r0, r4
        mov     r2, r5
        mov     r1, #1
        bl      _ippsDCTInvGetSize_32f
        cmp     r0, #0
        addne   sp, sp, #8
        ldmneia sp!, {r4 - r6, pc}
        ldr     r1, [r5]
        add     r1, r1, #0x38
        str     r1, [r5]
        ldr     r1, [r6]
        add     r4, r1, r4, lsl #2
        add     r0, r4, #0x20
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCSV0:
        mov     r0, #0x38
        str     r0, [r5]
        str     r1, [r3]
        mov     r0, #0
        str     r1, [r6]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCSV1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}
LCSV2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r6, pc}


