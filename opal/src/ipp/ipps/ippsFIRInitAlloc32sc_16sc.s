        .text
        .align  4
        .globl  _ippsFIRInitAlloc32sc_16sc


_ippsFIRInitAlloc32sc_16sc:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x24]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r4, r2
        mov     r5, r3
        beq     LBUF2
        cmp     r6, #0
        beq     LBUF2
        cmp     r4, #0
        ble     LBUF1
        add     r1, sp, #8
        mov     r0, r4
        bl      _ippsFIRGetStateSize32sc_16sc
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r8, pc}
        ldr     r0, [sp, #8]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        bne     LBUF0
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LBUF0:
        str     r0, [sp, #4]
        str     r8, [sp]
        mov     r0, r7
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRInit32sc_16sc
        ldr     r7, [r7]
        mov     r1, #1
        str     r1, [r7, #0x50]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LBUF1:
        mvn     r0, #0x19
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LBUF2:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}


