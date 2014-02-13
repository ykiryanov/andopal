        .text
        .align  4
        .globl  _ippsWTHaarInv_64s


_ippsWTHaarInv_64s:
        mov     r12, sp
        stmdb   sp!, {r4, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x38
        str     r0, [r11, #-0x20]
        str     r1, [r11, #-0x1C]
        str     r2, [r11, #-0x18]
        str     r3, [r11, #-0x14]
        ldr     r0, [r11, #-0x14]
        ldr     r1, [r11, #-0x20]
        cmp     r1, #0
        bne     LAJB0
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LAJB0:
        ldr     r1, [r11, #-0x1C]
        cmp     r1, #0
        bne     LAJB1
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LAJB1:
        ldr     r1, [r11, #-0x18]
        cmp     r1, #0
        bne     LAJB2
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LAJB2:
        ldr     r1, [r11, #-0x14]
        cmp     r1, #0
        bgt     LAJB3
        mvn     r0, #5
        ldmdb   r11, {r4, r11, sp, pc}
LAJB3:
        mov     r1, #0
        str     r1, [r11, #-0x28]
        str     r1, [r11, #-0x24]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x14]
        sub     r2, r2, #1
        cmp     r1, r2
        bge     LAJB9
LAJB4:
        ldr     r2, [r11, #-0x20]
        ldr     r3, [r11, #-0x28]
        mov     r1, r3, lsl #3
        add     r1, r2, r1
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r1, [r1, #4]
        str     r2, [r11, #-0x48]
        str     r1, [r11, #-0x44]
        ldr     r2, [r11, #-0x1C]
        ldr     r3, [r11, #-0x28]
        mov     r1, r3, lsl #3
        add     r1, r2, r1
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r1, [r1, #4]
        str     r2, [r11, #-0x40]
        str     r1, [r11, #-0x3C]
        ldr     r2, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        ldr     r3, [r11, #-0x40]
        ldr     lr, [r11, #-0x3C]
        rsbs    r3, r3, #0
        rsc     lr, lr, #0
        adds    r3, r2, r3
        adc     lr, r1, lr
        str     r3, [r11, #-0x38]
        str     lr, [r11, #-0x34]
        ldr     r1, [r11, #-0x48]
        ldr     r2, [r11, #-0x44]
        ldr     lr, [r11, #-0x40]
        ldr     r3, [r11, #-0x3C]
        adds    r1, r1, lr
        adc     r3, r2, r3
        str     r1, [r11, #-0x30]
        str     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x48]
        ldr     r2, [r11, #-0x44]
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        subs    r3, lr, r3
        sbcs    r2, r2, r1
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        beq     LAJB5
        ldr     r1, [r11, #-0x34]
        tst     r1, r1
        bpl     LAJB6
        mvn     r2, #0
        mvn     r1, #2, 2
        str     r2, [r11, #-0x38]
        str     r1, [r11, #-0x34]
        b       LAJB6
LAJB5:
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x34]
        orrs    r2, r1, r2, lsl #1
        tstcs   r2, #0
        beq     LAJB6
        mov     r2, #0
        mov     r1, #2, 2
        str     r2, [r11, #-0x38]
        str     r1, [r11, #-0x34]
LAJB6:
        ldr     r1, [r11, #-0x40]
        ldr     r2, [r11, #-0x3C]
        rsbs    r1, r1, #0
        rsc     r2, r2, #0
        str     r1, [r11, #-0x40]
        str     r2, [r11, #-0x3C]
        ldr     r1, [r11, #-0x40]
        ldr     r2, [r11, #-0x3C]
        mvn     r3, #0
        adds    r1, r1, r3
        mvn     r3, #0
        adc     r2, r2, r3
        str     r1, [r11, #-0x40]
        str     r2, [r11, #-0x3C]
        ldr     lr, [r11, #-0x48]
        ldr     r2, [r11, #-0x44]
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        subs    r3, lr, r3
        sbcs    r2, r2, r1
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        bne     LAJB7
        ldr     r1, [r11, #-0x2C]
        tst     r1, r1
        bmi     LAJB8
        mov     r2, #0
        mov     r1, #2, 2
        str     r2, [r11, #-0x30]
        str     r1, [r11, #-0x2C]
        b       LAJB8
LAJB7:
        ldr     r1, [r11, #-0x2C]
        tst     r1, r1
        bpl     LAJB8
        mvn     r2, #0
        mvn     r1, #2, 2
        str     r2, [r11, #-0x30]
        str     r1, [r11, #-0x2C]
LAJB8:
        ldr     r1, [r11, #-0x38]
        ldr     lr, [r11, #-0x34]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x24]
        mov     r4, r3, lsl #3
        add     r4, r2, r4
        str     r1, [r2, +r3, lsl #3]
        str     lr, [r4, #4]
        ldr     r1, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        ldr     r2, [r11, #-0x18]
        ldr     lr, [r11, #-0x24]
        mov     lr, lr, lsl #3
        add     lr, lr, #8
        add     r4, r2, lr
        str     r1, [r2, +lr]
        str     r3, [r4, #4]
        ldr     r1, [r11, #-0x24]
        add     r1, r1, #2
        str     r1, [r11, #-0x24]
        ldr     r1, [r11, #-0x28]
        add     r1, r1, #1
        str     r1, [r11, #-0x28]
        ldr     r1, [r11, #-0x24]
        sub     r2, r0, #1
        cmp     r1, r2
        blt     LAJB4
LAJB9:
        ldr     r0, [r11, #-0x14]
        tst     r0, #1
        beq     LAJB10
        ldr     r0, [r11, #-0x20]
        ldr     r2, [r11, #-0x28]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x18]
        ldr     r3, [r11, #-0x24]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
LAJB10:
        mov     r0, #0
        ldmdb   r11, {r4, r11, sp, pc}


