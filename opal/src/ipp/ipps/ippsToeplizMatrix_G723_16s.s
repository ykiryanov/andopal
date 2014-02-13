        .text
        .align  4
        .globl  _ippsToeplizMatrix_G723_16s


_ippsToeplizMatrix_G723_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x69, 28
        mov     r2, sp
        and     r2, r2, #0xF
        rsb     r3, r2, #0
        mov     r2, sp
        and     r3, r3, #0xF
        cmp     r0, #0
        mov     r5, r1
        add     r4, r2, r3
        beq     LDPX1
        cmp     r5, #0
        beq     LDPX1
        mov     r1, r4
        bl      _ippsToeplizMatrix_G723_16s32s
        mov     r12, #0
        mov     r3, r5
        mov     r2, r4
LDPX0:
        ldr     r0, [r2], #0x10
        add     r8, r12, #1
        ldr     r9, [r4, +r8, lsl #2]
        mov     r0, r0, asr #15
        add     lr, r12, #2
        ldr     r6, [r4, +lr, lsl #2]
        strh    r0, [r3], #8
        add     r7, r12, #3
        ldr     r0, [r4, +r7, lsl #2]
        mov     r9, r9, asr #15
        mov     r8, r8, lsl #1
        strh    r9, [r5, +r8]
        mov     r6, r6, asr #15
        mov     lr, lr, lsl #1
        add     r12, r12, #4
        strh    r6, [r5, +lr]
        mov     r0, r0, asr #15
        mov     r7, r7, lsl #1
        cmp     r12, #0x1A, 28
        strh    r0, [r5, +r7]
        blt     LDPX0
        mov     r0, #0
        add     sp, sp, #0x69, 28
        ldmia   sp!, {r4 - r9, pc}
LDPX1:
        mvn     r0, #7
        add     sp, sp, #0x69, 28
        ldmia   sp!, {r4 - r9, pc}


