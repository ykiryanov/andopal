        .text
        .align  4
        .globl  _ippsMulC_32fc


_ippsMulC_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        str     r1, [sp]
        ldr     r1, [sp, #0x2C]
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r3
        str     r2, [sp, #4]
        beq     LBEQ3
        cmp     r8, #0
        beq     LBEQ3
        cmp     r1, #0
        ble     LBEQ2
        cmp     r1, #0
        sub     r11, r1, #1
        beq     LBEQ1
        ldr     r6, [sp]
        ldr     r5, [sp, #4]
LBEQ0:
        ldr     r4, [r9]
        ldr     r7, [r9, #4]
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r11, r11, #1
        str     r0, [r8, #4]
        str     r10, [r8], #8
        cmn     r11, #1
        add     r9, r9, #8
        bne     LBEQ0
LBEQ1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBEQ2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBEQ3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


