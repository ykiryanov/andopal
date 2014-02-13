        .text
        .align  4
        .globl  _ippsSortIndexAscend_32s_I


_ippsSortIndexAscend_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAXD26
        cmp     r5, #0
        beq     LAXD26
        cmp     r4, #0
        ble     LAXD27
        cmp     r4, #2
        bge     LAXD0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXD0:
        mov     r1, r4
        mov     r0, r5
        bl      ownOneTwoThreeFell
        add     r12, r6, r4, lsl #2
        add     r3, r5, r4, lsl #2
        sub     r12, r12, #4
        sub     r3, r3, #4
        mov     lr, #1
LAXD1:
        cmp     r4, #9
        bgt     LAXD7
        cmp     r12, r6
        bls     LAXD5
        add     r4, r6, #4
        add     r2, r5, #4
LAXD2:
        cmp     r4, r12
        mov     r10, r2
        mov     r9, r4
        mov     r7, r5
        mov     r8, r6
        bhi     LAXD4
LAXD3:
        ldr     r0, [r9]
        ldr     r11, [r8]
        cmp     r0, r11
        movge   r7, r10
        cmp     r0, r11
        movge   r8, r9
        add     r9, r9, #4
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAXD3
LAXD4:
        ldr     r9, [r12]
        ldr     r10, [r8]
        str     r9, [r8]
        str     r10, [r12], #-4
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r6
        str     r9, [r3], #-4
        bhi     LAXD2
