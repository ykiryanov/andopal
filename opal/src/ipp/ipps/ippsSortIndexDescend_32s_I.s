        .text
        .align  4
        .globl  _ippsSortIndexDescend_32s_I


_ippsSortIndexDescend_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LAWZ27
        cmp     r4, #0
        beq     LAWZ27
        cmp     r6, #0
        ble     LAWZ28
        cmp     r6, #2
        bge     LAWZ0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAWZ0:
        mov     r1, r6
        mov     r0, r4
        bl      ownOneTwoThreeFell
        add     r12, r5, r6, lsl #2
        add     r3, r4, r6, lsl #2
        sub     r12, r12, #4
        sub     r3, r3, #4
        mov     lr, #1
LAWZ1:
        cmp     r6, #9
        bgt     LAWZ7
        cmp     r12, r5
        bls     LAWZ5
        add     r6, r5, #4
        add     r2, r4, #4
LAWZ2:
        cmp     r6, r12
        mov     r10, r2
        mov     r9, r6
        mov     r7, r4
        mov     r8, r5
        bhi     LAWZ4
LAWZ3:
        ldr     r0, [r9]
        ldr     r11, [r8]
        cmp     r0, r11
        movle   r7, r10
        cmp     r0, r11
        movle   r8, r9
        add     r9, r9, #4
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAWZ3
LAWZ4:
        ldr     r9, [r12]
        ldr     r10, [r8]
        str     r9, [r8]
        str     r10, [r12], #-4
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r5
        str     r9, [r3], #-4
        bhi     LAWZ2
