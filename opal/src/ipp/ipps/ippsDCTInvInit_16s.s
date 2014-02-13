        .text
        .align  4
        .globl  _ippsDCTInvInit_16s


_ippsDCTInvInit_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0xC
        ldr     r9, [sp, #0x2C]
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r10, r2
        mov     r5, r3
        beq     LCST2
        cmp     r4, #0
        ble     LCST1
        cmp     r5, #0
        beq     LCST2
        and     r12, r5, #0x1F
        rsb     r12, r12, #0
        and     r8, r12, #0x1F
        add     r6, r5, r8
        mov     r1, #0x18
        mov     r0, r6
        bl      _ippsZero_8u
        str     r10, [r6, #8]
        mov     r2, #0
        cmp     r4, #1
        str     r4, [r6, #4]
        str     r2, [r6, #0x10]
        mov     r10, #0x14
        bne     LCST0
        str     r10, [r8, +r5]
        str     r2, [r6, #0xC]
        mov     r0, #0
        str     r6, [r7]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCST0:
        add     r0, r6, #0x14
        add     r3, r6, #0x18
        str     r9, [sp]
        mov     r2, #1
        mov     r1, r4
        bl      _ippsDCTInvInit_32f
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r10, pc}
        ldr     r0, [r6, #0x14]
        add     r1, sp, #8
        bl      _ippsDCTInvGetBufSize_32f
        ldr     r2, [sp, #8]
        str     r10, [r8, +r5]
        mov     r0, #0
        add     r4, r2, r4, lsl #2
        str     r4, [r6, #0xC]
        str     r6, [r7]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCST1:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCST2:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}


