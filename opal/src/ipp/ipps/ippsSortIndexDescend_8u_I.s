        .text
        .align  4
        .globl  _ippsSortIndexDescend_8u_I


_ippsSortIndexDescend_8u_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LAWY27
        cmp     r4, #0
        beq     LAWY27
        cmp     r6, #0
        ble     LAWY28
        cmp     r6, #2
        bge     LAWY0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAWY0:
        mov     r1, r6
        mov     r0, r4
        bl      ownOneTwoThreeFell
        add     r12, r5, r6
        add     r3, r4, r6, lsl #2
        sub     r12, r12, #1
        sub     r3, r3, #4
        mov     lr, #1
LAWY1:
        cmp     r6, #9
        bgt     LAWY7
        cmp     r12, r5
        bls     LAWY5
        add     r6, r5, #1
        add     r2, r4, #4
LAWY2:
        cmp     r6, r12
        mov     r10, r2
        mov     r9, r6
        mov     r7, r4
        mov     r8, r5
        bhi     LAWY4
LAWY3:
        ldrb    r0, [r9]
        ldrb    r11, [r8]
        cmp     r0, r11
        movle   r7, r10
        cmp     r0, r11
        movle   r8, r9
        add     r9, r9, #1
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAWY3
LAWY4:
        ldrb    r9, [r12]
        ldrb    r10, [r8]
        strb    r9, [r8]
        strb    r10, [r12], #-1
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r5
        str     r9, [r3], #-4
        bhi     LAWY2
LAWY5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r5, [r0, +lr, lsl #2]
        ldr     r4, [r1, +lr, lsl #2]
LAWY6:
        sub     r2, r12, r5
        cmp     lr, #0
        add     r6, r2, #1
        bne     LAWY1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAWY7:
        ldrb    r7, [r12]
        ldrb    r10, [r12, #-1]
        ldr     r9, [r3]
        mov     r8, r7
        cmp     r7, r10
        bge     LAWY8
        ldr     r7, [r3, #-4]
        str     r7, [r3]
        ldrb    r7, [r12, #-1]
        strb    r7, [r12]
        mov     r10, r7
LAWY8:
        cmp     r8, r10
        bge     LAWY9
        str     r9, [r3, #-4]
        ldrb    r7, [r12]
        strb    r8, [r12, #-1]
LAWY9:
        ldrb    r0, [r5, +r6, asr #1]
        ldrb    r8, [r5]
        mov     r6, r6, asr #1
        add     r11, r4, r6, lsl #2
        cmp     r8, r0
        ldrlt   r10, [r4, +r6, lsl #2]
        movlt   r9, r0
        ldrge   r10, [r4]
        movge   r9, r8
        cmp     r8, r0
        ldrge   r2, [r11]
        movge   r8, r0
        ldrlt   r2, [r4]
        cmp     r9, r7
        strge   r10, [r4]
        movge   r7, r9
        bge     LAWY10
        ldr     r7, [r3]
        str     r7, [r4]
        ldrb    r7, [r12]
LAWY10:
        strb    r7, [r5]
        ldrb    r7, [r12]
        cmp     r9, r7
        ldrge   r10, [r3]
        movge   r9, r7
        cmp     r8, r9
        blt     LAWY11
        str     r2, [r11]
        strb    r8, [r5, +r6]
        str     r10, [r3]
        b       LAWY12
LAWY11:
        str     r10, [r11]
        strb    r9, [r5, +r6]
        str     r2, [r3]
        mov     r9, r8
LAWY12:
        strb    r9, [r12]
        ldrb    r2, [r5, +r6]
        add     r10, r5, #1
        add     r8, r4, #4
        mov     r7, r12
        mov     r6, r3
LAWY13:
        cmp     r7, r10
        bls     LAWY19
        sub     r9, r7, r10
        cmp     r9, #6
        bcc     LAWY26
        ldrb    r11, [r10]
        cmp     r11, r2
        blt     LAWY16
LAWY14:
        add     r10, r10, #1
        ldrb    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWY15
        add     r10, r10, #1
        ldrb    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWY15
        add     r10, r10, #1
        ldrb    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWY15
        add     r10, r10, #1
        ldrb    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAWY15
        add     r10, r10, #1
        ldrb    r9, [r10]
        sub     r11, r7, #6
        cmp     r10, r11
        add     r8, r8, #4
        bcs     LAWY24
        cmp     r9, r2
        bge     LAWY14
LAWY15:
        cmp     r7, r10
        subhi   r9, r7, r10
        bls     LAWY19
LAWY16:
        cmp     r9, #6
        bcc     LAWY18
        add     r9, r10, #6
LAWY17:
        ldrb    r11, [r7]
        cmp     r11, r2
        bge     LAWY19
        sub     r7, r7, #1
        ldrb    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWY19
        sub     r7, r7, #1
        ldrb    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWY19
        sub     r7, r7, #1
        ldrb    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWY19
        sub     r7, r7, #1
        ldrb    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAWY19
        sub     r7, r7, #1
        cmp     r7, r9
        sub     r6, r6, #4
        bhi     LAWY17
LAWY18:
        ldrb    r9, [r7]
        cmp     r9, r2
        bge     LAWY19
        sub     r7, r7, #1
        cmp     r7, r10
        sub     r6, r6, #4
        bhi     LAWY18
LAWY19:
        cmp     r10, r7
        beq     LAWY20
        ldrb    r9, [r7]
        ldrb    r11, [r10]
        strb    r9, [r10]
        strb    r11, [r7]
        ldr     r9, [r6]
        ldr     r11, [r8]
        str     r9, [r8]
        str     r11, [r6]
        b       LAWY13
LAWY20:
        ldrb    r11, [r10, #-1]
        sub     r9, r10, #1
        sub     r8, r8, #4
        cmp     r11, r2
        bne     LAWY22
LAWY21:
        cmp     r9, r5
        bls     LAWY22
        sub     r9, r9, #1
        ldrb    r10, [r9]
        sub     r8, r8, #4
        cmp     r10, r2
        beq     LAWY21
LAWY22:
        sub     r10, r9, r5
        sub     r2, r12, r7
        cmp     r10, r2
        bge     LAWY23
        cmp     r9, r5
        moveq   r5, r7
        moveq   r4, r6
        beq     LAWY6
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
        b       LAWY6
LAWY23:
        cmp     r7, r12
        moveq   r3, r8
        moveq   r12, r9
        beq     LAWY6
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
        b       LAWY6
LAWY24:
        cmp     r9, r2
        blt     LAWY15
LAWY25:
        add     r10, r10, #1
        cmp     r7, r10
        add     r8, r8, #4
        bls     LAWY19
        ldrb    r9, [r10]
        cmp     r9, r2
        bge     LAWY25
        sub     r9, r7, r10
        b       LAWY16
LAWY26:
        ldrb    r11, [r10]
        cmp     r11, r2
        bge     LAWY25
        b       LAWY16
LAWY27:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAWY28:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}


