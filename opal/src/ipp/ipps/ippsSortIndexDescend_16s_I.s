        .text
        .align  4
        .globl  _ippsSortIndexDescend_16s_I


_ippsSortIndexDescend_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LAXB27
        cmp     r4, #0
        beq     LAXB27
        cmp     r6, #0
        ble     LAXB28
        cmp     r6, #2
        bge     LAXB0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXB0:
        mov     r1, r6
        mov     r0, r4
        bl      ownOneTwoThreeFell
        add     r12, r5, r6, lsl #1
        add     r3, r4, r6, lsl #2
        sub     r12, r12, #2
        sub     r3, r3, #4
        mov     lr, #1
LAXB1:
        cmp     r6, #9
        bgt     LAXB7
        cmp     r12, r5
        bls     LAXB5
        add     r6, r5, #2
        add     r2, r4, #4
LAXB2:
        cmp     r6, r12
        mov     r10, r2
        mov     r9, r6
        mov     r7, r4
        mov     r8, r5
        bhi     LAXB4
LAXB3:
        ldrsh   r0, [r9]
        ldrsh   r11, [r8]
        cmp     r0, r11
        movle   r7, r10
        cmp     r0, r11
        movle   r8, r9
        add     r9, r9, #2
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAXB3
LAXB4:
        ldrsh   r9, [r12]
        ldrsh   r10, [r8]
        strh    r9, [r8]
        strh    r10, [r12], #-2
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r5
        str     r9, [r3], #-4
        bhi     LAXB2
LAXB5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r5, [r0, +lr, lsl #2]
        ldr     r4, [r1, +lr, lsl #2]
LAXB6:
        sub     r2, r12, r5
        cmp     lr, #0
        mov     r2, r2, asr #1
        add     r6, r2, #1
        bne     LAXB1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXB7:
        ldrsh   r7, [r12]
        ldrsh   r10, [r12, #-2]
        ldr     r9, [r3]
        mov     r8, r7
        cmp     r7, r10
        bge     LAXB8
        ldr     r7, [r3, #-4]
        str     r7, [r3]
        ldrsh   r7, [r12, #-2]
        strh    r7, [r12]
        mov     r10, r7
LAXB8:
        cmp     r8, r10
        bge     LAXB9
        str     r9, [r3, #-4]
        ldrsh   r7, [r12]
        strh    r8, [r12, #-2]
LAXB9:
        mov     r2, r6, asr #1
        ldrsh   r6, [r5]
        mov     r11, r2, lsl #1
        ldrsh   r0, [r5, +r11]
        add     r10, r4, r2, lsl #2
        cmp     r6, r0
        ldrlt   r2, [r4, +r2, lsl #2]
        movlt   r9, r0
        ldrge   r2, [r4]
        movge   r9, r6
        cmp     r6, r0
        ldrge   r8, [r10]
        movge   r6, r0
        ldrlt   r8, [r4]
        cmp     r9, r7
        strge   r2, [r4]
        movge   r7, r9
        bge     LAXB10
        ldr     r7, [r3]
        str     r7, [r4]
        ldrsh   r7, [r12]
LAXB10:
        strh    r7, [r5]
        ldrsh   r7, [r12]
        cmp     r9, r7
        ldrge   r2, [r3]
        movge   r9, r7
        cmp     r6, r9
        blt     LAXB11
        str     r8, [r10]
        strh    r6, [r5, +r11]
        str     r2, [r3]
        b       LAXB12
LAXB11:
        str     r2, [r10]
        strh    r9, [r5, +r11]
        str     r8, [r3]
        mov     r9, r6
LAXB12:
        strh    r9, [r12]
        ldrsh   r2, [r5, +r11]
        add     r10, r5, #2
        add     r8, r4, #4
        mov     r7, r12
        mov     r6, r3
LAXB13:
        cmp     r7, r10
        bls     LAXB19
        sub     r9, r7, r10
        cmp     r9, #0xC
        bcc     LAXB26
        ldrsh   r11, [r10]
        cmp     r11, r2
        blt     LAXB16
LAXB14:
        add     r10, r10, #2
        ldrsh   r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXB15
        add     r10, r10, #2
        ldrsh   r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXB15
        add     r10, r10, #2
        ldrsh   r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXB15
        add     r10, r10, #2
        ldrsh   r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXB15
        add     r10, r10, #2
        ldrsh   r9, [r10]
        sub     r11, r7, #0xC
        cmp     r10, r11
        add     r8, r8, #4
        bcs     LAXB24
        cmp     r9, r2
        bge     LAXB14
LAXB15:
        cmp     r7, r10
        subhi   r9, r7, r10
        bls     LAXB19
LAXB16:
        cmp     r9, #0xC
        bcc     LAXB18
        add     r9, r10, #0xC
LAXB17:
        ldrsh   r11, [r7]
        cmp     r11, r2
        bge     LAXB19
        sub     r7, r7, #2
        ldrsh   r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXB19
        sub     r7, r7, #2
        ldrsh   r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXB19
        sub     r7, r7, #2
        ldrsh   r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXB19
        sub     r7, r7, #2
        ldrsh   r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXB19
        sub     r7, r7, #2
        cmp     r7, r9
        sub     r6, r6, #4
        bhi     LAXB17
LAXB18:
        ldrsh   r9, [r7]
        cmp     r9, r2
        bge     LAXB19
        sub     r7, r7, #2
        cmp     r7, r10
        sub     r6, r6, #4
        bhi     LAXB18
LAXB19:
        cmp     r10, r7
        beq     LAXB20
        ldrsh   r9, [r7]
        ldrsh   r11, [r10]
        strh    r9, [r10]
        strh    r11, [r7]
        ldr     r9, [r6]
        ldr     r11, [r8]
        str     r9, [r8]
        str     r11, [r6]
        b       LAXB13
LAXB20:
        ldrsh   r11, [r10, #-2]
        sub     r9, r10, #2
        sub     r8, r8, #4
        cmp     r11, r2
        bne     LAXB22
LAXB21:
        cmp     r9, r5
        bls     LAXB22
        sub     r9, r9, #2
        ldrsh   r10, [r9]
        sub     r8, r8, #4
        cmp     r10, r2
        beq     LAXB21
LAXB22:
        sub     r10, r12, r7
        sub     r2, r9, r5
        mov     r10, r10, asr #1
        cmp     r10, r2, asr #1
        ble     LAXB23
        cmp     r9, r5
        moveq   r5, r7
        moveq   r4, r6
        beq     LAXB6
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
        b       LAXB6
LAXB23:
        cmp     r7, r12
        moveq   r3, r8
        moveq   r12, r9
        beq     LAXB6
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
        b       LAXB6
LAXB24:
        cmp     r9, r2
        blt     LAXB15
LAXB25:
        add     r10, r10, #2
        cmp     r7, r10
        add     r8, r8, #4
        bls     LAXB19
        ldrsh   r9, [r10]
        cmp     r9, r2
        bge     LAXB25
        sub     r9, r7, r10
        b       LAXB16
LAXB26:
        ldrsh   r11, [r10]
        cmp     r11, r2
        bge     LAXB25
        b       LAXB16
LAXB27:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXB28:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}


