        .text
        .align  4
        .globl  _ippsDecodeAdaptiveVector_G723_16s


_ippsDecodeAdaptiveVector_G723_16s:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0x90
        mov     r12, sp
        ldr     r6, [sp, #0xA8]
        and     r4, r12, #0xF
        ldr     r12, [sp, #0xAC]
        rsb     r4, r4, #0
        and     r4, r4, #0xF
        mov     lr, sp
        cmp     r3, #0
        add     r4, lr, r4
        mov     r5, r2
        beq     LDQD3
        cmp     r6, #0
        beq     LDQD3
        cmp     r1, #0
        blt     LDQD1
        cmp     r1, #3
        bgt     LDQD1
        cmp     r0, #0x12
        blt     LDQD1
        add     lr, r0, r1
        cmp     lr, #0x92
        bgt     LDQD1
        cmp     r5, #0
        blt     LDQD1
        cmp     r5, #0xAA
        bge     LDQD1
        cmp     r12, #2
        beq     LDQD0
        cmp     r12, #4
        beq     LDQD0
        mvn     r0, #6
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r8, pc}
LDQD0:
        ldr     r8, [pc, #0x64]
        cmp     r12, #4
        ldr     r7, [r8, #4]
        bne     LDQD2
        cmp     r0, #0x3A
        bge     LDQD2
        ldr     r7, [r8]
        cmp     r5, #0x55
        ble     LDQD2
LDQD1:
        mvn     r0, #0xA
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r8, pc}
LDQD2:
        sub     r2, lr, #1
        mov     r0, r3
        mov     r1, r4
        bl      _ippsExcitationDelay_G723_16s
        add     r5, r5, r5, lsl #2
        mov     r2, r6
        add     r0, r7, r5, lsl #3
        mov     r1, r4
        bl      _ippsAdaptiveCodebookDecode_G723_16s
        mov     r0, #0
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r8, pc}
LDQD3:
        mvn     r0, #7
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r8, pc}
        .long   AdCdbkGainTbl_G723


