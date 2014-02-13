        .text
        .align  4
        .globl  _ippsWinBartlett_64fc_I


_ippsWinBartlett_64fc_I:
        stmdb   sp!, {r4 - r10, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r8, #3
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r10, pc}
        sub     r7, r8, #1
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        mov     r4, #0
        add     r2, r9, r8, lsl #4
        cmp     r8, #3
        mov     r6, r0
        mov     r5, r1
        str     r4, [r9, #4]
        str     r4, [r9]
        str     r4, [r9, #0xC]
        str     r4, [r9, #8]
        sub     r12, r2, #0x10
        beq     LALA3
        cmp     r7, #0
        mov     lr, r4
        mov     r7, #1
        movlt   lr, r7
        add     lr, r8, lr
        sub     lr, lr, #1
        str     r4, [r2, #-8]
        mov     lr, lr, asr #1
        cmp     lr, #1
        str     r4, [r2, #-4]
        str     r4, [r2, #-0x10]
        str     r4, [r2, #-0xC]
        add     r8, r9, #0x10
        sub     r7, r12, #0x10
        movle   r9, r4
        ble     LALA1
        sub     r10, lr, #1
        mov     r9, r4
LALA0:
        mov     r2, r9
        mov     r3, r4
        mov     r0, r6
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r9, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, r9
        mov     r1, r4
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r0, r9
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, r9
        mov     r1, r4
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        subs    r10, r10, #1
        add     r8, r8, #0x10
        sub     r7, r7, #0x10
        bne     LALA0
LALA1:
        cmp     r8, r7
        beq     LALA2
        mov     r0, r6
        mov     r1, r5
        mov     r2, r9
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
LALA2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LALA3:
        mov     r0, #0
        str     r4, [r2, #-8]
        str     r4, [r2, #-4]
        str     r4, [r2, #-0x10]
        str     r4, [r2, #-0xC]
        ldmia   sp!, {r4 - r10, pc}


