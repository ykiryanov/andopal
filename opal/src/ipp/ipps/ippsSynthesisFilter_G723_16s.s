        .text
        .align  4
        .globl  _ippsSynthesisFilter_G723_16s


_ippsSynthesisFilter_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        add     r6, sp, #0x30
        add     r12, sp, #8
        and     r6, r6, #0xF
        and     lr, r12, #0xF
        rsb     r6, r6, #0
        mov     r5, r0
        rsb     lr, lr, #0
        and     r11, r6, #0xF
        add     r10, sp, #8
        add     r12, sp, #0x30
        and     r8, lr, #0xF
        cmp     r5, #0
        mov     r0, r1
        mov     r7, r2
        mov     r4, r3
        add     r6, r10, r8
        add     r9, r12, r11
        beq     LDPY0
        cmp     r0, #0
        beq     LDPY0
        cmp     r7, #0
        beq     LDPY0
        cmp     r4, #0
        beq     LDPY0
        mov     r2, #0x3C
        mov     r1, r4
        bl      _ippsCopy_16s
        ldrsh   lr, [r7, #0x12]
        ldrsh   r12, [r5]
        add     r0, sp, #0x30
        strh    lr, [r11, +r0]
        ldrsh   r0, [r5, #2]
        ldrsh   r11, [r5, #4]
        ldrsh   r1, [r5, #6]
        ldrsh   lr, [r5, #8]
        rsb     r0, r0, #0
        strh    r0, [r6, #4]
        ldrsh   r0, [r5, #0xA]
        rsb     r11, r11, #0
        strh    r11, [r6, #6]
        ldrsh   r11, [r5, #0xC]
        rsb     r0, r0, #0
        strh    r0, [r6, #0xC]
        ldrsh   r0, [r7]
        rsb     r11, r11, #0
        strh    r11, [r6, #0xE]
        ldrsh   r11, [r7, #4]
        strh    r0, [r9, #0x12]
        ldrsh   r0, [r7, #2]
        strh    r11, [r9, #0xE]
        ldrsh   r11, [r7, #8]
        strh    r0, [r9, #0x10]
        ldrsh   r0, [r7, #6]
        strh    r11, [r9, #0xA]
        ldrsh   r11, [r7, #0xC]
        rsb     r1, r1, #0
        strh    r1, [r6, #8]
        ldrsh   r1, [r5, #0xE]
        strh    r11, [r9, #6]
        ldrsh   r11, [r7, #0x10]
        rsb     lr, lr, #0
        strh    lr, [r6, #0xA]
        ldrsh   lr, [r5, #0x10]
        ldrsh   r5, [r5, #0x12]
        strh    r0, [r9, #0xC]
        ldrsh   r0, [r7, #0xA]
        strh    r11, [r9, #2]
        mov     r11, #1, 20
        strh    r11, [r8, +r10]
        strh    r0, [r9, #8]
        ldrsh   r0, [r7, #0xE]
        rsb     r1, r1, #0
        rsb     r5, r5, #0
        strh    r5, [r6, #0x14]
        rsb     r12, r12, #0
        strh    r0, [r9, #4]
        strh    r1, [r6, #0x10]
        strh    r12, [r6, #2]
        rsb     lr, lr, #0
        strh    lr, [r6, #0x12]
        str     r9, [sp]
        mov     r1, r4
        mov     r0, r6
        mov     r3, #0xD
        mov     r2, #0x3C
        bl      _ippsSynthesisFilter_NR_16s_ISfs
        ldrsh   r12, [r4, #0x76]
        mov     r0, #0
        strh    r12, [r7]
        ldrsh   r12, [r4, #0x74]
        strh    r12, [r7, #2]
        ldrsh   r12, [r4, #0x72]
        strh    r12, [r7, #4]
        ldrsh   r12, [r4, #0x70]
        strh    r12, [r7, #6]
        ldrsh   r12, [r4, #0x6E]
        strh    r12, [r7, #8]
        ldrsh   r12, [r4, #0x6C]
        strh    r12, [r7, #0xA]
        ldrsh   r12, [r4, #0x6A]
        strh    r12, [r7, #0xC]
        ldrsh   r12, [r4, #0x68]
        strh    r12, [r7, #0xE]
        ldrsh   r12, [r4, #0x66]
        strh    r12, [r7, #0x10]
        ldrsh   r4, [r4, #0x64]
        strh    r4, [r7, #0x12]
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDPY0:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


