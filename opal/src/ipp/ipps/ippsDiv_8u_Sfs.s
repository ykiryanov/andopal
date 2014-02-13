        .text
        .align  4
        .globl  _ippsDiv_8u_Sfs


_ippsDiv_8u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r9, [sp, #0x2C]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        mov     r5, r3
        beq     LCHB21
        cmp     r7, #0
        beq     LCHB21
        cmp     r6, #0
        beq     LCHB21
        cmp     r5, #0
        ble     LCHB22
        cmn     r9, #0x10
        mov     r12, #0
        mov     r10, #0xFF
        ble     LCHB6
        cmp     r9, #8
        bgt     LCHB6
        ldr     r12, [pc, #0x344]
        cmp     r9, #0
        ldr     r4, [r12]
        blt     LCHB10
        cmp     r9, #0
        ble     LCHB2
        ldr     r12, [pc, #0x330]
        cmp     r9, #6
        ldrlt   r10, [r12]
        movlt   r11, #0
        blt     LCHB1
        ldr     r10, [r12]
        sub     r0, r9, #6
        str     r0, [sp, #4]
        mov     r0, r4
        ldr     r4, [sp, #4]
        mov     r11, #0
LCHB0:
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        add     r11, r11, #5
        cmp     r11, r4
        ble     LCHB0
        mov     r4, r0
LCHB1:
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        add     r11, r11, #1
        cmp     r11, r9
        mov     r4, r0
        blt     LCHB1
LCHB2:
        cmp     r5, #0
        ble     LCHB9
        ldr     r12, [pc, #0x2A8]
        mov     r0, #0
        mov     r9, r0
        str     r0, [sp, #4]
LCHB3:
        ldrb    r0, [r8], #1
        cmp     r0, #0
        beq     LCHB4
        bl      __floatunssisf
        ldrb    r1, [r7]
        ldr     r12, [pc, #0x284]
        mov     r10, r0
        mov     r0, r1
        ldr     r11, [r12]
        bl      __floatunssisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __divsf3
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        bl      __fixsfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCHB5
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r10
        bl      __eqsf2
        cmp     r0, #0
        subeq   r11, r11, #1
        b       LCHB5
LCHB4:
        ldrb    r12, [r7]
        cmp     r12, #0
        moveq   r11, #0
        movne   r11, #0xFF
        mov     r12, #6
        str     r12, [sp, #4]
LCHB5:
        add     r9, r9, #1
        strb    r11, [r6], #1
        cmp     r9, r5
        add     r7, r7, #1
        blt     LCHB3
        ldr     r0, [sp, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB6:
        cmp     r9, #0
        ble     LCHB19
        mov     r0, #0
        mov     lr, r0
LCHB7:
        ldrb    r4, [r8], #1
        cmp     r4, #0
        strneb  r12, [r6]
        bne     LCHB8
        ldrb    r4, [r7]
        cmp     r4, #0
        moveq   r4, #0
        movne   r4, #0xFF
        strb    r4, [r6]
        mov     r0, #6
LCHB8:
        add     lr, lr, #1
        cmp     lr, r5
        add     r7, r7, #1
        add     r6, r6, #1
        blt     LCHB7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB9:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB10:
        cmp     r9, #0
        bge     LCHB13
        rsb     r12, r9, #0
        cmp     r12, #6
        blt     LCHB12
LCHB11:
        mov     r1, r4
        mov     r0, r4
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        add     r9, r9, #5
        cmn     r9, #6
        mov     r4, r0
        blt     LCHB11
LCHB12:
        mov     r0, r4
        mov     r1, r4
        bl      __addsf3
        adds    r9, r9, #1
        mov     r4, r0
        bmi     LCHB12
LCHB13:
        cmp     r5, #0
        ble     LCHB18
        ldr     r9, [pc, #0x120]
        mov     r0, #0
        mov     r11, r0
        str     r0, [sp, #4]
        str     r4, [sp]
LCHB14:
        ldrb    r0, [r8], #1
        cmp     r0, #0
        beq     LCHB16
        bl      __floatunssisf
        ldrb    r1, [r7]
        ldr     r10, [r9]
        mov     r4, r0
        mov     r0, r1
        bl      __floatunssisf
        ldr     r1, [sp]
        bl      __mulsf3
        mov     r1, r4
        bl      __divsf3
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        bl      __fixsfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCHB15
        mov     r0, r10
        bl      __floatsisf
        mov     r1, r4
        bl      __eqsf2
        cmp     r0, #0
        subeq   r10, r10, #1
LCHB15:
        cmp     r10, #0xFF
        mov     r12, #0xFF
        movgt   r10, r12
        b       LCHB17
LCHB16:
        ldrb    r12, [r7]
        cmp     r12, #0
        moveq   r10, #0
        movne   r10, #0xFF
        mov     r12, #6
        str     r12, [sp, #4]
LCHB17:
        add     r11, r11, #1
        strb    r10, [r6], #1
        cmp     r11, r5
        add     r7, r7, #1
        blt     LCHB14
        ldr     r0, [sp, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB18:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB19:
        mov     r0, #0
        mov     r12, r0
LCHB20:
        ldrb    lr, [r8], #1
        cmp     lr, #0
        moveq   r0, #6
        ldrb    lr, [r7], #1
        cmp     lr, #0
        moveq   lr, #0
        movne   lr, #0xFF
        add     r12, r12, #1
        strb    lr, [r6], #1
        cmp     r12, r5
        blt     LCHB20
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB21:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCHB22:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCHB__2il0floatpacket.1
        .long   LCHB__2il0floatpacket.2


        .data
        .align  4


LCHB__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LCHB__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x3F


