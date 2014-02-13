        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearch_G729A_32f


_ippsOpenLoopPitchSearch_G729A_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r4, r0
        cmp     r4, #0
        str     r1, [sp, #0x20]
        beq     LDHJ13
        ldr     r1, [sp, #0x20]
        cmp     r1, #0
        beq     LDHJ13
        ldr     r1, [pc, #0x62C]
        ldr     r2, [pc, #0x62C]
        mov     r3, #0
        ldr     r5, [r1]
        str     r3, [sp]
        ldr     r9, [r2]
        ldr     r10, [sp]
        mov     r7, #0x14
        mov     r6, r5
        str     r5, [sp, #8]
LDHJ0:
        rsb     r2, r7, #0
        mov     r0, #0
        add     r2, r4, r2, lsl #2
        add     r11, r4, #8
        str     r4, [sp, #0xC]
        mov     r5, r9
        add     r8, r2, #8
        mov     r4, r0
LDHJ1:
        ldr     r1, [r8, #-8]
        ldr     r0, [r11, #-8]
        add     r4, r4, #8
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r11]
        ldr     r1, [r8]
        mov     r5, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r11, #8]
        ldr     r1, [r8, #8]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r11, #0x10]
        ldr     r1, [r8, #0x10]
        add     r11, r11, #0x20
        add     r8, r8, #0x20
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        cmp     r4, #0x50
        mov     r5, r0
        blt     LDHJ1
        ldr     r4, [sp, #0xC]
        mov     r0, r5
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        movgt   r6, r5
        movgt   r10, r7
        add     r7, r7, #1
        cmp     r7, #0x28
        blt     LDHJ0
        ldr     r5, [sp, #8]
        str     r10, [sp]
        mov     r8, #0
        mov     r7, r5
        mov     r10, #0x28
        str     r6, [sp, #4]
        str     r5, [sp, #8]
LDHJ2:
        rsb     r2, r10, #0
        mov     r0, #0
        add     r2, r4, r2, lsl #2
        add     r11, r4, #8
        str     r4, [sp, #0xC]
        add     r6, r2, #8
        mov     r5, r9
        mov     r4, r0
LDHJ3:
        ldr     r1, [r6, #-8]
        ldr     r0, [r11, #-8]
        add     r4, r4, #8
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r11]
        ldr     r1, [r6]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r11, #8]
        ldr     r1, [r6, #8]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        ldr     r0, [r11, #0x10]
        ldr     r1, [r6, #0x10]
        add     r11, r11, #0x20
        add     r6, r6, #0x20
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        cmp     r4, #0x50
        mov     r5, r0
        blt     LDHJ3
        ldr     r4, [sp, #0xC]
        mov     r0, r5
        mov     r1, r7
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r5
        movgt   r8, r10
        add     r10, r10, #1
        cmp     r10, #0x50
        blt     LDHJ2
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #8]
        mov     r11, #0
        mov     r10, #0x50
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     r6, [sp, #4]
LDHJ4:
        rsb     r2, r10, #0
        mov     r0, #0
        add     r2, r4, r2, lsl #2
        add     r8, r4, #8
        str     r4, [sp, #0xC]
        add     r7, r2, #8
        mov     r6, r9
        mov     r4, r0
LDHJ5:
        ldr     r1, [r7, #-8]
        ldr     r0, [r8, #-8]
        add     r4, r4, #8
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [r8]
        ldr     r1, [r7]
        mov     r6, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r7, #8]
        ldr     r2, [r8, #8]
        mov     r6, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r7, #0x10]
        ldr     r2, [r8, #0x10]
        mov     r6, r0
        add     r8, r8, #0x20
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        cmp     r4, #0x50
        add     r7, r7, #0x20
        mov     r6, r0
        blt     LDHJ5
        ldr     r4, [sp, #0xC]
        mov     r0, r6
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r5, r6
        movgt   r11, r10
        add     r10, r10, #2
        cmp     r10, #0x8F
        blt     LDHJ4
        ldr     r2, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     r6, [sp, #4]
        sub     r0, r4, r2, lsl #2
        add     r3, sp, #0x2C
        mov     r1, r0
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_32f
        sub     r0, r4, r8, lsl #2
        add     r3, sp, #0x28
        mov     r1, r0
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_32f
        mov     r9, r11
        mov     r0, r6
        bl      __extendsfdf2
        mov     r6, r0
        mov     r0, r7
        mov     r7, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x18]
        mov     r0, r5
        str     r1, [sp, #0x10]
        bl      __extendsfdf2
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #4]
        bl      __extendsfdf2
        ldr     r2, [pc, #0x31C]
        ldr     r3, [pc, #0x31C]
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        bl      __extendsfdf2
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x24]
        mov     r2, r0
        mov     r0, #0
        bl      __divdf3
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        add     r12, r11, #1
        mov     r7, r0
        mov     r10, r1
        str     r12, [sp, #0x14]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [pc, #0x2C0]
        ldr     r3, [pc, #0x2C0]
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [sp, #0x24]
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x10]
        bl      __muldf3
        ldr     r12, [sp, #0x14]
        mov     r6, r1
        add     r3, sp, #0x30
        mov     r5, r0
        sub     r1, r4, r12, lsl #2
        mov     r0, r4
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_32f
        ldr     r0, [sp, #0x30]
        bl      __extendsfdf2
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x18]
        bl      __gtdf2
        cmp     r0, #0
        ble     LDHJ6
        ldr     r12, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x18]
        str     r12, [sp, #4]
LDHJ6:
        sub     r11, r11, #1
        add     r3, sp, #0x30
        sub     r1, r4, r11, lsl #2
        str     r11, [sp, #0x14]
        mov     r0, r4
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_32f
        ldr     r0, [sp, #0x30]
        bl      __extendsfdf2
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        str     r1, [sp, #0x10]
        mov     r11, r0
        bl      __gtdf2
        cmp     r0, #0
        ble     LDHJ7
        ldr     r12, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        str     r11, [sp, #8]
        str     r12, [sp, #4]
LDHJ7:
        sub     r0, r4, r9, lsl #2
        add     r3, sp, #0x30
        mov     r1, r0
        mov     r2, #0x50
        bl      _ippsDotProd_G729A_32f
        ldr     r0, [sp, #0x30]
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        str     r4, [sp, #0xC]
        bl      __extendsfdf2
        ldr     r2, [pc, #0x1B8]
        ldr     r3, [pc, #0x1B8]
        rsb     r12, r9, r8, lsl #1
        str     r12, [sp, #0x24]
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        bl      __extendsfdf2
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __muldf3
        ldr     lr, [sp, #0x24]
        mov     r11, r0
        mov     r4, r1
        eor     r12, lr, lr, asr #31
        sub     r12, r12, lr, asr #31
        cmp     r12, #5
        bge     LDHJ8
        mov     r0, r11
        mov     r1, r4
        ldr     r12, [sp, #0xC]
        mov     r2, #0
        sub     r3, r12, #2, 12
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r5, r0
        mov     r6, r1
LDHJ8:
        add     r12, r8, r8, lsl #1
        sub     r12, r12, r9
        eor     lr, r12, r12, asr #31
        sub     lr, lr, r12, asr #31
        cmp     lr, #7
        bge     LDHJ9
        ldr     r12, [sp, #0xC]
        mov     r0, r11
        mov     r1, r4
        sub     r3, r12, #2, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r5, r0
        mov     r6, r1
LDHJ9:
        ldr     r12, [sp]
        rsb     r12, r8, r12, lsl #1
        eor     lr, r12, r12, asr #31
        sub     lr, lr, r12, asr #31
        cmp     lr, #5
        bge     LDHJ10
        mov     r0, r5
        mov     r1, r6
        ldr     r3, [pc, #0xD4]
        mov     r2, #0xA, 4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r10
        bl      __adddf3
        mov     r7, r0
        mov     r10, r1
LDHJ10:
        ldr     r12, [sp]
        add     r12, r12, r12, lsl #1
        sub     r12, r12, r8
        eor     lr, r12, r12, asr #31
        sub     lr, lr, r12, asr #31
        cmp     lr, #7
        bge     LDHJ11
        ldr     r3, [pc, #0x98]
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0xA, 4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r10
        bl      __adddf3
        mov     r7, r0
        mov     r10, r1
LDHJ11:
        mov     r0, r7
        mov     r1, r10
        mov     r2, r5
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LDHJ12
        mov     r7, r5
        mov     r10, r6
        str     r8, [sp]
LDHJ12:
        mov     r0, r7
        mov     r1, r10
        mov     r2, r11
        mov     r3, r4
        bl      __ltdf2
        cmp     r0, #0
        strlt   r9, [sp]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp]
        str     r1, [r0]
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDHJ13:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LDHJ__2il0floatpacket.1
        .long   LDHJ__2il0floatpacket.2
        .long   0x47ae147b
        .long   0x3f847ae1
        .long   0x3fc99999


        .data
        .align  4


LDHJ__2il0floatpacket.1:
        .byte   0xFF,0xFF,0x7F,0xFF
LDHJ__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


