        .text
        .align  4
        .globl  _ippsMinMax_64f


_ippsMinMax_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r6, r1
        beq     LBGS3
        cmp     r2, #0
        beq     LBGS3
        cmp     r3, #0
        beq     LBGS3
        cmp     r6, #0
        ble     LBGS2
        ldr     r10, [r0]
        ldr     r9, [r0, #4]
        cmp     r6, #0
        mov     r8, r10
        mov     r7, r9
        ble     LBGS1
        sub     r11, r0, #4
        str     r3, [sp, #4]
        str     r2, [sp]
LBGS0:
        ldr     r4, [r11, #8]
        ldr     r5, [r11, #4]
        mov     r3, r9
        mov     r2, r10
        mov     r1, r4
        mov     r0, r5
        bl      __ltdf2
        cmp     r0, #0
        mov     r2, r8
        mov     r3, r7
        mov     r0, r5
        mov     r1, r4
        movlt   r9, r4
        movlt   r10, r5
        bl      __gtdf2
        cmp     r0, #0
        add     r11, r11, #8
        movgt   r8, r5
        movgt   r7, r4
        subs    r6, r6, #1
        bne     LBGS0
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LBGS1:
        str     r10, [r2]
        str     r9, [r2, #4]
        mov     r0, #0
        str     r8, [r3]
        str     r7, [r3, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBGS2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBGS3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


