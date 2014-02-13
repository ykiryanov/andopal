        .text
        .align  4
        .globl  _ippsDiv_16s_Sfs


_ippsDiv_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r11, [sp, #0x3C]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        beq     LCHQ20
        cmp     r6, #0
        beq     LCHQ20
        cmp     r5, #0
        beq     LCHQ20
        cmp     r3, #0
        ble     LCHQ21
        ldr     lr, [pc, #0x380]
        cmp     r11, #0
        mvn     r12, #0xFF
        ldr     r0, [lr]
        bic     r8, r12, #0x7F, 24
        mov     r10, #0
        ble     LCHQ9
        ldr     r12, [pc, #0x368]
        cmp     r11, #6
        ldrlt   r4, [r12]
        movlt   r9, #0
        blt     LCHQ1
        ldr     r4, [r12]
        sub     r1, r11, #6
        str     r11, [sp, #8]
        mov     r9, #0
        str     r3, [sp, #0xC]
        mov     r11, r1
LCHQ0:
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        add     r9, r9, #5
        cmp     r9, r11
        ble     LCHQ0
        ldr     r11, [sp, #8]
        ldr     r3, [sp, #0xC]
LCHQ1:
        str     r3, [sp, #0xC]
LCHQ2:
        mov     r1, r4
        bl      __mulsf3
        add     r9, r9, #1
        cmp     r9, r11
        blt     LCHQ2
        ldr     r3, [sp, #0xC]
        cmp     r3, #0
        ble     LCHQ8
        ldr     r11, [pc, #0x2E0]
        mov     r9, #0
        mov     r1, r9
        str     r4, [sp, #0x14]
        str     r8, [sp, #4]
        mov     r12, r1
        str     r0, [sp]
        mov     r8, r1
        mov     r4, r3
LCHQ3:
        ldrsh   r0, [r7], #2
        cmp     r0, #0
        beq     LCHQ5
        bl      __floatsisf
        mov     r10, r0
        ldrsh   r0, [r6]
        bl      __floatsisf
        ldr     r1, [sp]
        bl      __mulsf3
        mov     r1, r10
        bl      __divsf3
        ldr     r1, [r11]
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        str     r0, [sp, #0x10]
        bl      __fixsfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCHQ4
        mov     r0, r10
        bl      __floatsisf
        ldr     r1, [sp, #0x10]
        bl      __eqsf2
        cmp     r0, #0
        subeq   r10, r10, #1
LCHQ4:
        sub     r10, r10, #2, 18
        strh    r10, [r5]
        b       LCHQ7
LCHQ5:
        ldrsh   r12, [r6]
        cmp     r12, #0
        beq     LCHQ6
        cmp     r12, #0
        movle   r12, #0
        suble   r12, r12, #2, 18
        ldrgt   r12, [sp, #4]
        mvngt   r12, r12
        strh    r12, [r5]
        mov     r9, #6
        b       LCHQ7
LCHQ6:
        mov     r12, #0
        strh    r12, [r5]
        mov     r9, #6
LCHQ7:
        add     r8, r8, #1
        cmp     r8, r4
        add     r6, r6, #2
        add     r5, r5, #2
        blt     LCHQ3
        mov     r0, r9
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHQ8:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHQ9:
        cmp     r11, #0
        bge     LCHQ13
        rsb     r12, r11, #0
        cmp     r12, #6
        blt     LCHQ11
        mov     r4, r3
LCHQ10:
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        add     r11, r11, #5
        cmn     r11, #6
        blt     LCHQ10
        mov     r3, r4
LCHQ11:
        mov     r4, r3
LCHQ12:
        mov     r1, r0
        bl      __addsf3
        adds    r11, r11, #1
        bmi     LCHQ12
        mov     r3, r4
LCHQ13:
        cmp     r3, #0
        ble     LCHQ19
        ldr     r4, [pc, #0x170]
        ldr     lr, [pc, #0x170]
        ldr     r12, [pc, #0x164]
        mov     r9, #0
        mov     r11, r9
        str     r8, [sp, #4]
        mov     r1, r11
        str     r9, [sp, #8]
        str     r0, [sp]
        mov     r8, r3
LCHQ14:
        ldrsh   r0, [r7], #2
        cmp     r0, #0
        beq     LCHQ17
        bl      __floatsisf
        ldrsh   r1, [r6]
        mov     r9, r0
        mov     r0, r1
        bl      __floatsisf
        ldr     r1, [sp]
        bl      __mulsf3
        mov     r1, r9
        bl      __divsf3
        ldr     r10, [r4]
        mov     r9, r0
        mov     r1, r10
        bl      __gesf2
        cmp     r0, #0
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        blt     LCHQ16
        ldr     r12, [pc, #0xFC]
        mov     r0, r9
        ldr     r1, [r12]
        bl      __lesf2
        cmp     r0, #0
        ldrgt   r12, [sp, #4]
        mvngt   r12, r12
        bgt     LCHQ16
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        ldr     r12, [pc, #0xC8]
        ldr     r1, [r12]
        bl      __addsf3
        mov     r9, r0
        bl      __fixsfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCHQ15
        mov     r0, r10
        bl      __floatsisf
        mov     r1, r9
        bl      __eqsf2
        cmp     r0, #0
        subeq   r10, r10, #1
LCHQ15:
        sub     r10, r10, #2, 18
        strh    r10, [r5]
        b       LCHQ18
LCHQ16:
        strh    r12, [r5]
        b       LCHQ18
LCHQ17:
        ldrsh   r12, [r6]
        mov     lr, #6
        str     lr, [sp, #8]
        cmp     r12, #0
        moveq   r12, #0
        streqh  r12, [r5]
        beq     LCHQ18
        cmp     r12, #0
        movle   r12, #0
        suble   r12, r12, #2, 18
        ldrgt   r12, [sp, #4]
        mvngt   r12, r12
        strh    r12, [r5]
LCHQ18:
        add     r11, r11, #1
        cmp     r11, r8
        add     r6, r6, #2
        add     r5, r5, #2
        blt     LCHQ14
        ldr     r9, [sp, #8]
        mov     r0, r9
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHQ19:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHQ20:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHQ21:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LCHQ__2il0floatpacket.1
        .long   LCHQ__2il0floatpacket.3
        .long   LCHQ__2il0floatpacket.2
        .long   LCHQ__2il0floatpacket.4


        .data
        .align  4


LCHQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LCHQ__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC7
LCHQ__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x3F
LCHQ__2il0floatpacket.4:
        .byte   0x00,0xFE,0xFF,0x46


