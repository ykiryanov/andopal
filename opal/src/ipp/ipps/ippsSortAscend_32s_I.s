        .text
        .align  4
        .globl  _ippsSortAscend_32s_I


_ippsSortAscend_32s_I:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #1, 24
        cmp     r0, #0
        beq     LAXO22
        cmp     r1, #0
        ble     LAXO21
        cmp     r1, #2
        blt     LAXO23
        add     r2, r0, r1, lsl #2
        sub     r2, r2, #4
        mov     r3, #1
LAXO0:
        cmp     r1, #9
        bgt     LAXO6
        cmp     r2, r0
        bls     LAXO4
        add     r12, r0, #4
LAXO1:
        cmp     r12, r2
        mov     lr, r12
        mov     r1, r0
        bhi     LAXO3
LAXO2:
        ldr     r5, [lr]
        ldr     r4, [r1]
        cmp     r5, r4
        movgt   r1, lr
        add     lr, lr, #4
        cmp     lr, r2
        bls     LAXO2
LAXO3:
        ldr     lr, [r2]
        ldr     r4, [r1]
        str     lr, [r1]
        str     r4, [r2], #-4
        cmp     r2, r0
        bhi     LAXO1
LAXO4:
        add     r0, sp, #0x80
        sub     r3, r3, #1
        mov     r1, sp
        ldr     r2, [r1, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
LAXO5:
        sub     r1, r2, r0
        cmp     r3, #0
        mov     r1, r1, asr #2
        add     r1, r1, #1
        bne     LAXO0
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXO6:
        ldr     r5, [r0]
        ldr     r6, [r0, #4]
        mov     lr, r1, asr #1
        mov     r4, r5
        add     r12, r0, #4
        cmp     r6, r5
        movlt   r5, r6
        movgt   r4, r6
        str     r5, [r0, #4]
        str     r4, [r0]
        ldr     r6, [r0, +lr, lsl #2]
        ldr     r1, [r2]
        mov     r5, r4
        cmp     r6, r4
        movlt   r5, r6
        movgt   r4, r6
        cmp     r1, r5
        mov     r6, r5
        movlt   r6, r1
        str     r6, [r0]
        ldr     r6, [r2]
        mov     r1, r2
        cmp     r6, r5
        movgt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movlt   r6, r5
        str     r6, [r0, +lr, lsl #2]
        movgt   r4, r5
        str     r4, [r2]
        ldr     lr, [r0, +lr, lsl #2]
LAXO7:
        cmp     r1, r12
        bls     LAXO13
        sub     r4, r1, r12
        cmp     r4, #0x18
        bcc     LAXO20
        ldr     r5, [r12]
        cmp     r5, lr
        bgt     LAXO10
LAXO8:
        add     r12, r12, #4
        ldr     r4, [r12]
        cmp     r4, lr
        bgt     LAXO9
        add     r12, r12, #4
        ldr     r4, [r12]
        cmp     r4, lr
        bgt     LAXO9
        add     r12, r12, #4
        ldr     r4, [r12]
        cmp     r4, lr
        bgt     LAXO9
        add     r12, r12, #4
        ldr     r4, [r12]
        cmp     r4, lr
        bgt     LAXO9
        add     r12, r12, #4
        ldr     r4, [r12]
        sub     r5, r1, #0x18
        cmp     r12, r5
        bcs     LAXO18
        cmp     r4, lr
        ble     LAXO8
LAXO9:
        cmp     r1, r12
        subhi   r4, r1, r12
        bls     LAXO13
LAXO10:
        cmp     r4, #0x18
        bcc     LAXO12
        add     r4, r12, #0x18
LAXO11:
        ldr     r5, [r1]
        cmp     r5, lr
        ble     LAXO13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, lr
        ble     LAXO13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, lr
        ble     LAXO13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, lr
        ble     LAXO13
        sub     r1, r1, #4
        ldr     r5, [r1]
        cmp     r5, lr
        ble     LAXO13
        sub     r1, r1, #4
        cmp     r1, r4
        bhi     LAXO11
LAXO12:
        ldr     r4, [r1]
        cmp     r4, lr
        ble     LAXO13
        sub     r1, r1, #4
        cmp     r1, r12
        bhi     LAXO12
LAXO13:
        cmp     r12, r1
        beq     LAXO14
        ldr     r4, [r1]
        ldr     r5, [r12]
        str     r4, [r12]
        str     r5, [r1]
        b       LAXO7
LAXO14:
        ldr     r4, [r12, #-4]!
        cmp     r4, lr
        bne     LAXO16
LAXO15:
        cmp     r12, r0
        bls     LAXO16
        ldr     r4, [r12, #-4]!
        cmp     r4, lr
        beq     LAXO15
LAXO16:
        sub     r4, r2, r1
        sub     lr, r12, r0
        mov     r4, r4, asr #2
        cmp     r4, lr, asr #2
        ble     LAXO17
        cmp     r12, r0
        moveq   r0, r1
        beq     LAXO5
        mov     lr, sp
        add     r4, sp, #0x80
        str     r2, [lr, +r3, lsl #2]
        str     r1, [r4, +r3, lsl #2]
        add     r3, r3, #1
        mov     r2, r12
        b       LAXO5
LAXO17:
        cmp     r1, r2
        moveq   r2, r12
        beq     LAXO5
        add     r5, sp, #0x80
        mov     lr, r3
        str     r0, [r5, +r3, lsl #2]
        mov     r4, sp
        add     r3, r3, #1
        str     r12, [r4, +lr, lsl #2]
        mov     r0, r1
        b       LAXO5
LAXO18:
        cmp     r4, lr
        bgt     LAXO9
LAXO19:
        add     r12, r12, #4
        cmp     r1, r12
        bls     LAXO13
        ldr     r4, [r12]
        cmp     r4, lr
        ble     LAXO19
        sub     r4, r1, r12
        b       LAXO10
LAXO20:
        ldr     r5, [r12]
        cmp     r5, lr
        ble     LAXO19
        b       LAXO10
LAXO21:
        mvn     r0, #5
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXO22:
        mvn     r0, #7
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}
LAXO23:
        mov     r0, #0
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r6, pc}


