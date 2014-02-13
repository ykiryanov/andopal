        .text
        .align  4
        .globl  _ippsVectorRamp_32s


_ippsVectorRamp_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r6, r2
        mov     r5, r3
        beq     LAZZ6
        cmp     r9, #0
        ble     LAZZ5
        cmp     r9, #0
        ble     LAZZ4
        mvn     r12, #0xE2, 12
        mov     lr, #0xFE, 12
        bic     r12, r12, #0xB, 4
        orr     r4, lr, #3, 4
        mvn     r11, #2, 2
        mov     r10, #0
        mov     r8, #0
        mov     lr, #2, 2
        str     r11, [sp]
        str     r12, [sp, #4]
LAZZ0:
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        bl      __extendsfdf2
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LAZZ1
        mov     r0, r11
        mov     r1, r10
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        b       LAZZ2
LAZZ1:
        mov     r2, r11
        mov     r3, r10
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
LAZZ2:
        ldr     r3, [sp, #4]
        mov     r12, #0
        sub     r2, r12, #1, 10
        mov     r0, r11
        mov     r1, r10
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp]
        strge   r12, [r7]
        bge     LAZZ3
        mov     r0, r11
        sub     r3, r4, #0x7E, 8
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r7]
        ble     LAZZ3
        mov     r0, r11
        mov     r1, r10
        bl      __fixdfsi
        str     r0, [r7]
LAZZ3:
        add     r8, r8, #1
        cmp     r8, r9
        add     r7, r7, #4
        blt     LAZZ0
LAZZ4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAZZ5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAZZ6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


