        .text
        .align  4
        .globl  _ippsAddProductC_32f


_ippsAddProductC_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LDBK3
        cmp     r6, #0
        beq     LDBK3
        cmp     r5, #0
        ble     LDBK4
        cmp     r5, #5
        mov     r10, #0
        blt     LDBK1
        sub     r9, r5, #5
        add     r8, r6, #4
        add     r7, r0, #4
        str     r0, [sp]
LDBK0:
        ldr     r0, [r7, #-4]
        ldr     r11, [r8, #-4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r8]
        str     r0, [r8, #-4]
        ldr     r0, [r7]
        mov     r1, r4
        add     r10, r10, #4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8]
        ldr     r0, [r7, #4]
        ldr     r11, [r8, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r0, [r7, #8]
        ldr     r11, [r8, #8]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #8]
        cmp     r10, r9
        add     r7, r7, #0x10
        add     r8, r8, #0x10
        ble     LDBK0
        ldr     r0, [sp]
LDBK1:
        add     r7, r6, r10, lsl #2
        add     r6, r0, r10, lsl #2
LDBK2:
        ldr     r0, [r6], #4
        ldr     r8, [r7]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        add     r10, r10, #1
        str     r0, [r7], #4
        cmp     r10, r5
        blt     LDBK2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LDBK3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LDBK4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


