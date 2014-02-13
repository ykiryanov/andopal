        .text
        .align  4
        .globl  _ippsFullbandController_EC_32f


_ippsFullbandController_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r11, [sp, #0x50]
        ldr     r12, [sp, #0x54]
        cmp     r0, #0
        mov     r9, r2
        str     r3, [sp, #4]
        beq     LDLJ16
        cmp     r1, #0
        beq     LDLJ16
        cmp     r9, #0
        beq     LDLJ16
        ldr     r3, [sp, #4]
        cmp     r3, #0
        beq     LDLJ16
        cmp     r11, #0
        beq     LDLJ16
        cmp     r12, #0
        beq     LDLJ16
        ldr     r3, [pc, #0x580]
        and     lr, r12, #0xF
        rsb     lr, lr, #0
        ldr     r5, [r3]
        and     lr, lr, #0xF
        add     r10, r12, lr
        str     r5, [sp, #0x10]
        ldr     r2, [r10, #0x20]
        mov     r6, r5
        cmp     r2, #0
        ble     LDLJ3
        cmp     r2, #4
        mov     r7, #0
        blt     LDLJ1
        str     r10, [sp, #0xC]
        str     r9, [sp]
        sub     r3, r2, #4
        mov     r9, r5
        mov     r10, r6
        add     r8, r0, #4
        add     r4, r1, #4
        str     r11, [sp, #8]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
        mov     r5, r2
        mov     r6, r3
LDLJ0:
        ldr     r0, [r8, #-4]
        add     r7, r7, #3
        mov     r1, r0
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r4, #-4]
        mov     r10, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r8]
        mov     r9, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r4]
        mov     r10, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r8, #4]
        mov     r9, r0
        add     r8, r8, #0xC
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r4, #4]
        mov     r10, r0
        add     r4, r4, #0xC
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        cmp     r7, r6
        mov     r9, r0
        ble     LDLJ0
        mov     r2, r5
        mov     r5, r9
        mov     r6, r10
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r9, [sp]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x14]
LDLJ1:
        str     r9, [sp]
        add     r4, r0, r7, lsl #2
        add     r8, r1, r7, lsl #2
        mov     r9, r2
LDLJ2:
        ldr     r1, [r4], #4
        add     r7, r7, #1
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r8], #4
        mov     r6, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        cmp     r7, r9
        mov     r5, r0
        blt     LDLJ2
        ldr     r9, [sp]
LDLJ3:
        ldr     r3, [pc, #0x408]
        ldr     r8, [r10, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r0, [r3]
        mov     r1, r8
        str     r0, [sp, #0x20]
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [r10, #4]
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x24]
        mov     r1, r6
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        str     r0, [sp, #0x1C]
        str     r0, [r10, #4]
        ldr     r0, [r10, #8]
        mov     r1, r8
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r6, [r10, #0x24]
        mov     r5, r0
        str     r5, [r10, #8]
        cmp     r6, #0
        ble     LDLJ7
        cmp     r6, #6
        movlt   r0, #0
        blt     LDLJ5
        str     r10, [sp, #0xC]
        str     r11, [sp, #8]
        sub     r2, r6, #6
        add     r1, r9, #4
        mov     r0, #0
        str     r9, [sp]
        mov     r11, r4
        mov     r10, r6
        mov     r4, r0
        mov     r6, r1
        mov     r9, r2
LDLJ4:
        ldr     r1, [r6, #-4]
        add     r4, r4, #5
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6]
        mov     r11, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #4]
        mov     r11, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #8]
        mov     r11, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #0xC]
        mov     r11, r0
        add     r6, r6, #0x14
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        cmp     r4, r9
        mov     r11, r0
        ble     LDLJ4
        mov     r0, r4
        mov     r4, r11
        mov     r6, r10
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r9, [sp]
LDLJ5:
        add     r1, r9, r0, lsl #2
        str     r11, [sp, #8]
        str     r9, [sp]
        mov     r9, r0
        mov     r11, r1
LDLJ6:
        ldr     r1, [r11], #4
        add     r9, r9, #1
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r6
        mov     r4, r0
        blt     LDLJ6
        ldr     r11, [sp, #8]
        ldr     r9, [sp]
LDLJ7:
        ldr     r0, [r10, #0xC]
        mov     r1, r4
        str     r0, [sp, #0x24]
        bl      __subsf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x24]
        mov     r1, r8
        bl      __mulsf3
        ldr     r3, [sp, #0x18]
        mov     r8, r0
        mov     r0, r7
        bic     r3, r3, #2, 2
        str     r3, [sp, #0x18]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10, #0xC]
        ldr     r0, [sp, #0x1C]
        bl      __extendsfdf2
        mov     r8, r0
        mov     r0, r5
        mov     r7, r1
        bl      __extendsfdf2
        ldr     lr, [pc, #0x210]
        ldr     r12, [pc, #0x210]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x14]
        mov     r2, lr, lsl #1
        sub     r3, r12, #1, 12
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LDLJ10
        mov     r0, r4
        bl      __extendsfdf2
        ldr     r12, [pc, #0x1D8]
        ldr     r3, [pc, #0x1D8]
        mov     r2, r12, lsl #1
        bl      __muldf3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0x18]
        bl      __extendsfdf2
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x18]
        bl      __ltdf2
        cmp     r0, #0
        bge     LDLJ10
        cmp     r6, #0
        ble     LDLJ9
        ldr     r0, [sp, #4]
        mov     r1, #0
LDLJ8:
        ldr     r3, [r9], #4
        add     r1, r1, #1
        str     r3, [r0], #4
        ldr     r3, [r10, #0x24]
        cmp     r1, r3
        blt     LDLJ8
        ldr     r0, [r10, #4]
        str     r0, [sp, #0x1C]
LDLJ9:
        ldr     r5, [sp, #0x1C]
        ldr     r0, [r10, #0x2C]
        ldr     r1, [r10, #0x18]
        str     r5, [r10, #8]
        bl      __mulsf3
        bl      __extendsfdf2
        bl      __truncdfsf2
        str     r0, [r10, #0x2C]
        b       LDLJ13
LDLJ10:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     r3, [pc, #0x150]
        ldr     r2, [pc, #0x144]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        ldrge   r0, [r10, #0x2C]
        bge     LDLJ13
        cmp     r6, #0
        ble     LDLJ12
        ldr     r0, [sp, #4]
        mov     r1, #0
LDLJ11:
        ldr     r3, [r0], #4
        add     r1, r1, #1
        str     r3, [r9], #4
        ldr     r3, [r10, #0x24]
        cmp     r1, r3
        blt     LDLJ11
        ldr     r5, [r10, #8]
LDLJ12:
        ldr     r0, [r10, #0x2C]
        ldr     r4, [r10, #0x18]
        str     r5, [r10, #4]
        mov     r1, r4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r6, r0
        ldr     r0, [sp, #0x20]
        mov     r7, r1
        mov     r1, r4
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r10, #0x2C]
LDLJ13:
        bl      __extendsfdf2
        mov     r2, #0xFE, 12
        orr     r3, r2, #3, 4
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LDLJ14
        mov     r0, r5
        bl      __extendsfdf2
        ldr     r2, [r10, #0x10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [pc, #0x7C]
        ldr     r3, [pc, #0x7C]
        mov     r2, r12, lsl #1
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        bgt     LDLJ15
LDLJ14:
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0x10]
LDLJ15:
        ldr     r0, [r10, #0x28]
        ldr     r5, [r10, #0x1C]
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        ldr     r0, [sp, #0x20]
        mov     r1, r5
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r10, #0x28]
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDLJ16:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLJ__2il0floatpacket.1
        .long   LDLJ__2il0floatpacket.2
        .long   0xcccccccd
        .long   0x3fc99999
        .long   0x3ff4cccc


        .data
        .align  4


LDLJ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLJ__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


