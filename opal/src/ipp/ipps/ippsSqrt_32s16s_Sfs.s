        .text
        .align  4
        .globl  _ippsSqrt_32s16s_Sfs


_ippsSqrt_32s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r8, r0
        cmp     r8, #0
        mov     r5, r1
        mov     r4, r2
        beq     LAVU23
        cmp     r5, #0
        beq     LAVU23
        cmp     r4, #0
        ble     LAVU24
        mov     lr, #0xFF
        mov     r12, #0xFE, 12
        cmp     r3, #0
        orr     r7, lr, #0x7F, 24
        orr     r6, r12, #3, 4
        mov     r10, #0
        bne     LAVU2
        cmp     r4, #0
        ble     LAVU9
        ldr     r11, [pc, #0x338]
        mov     r9, #0
        mov     r0, r9
        mov     r10, r7
        mov     r7, r0
LAVU0:
        ldr     r0, [r8], #4
        cmp     r0, #0
        blt     LAVU8
        cmp     r11, r0
        strlth  r10, [r5]
        blt     LAVU1
        bl      __floatsidf
        bl      sqrt
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        bl      __fixdfsi
        strh    r0, [r5]
LAVU1:
        add     r7, r7, #1
        cmp     r7, r4
        add     r5, r5, #2
        blt     LAVU0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU2:
        cmp     r3, #0
        mov     r12, #1
        ble     LAVU14
        cmp     r3, #0x10
        bgt     LAVU6
        mov     r0, r12, lsl r3
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        add     r1, r6, #1, 12
        mov     r0, #0
        bl      __divdf3
        cmp     r4, #0
        mov     r7, r1
        ble     LAVU11
        mov     r9, #0
        mov     r11, r9
        str     r9, [sp, #4]
        str     r6, [sp, #8]
        mov     r9, r0
LAVU3:
        ldr     r0, [r8], #4
        cmp     r0, #0
        blt     LAVU10
        bl      __floatsidf
        bl      sqrt
        mov     r2, r9
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp]
        mov     r6, r0
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LAVU4
        mov     r0, r10
        bl      __floatsidf
        ldr     r3, [sp]
        mov     r2, r6
        bl      __eqdf2
        cmp     r0, #0
        subeq   r10, r10, #1
LAVU4:
        strh    r10, [r5]
LAVU5:
        add     r11, r11, #1
        cmp     r11, r4
        add     r5, r5, #2
        blt     LAVU3
        ldr     r9, [sp, #4]
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU6:
        mov     r0, r5
        mov     r1, r4
        bl      _ippsZero_16s
        cmp     r4, #0
        ble     LAVU13
        mov     r3, #0
LAVU7:
        ldr     r12, [r8], #4
        cmp     r12, #0
        blt     LAVU12
        add     r3, r3, #1
        cmp     r3, r4
        blt     LAVU7
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU8:
        mov     r12, #0
        strh    r12, [r5]
        mov     r9, #3
        b       LAVU1
LAVU9:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU10:
        mov     r12, #0
        strh    r12, [r5]
        mov     r12, #3
        str     r12, [sp, #4]
        b       LAVU5
LAVU11:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU12:
        mov     r9, #3
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU13:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU14:
        cmn     r3, #0xE
        blt     LAVU17
        rsb     r3, r3, #0
        mov     r0, r12, lsl r3
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r4, #0
        mov     r6, r1
        ble     LAVU21
        mov     r9, #0
        mov     r11, r9
        str     r9, [sp, #4]
        str     r7, [sp]
        mov     r10, r0
LAVU15:
        ldr     r0, [r8], #4
        cmp     r0, #0
        blt     LAVU20
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r6
        bl      __muldf3
        ldr     r3, [pc, #0x104]
        mov     r7, r0
        mov     r9, r1
        mov     r2, #2, 10
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp]
        strgth  r12, [r5]
        bgt     LAVU16
        mov     r0, r7
        mov     r1, r9
        bl      sqrt
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __adddf3
        bl      __fixdfsi
        strh    r0, [r5]
LAVU16:
        add     r11, r11, #1
        cmp     r11, r4
        add     r5, r5, #2
        blt     LAVU15
        ldr     r9, [sp, #4]
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU17:
        cmp     r4, #0
        ble     LAVU22
        mov     r9, #0
        mov     r12, r9
        mov     r3, r12
LAVU18:
        ldr     lr, [r8], #4
        cmp     lr, #0
        strlth  r3, [r5]
        movlt   r9, #3
        blt     LAVU19
        cmp     lr, #0
        moveq   lr, #0
        movne   lr, r7
        strh    lr, [r5]
LAVU19:
        add     r12, r12, #1
        cmp     r12, r4
        add     r5, r5, #2
        blt     LAVU18
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU20:
        mov     r12, #0
        strh    r12, [r5]
        mov     r12, #3
        str     r12, [sp, #4]
        b       LAVU16
LAVU21:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU22:
        mov     r9, #0
        mov     r0, r9
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU23:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LAVU24:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x3fff0001
        .long   0x41cfff80


