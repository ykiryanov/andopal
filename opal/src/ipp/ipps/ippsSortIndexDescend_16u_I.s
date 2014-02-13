        .text
        .align  4
        .globl  _ippsSortIndexDescend_16u_I


_ippsSortIndexDescend_16u_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LAXA27
        cmp     r4, #0
        beq     LAXA27
        cmp     r6, #0
        ble     LAXA28
        cmp     r6, #2
        bge     LAXA0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXA0:
        mov     r1, r6
        mov     r0, r4
        bl      ownOneTwoThreeFell
        add     r12, r5, r6, lsl #1
        add     r3, r4, r6, lsl #2
        sub     r12, r12, #2
        sub     r3, r3, #4
        mov     lr, #1
LAXA1:
        cmp     r6, #9
        bgt     LAXA7
        cmp     r12, r5
        bls     LAXA5
        add     r6, r5, #2
        add     r2, r4, #4
LAXA2:
        cmp     r6, r12
        mov     r10, r2
        mov     r9, r6
        mov     r7, r4
        mov     r8, r5
        bhi     LAXA4
LAXA3:
        ldrh    r0, [r9]
        ldrh    r11, [r8]
        cmp     r0, r11
        movle   r7, r10
        cmp     r0, r11
        movle   r8, r9
        add     r9, r9, #2
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAXA3
LAXA4:
        ldrh    r9, [r12]
        ldrh    r10, [r8]
        strh    r9, [r8]
        strh    r10, [r12], #-2
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r5
        str     r9, [r3], #-4
        bhi     LAXA2
LAXA5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r5, [r0, +lr, lsl #2]
        ldr     r4, [r1, +lr, lsl #2]
LAXA6:
        sub     r2, r12, r5
        cmp     lr, #0
        mov     r2, r2, asr #1
        add     r6, r2, #1
        bne     LAXA1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXA7:
        ldrh    r7, [r12]
        ldrh    r10, [r12, #-2]
        ldr     r9, [r3]
        mov     r8, r7
        cmp     r7, r10
        bge     LAXA8
        ldr     r7, [r3, #-4]
        str     r7, [r3]
        ldrh    r7, [r12, #-2]
        strh    r7, [r12]
        mov     r10, r7
LAXA8:
        cmp     r8, r10
        bge     LAXA9
        str     r9, [r3, #-4]
        ldrh    r7, [r12]
        strh    r8, [r12, #-2]
LAXA9:
        mov     r2, r6, asr #1
        ldrh    r6, [r5]
        mov     r11, r2, lsl #1
        ldrh    r0, [r5, +r11]
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
        bge     LAXA10
        ldr     r7, [r3]
        str     r7, [r4]
        ldrh    r7, [r12]
LAXA10:
        strh    r7, [r5]
        ldrh    r7, [r12]
        cmp     r9, r7
        ldrge   r2, [r3]
        movge   r9, r7
        cmp     r6, r9
        blt     LAXA11
        str     r8, [r10]
        strh    r6, [r5, +r11]
        str     r2, [r3]
        b       LAXA12
LAXA11:
        str     r2, [r10]
        strh    r9, [r5, +r11]
        str     r8, [r3]
        mov     r9, r6
LAXA12:
        strh    r9, [r12]
        ldrh    r2, [r5, +r11]
        add     r10, r5, #2
        add     r8, r4, #4
        mov     r7, r12
        mov     r6, r3
LAXA13:
        cmp     r7, r10
        bls     LAXA19
        sub     r9, r7, r10
        cmp     r9, #0xC
        bcc     LAXA26
        ldrh    r11, [r10]
        cmp     r11, r2
        blt     LAXA16
LAXA14:
        add     r10, r10, #2
        ldrh    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXA15
        add     r10, r10, #2
        ldrh    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXA15
        add     r10, r10, #2
        ldrh    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXA15
        add     r10, r10, #2
        ldrh    r9, [r10]
        add     r8, r8, #4
        cmp     r9, r2
        blt     LAXA15
        add     r10, r10, #2
        ldrh    r9, [r10]
        sub     r11, r7, #0xC
        cmp     r10, r11
        add     r8, r8, #4
        bcs     LAXA24
        cmp     r9, r2
        bge     LAXA14
LAXA15:
        cmp     r7, r10
        subhi   r9, r7, r10
        bls     LAXA19
LAXA16:
        cmp     r9, #0xC
        bcc     LAXA18
        add     r9, r10, #0xC
LAXA17:
        ldrh    r11, [r7]
        cmp     r11, r2
        bge     LAXA19
        sub     r7, r7, #2
        ldrh    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXA19
        sub     r7, r7, #2
        ldrh    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXA19
        sub     r7, r7, #2
        ldrh    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXA19
        sub     r7, r7, #2
        ldrh    r11, [r7]
        sub     r6, r6, #4
        cmp     r11, r2
        bge     LAXA19
        sub     r7, r7, #2
        cmp     r7, r9
        sub     r6, r6, #4
        bhi     LAXA17
LAXA18:
        ldrh    r9, [r7]
        cmp     r9, r2
        bge     LAXA19
        sub     r7, r7, #2
        cmp     r7, r10
        sub     r6, r6, #4
        bhi     LAXA18
LAXA19:
        cmp     r10, r7
        beq     LAXA20
        ldrh    r9, [r7]
        ldrh    r11, [r10]
        strh    r9, [r10]
        strh    r11, [r7]
        ldr     r9, [r6]
        ldr     r11, [r8]
        str     r9, [r8]
        str     r11, [r6]
        b       LAXA13
LAXA20:
        ldrh    r11, [r10, #-2]
        sub     r9, r10, #2
        sub     r8, r8, #4
        cmp     r11, r2
        bne     LAXA22
LAXA21:
        cmp     r9, r5
        bls     LAXA22
        sub     r9, r9, #2
        ldrh    r10, [r9]
        sub     r8, r8, #4
        cmp     r10, r2
        beq     LAXA21
LAXA22:
        sub     r10, r12, r7
        sub     r2, r9, r5
        mov     r10, r10, asr #1
        cmp     r10, r2, asr #1
        ble     LAXA23
        cmp     r9, r5
        moveq   r5, r7
        moveq   r4, r6
        beq     LAXA6
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
        b       LAXA6
LAXA23:
        cmp     r7, r12
        moveq   r3, r8
        moveq   r12, r9
        beq     LAXA6
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
        b       LAXA6
LAXA24:
        cmp     r9, r2
        blt     LAXA15
LAXA25:
        add     r10, r10, #2
        cmp     r7, r10
        add     r8, r8, #4
        bls     LAXA19
        ldrh    r9, [r10]
        cmp     r9, r2
        bge     LAXA25
        sub     r9, r7, r10
        b       LAXA16
LAXA26:
        ldrh    r11, [r10]
        cmp     r11, r2
        bge     LAXA25
        b       LAXA16
LAXA27:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXA28:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}


