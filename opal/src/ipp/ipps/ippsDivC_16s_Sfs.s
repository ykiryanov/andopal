        .text
        .align  4
        .globl  _ippsDivC_16s_Sfs


_ippsDivC_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x34]
        mov     r9, r0
        cmp     r9, #0
        mov     r0, r1
        mov     r7, r2
        mov     r5, r3
        beq     LCIE17
        cmp     r7, #0
        beq     LCIE17
        cmp     r5, #0
        ble     LCIE18
        cmp     r0, #0
        mvneq   r8, #9
        beq     LCIE10
        ldr     lr, [pc, #0x32C]
        cmp     r12, #0
        mov     r8, #0
        ldr     r6, [lr]
        mov     r4, r6
        ble     LCIE13
        ldr     lr, [pc, #0x318]
        cmp     r12, #6
        ldrlt   r10, [lr]
        movlt   r11, r8
        blt     LCIE1
        ldr     r10, [lr]
        str     r0, [sp, #8]
        sub     r1, r12, #6
        str     r7, [sp, #0xC]
        mov     r0, r4
        mov     r11, r8
        mov     r7, r1
        mov     r4, r12
LCIE0:
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
        cmp     r11, r7
        ble     LCIE0
        mov     r12, r4
        mov     r4, r0
        ldr     r7, [sp, #0xC]
        ldr     r0, [sp, #8]
LCIE1:
        str     r0, [sp, #8]
        mov     r0, r4
        mov     r4, r12
LCIE2:
        mov     r1, r10
        bl      __mulsf3
        add     r11, r11, #1
        cmp     r11, r4
        blt     LCIE2
        mov     r4, r0
        ldr     r0, [sp, #8]
LCIE3:
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r4
        bl      __divsf3
        ldr     r12, [pc, #0x26C]
        mov     r4, r0
        ldr     r1, [r12]
        bl      __gesf2
        cmp     r0, #0
        blt     LCIE6
        mov     r0, r4
        mov     r1, r6
        bl      __lesf2
        cmp     r0, #0
        bgt     LCIE6
        cmp     r5, #0
        ble     LCIE11
        ldr     lr, [pc, #0x234]
        ldr     r12, [pc, #0x238]
        mov     r11, r8
        ldr     r10, [lr]
        ldr     r6, [r12]
        str     r8, [sp, #4]
LCIE4:
        ldrsh   r0, [r9], #2
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __subsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp]
        bl      __fixsfsi
        mov     r8, r0
        tst     r8, #1
        beq     LCIE5
        mov     r0, r8
        bl      __floatsisf
        ldr     r1, [sp]
        bl      __eqsf2
        cmp     r0, #0
        subeq   r8, r8, #1
LCIE5:
        sub     r8, r8, #2, 18
        add     r11, r11, #1
        strh    r8, [r7], #2
        cmp     r11, r5
        blt     LCIE4
        ldr     r8, [sp, #4]
        mov     r0, r8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCIE6:
        cmp     r5, #0
        ble     LCIE12
        ldr     lr, [pc, #0x1AC]
        ldr     r10, [pc, #0x1AC]
        ldr     r12, [pc, #0x19C]
        ldr     r6, [lr]
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r11, r8
        str     r8, [sp, #4]
        str     lr, [sp]
LCIE7:
        ldrsh   r0, [r9], #2
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r6
        bl      __gesf2
        cmp     r0, #0
        ldrlt   r12, [sp, #4]
        sublt   r8, r12, #2, 18
        blt     LCIE9
        ldr     r1, [r10]
        mov     r0, r8
        bl      __lesf2
        cmp     r0, #0
        ldrgt   r12, [sp]
        mvngt   r8, r12
        bgt     LCIE9
        mov     r0, r8
        mov     r1, r6
        bl      __subsf3
        ldr     r12, [pc, #0x12C]
        ldr     r1, [r12]
        bl      __addsf3
        str     r0, [sp, #8]
        bl      __fixsfsi
        mov     r8, r0
        tst     r8, #1
        beq     LCIE8
        mov     r0, r8
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        subeq   r8, r8, #1
LCIE8:
        sub     r8, r8, #2, 18
LCIE9:
        add     r11, r11, #1
        strh    r8, [r7], #2
        cmp     r11, r5
        blt     LCIE7
        ldr     r8, [sp, #4]
        mov     r0, r8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCIE10:
        mov     r0, r8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCIE11:
        mov     r0, r8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCIE12:
        mov     r0, r8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCIE13:
        cmp     r12, #0
        bge     LCIE3
        rsb     lr, r12, #0
        cmp     lr, #6
        blt     LCIE15
        mov     r10, r0
        mov     r11, r7
        mov     r7, r5
        mov     r5, r12
LCIE14:
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
        add     r5, r5, #5
        cmn     r5, #6
        mov     r4, r0
        blt     LCIE14
        mov     r12, r5
        mov     r5, r7
        mov     r7, r11
        mov     r0, r10
LCIE15:
        mov     r11, r0
        mov     r10, r12
LCIE16:
        mov     r0, r4
        mov     r1, r4
        bl      __addsf3
        adds    r10, r10, #1
        mov     r4, r0
        bmi     LCIE16
        mov     r0, r11
        b       LCIE3
LCIE17:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCIE18:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCIE__2il0floatpacket.1
        .long   LCIE__2il0floatpacket.4
        .long   LCIE__2il0floatpacket.2
        .long   LCIE__2il0floatpacket.3
        .long   LCIE__2il0floatpacket.5


        .data
        .align  4


LCIE__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LCIE__2il0floatpacket.2:
        .byte   0x72,0xF9,0x7F,0xBF
LCIE__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7
LCIE__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x3F
LCIE__2il0floatpacket.5:
        .byte   0x00,0xFE,0xFF,0x46


