        .text
        .align  4
        .globl  _ippsDecodeDatStrElt_AAC


_ippsDecodeDatStrElt_AAC:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r8, [sp, #0x1C]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r7, r3
        beq     LGFN7
        cmp     r4, #0
        beq     LGFN7
        cmp     r6, #0
        beq     LGFN7
        cmp     r7, #0
        beq     LGFN7
        cmp     r8, #0
        beq     LGFN7
        ldr     r12, [r5]
        cmp     r12, #0
        beq     LGFN7
        ldr     r12, [r4]
        cmp     r12, #0
        blt     LGFN0
        cmp     r12, #7
        ble     LGFN1
LGFN0:
        mvn     r0, #0x94
        ldmia   sp!, {r4 - r9, pc}
LGFN1:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r6]
        mov     r0, r5
        mov     r2, #1
        mov     r1, r4
        bl      ownsGetBits_AAC
        mov     r9, r0
        mov     r0, r5
        mov     r2, #8
        mov     r1, r4
        bl      ownsGetBits_AAC
        mov     r6, r0
        cmp     r6, #0xFF
        beq     LGFN6
LGFN2:
        cmp     r9, #0
        beq     LGFN3
        mov     r1, r4
        mov     r0, r5
        bl      ownsByteAlign_AAC
LGFN3:
        cmp     r6, #0
        ble     LGFN5
        mov     r9, #0
LGFN4:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #8
        bl      ownsGetBits_AAC
        add     r9, r9, #1
        add     r8, r8, #1
        cmp     r9, r6
        strb    r0, [r8, #-1]
        blt     LGFN4
LGFN5:
        mov     r0, #0
        str     r6, [r7]
        ldmia   sp!, {r4 - r9, pc}
LGFN6:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #8
        bl      ownsGetBits_AAC
        add     r6, r6, r0
        b       LGFN2
LGFN7:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


