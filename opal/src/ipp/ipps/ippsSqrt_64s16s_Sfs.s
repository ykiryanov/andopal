        .text
        .align  4
        .globl  _ippsSqrt_64s16s_Sfs


_ippsSqrt_64s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r5, r2
        mov     r11, r3
        beq     LAVP28
        cmp     r4, #0
        beq     LAVP28
        cmp     r5, #0
        ble     LAVP29
        mov     lr, #0xFE, 12
        mov     r12, #0xFF
        cmp     r11, #0
        orr     r6, lr, #3, 4
        orr     r8, r12, #0x7F, 24
        mov     r9, #0
        bne     LAVP3
        cmp     r5, #0
        ble     LAVP16
        ldr     r10, [pc, #0x4B8]
        mov     r0, r9
        mov     r11, r0
        str     r0, [sp, #8]
        str     r8, [sp, #4]
        str     r6, [sp, #0xC]
LAVP0:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        bl      __floatdidf
        mov     r8, r0
        mov     r6, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVP1
        mov     r3, r10
        mov     r0, r8
        mov     r1, r6
        mov     r2, #2, 10
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp, #4]
        strgth  r12, [r4]
        bgt     LAVP2
        mov     r0, r8
        mov     r1, r6
        bl      sqrt
        ldr     r3, [sp, #0xC]
        mov     r2, #0
        bl      __adddf3
        bl      __fixdfsi
        strh    r0, [r4]
        b       LAVP2
LAVP1:
        strh    r9, [r4]
        mov     r12, #3
        str     r12, [sp, #8]
LAVP2:
        add     r11, r11, #1
        cmp     r11, r5
        add     r7, r7, #8
        add     r4, r4, #2
        blt     LAVP0
        ldr     r0, [sp, #8]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP3:
        cmp     r11, #0
        mov     r12, #1
        ble     LAVP19
        cmp     r11, #0x20
        bgt     LAVP14
        cmp     r11, #0x1F
        addlt   r10, r6, #1, 12
        blt     LAVP4
        cmp     r11, #0x1F
        moveq   r10, r6
        subne   r10, r6, #1, 12
        mov     r11, #0x1E
LAVP4:
        mov     r0, r12, lsl r11
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r1, r10
        mov     r0, #0
        bl      __divdf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r11, #0x10
        mov     r11, r0
        mov     r10, r1
        mov     r12, r9
        ble     LAVP9
        mov     r0, r9
        str     r0, [sp, #8]
        str     r11, [sp, #0x10]
LAVP5:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        bl      __floatdidf
        mov     r11, r0
        mov     r8, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVP7
        mov     r0, r11
        mov     r1, r8
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        bl      __muldf3
        bl      sqrt
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        str     r1, [sp, #4]
        mov     r8, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LAVP6
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #4]
        mov     r2, r8
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LAVP6:
        strh    r11, [r4]
        b       LAVP8
LAVP7:
        mov     r12, #0
        strh    r12, [r4]
        mov     r12, #3
        str     r12, [sp, #8]
LAVP8:
        add     r9, r9, #1
        cmp     r9, r5
        add     r7, r7, #8
        add     r4, r4, #2
        blt     LAVP5
        ldr     r0, [sp, #8]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP9:
        mov     r0, r9
        str     r0, [sp, #8]
        str     r8, [sp, #4]
LAVP10:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        bl      __floatdidf
        mov     r8, r0
        mov     r6, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVP12
        mov     r0, r8
        mov     r1, r6
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      sqrt
        ldr     r3, [pc, #0x28C]
        mov     r6, r0
        mov     r8, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp, #4]
        strgth  r12, [r4]
        bgt     LAVP13
        mov     r2, r6
        mov     r3, r8
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r6, r0
        bl      __fixdfsi
        mov     r8, r0
        tst     r8, #1
        beq     LAVP11
        mov     r0, r8
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r6
        bl      __eqdf2
        cmp     r0, #0
        subeq   r8, r8, #1
LAVP11:
        strh    r8, [r4]
        b       LAVP13
LAVP12:
        mov     r12, #0
        strh    r12, [r4]
        mov     r12, #3
        str     r12, [sp, #8]
LAVP13:
        add     r9, r9, #1
        cmp     r9, r5
        add     r7, r7, #8
        add     r4, r4, #2
        blt     LAVP10
        ldr     r0, [sp, #8]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP14:
        mov     r0, r4
        mov     r1, r5
        bl      _ippsZero_16s
        cmp     r5, #0
        ble     LAVP18
        mov     r12, r9
LAVP15:
        ldr     r3, [r7, #4]
        tst     r3, r3
        bmi     LAVP17
        add     r12, r12, #1
        cmp     r12, r5
        add     r7, r7, #8
        blt     LAVP15
        mov     r0, r9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP16:
        mov     r0, r9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP17:
        mov     r0, #3
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP18:
        mov     r0, r9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP19:
        cmn     r11, #0xE
        blt     LAVP23
        rsb     r11, r11, #0
        mov     r0, r12, lsl r11
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r5, #0
        mov     r10, r0
        mov     r6, r1
        ble     LAVP26
        mov     r0, r9
        mov     r11, r0
        str     r0, [sp, #8]
        str     r9, [sp]
        str     r8, [sp, #4]
LAVP20:
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        bl      __floatdidf
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVP21
        mov     r0, r9
        mov     r1, r8
        mov     r2, r10
        mov     r3, r6
        bl      __muldf3
        bl      sqrt
        ldr     r3, [pc, #0xFC]
        mov     r8, r0
        mov     r9, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp, #4]
        strgth  r12, [r4]
        bgt     LAVP22
        mov     r2, r8
        mov     r3, r9
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        strh    r0, [r4]
        b       LAVP22
LAVP21:
        ldr     r12, [sp]
        strh    r12, [r4]
        mov     r12, #3
        str     r12, [sp, #8]
LAVP22:
        add     r11, r11, #1
        cmp     r11, r5
        add     r7, r7, #8
        add     r4, r4, #2
        blt     LAVP20
        ldr     r0, [sp, #8]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP23:
        cmp     r5, #0
        ble     LAVP27
        mov     r0, r9
        mov     r12, r0
        mov     r3, r12
LAVP24:
        ldr     r6, [r7, #4]
        ldr     lr, [r7]
        tst     r6, r6
        strmih  r3, [r4]
        movmi   r0, #3
        bmi     LAVP25
        orrs    r6, lr, r6
        moveq   lr, r9
        movne   lr, r8
        strh    lr, [r4]
LAVP25:
        add     r12, r12, #1
        cmp     r12, r5
        add     r7, r7, #8
        add     r4, r4, #2
        blt     LAVP24
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP26:
        mov     r0, r9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP27:
        mov     r0, r9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP28:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAVP29:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x41cfff80
        .long   0x40dfffc0


