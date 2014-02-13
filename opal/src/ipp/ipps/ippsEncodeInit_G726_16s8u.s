        .text
        .align  4
        .globl  _ippsEncodeInit_G726_16s8u


_ippsEncodeInit_G726_16s8u:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r0
        cmp     r4, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, r5, pc}
        cmp     r1, #0x11
        beq     LDFI0
        cmp     r1, #0x16
        beq     LDFI0
        cmp     r1, #0x17
        beq     LDFI0
        cmp     r1, #0x18
        mvnne   r0, #6
        ldmneia sp!, {r4, r5, pc}
LDFI0:
        subs    r1, r1, #0x18
        mov     r5, #0
        moveq   r1, #3
        beq     LDFI1
        adds    r1, r1, #1
        moveq   r1, #2
        beq     LDFI1
        adds    r1, r1, #1
        moveq   r1, #1
        beq     LDFI1
        adds    r1, r1, #5
        moveq   r1, #0
        mvnne   r1, #0
LDFI1:
        strh    r1, [r4, #0x16]
        add     r0, r4, #0x28
        strh    r5, [r4, #0x1A]
        mov     r1, #8
        bl      _ippsZero_16s
        add     r1, r4, #0x38
        strh    r5, [r4, #0x22]
        strh    r5, [r4, #0x20]
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
        strh    r5, [r4, #0x14]
        strh    r5, [r4, #0x12]
        strh    r5, [r4, #0x24]
        strh    r1, [r4, #0x18]
        ldmia   sp!, {r4, r5, pc}


