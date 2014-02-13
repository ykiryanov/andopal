        .text
        .align  4
        .globl  _ipps_cnvrt_32s16s


_ipps_cnvrt_32s16s:
        stmdb   sp!, {r0, r4 - r11, lr}
        mvn     r12, #0xFF
        cmp     r3, #0
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        ble     LCCC4
        cmp     r2, #0
        sub     r5, r3, #1
        mov     r4, #1
        ble     LCCC3
        cmp     r2, #6
        blt     LCCC1
        mvn     r12, r12
        sub     r9, r2, #6
        sub     r8, lr, #2, 18
        mov     r7, r1
        mov     r6, r0
        str     r2, [sp]
LCCC0:
        ldr     r2, [r6], #0x14
        mov     r11, r12
        mov     r10, r12
        add     r2, r2, r4, lsl r5
        mov     r2, r2, asr r3
        cmn     r2, #2, 18
        movlt   r2, r8
        cmp     r2, r12
        movlt   r10, r2
        strh    r10, [r7], #0xA
        add     r2, lr, #1
        ldr     r10, [r0, +r2, lsl #2]
        add     r10, r10, r4, lsl r5
        mov     r2, r2, lsl #1
        mov     r10, r10, asr r3
        cmn     r10, #2, 18
        movlt   r10, r8
        cmp     r10, r12
        movlt   r11, r10
        strh    r11, [r1, +r2]
        add     r2, lr, #2
        ldr     r10, [r0, +r2, lsl #2]
        mov     r2, r2, lsl #1
        mov     r11, r12
        add     r10, r10, r4, lsl r5
        mov     r10, r10, asr r3
        cmn     r10, #2, 18
        movlt   r10, r8
        cmp     r10, r12
        movlt   r11, r10
        strh    r11, [r1, +r2]
        add     r2, lr, #3
        ldr     r10, [r0, +r2, lsl #2]
        mov     r2, r2, lsl #1
        mov     r11, r12
        add     r10, r10, r4, lsl r5
        mov     r10, r10, asr r3
        cmn     r10, #2, 18
        movlt   r10, r8
        cmp     r10, r12
        movlt   r11, r10
        strh    r11, [r1, +r2]
        add     r2, lr, #4
        ldr     r10, [r0, +r2, lsl #2]
        mov     r2, r2, lsl #1
        add     lr, lr, #5
        add     r10, r10, r4, lsl r5
        mov     r10, r10, asr r3
        cmn     r10, #2, 18
        movlt   r10, r8
        cmp     r10, r12
        mov     r11, r12
        movlt   r11, r10
        cmp     lr, r9
        strh    r11, [r1, +r2]
        ble     LCCC0
        ldr     r2, [sp]
LCCC1:
        mvn     r12, #0xFF
        bic     r6, r12, #0x7F, 24
        mov     r12, #0
        mvn     r6, r6
        sub     r12, r12, #2, 18
        add     r1, r1, lr, lsl #1
        add     r0, r0, lr, lsl #2
LCCC2:
        ldr     r7, [r0], #4
        add     lr, lr, #1
        add     r7, r7, r4, lsl r5
        mov     r7, r7, asr r3
        cmn     r7, #2, 18
        movlt   r7, r12
        cmp     r7, r6
        mov     r8, r6
        movlt   r8, r7
        strh    r8, [r1], #2
        cmp     lr, r2
        blt     LCCC2
LCCC3:
        ldmia   sp!, {r0, r4 - r11, pc}
LCCC4:
        cmp     r3, #0
        blt     LCCC8
        cmp     r2, #0
        ble     LCCC3
        cmp     r2, #6
        movlt   r3, lr
        blt     LCCC6
        mov     r3, lr
        sub     r8, r2, #6
        mvn     r7, r12
        sub     r6, lr, #2, 18
        mov     r5, r1
        mov     r4, r0
LCCC5:
        ldr     r10, [r4], #0x14
        mov     r9, r7
        cmn     r10, #2, 18
        movlt   r10, r6
        cmp     r10, r7
        movlt   r9, r10
        strh    r9, [r5], #0xA
        add     r10, r3, #1
        ldr     r9, [r0, +r10, lsl #2]
        mov     r10, r10, lsl #1
        cmn     r9, #2, 18
        movlt   r9, r6
        cmp     r9, r7
        mov     r11, r7
        movlt   r11, r9
        strh    r11, [r1, +r10]
        add     r10, r3, #2
        ldr     r9, [r0, +r10, lsl #2]
        mov     r10, r10, lsl #1
        mov     r11, r7
        cmn     r9, #2, 18
        movlt   r9, r6
        cmp     r9, r7
        movlt   r11, r9
        strh    r11, [r1, +r10]
        add     r10, r3, #3
        ldr     r9, [r0, +r10, lsl #2]
        mov     r10, r10, lsl #1
        mov     r11, r7
        cmn     r9, #2, 18
        movlt   r9, r6
        cmp     r9, r7
        movlt   r11, r9
        strh    r11, [r1, +r10]
        add     r10, r3, #4
        ldr     r9, [r0, +r10, lsl #2]
        mov     r10, r10, lsl #1
        add     r3, r3, #5
        cmn     r9, #2, 18
        movlt   r9, r6
        cmp     r9, r7
        mov     r11, r7
        movlt   r11, r9
        cmp     r3, r8
        strh    r11, [r1, +r10]
        ble     LCCC5
LCCC6:
        mvn     r12, r12
        sub     lr, lr, #2, 18
        add     r1, r1, r3, lsl #1
        add     r0, r0, r3, lsl #2
LCCC7:
        ldr     r5, [r0], #4
        add     r3, r3, #1
        cmn     r5, #2, 18
        movlt   r5, lr
        cmp     r5, r12
        mov     r4, r12
        movlt   r4, r5
        strh    r4, [r1], #2
        cmp     r3, r2
        blt     LCCC7
        ldmia   sp!, {r0, r4 - r11, pc}
LCCC8:
        rsb     r3, r3, #0
        cmp     r3, #0x10
        movge   r4, lr
        sublt   r4, lr, #2, 18
        movlt   r4, r4, asr r3
        cmp     r2, #0
        mvn     r6, r12
        ble     LCCC3
        mov     r5, lr
LCCC9:
        ldr     r7, [r0], #4
        cmp     r7, r6, asr r3
        mvngt   r7, r12
        bgt     LCCC10
        cmp     r7, r4
        movge   r7, r7, lsl r3
        sublt   r7, lr, #2, 18
LCCC10:
        add     r5, r5, #1
        strh    r7, [r1], #2
        cmp     r5, r2
        blt     LCCC9
        ldmia   sp!, {r0, r4 - r11, pc}