LAWZ5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r5, [r0, +lr, lsl #2]
        ldr     r4, [r1, +lr, lsl #2]
LAWZ6:
        sub     r2, r12, r5
        cmp     lr, #0
        mov     r2, r2, asr #2
        add     r6, r2, #1
        bne     LAWZ1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAWZ7:
        ldr     r7, [r12]
        ldr     r10, [r12, #-4]
        ldr     r9, [r3]
        mov     r8, r7
        cmp     r7, r10
        bge     LAWZ8
        ldr     r7, [r3, #-4]
        str     r7, [r3]
        ldr     r10, [r12, #-4]
        str     r10, [r12]
        mov     r7, r10
LAWZ8:
        cmp     r8, r10
        bge     LAWZ9
        str     r9, [r3, #-4]
        ldr     r7, [r12]
        str     r8, [r12, #-4]
LAWZ9:
        mov     r6, r6, asr #1
        ldr     r0, [r5, +r6, lsl #2]
        ldr     r2, [r5]
        add     r11, r4, r6, lsl #2
        cmp     r2, r0
        ldrlt   r10, [r4, +r6, lsl #2]
        movlt   r9, r0
        ldrge   r10, [r4]
        movge   r9, r2
        cmp     r2, r0
        ldrge   r8, [r11]
        movge   r2, r0
        ldrlt   r8, [r4]
        cmp     r9, r7
        strge   r10, [r4]
        movge   r7, r9
        bge     LAWZ10
        ldr     r7, [r3]
        str     r7, [r4]
        ldr     r7, [r12]
LAWZ10:
        str     r7, [r5]
        ldr     r7, [r12]
        cmp     r9, r7
        ldrge   r10, [r3]
        movge   r9, r7
        cmp     r2, r9
        blt     LAWZ11
        str     r8, [r11]
        str     r2, [r5, +r6, lsl #2]
        str     r10, [r3]
        b       LAWZ12
LAWZ11:
        str     r10, [r11]
        str     r9, [r5, +r6, lsl #2]
        str     r8, [r3]
        mov     r9, r2
LAWZ12:
        str     r9, [r12]
        ldr     r2, [r5, +r6, lsl #2]
        add     r10, r5, #4
        add     r8, r4, #4
        mov     r7, r12
        mov     r6, r3
LAWZ13:
        cmp     r7, r10
        bls     LAWZ19
        sub     r9, r7, r10
        cmp     r9, #0x18
        bcc     LAWZ26
        ldr     r11, [r10]
        cmp     r11, r2
        blt     LAWZ16
LAWZ14:
        add     r10, r10, #4
        ldr     r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWZ15
        add     r10, r10, #4
        ldr     r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWZ15
        add     r10, r10, #4
        ldr     r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWZ15
        add     r10, r10, #4
        ldr     r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWZ15
        add     r10, r10, #4
        ldr     r9, [r10]
        sub     r11, r7, #0x18
        cmp     r10, r11
        add     r8, r8, #4
        bcs     LAWZ24
        cmp     r9, r2
        bge     LAWZ14
LAWZ15:
        cmp     r7, r10
        subhi   r9, r7, r10
        bls     LAWZ19
LAWZ16:
        cmp     r9, #0x18
        bcc     LAWZ18
        add     r9, r10, #0x18
LAWZ17:
        ldr     r11, [r7]
        cmp     r11, r2
        bge     LAWZ19
        sub     r7, r7, #4
        ldr     r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWZ19
        sub     r7, r7, #4
        ldr     r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWZ19
        sub     r7, r7, #4
        ldr     r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWZ19
        sub     r7, r7, #4
        ldr     r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWZ19
        sub     r7, r7, #4
        cmp     r7, r9
        sub     r6, r6, #4
        bhi     LAWZ17
LAWZ18:
        ldr     r9, [r7]
        cmp     r9, r2
        bge     LAWZ19
        sub     r7, r7, #4
        cmp     r7, r10
        sub     r6, r6, #4
        bhi     LAWZ18
LAWZ19:
        cmp     r10, r7
        beq     LAWZ20
        ldr     r9, [r7]
        ldr     r11, [r10]
        str     r9, [r10]
        str     r11, [r7]
        ldr     r9, [r6]
        ldr     r11, [r8]
        str     r9, [r8]
        str     r11, [r6]
        b       LAWZ13
LAWZ20:
        ldr     r11, [r10, #-4]
        sub     r9, r10, #4
        sub     r8, r8, #4
        cmp     r11, r2
        bne     LAWZ22
LAWZ21:
        cmp     r9, r5
        bls     LAWZ22
        sub     r9, r9, #4
        ldr     r10, [r9]
        sub     r8, r8, #4
        cmp     r10, r2
        beq     LAWZ21
LAWZ22:
        sub     r10, r12, r7
        sub     r2, r9, r5
        mov     r10, r10, asr #2
        cmp     r10, r2, asr #2
        ble     LAWZ23
        cmp     r9, r5
        moveq   r5, r7
        moveq   r4, r6
        beq     LAWZ6
        add     r11, sp, #0x80
        add     r10, sp, #6, 26
        add     r2, sp, #1, 24
        str     r12, [r11, +lr, lsl #2]
        str     r7, [r10, +lr, lsl #2]
        str     r6, [r2, +lr, lsl #2]
        mov     r12, sp
        add     lr, lr, #1
        str     r3, [r12, +lr, lsl #2]
        mov     r3, r8
        mov     r12, r9
        b       LAWZ6
LAWZ23:
        cmp     r7, r12
        moveq   r3, r8
        moveq   r12, r9
        beq     LAWZ6
        add     r11, sp, #6, 26
        add     r2, sp, #1, 24
        add     r10, sp, #0x80
        str     r5, [r11, +lr, lsl #2]
        str     r4, [r2, +lr, lsl #2]
        str     r9, [r10, +lr, lsl #2]
        mov     r5, sp
        add     lr, lr, #1
        str     r8, [r5, +lr, lsl #2]
        mov     r4, r6
        mov     r5, r7
        b       LAWZ6
LAWZ24:
        cmp     r9, r2
        blt     LAWZ15
LAWZ25:
        add     r10, r10, #4
        cmp     r7, r10
        add     r8, r8, #4
        bls     LAWZ19
        ldr     r9, [r10]
        cmp     r9, r2
        bge     LAWZ25
        sub     r9, r7, r10
        b       LAWZ16
LAWZ26:
        ldr     r11, [r10]
        cmp     r11, r2
        bge     LAWZ25
        b       LAWZ16
LAWZ27:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAWZ28:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}


