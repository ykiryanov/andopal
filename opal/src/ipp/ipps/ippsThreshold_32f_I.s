        .text
        .align  4
        .globl  _ippsThreshold_32f_I


_ippsThreshold_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r3, #4
        mov     r7, #0
        beq     LARO3
        cmp     r5, #6
        blt     LARO1
        sub     r10, r5, #6
        add     r9, r6, #4
LARO0:
        ldr     r8, [r9, #-4]
        mov     r0, r4
        add     r7, r7, #5
        mov     r1, r8
        bl      __gtsf2
        ldr     r11, [r9]
        cmp     r0, #0
        movgt   r8, r4
        str     r8, [r9, #-4]
        mov     r1, r11
        mov     r0, r4
        bl      __gtsf2
        ldr     r8, [r9, #4]
        cmp     r0, #0
        movgt   r11, r4
        str     r11, [r9]
        mov     r1, r8
        mov     r0, r4
        bl      __gtsf2
        ldr     r11, [r9, #8]
        cmp     r0, #0
        movgt   r8, r4
        str     r8, [r9, #4]
        mov     r1, r11
        mov     r0, r4
        bl      __gtsf2
        ldr     r8, [r9, #0xC]
        cmp     r0, #0
        movgt   r11, r4
        str     r11, [r9, #8]
        mov     r1, r8
        mov     r0, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r8, r4
        str     r8, [r9, #0xC]
        cmp     r7, r10
        add     r9, r9, #0x14
        ble     LARO0
LARO1:
        add     r8, r6, r7, lsl #2
LARO2:
        ldr     r6, [r8]
        mov     r0, r4
        add     r7, r7, #1
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        movgt   r6, r4
        str     r6, [r8], #4
        cmp     r7, r5
        blt     LARO2
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LARO3:
        cmp     r5, #6
        blt     LARO5
        sub     r10, r5, #6
        add     r9, r6, #4
LARO4:
        ldr     r8, [r9, #-4]
        mov     r0, r4
        add     r7, r7, #5
        mov     r1, r8
        bl      __ltsf2
        ldr     r11, [r9]
        cmp     r0, #0
        movlt   r8, r4
        str     r8, [r9, #-4]
        mov     r1, r11
        mov     r0, r4
        bl      __ltsf2
        ldr     r8, [r9, #4]
        cmp     r0, #0
        movlt   r11, r4
        str     r11, [r9]
        mov     r1, r8
        mov     r0, r4
        bl      __ltsf2
        ldr     r11, [r9, #8]
        cmp     r0, #0
        movlt   r8, r4
        str     r8, [r9, #4]
        mov     r1, r11
        mov     r0, r4
        bl      __ltsf2
        ldr     r8, [r9, #0xC]
        cmp     r0, #0
        movlt   r11, r4
        str     r11, [r9, #8]
        mov     r1, r8
        mov     r0, r4
        bl      __ltsf2
        cmp     r0, #0
        movlt   r8, r4
        str     r8, [r9, #0xC]
        cmp     r7, r10
        add     r9, r9, #0x14
        ble     LARO4
LARO5:
        add     r8, r6, r7, lsl #2
LARO6:
        ldr     r6, [r8]
        mov     r0, r4
        add     r7, r7, #1
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        movlt   r6, r4
        str     r6, [r8], #4
        cmp     r7, r5
        blt     LARO6
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


