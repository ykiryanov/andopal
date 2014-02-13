        .text
        .align  4
        .globl  _ippsDecodeChanPairElt_AAC


_ippsDecodeChanPairElt_AAC:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r8, [sp, #0x20]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r7, r3
        beq     LGFO8
        cmp     r4, #0
        beq     LGFO8
        cmp     r6, #0
        beq     LGFO8
        cmp     r7, #0
        beq     LGFO8
        ldr     r12, [r5]
        cmp     r12, #0
        beq     LGFO8
        ldr     r12, [r4]
        cmp     r12, #0
        blt     LGFO3
        cmp     r12, #7
        bgt     LGFO3
        cmp     r8, #0
        blt     LGFO0
        cmp     r8, #0x29
        ble     LGFO1
LGFO0:
        mvn     r0, #0xA0
        ldmia   sp!, {r4 - r10, pc}
LGFO1:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r7]
        beq     LGFO2
        mov     r3, r8
        mov     r0, r5
        mov     r2, r6
        mov     r1, r4
        bl      ownsUnpackIcsInfo_AAC
        cmp     r0, #0
        ldmneia sp!, {r4 - r10, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, #2
        bl      ownsGetBits_AAC
        cmp     r0, #1
        str     r0, [r7, #4]
        beq     LGFO4
LGFO2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LGFO3:
        mvn     r0, #0x94
        ldmia   sp!, {r4 - r10, pc}
LGFO4:
        ldr     r10, [r6, #0x4C]
        cmp     r10, #0
        ble     LGFO2
        ldr     r12, [r6, #0xC]
LGFO5:
        cmp     r12, #0
        ble     LGFO7
        mov     r9, #0
        add     r8, r7, #7
LGFO6:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        strb    r0, [r8, #1]!
        ldr     r12, [r6, #0xC]
        add     r9, r9, #1
        cmp     r9, r12
        blt     LGFO6
LGFO7:
        subs    r10, r10, #1
        add     r7, r7, #0x3C
        bne     LGFO5
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LGFO8:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


