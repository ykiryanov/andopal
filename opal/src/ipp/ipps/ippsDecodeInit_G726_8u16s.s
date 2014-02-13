        .text
        .align  4
        .globl  _ippsDecodeInit_G726_8u16s


_ippsDecodeInit_G726_8u16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        cmp     r1, #0x11
        beq     LDFL0
        cmp     r1, #0x16
        beq     LDFL0
        cmp     r1, #0x17
        beq     LDFL0
        cmp     r1, #0x18
        mvnne   r0, #6
        ldmneia sp!, {r4, r5, pc}
LDFL0:
        cmp     r2, #0
        beq     LDFL1
        cmp     r2, #1
        beq     LDFL1
        cmp     r2, #2
        mvnne   r0, #6
        ldmneia sp!, {r4, r5, pc}
LDFL1:
        subs    r3, r1, #0x18
        mvn     r1, #0
        mov     r5, #0
        moveq   r3, #3
        beq     LDFL2
        adds    r3, r3, #1
        moveq   r3, #2
        beq     LDFL2
        adds    r3, r3, #1
        moveq   r3, #1
        beq     LDFL2
        adds    r3, r3, #5
        moveq   r3, #0
        movne   r3, r1
LDFL2:
        subs    r2, r2, #2
        strh    r3, [r4, #0x16]
        moveq   r1, #2
        beq     LDFL3
        adds    r2, r2, #1
        moveq   r1, #1
        beq     LDFL3
        adds    r2, r2, #1
        moveq   r1, #0
LDFL3:
        strh    r1, [r4, #0x58]
        add     r0, r4, #0x28
        strh    r5, [r4, #0x1A]
        mov     r1, #8
        bl      _ippsZero_16s
        add     r1, r4, #0x38
        strh    r5, [r4, #0x22]
        strh    r5, [r4, #0x20]
        strh    r5, [r4, #0x14]
        strh    r5, [r4, #0x12]
        mov     r0, #0x20
        mov     r2, #8
        bl      _ippsSet_16s
        add     r0, r4, #0x48
        mov     r1, #8
        bl      _ippsZero_16s
        mov     r1, #0x22, 22
        str     r1, [r4, #0x1C]
        mov     r1, #0x22, 28
        mov     r0, #0
        strh    r5, [r4, #0x24]
        strh    r1, [r4, #0x18]
        ldmia   sp!, {r4, r5, pc}


