        .text
        .align  4
        .globl  _ippsWTHaarInv_32f


_ippsWTHaarInv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        beq     LAJF4
        cmp     r1, #0
        beq     LAJF4
        cmp     r2, #0
        beq     LAJF4
        cmp     r3, #0
        ble     LAJF5
        sub     r12, r3, #1
        cmp     r12, #0
        mov     r9, #0
        movle   r8, r9
        ble     LAJF3
        sub     lr, r3, #1
        cmp     lr, #8
        movlt   r8, r9
        addlt   r10, r2, #4
        blt     LAJF1
        mov     r8, r9
        add     r10, r2, #4
        sub     lr, r3, #9
        add     r7, r0, #4
        add     r6, r1, #4
        add     r5, r2, #8
        add     r4, r2, #0xC
        str     r10, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp, #0x10]
        str     r0, [sp]
LAJF0:
        ldr     r10, [r7, #-4]
        ldr     r11, [r6, #-4]
        add     r9, r9, #6
        mov     r0, r10
        add     r8, r8, #3
        mov     r1, r11
        bl      __subsf3
        str     r0, [r5, #-8]
        mov     r0, r10
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4, #-8]
        ldr     r10, [r7]
        ldr     r11, [r6]
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        str     r0, [r5]
        mov     r0, r10
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4]
        ldr     r11, [r7, #4]
        ldr     r10, [r6, #4]
        add     r7, r7, #0xC
        mov     r0, r11
        add     r6, r6, #0xC
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, #8]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [r4, #8]
        cmp     r9, r1
        add     r5, r5, #0x18
        add     r4, r4, #0x18
        ble     LAJF0
        ldr     r10, [sp, #0x14]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp]
LAJF1:
        add     r4, r1, r8, lsl #2
        add     r6, r2, r9, lsl #2
        add     r5, r0, r8, lsl #2
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LAJF2:
        ldr     r11, [r5], #4
        ldr     r7, [r4], #4
        mov     r0, r11
        mov     r1, r7
        bl      __subsf3
        str     r0, [r6], #8
        mov     r0, r11
        mov     r1, r7
        bl      __addsf3
        str     r0, [r10, +r9, lsl #2]
        ldr     r0, [sp, #0xC]
        add     r9, r9, #2
        add     r8, r8, #1
        cmp     r9, r0
        blt     LAJF2
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LAJF3:
        tst     r3, #1
        ldrne   r8, [r0, +r8, lsl #2]
        strne   r8, [r2, +r9, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJF4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAJF5:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


