        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729_32s16s


_ippsFixedCodebookSearch_G729_32s16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #8
        ldr     r9, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r7, r3
        beq     LDVG1
        cmp     r4, #0
        beq     LDVG1
        cmp     r6, #0
        beq     LDVG1
        cmp     r9, #0
        beq     LDVG1
        cmp     r7, #0
        beq     LDVG1
        cmp     r8, #0
        blt     LDVG0
        mov     r1, r4
        mov     r0, #0xF
        mov     r2, #0x9A, 30
        bl      _ippsRShiftC_32s_I
        str     r7, [sp, #4]
        str     r9, [sp]
        mov     r0, r5
        mov     r3, r8
        mov     r2, r6
        mov     r1, r4
        bl      ownFixedCodebookSearch_G729_32s16s
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}
LDVG0:
        mvn     r0, #6
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}
LDVG1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}


