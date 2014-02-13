        .text
        .align  4
        .globl  _ippsSortIndexAscend_8u_I


_ippsSortIndexAscend_8u_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #2, 24
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAXC26
        cmp     r5, #0
        beq     LAXC26
        cmp     r4, #0
        ble     LAXC27
        cmp     r4, #2
        bge     LAXC0
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXC0:
        mov     r1, r4
        mov     r0, r5
        bl      ownOneTwoThreeFell
        add     r12, r6, r4
        add     r3, r5, r4, lsl #2
        sub     r12, r12, #1
        sub     r3, r3, #4
        mov     lr, #1
LAXC1:
        cmp     r4, #9
        bgt     LAXC7
        cmp     r12, r6
        bls     LAXC5
        add     r4, r6, #1
        add     r2, r5, #4
LAXC2:
        cmp     r4, r12
        mov     r10, r2
        mov     r9, r4
        mov     r7, r5
        mov     r8, r6
        bhi     LAXC4
LAXC3:
        ldrb    r0, [r9]
        ldrb    r11, [r8]
        cmp     r0, r11
        movge   r7, r10
        cmp     r0, r11
        movge   r8, r9
        add     r9, r9, #1
        cmp     r9, r12
        add     r10, r10, #4
        bls     LAXC3
LAXC4:
        ldrb    r9, [r12]
        ldrb    r10, [r8]
        strb    r9, [r8]
        strb    r10, [r12], #-1
        ldr     r8, [r3]
        ldr     r9, [r7]
        str     r8, [r7]
        cmp     r12, r6
        str     r9, [r3], #-4
        bhi     LAXC2
LAXC5:
        mov     r1, sp
        ldr     r3, [r1, +lr, lsl #2]
        sub     lr, lr, #1
        add     r2, sp, #0x80
        add     r0, sp, #6, 26
        add     r1, sp, #1, 24
        ldr     r12, [r2, +lr, lsl #2]
        ldr     r6, [r0, +lr, lsl #2]
        ldr     r5, [r1, +lr, lsl #2]
LAXC6:
        sub     r2, r12, r6
        cmp     lr, #0
        add     r4, r2, #1
        bne     LAXC1
        mov     r0, #0
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXC7:
        ldrb    r9, [r6]
        ldrb    r0, [r6, #1]
        ldr     r11, [r5]
        mov     r10, r9
        add     r8, r6, #1
        cmp     r9, r0
        add     r7, r5, #4
        bge     LAXC8
        ldr     r9, [r7]
        str     r9, [r5]
        ldrb    r9, [r6, #1]
        strb    r9, [r6]
        mov     r0, r9
LAXC8:
        cmp     r10, r0
        bge     LAXC9
        str     r11, [r7]
        ldrb    r9, [r6]
        strb    r10, [r6, #1]
LAXC9:
        ldrb    r1, [r6, +r4, asr #1]
        mov     r4, r4, asr #1
        cmp     r9, r1
        add     r0, r5, r4, lsl #2
        ldrle   r11, [r5]
        movle   r10, r9
        ldrgt   r11, [r5, +r4, lsl #2]
        movgt   r10, r1
        cmp     r9, r1
        movle   r9, r1
        ldrle   r2, [r0]
        ldrgt   r2, [r5]
        ldrb    r1, [r12]
        cmp     r10, r1
        strleb  r10, [r6]
        movle   r1, r11
        strgtb  r1, [r6]
        ldrgt   r1, [r3]
        str     r1, [r5]
        ldrb    r1, [r12]
        cmp     r10, r1
        movle   r10, r1
        ldrle   r11, [r3]
        cmp     r10, r9
        blt     LAXC10
        strb    r9, [r6, +r4]
        str     r2, [r0]
        strb    r10, [r12]
        b       LAXC11
LAXC10:
        strb    r10, [r6, +r4]
        str     r11, [r0]
        strb    r9, [r12]
        mov     r11, r2
LAXC11:
        str     r11, [r3]
        ldrb    r2, [r6, +r4]
        mov     r9, r12
        mov     r4, r3
LAXC12:
        cmp     r9, r8
        bls     LAXC18
        sub     r10, r9, r8
        cmp     r10, #6
        bcc     LAXC25
        ldrb    r11, [r8]
        cmp     r11, r2
        bgt     LAXC15
LAXC13:
        add     r8, r8, #1
        ldrb    r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXC14
        add     r8, r8, #1
        ldrb    r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXC14
        add     r8, r8, #1
        ldrb    r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXC14
        add     r8, r8, #1
        ldrb    r10, [r8]
        add     r7, r7, #4
        cmp     r10, r2
        bgt     LAXC14
        add     r8, r8, #1
        ldrb    r10, [r8]
        sub     r11, r9, #6
        cmp     r8, r11
        add     r7, r7, #4
        bcs     LAXC23
        cmp     r10, r2
        ble     LAXC13
LAXC14:
        cmp     r9, r8
        subhi   r10, r9, r8
        bls     LAXC18
LAXC15:
        cmp     r10, #6
        bcc     LAXC17
        add     r10, r8, #6
LAXC16:
        ldrb    r11, [r9]
        cmp     r11, r2
        ble     LAXC18
        sub     r9, r9, #1
        ldrb    r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXC18
        sub     r9, r9, #1
        ldrb    r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXC18
        sub     r9, r9, #1
        ldrb    r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXC18
        sub     r9, r9, #1
        ldrb    r11, [r9]
        sub     r4, r4, #4
        cmp     r11, r2
        ble     LAXC18
        sub     r9, r9, #1
        cmp     r9, r10
        sub     r4, r4, #4
        bhi     LAXC16
LAXC17:
        ldrb    r10, [r9]
        cmp     r10, r2
        ble     LAXC18
        sub     r9, r9, #1
        cmp     r9, r8
        sub     r4, r4, #4
        bhi     LAXC17
LAXC18:
        cmp     r8, r9
        beq     LAXC19
        ldrb    r10, [r9]
        ldrb    r11, [r8]
        strb    r10, [r8]
        strb    r11, [r9]
        ldr     r10, [r4]
        ldr     r11, [r7]
        str     r10, [r7]
        str     r11, [r4]
        b       LAXC12
LAXC19:
        ldrb    r10, [r8, #-1]!
        sub     r7, r7, #4
        cmp     r10, r2
        bne     LAXC21
LAXC20:
        cmp     r8, r6
        bls     LAXC21
        sub     r8, r8, #1
        ldrb    r10, [r8]
        sub     r7, r7, #4
        cmp     r10, r2
        beq     LAXC20
LAXC21:
        sub     r10, r8, r6
        sub     r2, r12, r9
        cmp     r10, r2
        bge     LAXC22
        cmp     r8, r6
        moveq   r6, r9
        moveq   r5, r4
        beq     LAXC6
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
        b       LAXC6
LAXC22:
        cmp     r9, r12
        moveq   r12, r8
        moveq   r3, r7
        beq     LAXC6
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
        b       LAXC6
LAXC23:
        cmp     r10, r2
        bgt     LAXC14
LAXC24:
        add     r8, r8, #1
        cmp     r9, r8
        add     r7, r7, #4
        bls     LAXC18
        ldrb    r10, [r8]
        cmp     r10, r2
        ble     LAXC24
        sub     r10, r9, r8
        b       LAXC15
LAXC25:
        ldrb    r11, [r8]
        cmp     r11, r2
        ble     LAXC24
        b       LAXC15
LAXC26:
        mvn     r0, #7
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}
LAXC27:
        mvn     r0, #5
        add     sp, sp, #2, 24
        ldmia   sp!, {r4 - r11, pc}

