        .text
        .align  4
        .globl  _ippsFilteredExcitation_G729_32f


_ippsFilteredExcitation_G729_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r3
        beq     LDHR5
        cmp     r5, #0
        beq     LDHR5
        cmp     r2, #0
        ble     LDHR4
        sub     r7, r2, #1
        cmp     r7, #0
        ble     LDHR3
        cmp     r7, #6
        sublt   r10, r5, #4
        blt     LDHR1
        mov     r2, r7, lsl #2
        sub     r2, r2, #4
        sub     r10, r5, #4
        add     r9, r2, r10
        add     r8, r2, r0
        add     r6, r2, r5
        str     r0, [sp]
LDHR0:
        ldr     r1, [r8, #4]
        ldr     r11, [r9, #4]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r1, [r8]
        ldr     r11, [r9]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6]
        ldr     r1, [r8, #-4]
        ldr     r11, [r9, #-4]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #-4]
        ldr     r1, [r8, #-8]
        ldr     r11, [r9, #-8]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #-8]
        ldr     r1, [r8, #-0xC]
        ldr     r11, [r9, #-0xC]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        sub     r7, r7, #5
        str     r0, [r6, #-0xC]
        cmp     r7, #6
        sub     r9, r9, #0x14
        sub     r8, r8, #0x14
        sub     r6, r6, #0x14
        bge     LDHR0
        ldr     r0, [sp]
LDHR1:
        add     r8, r0, r7, lsl #2
        add     r9, r5, r7, lsl #2
LDHR2:
        ldr     r1, [r8], #-4
        ldr     r6, [r10, +r7, lsl #2]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        sub     r7, r7, #1
        str     r0, [r9], #-4
        cmp     r7, #0
        bgt     LDHR2
LDHR3:
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r1, r4 - r11, pc}
LDHR4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LDHR5:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


