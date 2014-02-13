        .text
        .align  4
        .globl  _ippsAddProduct_32f


_ippsAddProduct_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LDBP3
        cmp     r1, #0
        beq     LDBP3
        cmp     r5, #0
        beq     LDBP3
        cmp     r4, #0
        ble     LDBP4
        cmp     r4, #5
        mov     r10, #0
        blt     LDBP1
        sub     r9, r4, #5
        add     r8, r5, #4
        add     r7, r0, #4
        add     r6, r1, #4
        str     r1, [sp, #4]
        str     r0, [sp]
LDBP0:
        ldr     r1, [r6, #-4]
        ldr     r0, [r7, #-4]
        ldr     r11, [r8, #-4]
        add     r10, r10, #4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r8]
        str     r0, [r8, #-4]
        ldr     r0, [r7]
        ldr     r1, [r6]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8]
        ldr     r0, [r7, #4]
        ldr     r1, [r6, #4]
        ldr     r11, [r8, #4]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r0, [r7, #8]
        ldr     r1, [r6, #8]
        ldr     r11, [r8, #8]
        add     r7, r7, #0x10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #8]
        cmp     r10, r9
        add     r6, r6, #0x10
        add     r8, r8, #0x10
        ble     LDBP0
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDBP1:
        add     r8, r5, r10, lsl #2
        add     r7, r0, r10, lsl #2
        add     r6, r1, r10, lsl #2
LDBP2:
        ldr     r0, [r7], #4
        ldr     r1, [r6], #4
        ldr     r5, [r8]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        add     r10, r10, #1
        str     r0, [r8], #4
        cmp     r10, r4
        blt     LDBP2
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDBP3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDBP4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


