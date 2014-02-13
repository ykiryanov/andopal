        .text
        .align  4
        .globl  _ippsSortAscend_64f_I


_ippsSortAscend_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x43, 30
        mov     r4, r0
        cmp     r4, #0
        mov     r0, r1
        beq     LAXN22
        cmp     r0, #0
        ble     LAXN21
        cmp     r0, #2
        blt     LAXN23
        add     r2, r4, r0, lsl #3
        sub     r5, r2, #8
        mov     r6, #1
LAXN0:
        cmp     r0, #9
        bgt     LAXN6
        cmp     r5, r4
        bls     LAXN4
        add     r7, r4, #8
LAXN1:
        cmp     r7, r5
        mov     r9, r7
        mov     r8, r4
        bhi     LAXN3
LAXN2:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        bl      __gtdf2
        cmp     r0, #0
        movgt   r8, r9
        add     r9, r9, #8
        cmp     r9, r5
        bls     LAXN2
LAXN3:
        ldr     r12, [r5]
        ldr     r3, [r5, #4]
        ldr     r2, [r8]
        ldr     r1, [r8, #4]
        str     r12, [r8]
        str     r3, [r8, #4]
        str     r2, [r5]
        str     r1, [r5, #4]
        sub     r5, r5, #8
        cmp     r5, r4
        bhi     LAXN1
LAXN4:
        sub     r6, r6, #1
        add     r1, sp, #0xC
        add     r0, sp, #0x8C
        ldr     r5, [r1, +r6, lsl #2]
        ldr     r4, [r0, +r6, lsl #2]
LAXN5:
        sub     r1, r5, r4
        cmp     r6, #0
        mov     r1, r1, asr #3
        add     r0, r1, #1
        bne     LAXN0
        mov     r0, #0
        add     sp, sp, #0x43, 30
        ldmia   sp!, {r4 - r11, pc}
LAXN6:
        ldr     r1, [r4, #0xC]
        mov     r0, r0, asr #1
        str     r1, [sp]
        ldr     r8, [r4, #4]
        ldr     r7, [r4]
        ldr     r11, [r4, #8]
        str     r0, [sp, #4]
        mov     r2, r7
        mov     r0, r11
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        mov     r10, r7
        movgt   r10, r11
        str     r10, [r4]
        ldr     r1, [sp]
        mov     r9, r8
        mov     r0, r11
        movgt   r9, r1
        str     r9, [r4, #4]
        mov     r2, r7
        mov     r3, r8
        bl      __ltdf2
        ldr     r1, [sp]
        cmp     r0, #0
        movlt   r7, r11
        movlt   r8, r1
        str     r7, [r4, #8]
        str     r8, [r4, #0xC]
        ldr     r1, [sp, #4]
        mov     r8, r10
        mov     r2, r10
        ldr     r1, [r4, +r1, lsl #3]
        mov     r7, r9
        mov     r3, r9
        str     r1, [sp]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
        add     r1, r4, r1, lsl #3
        str     r1, [sp, #8]
        ldr     r11, [r1, #4]
        mov     r1, r11
        bl      __ltdf2
        cmp     r0, #0
        ldr     r0, [sp]
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        movlt   r8, r0
        movlt   r7, r11
        bl      __gtdf2
        ldr     r12, [sp]
        ldr     r1, [r5, #4]
        cmp     r0, #0
        movgt   r9, r11
        ldr     r11, [r5]
        str     r1, [sp]
        movgt   r10, r12
        mov     r2, r8
        mov     r0, r11
        mov     r3, r7
        bl      __ltdf2
        ldr     r12, [sp]
        cmp     r0, #0
        mov     lr, r7
        movlt   lr, r12
        mov     r12, r8
        movlt   r12, r11
        str     lr, [r4, #4]
        str     r12, [r4]
        ldr     r0, [r5]
        mov     r2, r8
        mov     r3, r7
        str     r0, [sp]
        ldr     r11, [r5, #4]
        mov     r1, r11
        bl      __gtdf2
        ldr     r12, [sp]
        cmp     r0, #0
        movgt   r7, r11
        movgt   r8, r12
        mov     r2, r10
        mov     r3, r9
        mov     r0, r8
        mov     r1, r7
        bl      __ltdf2
        ldr     lr, [sp, #4]
        cmp     r0, #0
        mov     r12, r10
        movlt   r12, r8
        str     r12, [r4, +lr, lsl #3]
        ldr     lr, [sp, #8]
        mov     r12, r9
        movlt   r12, r7
        str     r12, [lr, #4]
        mov     r2, r10
        mov     r3, r9
        mov     r0, r8
        mov     r1, r7
        bl      __gtdf2
        cmp     r0, #0
        movgt   r10, r8
        movgt   r9, r7
        str     r10, [r5]
        str     r9, [r5, #4]
        ldr     r1, [sp, #4]
        add     r10, r4, #8
        mov     r9, r5
        ldr     r8, [r4, +r1, lsl #3]
        ldr     r1, [sp, #8]
        ldr     r7, [r1, #4]
LAXN7:
        cmp     r9, r10
        bls     LAXN13
        sub     r11, r9, r10
        cmp     r11, #0x30
        bcc     LAXN20
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        bgt     LAXN10
LAXN8:
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        bgt     LAXN9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        bgt     LAXN9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        bgt     LAXN9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        bgt     LAXN9
        add     r10, r10, #8
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        sub     r12, r9, #0x30
        cmp     r10, r12
        bcs     LAXN18
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        ble     LAXN8
LAXN9:
        cmp     r9, r10
        subhi   r11, r9, r10
        bls     LAXN13
LAXN10:
        cmp     r11, #0x30
        bcc     LAXN12
        add     r11, r10, #0x30
LAXN11:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXN13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXN13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXN13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXN13
        sub     r9, r9, #8
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXN13
        sub     r9, r9, #8
        cmp     r9, r11
        bhi     LAXN11
LAXN12:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LAXN13
        sub     r9, r9, #8
        cmp     r9, r10
        bhi     LAXN12
LAXN13:
        cmp     r10, r9
        beq     LAXN14
        ldr     lr, [r9]
        ldr     r12, [r9, #4]
        ldr     r1, [r10]
        str     lr, [r10]
        ldr     lr, [r10, #4]
        str     r12, [r10, #4]
        str     r1, [r9]
        str     lr, [r9, #4]
        b       LAXN7
LAXN14:
        ldr     r0, [r10, #-8]
        ldr     r1, [r10, #-4]
        mov     r2, r8
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        sub     r10, r10, #8
        bne     LAXN16
LAXN15:
        cmp     r10, r4
        bls     LAXN16
        ldr     r0, [r10, #-8]!
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        beq     LAXN15
LAXN16:
        sub     r2, r5, r9
        sub     r1, r10, r4
        mov     r2, r2, asr #3
        cmp     r2, r1, asr #3
        ble     LAXN17
        cmp     r10, r4
        moveq   r4, r9
        beq     LAXN5
        add     r2, sp, #0xC
        add     r1, sp, #0x8C
        str     r5, [r2, +r6, lsl #2]
        str     r9, [r1, +r6, lsl #2]
        add     r6, r6, #1
        mov     r5, r10
        b       LAXN5
LAXN17:
        cmp     r9, r5
        moveq   r5, r10
        beq     LAXN5
        add     r1, sp, #0x8C
        mov     r3, r6
        str     r4, [r1, +r6, lsl #2]
        add     r2, sp, #0xC
        add     r6, r6, #1
        str     r10, [r2, +r3, lsl #2]
        mov     r4, r9
        b       LAXN5
LAXN18:
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        bgt     LAXN9
LAXN19:
        add     r10, r10, #8
        cmp     r9, r10
        bls     LAXN13
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        ble     LAXN19
        sub     r11, r9, r10
        b       LAXN10
LAXN20:
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __ledf2
        cmp     r0, #0
        ble     LAXN19
        b       LAXN10
LAXN21:
        mvn     r0, #5
        add     sp, sp, #0x43, 30
        ldmia   sp!, {r4 - r11, pc}
LAXN22:
        mvn     r0, #7
        add     sp, sp, #0x43, 30
        ldmia   sp!, {r4 - r11, pc}
LAXN23:
        mov     r0, #0
        add     sp, sp, #0x43, 30
        ldmia   sp!, {r4 - r11, pc}


