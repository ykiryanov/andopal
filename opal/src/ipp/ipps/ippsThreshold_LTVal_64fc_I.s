        .text
        .align  4
        .globl  _ippsThreshold_LTVal_64fc_I


_ippsThreshold_LTVal_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        mov     r11, r0
        cmp     r11, #0
        mov     r10, r1
        mov     r5, r2
        mov     r4, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r10, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        mvnlt   r0, #0x12
        ldmltia sp!, {r4 - r11, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        cmp     r10, #0
        mov     r7, r0
        mov     r6, r1
        ble     LAOY2
LAOY0:
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        ldr     r8, [r11, #8]
        ldr     r9, [r11, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LAOY1
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        str     r12, [r11]
        str     lr, [r11, #4]
        str     r4, [r11, #8]
        str     r5, [r11, #0xC]
LAOY1:
        subs    r10, r10, #1
        add     r11, r11, #0x10
        bne     LAOY0
LAOY2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


