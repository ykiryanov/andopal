        .text
        .align  4
        .globl  _ippsSubbandAnalysis_32f32fc


_ippsSubbandAnalysis_32f32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r6, r0
        cmp     r6, #0
        mov     r10, r1
        beq     LDLH20
        cmp     r10, #0
        beq     LDLH20
        cmp     r2, #0
        beq     LDLH20
        cmp     r3, #0
        beq     LDLH20
        and     r12, r2, #0xF
        rsb     r12, r12, #0
        and     lr, r12, #0xF
        add     r12, r2, lr
        str     r12, [sp, #0x1C]
        ldr     r1, [lr, +r2]
        ldr     r9, [r12, #8]
        and     r2, r3, #0xF
        ldr     r5, [r12, #4]
        rsb     r2, r2, #0
        ldr     r0, [r12, #0xC]
        ldr     r4, [r12, #0x10]
        and     r2, r2, #0xF
        add     r2, r3, r2
        sub     r8, r1, r9
        add     r3, r2, r5, lsl #2
        cmp     r8, #0
        str     r3, [sp, #0x18]
        ble     LDLH3
        cmp     r8, #6
        movlt   r11, #0
        addlt   r7, r0, r9, lsl #2
        blt     LDLH1
        add     r7, r0, r9, lsl #2
        mov     r11, #0
        sub     lr, r8, #6
        add     r12, r7, #4
        add     r3, r0, #4
        str     r6, [sp]
LDLH0:
        ldr     r6, [r12, #-4]
        add     r11, r11, #5
        cmp     r11, lr
        str     r6, [r3, #-4]
        ldr     r6, [r12]
        str     r6, [r3]
        ldr     r6, [r12, #4]
        str     r6, [r3, #4]
        ldr     r6, [r12, #8]
        str     r6, [r3, #8]
        ldr     r6, [r12, #0xC]
        add     r12, r12, #0x14
        str     r6, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LDLH0
        ldr     r6, [sp]
LDLH1:
        add     r12, r0, r11, lsl #2
LDLH2:
        ldr     r3, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r3, [r12], #4
        blt     LDLH2
LDLH3:
        cmp     r9, #0
        ble     LDLH7
        cmp     r9, #6
        rsb     r3, r9, #0
        addlt   r3, r0, r3, lsl #2
        movlt   r8, #0
        blt     LDLH5
        add     r3, r0, r3, lsl #2
        mov     r8, #0
        sub     r7, r9, #6
        mov     lr, r1
        add     r12, r6, #4
        str     r1, [sp, #0xC]
        str     r2, [sp, #8]
        str     r10, [sp, #4]
        str     r6, [sp]
LDLH4:
        ldr     r1, [r12, #-4]
        mov     r11, lr, lsl #2
        add     r6, r11, #4
        str     r1, [r3, +lr, lsl #2]
        ldr     r10, [r12]
        add     r1, r11, #8
        add     r2, r11, #0xC
        str     r10, [r3, +r6]
        ldr     r6, [r12, #4]
        add     r11, r11, #0x10
        add     lr, lr, #5
        str     r6, [r3, +r1]
        ldr     r1, [r12, #8]
        add     r8, r8, #5
        cmp     r8, r7
        str     r1, [r3, +r2]
        ldr     r1, [r12, #0xC]
        add     r12, r12, #0x14
        str     r1, [r3, +r11]
        ble     LDLH4
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r6, [sp]
LDLH5:
        add     r6, r6, r8, lsl #2
        add     r12, r8, r1
LDLH6:
        ldr     lr, [r6], #4
        add     r8, r8, #1
        cmp     r8, r9
        str     lr, [r3, +r12, lsl #2]
        add     r12, r12, #1
        blt     LDLH6
LDLH7:
        cmp     r5, #0
        ble     LDLH19
        cmp     r5, #6
        movlt   r6, #0
        blt     LDLH9
        str     r10, [sp, #4]
        mov     r6, #0
        sub     r11, r5, #6
        add     r9, r0, #4
        add     r8, r4, #4
        add     r7, r2, #4
        str     r1, [sp, #0xC]
        str     r2, [sp, #8]
        mov     r10, r0
LDLH8:
        ldr     r1, [r8, #-4]
        ldr     r0, [r9, #-4]
        add     r6, r6, #5
        bl      __mulsf3
        str     r0, [r7, #-4]
        ldr     r0, [r9]
        ldr     r1, [r8]
        bl      __mulsf3
        str     r0, [r7]
        ldr     r0, [r9, #4]
        ldr     r1, [r8, #4]
        bl      __mulsf3
        str     r0, [r7, #4]
        ldr     r0, [r9, #8]
        ldr     r1, [r8, #8]
        bl      __mulsf3
        str     r0, [r7, #8]
        ldr     r0, [r9, #0xC]
        ldr     r1, [r8, #0xC]
        add     r9, r9, #0x14
        add     r8, r8, #0x14
        bl      __mulsf3
        str     r0, [r7, #0xC]
        cmp     r6, r11
        add     r7, r7, #0x14
        ble     LDLH8
        mov     r0, r10
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r10, [sp, #4]
LDLH9:
        str     r10, [sp, #4]
        add     r11, r0, r6, lsl #2
        add     r9, r4, r6, lsl #2
        add     r7, r2, r6, lsl #2
        str     r2, [sp, #8]
        mov     r10, r0
        mov     r8, r1
LDLH10:
        ldr     r0, [r11], #4
        ldr     r1, [r9], #4
        bl      __mulsf3
        add     r6, r6, #1
        str     r0, [r7], #4
        cmp     r6, r5
        blt     LDLH10
        mov     r1, r8
        mov     r0, r10
        ldr     r2, [sp, #8]
        ldr     r10, [sp, #4]
        cmp     r6, r1
        bge     LDLH16
LDLH11:
        str     r10, [sp, #4]
LDLH12:
        cmp     r5, #0
        ble     LDLH18
        cmp     r5, #5
        movlt   r8, #0
        blt     LDLH14
        mov     r3, r6, lsl #2
        add     r3, r3, #4
        mov     r8, #0
        sub     r11, r5, #5
        add     r10, r3, r0
        add     r7, r3, r4
        add     r9, r2, #4
        str     r4, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r2, [sp, #8]
LDLH13:
        ldr     r1, [r7, #-4]
        ldr     r0, [r10, #-4]
        ldr     r4, [r9, #-4]
        add     r8, r8, #4
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r4, [r9]
        str     r0, [r9, #-4]
        ldr     r0, [r10]
        ldr     r1, [r7]
        add     r6, r6, #4
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r9]
        ldr     r0, [r10, #4]
        ldr     r1, [r7, #4]
        ldr     r4, [r9, #4]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r9, #4]
        ldr     r0, [r10, #8]
        ldr     r1, [r7, #8]
        ldr     r4, [r9, #8]
        add     r10, r10, #0x10
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r9, #8]
        cmp     r8, r11
        add     r9, r9, #0x10
        add     r7, r7, #0x10
        ble     LDLH13
        ldr     r4, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
LDLH14:
        add     r10, r0, r6, lsl #2
        add     r9, r4, r6, lsl #2
        add     r7, r2, r8, lsl #2
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r2, [sp, #8]
LDLH15:
        ldr     r0, [r10], #4
        ldr     r1, [r9], #4
        ldr     r11, [r7]
        add     r8, r8, #1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r7], #4
        cmp     r8, r5
        add     r6, r6, #1
        blt     LDLH15
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #8]
        cmp     r6, r1
        blt     LDLH12
        ldr     r10, [sp, #4]
LDLH16:
        ldr     r3, [sp, #0x1C]
        mov     r0, r2
        ldr     r1, [r3, #0x14]
        ldr     r3, [sp, #0x18]
        mov     r2, r1
        mov     r1, r10
        bl      _ippsFFTFwd_RToCCS_32f
        cmp     r0, #0
        beq     LDLH17
        mvn     r0, #1
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDLH17:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDLH18:
        cmp     r6, r1
        blt     LDLH12
        ldr     r10, [sp, #4]
        b       LDLH16
LDLH19:
        cmp     r1, #0
        movgt   r6, #0
        bgt     LDLH11
        b       LDLH16
LDLH20:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


