        .text
        .align  4
        .globl  _ippsACELPFixedCodebookSearch_G723_16s


_ippsACELPFixedCodebookSearch_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA9, 30
        sub     sp, sp, #1, 22
        add     r12, sp, #0x14
        ldr     r5, [sp, #0x6C8]
        and     r6, r12, #0xF
        ldr     lr, [sp, #0x6CC]
        ldr     r12, [sp, #0x6D0]
        rsb     r6, r6, #0
        add     r4, sp, #0x14
        and     r6, r6, #0xF
        cmp     r0, #0
        add     r4, r4, r6
        beq     LDQF1
        cmp     r1, #0
        beq     LDQF1
        cmp     r2, #0
        beq     LDQF1
        cmp     r3, #0
        beq     LDQF1
        cmp     r5, #0
        beq     LDQF1
        cmp     lr, #0
        beq     LDQF1
        cmp     r12, #0
        beq     LDQF1
        mov     r8, r1
        mov     r7, r4
        mov     r9, #0
        str     r0, [sp, #0x10]
LDQF0:
        ldrsh   r0, [r8], #8
        add     r10, r9, #1
        mov     r0, r0, lsl #15
        mov     r6, r10, lsl #1
        ldrsh   r11, [r1, +r6]
        str     r0, [r7], #0x10
        add     r0, r9, #2
        mov     r11, r11, lsl #15
        str     r11, [r4, +r10, lsl #2]
        add     r6, r9, #3
        mov     r10, r0, lsl #1
        ldrsh   r10, [r1, +r10]
        mov     r11, r6, lsl #1
        ldrsh   r11, [r1, +r11]
        mov     r10, r10, lsl #15
        add     r9, r9, #4
        str     r10, [r4, +r0, lsl #2]
        mov     r11, r11, lsl #15
        cmp     r9, #0x1A, 28
        str     r11, [r4, +r6, lsl #2]
        blt     LDQF0
        ldr     r0, [sp, #0x10]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
        str     r5, [sp]
        mov     r1, r4
        bl      _ippsACELPFixedCodebookSearch_G723_32s16s
        add     sp, sp, #0xA9, 30
        mov     r0, #0
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDQF1:
        add     sp, sp, #0xA9, 30
        mvn     r0, #7
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}


