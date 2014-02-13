        .text
        .align  4
        .globl  ownippsIpp64fSort


ownippsIpp64fSort:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        sub     r8, r1, #1
        cmp     r8, #0
        ble     LBHJ4
        add     r1, r0, #8
LBHJ0:
        cmp     r8, #0
        ble     LBHJ3
        mov     r9, r1
        mov     r10, r0
        mov     r11, #0
        str     r1, [sp, #4]
        str     r0, [sp]
LBHJ1:
        ldr     r7, [r10]
        ldr     r6, [r10, #4]
        ldr     r5, [r9]
        ldr     r4, [r9, #4]
        mov     r0, r7
        mov     r1, r6
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHJ2
        str     r5, [r10]
        str     r4, [r10, #4]
        str     r7, [r9]
        str     r6, [r9, #4]
LBHJ2:
        add     r11, r11, #1
        cmp     r11, r8
        add     r10, r10, #8
        add     r9, r9, #8
        blt     LBHJ1
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBHJ3:
        sub     r8, r8, #1
        cmp     r8, #0
        bgt     LBHJ0
LBHJ4:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


