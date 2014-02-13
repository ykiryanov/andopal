        .text
        .align  4
        .globl  _ippsDecodeFillElt_AAC


_ippsDecodeFillElt_AAC:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LGFL6
        cmp     r4, #0
        beq     LGFL6
        cmp     r7, #0
        beq     LGFL6
        cmp     r6, #0
        beq     LGFL6
        ldr     r12, [r5]
        cmp     r12, #0
        beq     LGFL6
        ldr     r12, [r4]
        cmp     r12, #0
        blt     LGFL0
        cmp     r12, #7
        ble     LGFL1
LGFL0:
        mvn     r0, #0x94
        ldmia   sp!, {r4 - r9, pc}
LGFL1:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        mov     r8, r0
        cmp     r8, #0xF
        beq     LGFL5
LGFL2:
        cmp     r8, #0
        ble     LGFL4
        mov     r9, #0
LGFL3:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #8
        bl      ownsGetBits_AAC
        add     r9, r9, #1
        add     r6, r6, #1
        cmp     r9, r8
        strb    r0, [r6, #-1]
        blt     LGFL3
LGFL4:
        mov     r0, #0
        str     r8, [r7]
        ldmia   sp!, {r4 - r9, pc}
LGFL5:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #8
        bl      ownsGetBits_AAC
        add     r0, r8, r0
        sub     r8, r0, #1
        b       LGFL2
LGFL6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