LAXD5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r6, [r0, +lr, lsl #2]
        ldr     r5, [r1, +lr, lsl #2]
LAXD6:
        sub     r2, r12, r6
        cmp     lr, #0
        mov     r2, r2, asr #2
        add     r4, r2, #1
        bne     LAXD1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXD7:
        ldr     r9, [r6]
        ldr     r0, [r6, #4]
        ldr     r11, [r5]
        mov     r10, r9
        add     r8, r6, #4
        cmp     r9, r0
        add     r7, r5, #4
        bge     LAXD8
        ldr     r9, [r7]
        str     r9, [r5]
        ldr     r0, [r6, #4]
        str     r0, [r6]
        mov     r9, r0
LAXD8:
        cmp     r10, r0
        bge     LAXD9
        str     r11, [r7]
        ldr     r9, [r6]
        str     r10, [r6, #4]
LAXD9:
        mov     r4, r4, asr #1
        ldr     r2, [r6, +r4, lsl #2]
        add     r0, r5, r4, lsl #2
        cmp     r9, r2
        ldrle   r11, [r5]
        movle   r10, r9
        ldrgt   r11, [r5, +r4, lsl #2]
        movgt   r10, r2
        cmp     r9, r2
        movle   r9, r2
        ldrle   r2, [r0]
        ldrgt   r2, [r5]
        ldr     r1, [r12]
        cmp     r10, r1
        strle   r10, [r6]
        movle   r1, r11
        strgt   r1, [r6]
        ldrgt   r1, [r3]
        str     r1, [r5]
        ldr     r1, [r12]
        cmp     r10, r1
        movle   r10, r1
        ldrle   r11, [r3]
        cmp     r10, r9
        blt     LAXD10
        str     r9, [r6, +r4, lsl #2]
        str     r2, [r0]
        str     r10, [r12]
        b       LAXD11
LAXD10:
        str     r10, [r6, +r4, lsl #2]
        str     r11, [r0]
        str     r9, [r12]
        mov     r11, r2
LAXD11:
        str     r11, [r3]
        ldr     r2, [r6, +r4, lsl #2]
        mov     r9, r12
        mov     r4, r3
LAXD12:
        cmp     r9, r8
        bls     LAXD18
        sub     r10, r9, r8
        cmp     r10, #0x18
        bcc     LAXD25
        ldr     r11, [r8]
        cmp     r11, r2
        bgt     LAXD15
LAXD13:
        add     r8, r8, #4
        ldr     r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXD14
        add     r8, r8, #4
        ldr     r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXD14
        add     r8, r8, #4
        ldr     r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXD14
        add     r8, r8, #4
        ldr     r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXD14
        add     r8, r8, #4
        ldr     r10, [r8]
        sub     r11, r9, #0x18
        cmp     r8, r11
        add     r7, r7, #4
        bcs     LAXD23
        cmp     r10, r2
        ble     LAXD13
LAXD14:
        cmp     r9, r8
        subhi   r10, r9, r8
        bls     LAXD18
LAXD15:
        cmp     r10, #0x18
        bcc     LAXD17
        add     r10, r8, #0x18
LAXD16:
        ldr     r11, [r9]
        cmp     r11, r2
        ble     LAXD18
        sub     r9, r9, #4
        ldr     r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXD18
        sub     r9, r9, #4
        ldr     r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXD18
        sub     r9, r9, #4
        ldr     r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXD18
        sub     r9, r9, #4
        ldr     r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXD18
        sub     r9, r9, #4
        cmp     r9, r10
        sub     r4, r4, #4
        bhi     LAXD16
LAXD17:
        ldr     r10, [r9]
        cmp     r10, r2
        ble     LAXD18
        sub     r9, r9, #4
        cmp     r9, r8
        sub     r4, r4, #4
        bhi     LAXD17
LAXD18:
        cmp     r8, r9
        beq     LAXD19
        ldr     r10, [r9]
        ldr     r11, [r8]
        str     r10, [r8]
        str     r11, [r9]
        ldr     r10, [r4]
        ldr     r11, [r7]
        str     r10, [r7]
        str     r11, [r4]
        b       LAXD12
LAXD19:
        ldr     r10, [r8, #-4]!
        sub     r7, r7, #4
        cmp     r10, r2
        bne     LAXD21
LAXD20:
        cmp     r8, r6
        bls     LAXD21
        sub     r8, r8, #4
        ldr     r10, [r8]
        sub     r7, r7, #4
        cmp     r10, r2
        beq     LAXD20
LAXD21:
        sub     r10, r12, r9
        sub     r2, r8, r6
        mov     r10, r10, asr #2
        cmp     r10, r2, asr #2
        ble     LAXD22
        cmp     r8, r6
        moveq   r6, r9
        moveq   r5, r4
        beq     LAXD6
        add     r11, sp, #0x80
        add     r10, sp, #6, 26
        add     r2, sp, #1, 24
        str     r12, [r11, +lr, lsl #2]
        str     r9, [r10, +lr, lsl #2]
        str     r4, [r2, +lr, lsl #2]
        mov     r12, sp
        add     lr, lr, #1
        str     r3, [r12, +lr, lsl #2]
        mov     r12, r8
        mov     r3, r7
        b       LAXD6
LAXD22:
        cmp     r9, r12
        moveq   r12, r8
        moveq   r3, r7
        beq     LAXD6
        add     r11, sp, #6, 26
        add     r2, sp, #1, 24
        add     r10, sp, #0x80
        str     r6, [r11, +lr, lsl #2]
        str     r5, [r2, +lr, lsl #2]
        str     r8, [r10, +lr, lsl #2]
        mov     r6, sp
        add     lr, lr, #1
        str     r7, [r6, +lr, lsl #2]
        mov     r6, r9
        mov     r5, r4
        b       LAXD6
LAXD23:
        cmp     r10, r2
        bgt     LAXD14
LAXD24:
        add     r8, r8, #4
        cmp     r9, r8
        add     r7, r7, #4
        bls     LAXD18
        ldr     r10, [r8]
        cmp     r10, r2
        ble     LAXD24
        sub     r10, r9, r8
        b       LAXD15
LAXD25:
        ldr     r11, [r8]
        cmp     r11, r2
        ble     LAXD24
        b       LAXD15
LAXD26:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXD27:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}


