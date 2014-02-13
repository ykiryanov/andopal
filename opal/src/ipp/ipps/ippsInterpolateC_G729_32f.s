        .text
        .align  4
        .globl  _ippsInterpolateC_G729_32f


_ippsInterpolateC_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r3
        beq     LDHQ3
        cmp     r2, #0
        beq     LDHQ3
        cmp     r12, #0
        beq     LDHQ3
        cmp     r11, #0
        ble     LDHQ4
        cmp     r11, #5
        mov     r10, #0
        blt     LDHQ1
        sub     r9, r11, #5
        add     r8, r0, #4
        add     r7, r2, #4
        add     r6, r12, #4
        str     r11, [sp, #0xC]
        str     r12, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LDHQ0:
        ldr     r0, [r8, #-4]
        mov     r1, r5
        add     r10, r10, #4
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [r7, #-4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #-4]
        ldr     r0, [r8]
        mov     r1, r5
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [r7]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6]
        ldr     r0, [r8, #4]
        mov     r1, r5
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [r7, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r0, [r8, #8]
        mov     r1, r5
        add     r8, r8, #0x10
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [r7, #8]
        mov     r1, r4
        add     r7, r7, #0x10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #8]
        cmp     r10, r9
        add     r6, r6, #0x10
        ble     LDHQ0
        ldr     r11, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LDHQ1:
        add     r7, r0, r10, lsl #2
        add     r6, r2, r10, lsl #2
        add     r9, r12, r10, lsl #2
LDHQ2:
        ldr     r0, [r7], #4
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [r6], #4
        mov     r8, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        add     r10, r10, #1
        str     r0, [r9], #4
        cmp     r10, r11
        blt     LDHQ2
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDHQ3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDHQ4:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


