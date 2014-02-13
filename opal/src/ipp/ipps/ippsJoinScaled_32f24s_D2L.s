        .text
        .align  4
        .globl  _ippsJoinScaled_32f24s_D2L


_ippsJoinScaled_32f24s_D2L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r3, #0
        beq     LBLW13
        cmp     r1, #0
        ble     LBLW12
        cmp     r2, #0
        ble     LBLW12
        cmp     r0, #0
        beq     LBLW13
        cmp     r1, #0
        ble     LBLW1
        mov     r12, r0
        mov     lr, r1
LBLW0:
        ldr     r4, [r12], #4
        cmp     r4, #0
        beq     LBLW14
        subs    lr, lr, #1
        bne     LBLW0
LBLW1:
        cmp     r2, #0
        ble     LBLW10
        mov     r12, #0
        mov     r5, #0
        mov     r9, r12
        mov     r4, #0x7F
        mov     lr, #0xFF
        mov     r6, #0x80
LBLW2:
        cmp     r1, #0
        ble     LBLW11
        add     r5, r9, r3
        mov     r8, r12, lsl #2
        mov     r6, r0
        mov     r7, r1
        str     r12, [sp, #4]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
LBLW3:
        ldr     r0, [r6], #4
        mov     r1, #0xFE, 12
        ldr     r0, [r0, +r8]
        orr     r1, r1, #3, 4
        add     r11, r1, #1, 12
        bl      __extendsfdf2
        mov     r10, r0
        mov     r4, r1
        mov     r2, #0
        mov     r3, r11
        bl      __gtdf2
        cmp     r0, #0
        ble     LBLW4
        mov     r0, #0xFF
        strb    r0, [r5]
        strb    r0, [r5, #1]
        mov     r0, #0x7F
        strb    r0, [r5, #2]
        b       LBLW9
LBLW4:
        mov     r0, r10
        mov     r12, #0xFE, 12
        orr     r12, r12, #0xB, 4
        add     r3, r12, #1, 12
        mov     r1, r4
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLW5
        mov     r0, #0
        strb    r0, [r5]
        strb    r0, [r5, #1]
        mov     r0, #0x80
        strb    r0, [r5, #2]
        b       LBLW9
LBLW5:
        mvn     r12, #0xEA, 12
        bic     r1, r12, #0xB, 4
        mov     r2, r10
        mov     r0, #0xE, 4
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0xFE, 12
        orr     r3, r2, #0xB, 4
        mov     r2, #0
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLW6
        mov     r2, #0xFE, 12
        orr     r3, r2, #0xB, 4
        mov     r4, #1
        b       LBLW7
LBLW6:
        mov     r2, #0xFE, 12
        orr     r2, r2, #0xB, 4
        sub     r3, r2, #2, 2
        mvn     r4, #0
LBLW7:
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LBLW8
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        addeq   r11, r11, r4
LBLW8:
        mov     r2, r11, asr #8
        mov     r1, r11, asr #16
        strb    r11, [r5]
        strb    r2, [r5, #1]
        strb    r1, [r5, #2]
LBLW9:
        subs    r7, r7, #1
        add     r5, r5, #3
        add     r9, r9, #3
        bne     LBLW3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        add     r12, r12, #1
        cmp     r12, r2
        blt     LBLW2
LBLW10:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBLW11:
        add     r12, r12, #1
        cmp     r12, r2
        blt     LBLW2
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBLW12:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBLW13:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBLW14:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


