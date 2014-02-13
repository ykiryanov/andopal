        .text
        .align  4
        .globl  _ippsMinIndx_64f


_ippsMinIndx_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r4, r1
        beq     LBFO4
        cmp     r2, #0
        beq     LBFO4
        cmp     r4, #0
        ble     LBFO5
        cmp     r3, #0
        beq     LBFO3
        ldr     r8, [r0]
        ldr     r7, [r0, #4]
        cmp     r4, #1
        mov     r11, #0
        ble     LBFO2
        add     r9, r0, #8
        mov     r10, #1
        str     r3, [sp, #4]
        str     r2, [sp]
LBFO0:
        ldr     r6, [r9]
        ldr     r5, [r9, #4]
        mov     r2, r8
        mov     r0, r6
        mov     r3, r7
        mov     r1, r5
        bl      __ltdf2
        cmp     r0, #0
        bge     LBFO1
        mov     r8, r6
        mov     r7, r5
        mov     r11, r10
LBFO1:
        add     r10, r10, #1
        cmp     r10, r4
        add     r9, r9, #8
        blt     LBFO0
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LBFO2:
        str     r8, [r2]
        str     r7, [r2, #4]
        mov     r0, #0
        str     r11, [r3]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBFO3:
        mov     r1, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsMin_64f
LBFO4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBFO5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


