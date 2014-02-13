        .text
        .align  4
        .globl  _ippsSortIndexAscend_16s_I


_ippsSortIndexAscend_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAXF26
        cmp     r5, #0
        beq     LAXF26
        cmp     r4, #0
        ble     LAXF27
        cmp     r4, #2
        bge     LAXF0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXF0:
        mov     r1, r4
        mov     r0, r5
        bl      ownOneTwoThreeFell
        add     r12, r6, r4, lsl #1
        add     r3, r5, r4, lsl #2
        sub     r12, r12, #2
        sub     r3, r3, #4
        mov     lr, #1
LAXF1:
        cmp     r4, #9
        bgt     LAXF7
        cmp     r12, r6
        bls     LAXF5
        add     r4, r6, #2
        add     r2, r5, #4
LAXF2:
        cmp     r4, r12
        mov     r10, r2
        mov     r9, r4
        mov     r7, r5
        mov     r8, r6
        bhi     LAXF4
LAXF3:
        ldrsh   r0, [r9]
        ldrsh   r11, [r8]
        cmp     r0, r11
        movge   r7, r10
        cmp     r0, r11
        movge   r8, r9
        add     r9, r9, #2
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAXF3
LAXF4:
        ldrsh   r9, [r12]
        ldrsh   r10, [r8]
        strh    r9, [r8]
        strh    r10, [r12], #-2
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r6
        str     r9, [r3], #-4
        bhi     LAXF2
LAXF5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r6, [r0, +lr, lsl #2]
        ldr     r5, [r1, +lr, lsl #2]
LAXF6:
        sub     r2, r12, r6
        cmp     lr, #0
        mov     r2, r2, asr #1
        add     r4, r2, #1
        bne     LAXF1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXF7:
        ldrsh   r9, [r6]
        ldrsh   r0, [r6, #2]
        ldr     r11, [r5]
        mov     r10, r9
        add     r8, r6, #2
        cmp     r9, r0
        add     r7, r5, #4
        bge     LAXF8
        ldr     r9, [r7]
        str     r9, [r5]
        ldrsh   r9, [r6, #2]
        strh    r9, [r6]
        mov     r0, r9
LAXF8:
        cmp     r10, r0
        bge     LAXF9
        str     r11, [r7]
        ldrsh   r9, [r6]
        strh    r10, [r6, #2]
LAXF9:
        mov     r2, r4, asr #1
        mov     r0, r2, lsl #1
        ldrsh   r4, [r6, +r0]
        add     r11, r5, r2, lsl #2
        cmp     r9, r4
        ldrle   r2, [r5]
        movle   r10, r9
        ldrgt   r2, [r5, +r2, lsl #2]
        movgt   r10, r4
        cmp     r9, r4
        movle   r9, r4
        ldrle   r4, [r11]
        ldrgt   r4, [r5]
        ldrsh   r1, [r12]
        cmp     r10, r1
        strleh  r10, [r6]
        movle   r1, r2
        strgth  r1, [r6]
        ldrgt   r1, [r3]
        str     r1, [r5]
        ldrsh   r1, [r12]
        cmp     r10, r1
        movle   r10, r1
        ldrle   r2, [r3]
        cmp     r10, r9
        blt     LAXF10
        strh    r9, [r6, +r0]
        str     r4, [r11]
        strh    r10, [r12]
        b       LAXF11
LAXF10:
        strh    r10, [r6, +r0]
        str     r2, [r11]
        strh    r9, [r12]
        mov     r2, r4
LAXF11:
        str     r2, [r3]
        ldrsh   r2, [r6, +r0]
        mov     r9, r12
        mov     r4, r3
LAXF12:
        cmp     r9, r8
        bls     LAXF18
        sub     r10, r9, r8
        cmp     r10, #0xC
        bcc     LAXF25
        ldrsh   r11, [r8]
        cmp     r11, r2
        bgt     LAXF15
LAXF13:
        add     r8, r8, #2
        ldrsh   r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXF14
        add     r8, r8, #2
        ldrsh   r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXF14
        add     r8, r8, #2
        ldrsh   r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXF14
        add     r8, r8, #2
        ldrsh   r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXF14
        add     r8, r8, #2
        ldrsh   r10, [r8]
        sub     r11, r9, #0xC
        cmp     r8, r11
        add     r7, r7, #4
        bcs     LAXF23
        cmp     r10, r2
        ble     LAXF13
LAXF14:
        cmp     r9, r8
        subhi   r10, r9, r8
        bls     LAXF18
LAXF15:
        cmp     r10, #0xC
        bcc     LAXF17
        add     r10, r8, #0xC
LAXF16:
        ldrsh   r11, [r9]
        cmp     r11, r2
        ble     LAXF18
        sub     r9, r9, #2
        ldrsh   r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXF18
        sub     r9, r9, #2
        ldrsh   r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXF18
        sub     r9, r9, #2
        ldrsh   r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXF18
        sub     r9, r9, #2
        ldrsh   r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXF18
        sub     r9, r9, #2
        cmp     r9, r10
        sub     r4, r4, #4
        bhi     LAXF16
LAXF17:
        ldrsh   r10, [r9]
        cmp     r10, r2
        ble     LAXF18
        sub     r9, r9, #2
        cmp     r9, r8
        sub     r4, r4, #4
        bhi     LAXF17
LAXF18:
        cmp     r8, r9
        beq     LAXF19
        ldrsh   r10, [r9]
        ldrsh   r11, [r8]
        strh    r10, [r8]
        strh    r11, [r9]
        ldr     r10, [r4]
        ldr     r11, [r7]
        str     r10, [r7]
        str     r11, [r4]
        b       LAXF12
LAXF19:
        ldrsh   r10, [r8, #-2]!
        sub     r7, r7, #4
        cmp     r10, r2
        bne     LAXF21
LAXF20:
        cmp     r8, r6
        bls     LAXF21
        sub     r8, r8, #2
        ldrsh   r10, [r8]
        sub     r7, r7, #4
        cmp     r10, r2
        beq     LAXF20
LAXF21:
        sub     r10, r12, r9
        sub     r2, r8, r6
        mov     r10, r10, asr #1
        cmp     r10, r2, asr #1
        ble     LAXF22
        cmp     r8, r6
        moveq   r6, r9
        moveq   r5, r4
        beq     LAXF6
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
        b       LAXF6
LAXF22:
        cmp     r9, r12
        moveq   r12, r8
        moveq   r3, r7
        beq     LAXF6
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
        b       LAXF6
LAXF23:
        cmp     r10, r2
        bgt     LAXF14
LAXF24:
        add     r8, r8, #2
        cmp     r9, r8
        add     r7, r7, #4
        bls     LAXF18
        ldrsh   r10, [r8]
        cmp     r10, r2
        ble     LAXF24
        sub     r10, r9, r8
        b       LAXF15
LAXF25:
        ldrsh   r11, [r8]
        cmp     r11, r2
        ble     LAXF24
        b       LAXF15
LAXF26:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXF27:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}


