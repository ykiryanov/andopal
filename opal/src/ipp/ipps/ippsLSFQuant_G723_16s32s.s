        .text
        .align  4
        .globl  _ippsLSFQuant_G723_16s32s


_ippsLSFQuant_G723_16s32s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x2C
        mov     r12, sp
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        mov     r3, sp
        and     lr, r12, #0xF
        mov     r5, r1
        cmp     r0, #0
        mov     r4, r2
        add     r1, r3, lr
        beq     LDQB0
        cmp     r5, #0
        beq     LDQB0
        cmp     r4, #0
        beq     LDQB0
        ldrsh   r7, [r0]
        ldrsh   r6, [r0, #2]
        ldrsh   r12, [r0, #4]
        strh    r7, [lr, +r3]
        ldrsh   r7, [r0, #6]
        ldrsh   r3, [r0, #8]
        strh    r12, [r1, #4]
        strh    r6, [r1, #2]
        strh    r7, [r1, #6]
        ldrsh   lr, [r0, #0xA]
        ldrsh   r12, [r0, #0xE]
        ldrsh   r6, [r0, #0xC]
        ldrsh   r7, [r0, #0x10]
        ldrsh   r0, [r0, #0x12]
        strh    r3, [r1, #8]
        strh    lr, [r1, #0xA]
        strh    r6, [r1, #0xC]
        strh    r0, [r1, #0x12]
        add     r2, sp, #0x24
        strh    r12, [r1, #0xE]
        strh    r7, [r1, #0x10]
        mov     r0, r5
        bl      _ippsLSFQuant_G723_16s_I
        add     r0, sp, #0x24
        ldrsh   r0, [r0, #2]
        add     r1, sp, #0x24
        ldrsh   r1, [r1]
        add     r3, sp, #0x24
        ldrsh   r3, [r3, #4]
        mov     r0, r0, lsl #8
        orr     r1, r0, r1, lsl #16
        orr     r3, r1, r3
        mov     r0, #0
        str     r3, [r4]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r7, pc}
LDQB0:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r7, pc}


