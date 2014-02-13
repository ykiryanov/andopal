        .text
        .align  4
        .globl  _ippsSubbandSynthesis_32fc32f


_ippsSubbandSynthesis_32fc32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r1
        cmp     r4, #0
        beq     LDKZ25
        cmp     r0, #0
        beq     LDKZ25
        cmp     r2, #0
        beq     LDKZ25
        cmp     r3, #0
        beq     LDKZ25
        and     r12, r2, #0xF
        rsb     r12, r12, #0
        and     lr, r12, #0xF
        ldr     r9, [lr, +r2]
        add     r12, r2, lr
        and     r2, r3, #0xF
        rsb     r2, r2, #0
        ldr     r8, [r12, #4]
        and     r2, r2, #0xF
        add     r7, r3, r2
        ldr     r2, [r12, #0x14]
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        ldr     r6, [r12, #8]
        add     r3, r7, r8, lsl #2
        mov     r1, r7
        bl      _ippsFFTInv_CCSToR_32f
        cmp     r0, #0
        bne     LDKZ16
        sub     r5, r9, r6
        cmp     r5, #0
        ble     LDKZ3
        cmp     r5, #6
        mov     lr, #0
        addlt   r12, r11, r6, lsl #2
        blt     LDKZ1
        add     r12, r11, r6, lsl #2
        sub     r3, r5, #6
        add     r2, r12, #4
        add     r0, r11, #4
LDKZ0:
        ldr     r1, [r2, #-4]
        add     lr, lr, #5
        cmp     lr, r3
        str     r1, [r0, #-4]
        ldr     r1, [r2]
        str     r1, [r0]
        ldr     r1, [r2, #4]
        str     r1, [r0, #4]
        ldr     r1, [r2, #8]
        str     r1, [r0, #8]
        ldr     r1, [r2, #0xC]
        add     r2, r2, #0x14
        str     r1, [r0, #0xC]
        add     r0, r0, #0x14
        ble     LDKZ0
LDKZ1:
        add     r0, r11, lr, lsl #2
LDKZ2:
        ldr     r2, [r12, +lr, lsl #2]
        add     lr, lr, #1
        cmp     lr, r5
        str     r2, [r0], #4
        blt     LDKZ2
LDKZ3:
        cmp     r6, #0
        ble     LDKZ7
        ldr     r0, [pc, #0x440]
        cmp     r6, #6
        mov     lr, #0
        rsb     r2, r6, #0
        ldrlt   r0, [r0]
        addlt   r2, r11, r2, lsl #2
        blt     LDKZ5
        ldr     r0, [r0]
        add     r2, r11, r2, lsl #2
        sub     r12, r6, #6
        mov     r3, r9
LDKZ4:
        mov     r5, r3, lsl #2
        str     r0, [r2, +r3, lsl #2]
        add     r1, r5, #4
        str     r0, [r2, +r1]
        add     r1, r5, #8
        str     r0, [r2, +r1]
        add     r1, r5, #0xC
        add     lr, lr, #5
        str     r0, [r2, +r1]
        add     r5, r5, #0x10
        cmp     lr, r12
        add     r3, r3, #5
        str     r0, [r2, +r5]
        ble     LDKZ4
LDKZ5:
        add     r3, lr, r9
LDKZ6:
        add     lr, lr, #1
        str     r0, [r2, +r3, lsl #2]
        cmp     lr, r6
        add     r3, r3, #1
        blt     LDKZ6
LDKZ7:
        cmp     r8, #0
        ble     LDKZ24
        cmp     r8, #5
        sub     r0, r9, #1
        addlt   r0, r10, r0, lsl #2
        movlt   r5, #0
        blt     LDKZ9
        str     r9, [sp, #4]
        sub     r1, r8, #5
        add     r3, r7, #4
        add     r0, r10, r0, lsl #2
        add     r2, r11, #4
        str     r6, [sp, #0x14]
        str     r7, [sp]
        str     r4, [sp, #0xC]
        mov     r9, r8
        mov     r5, #0
        str     r10, [sp, #0x10]
        str     r11, [sp, #8]
        mov     r4, r0
        mov     r8, r1
        mov     r7, r2
        mov     r6, r3
LDKZ8:
        ldr     r0, [r6, #-4]
        ldr     r10, [r7, #-4]
        rsb     r12, r5, #0
        ldr     r1, [r4, +r12, lsl #2]
        mvn     r12, #0
        rsb     r11, r5, r12
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r10, [r7]
        str     r0, [r7, #-4]
        ldr     r1, [r4, +r11, lsl #2]
        ldr     r0, [r6]
        mvn     r11, #1
        rsb     r11, r5, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7]
        ldr     r1, [r4, +r11, lsl #2]
        ldr     r0, [r6, #4]
        ldr     r10, [r7, #4]
        mvn     r11, #2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7, #4]
        rsb     r11, r5, r11
        ldr     r0, [r6, #8]
        ldr     r1, [r4, +r11, lsl #2]
        ldr     r10, [r7, #8]
        add     r5, r5, #4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7, #8]
        cmp     r5, r8
        add     r6, r6, #0x10
        add     r7, r7, #0x10
        ble     LDKZ8
        mov     r0, r4
        mov     r8, r9
        ldr     r6, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r7, [sp]
        ldr     r4, [sp, #0xC]
LDKZ9:
        add     r1, r7, r5, lsl #2
        add     r2, r11, r5, lsl #2
        str     r9, [sp, #4]
        str     r7, [sp]
        str     r4, [sp, #0xC]
        str     r11, [sp, #8]
        mov     r4, r0
        mov     r7, r1
        mov     r9, r2
LDKZ10:
        ldr     r0, [r7], #4
        ldr     r11, [r9]
        rsb     r3, r5, #0
        ldr     r1, [r4, +r3, lsl #2]
        add     r5, r5, #1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r9], #4
        cmp     r5, r8
        blt     LDKZ10
        ldr     r9, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r7, [sp]
        ldr     r4, [sp, #0xC]
        cmp     r5, r9
        bge     LDKZ18
LDKZ11:
        str     r6, [sp, #0x14]
        str     r4, [sp, #0xC]
LDKZ12:
        cmp     r8, #0
        ble     LDKZ23
        cmp     r8, #5
        sub     r2, r9, #1
        addlt   r6, r10, r2, lsl #2
        movlt   r4, #0
        blt     LDKZ14
        mov     r0, r5, lsl #2
        add     r0, r0, #4
        add     r6, r10, r2, lsl #2
        sub     r2, r8, #5
        add     r1, r7, #4
        add     r0, r0, r11
        str     r8, [sp, #0x18]
        str     r9, [sp, #4]
        str     r7, [sp]
        mov     r4, #0
        str     r10, [sp, #0x10]
        str     r11, [sp, #8]
        mov     r8, r0
        mov     r7, r1
        mov     r9, r2
LDKZ13:
        ldr     r10, [r8, #-4]
        ldr     r0, [r7, #-4]
        rsb     r3, r5, #0
        ldr     r1, [r6, +r3, lsl #2]
        mvn     r3, #0
        rsb     r11, r5, r3
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r8, #-4]
        ldr     r1, [r6, +r11, lsl #2]
        ldr     r0, [r7]
        ldr     r10, [r8]
        mvn     r3, #1
        rsb     r11, r5, r3
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r8]
        ldr     r1, [r6, +r11, lsl #2]
        ldr     r0, [r7, #4]
        ldr     r11, [r8, #4]
        add     r4, r4, #4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #4]
        mvn     r10, #2
        ldr     r0, [r7, #8]
        ldr     r11, [r8, #8]
        rsb     r10, r5, r10
        ldr     r1, [r6, +r10, lsl #2]
        add     r7, r7, #0x10
        add     r5, r5, #4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #8]
        cmp     r4, r9
        add     r8, r8, #0x10
        ble     LDKZ13
        ldr     r8, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r7, [sp]
LDKZ14:
        add     r1, r7, r4, lsl #2
        str     r9, [sp, #4]
        add     r0, r11, r5, lsl #2
        str     r7, [sp]
        mov     r9, r4
        str     r11, [sp, #8]
        mov     r4, r0
        mov     r7, r1
LDKZ15:
        ldr     r0, [r7], #4
        ldr     r11, [r4]
        rsb     r2, r5, #0
        ldr     r1, [r6, +r2, lsl #2]
        add     r9, r9, #1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4], #4
        cmp     r9, r8
        add     r5, r5, #1
        blt     LDKZ15
        ldr     r9, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r7, [sp]
        cmp     r5, r9
        blt     LDKZ12
        b       LDKZ17
LDKZ16:
        mvn     r0, #1
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDKZ17:
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0xC]
LDKZ18:
        cmp     r6, #0
        ble     LDKZ22
        cmp     r6, #6
        mov     r0, #0
        blt     LDKZ20
        sub     r12, r6, #6
        add     r3, r11, #4
        add     r2, r4, #4
LDKZ19:
        ldr     lr, [r3, #-4]
        add     r0, r0, #5
        cmp     r0, r12
        str     lr, [r2, #-4]
        ldr     lr, [r3]
        str     lr, [r2]
        ldr     lr, [r3, #4]
        str     lr, [r2, #4]
        ldr     lr, [r3, #8]
        str     lr, [r2, #8]
        ldr     lr, [r3, #0xC]
        add     r3, r3, #0x14
        str     lr, [r2, #0xC]
        add     r2, r2, #0x14
        ble     LDKZ19
LDKZ20:
        add     r11, r11, r0, lsl #2
        add     r4, r4, r0, lsl #2
LDKZ21:
        ldr     r1, [r11], #4
        add     r0, r0, #1
        cmp     r0, r6
        str     r1, [r4], #4
        blt     LDKZ21
LDKZ22:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDKZ23:
        cmp     r5, r9
        blt     LDKZ12
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0xC]
        b       LDKZ18
LDKZ24:
        cmp     r9, #0
        movgt   r5, #0
        bgt     LDKZ11
        b       LDKZ18
LDKZ25:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDKZ__2il0floatpacket.1


        .data
        .align  4


LDKZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


