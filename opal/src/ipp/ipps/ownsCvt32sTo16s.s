        .text
        .align  4
        .globl  ownsCvt32sTo16s


ownsCvt32sTo16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r3, r0
        ldr     r12, [r3]
        cmp     r2, #1
        eor     lr, r12, r12, asr #31
        suble   r12, lr, r12, asr #31
        ble     LBVT2
        sub     r12, lr, r12, asr #31
        add     r4, r3, #4
        sub     lr, r2, #1
LBVT0:
        ldr     r6, [r4]
        eor     r5, r6, r6, asr #31
        sub     r5, r5, r6, asr #31
        cmp     r5, r12
        ble     LBVT1
        ldr     r5, [r4]
        eor     r12, r5, r5, asr #31
        sub     r12, r12, r5, asr #31
LBVT1:
        subs    lr, lr, #1
        add     r4, r4, #4
        bne     LBVT0
LBVT2:
        mvn     r7, #1
        add     lr, r7, #2, 18
        cmp     lr, r12
        mov     r8, #0
        movge   r0, r8
        bge     LBVT4
        mov     r0, r8
        add     lr, r7, #2, 18
LBVT3:
        mov     r12, r12, asr #1
        cmp     lr, r12
        add     r0, r0, #1
        blt     LBVT3
LBVT4:
        cmp     r2, #0
        ble     LBVT8
        cmp     r2, #6
        sub     r12, r2, #1
        addlt   r3, r3, r12, lsl #2
        blt     LBVT6
        add     r3, r3, r12, lsl #2
        mvn     r6, #0
        mvn     r5, #2
        mvn     r4, #3
        sub     lr, r2, #6
        mov     r12, r1
        str     r1, [sp]
LBVT5:
        rsb     r11, r8, #0
        ldr     r11, [r3, +r11, lsl #2]
        rsb     r10, r8, r6
        rsb     r1, r8, r5
        mov     r11, r11, asr r0
        strh    r11, [r12]
        ldr     r11, [r3, +r10, lsl #2]
        rsb     r9, r8, r4
        rsb     r10, r8, r7
        mov     r11, r11, asr r0
        strh    r11, [r12, #2]
        ldr     r10, [r3, +r10, lsl #2]
        add     r8, r8, #5
        cmp     r8, lr
        mov     r10, r10, asr r0
        strh    r10, [r12, #4]
        ldr     r1, [r3, +r1, lsl #2]
        mov     r1, r1, asr r0
        strh    r1, [r12, #6]
        ldr     r9, [r3, +r9, lsl #2]
        mov     r1, r9, asr r0
        strh    r1, [r12, #8]
        add     r12, r12, #0xA
        ble     LBVT5
        ldr     r1, [sp]
LBVT6:
        add     r1, r1, r8, lsl #1
LBVT7:
        rsb     r12, r8, #0
        ldr     r12, [r3, +r12, lsl #2]
        add     r8, r8, #1
        cmp     r8, r2
        mov     r12, r12, asr r0
        strh    r12, [r1], #2
        blt     LBVT7
LBVT8:
        ldmia   sp!, {r1, r4 - r11, pc}


