        .text
        .align  4
        .globl  _ippsScale_32f_I


_ippsScale_32f_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r6, r1
        cmp     r6, #0
        mov     r4, r2
        mov     r5, r3
        beq     LGCF5
        cmp     r0, #0
        beq     LGCF5
        cmp     r4, #0
        beq     LGCF5
        cmp     r5, #1
        blt     LGCF4
        cmp     r5, #0
        ble     LGCF3
        add     r9, r4, #4
        mov     r8, #0
        mov     r7, r9
LGCF0:
        ldr     r11, [r4], #4
        ldr     r12, [r7], #4
        cmp     r11, r12
        bge     LGCF2
        add     r10, r0, r11, lsl #2
        str     r0, [sp]
LGCF1:
        ldr     r0, [r10]
        ldr     r1, [r6, +r8, lsl #2]
        add     r11, r11, #1
        bl      __mulsf3
        str     r0, [r10], #4
        ldr     r0, [r9, +r8, lsl #2]
        cmp     r11, r0
        blt     LGCF1
        ldr     r0, [sp]
LGCF2:
        subs    r5, r5, #1
        add     r8, r8, #1
        bne     LGCF0
LGCF3:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LGCF4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LGCF5:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


