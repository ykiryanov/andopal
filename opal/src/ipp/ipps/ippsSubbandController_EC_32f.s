        .text
        .align  4
        .globl  _ippsSubbandController_EC_32f


_ippsSubbandController_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     lr, [sp, #0x84]
        ldr     r12, [pc, #0x6D0]
        ldr     r11, [sp, #0x88]
        str     lr, [sp, #0x28]
        mov     r5, r0
        ldr     r6, [r12]
        mov     r9, r1
        mov     r10, r2
        cmp     r5, #0
        mov     r8, r6
        str     r8, [sp, #0x34]
        str     r3, [sp]
        str     r8, [sp, #0x3C]
        beq     LDLC15
        cmp     r9, #0
        beq     LDLC15
        cmp     r10, #0
        beq     LDLC15
        ldr     r3, [sp]
        cmp     r3, #0
        beq     LDLC15
        ldr     r3, [sp, #0x28]
        cmp     r3, #0
        beq     LDLC15
        cmp     r11, #0
        beq     LDLC15
        and     r3, r11, #0xF
        rsb     r3, r3, #0
        and     r12, r3, #0xF
        str     r12, [sp, #0x10]
        ldr     r3, [r12, +r11]
        add     r7, r11, r12
        cmp     r3, #0
        ldr     r3, [r7, #0x1C]
        str     r3, [sp, #0x18]
        ldr     r3, [r7, #0x14]
        str     r3, [sp, #0x14]
        ldr     r3, [r7, #0x10]
        str     r3, [sp, #0x1C]
        ldr     r3, [r7, #0x28]
        str     r3, [sp, #4]
        ldr     r3, [r7, #0x24]
        str     r3, [sp, #8]
        ldr     r3, [pc, #0x62C]
        ldrle   r4, [r3]
        ble     LDLC10
        ldr     r4, [r3]
        ldr     r1, [sp, #4]
        mov     r3, #0
        str     r3, [sp, #0xC]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x20]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        str     r7, [sp, #0x40]
        str     r8, [sp, #0x38]
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        str     r4, [sp, #0x5C]
        str     r9, [sp, #0x4C]
        str     r0, [sp, #0x48]
        str     r11, [sp, #0x2C]
        str     r10, [sp, #0x24]
        mov     r4, r1
LDLC0:
        ldr     r2, [sp, #0x4C]
        ldr     r0, [r2]
        ldr     r9, [r2, #4]
        add     r2, r2, #8
        str     r2, [sp, #0x4C]
        mov     r1, r0
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r5]
        ldr     r9, [r5, #4]
        str     r0, [sp, #0x54]
        mov     r0, r1
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        ldr     r9, [sp, #0x30]
        add     r5, r5, #8
        ldr     r11, [r2, #8]
        str     r0, [sp, #0x50]
        cmp     r11, #0
        ble     LDLC2
        ldr     r10, [sp, #0x24]
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0xC]
        str     r4, [sp, #0x44]
LDLC1:
        ldr     r2, [r10], #4
        ldr     r1, [r2, +r8]
        add     r2, r8, r2
        ldr     r4, [r2, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        subs    r11, r11, #1
        mov     r9, r0
        bne     LDLC1
        ldr     r4, [sp, #0x44]
        ldr     r8, [sp, #0x14]
LDLC2:
        ldr     r10, [r7]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x20]
        mov     r1, r9
        bic     r9, r11, #2, 2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7]
        ldr     r10, [sp, #8]
        ldr     r0, [r8]
        mov     r1, r10
        bl      __mulsf3
        ldr     r11, [sp, #0x48]
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x58]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        str     r0, [r8]
        ldr     r0, [r6]
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        mov     r10, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r10, r0
        str     r10, [r6]
        ldr     r0, [r7], #4
        bl      __extendsfdf2
        ldr     r2, [pc, #0x44C]
        ldr     r3, [pc, #0x44C]
        bl      __muldf3
        mov     r11, r0
        mov     r0, r9
        mov     r9, r1
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LDLC5
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r11, [r8]
        str     r1, [sp, #0x54]
        mov     r9, r0
        mov     r0, r11
        bl      __extendsfdf2
        ldr     r12, [pc, #0x400]
        ldr     r3, [pc, #0x404]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x58]
        rsb     r2, r12, #0
        bl      __muldf3
        ldr     r3, [sp, #0x54]
        mov     r2, r9
        bl      __gtdf2
        cmp     r0, #0
        ble     LDLC6
        ldr     r2, [sp, #0x40]
        ldr     r2, [r2, #8]
        cmp     r2, #0
        ble     LDLC4
        ldr     r2, [sp]
        ldr     r1, [sp, #0x24]
        ldr     lr, [sp, #0xC]
        ldr     r9, [sp, #0x40]
        mov     r12, #0
LDLC3:
        ldr     r3, [r1], #4
        ldr     r10, [r2], #4
        ldr     r11, [r3, +lr]
        add     r0, lr, r3
        add     r3, lr, r10
        str     r11, [r10, +lr]
        ldr     r0, [r0, #4]
        add     r12, r12, #1
        str     r0, [r3, #4]
        ldr     r3, [r9, #8]
        cmp     r12, r3
        blt     LDLC3
        ldr     r10, [r6]
LDLC4:
        str     r10, [r8]
        ldr     r0, [sp, #0x38]
        mov     r1, r10
        mov     r11, r10
        bl      __addsf3
        str     r0, [sp, #0x38]
        b       LDLC9
LDLC5:
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r11, [r8]
        str     r1, [sp, #0x54]
        mov     r9, r0
        mov     r0, r11
        bl      __extendsfdf2
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x58]
LDLC6:
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x58]
        mov     r3, #0xFE, 12
        orr     r3, r3, #3, 4
        add     r3, r3, #6, 14
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0x54]
        mov     r2, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LDLC9
        ldr     r2, [sp, #0x40]
        ldr     r2, [r2, #8]
        cmp     r2, #0
        ble     LDLC8
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp]
        ldr     lr, [sp, #0xC]
        ldr     r9, [sp, #0x40]
        mov     r12, #0
LDLC7:
        ldr     r3, [r1], #4
        ldr     r10, [r2], #4
        ldr     r11, [r3, +lr]
        add     r0, lr, r3
        add     r3, lr, r10
        str     r11, [r10, +lr]
        ldr     r0, [r0, #4]
        add     r12, r12, #1
        str     r0, [r3, #4]
        ldr     r3, [r9, #8]
        cmp     r12, r3
        blt     LDLC7
        ldr     r11, [r8]
LDLC8:
        str     r11, [r6]
        ldr     r0, [sp, #0x3C]
        ldr     r11, [r8]
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x3C]
LDLC9:
        ldr     r0, [sp, #0x34]
        mov     r1, r11
        add     r4, r4, #1
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x10]
        add     r6, r6, #4
        add     r8, r8, #4
        ldr     r2, [r3, +r2]
        str     r0, [sp, #0x34]
        cmp     r4, r2
        ldr     r2, [sp, #0xC]
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        blt     LDLC0
        ldr     r4, [sp, #0x5C]
        ldr     r7, [sp, #0x40]
        ldr     r8, [sp, #0x38]
        ldr     r6, [sp, #0x30]
LDLC10:
        ldr     r2, [r7, #0x4C]
        cmp     r2, #0
        beq     LDLC12
        mov     r0, r8
        bl      __extendsfdf2
        mov     r11, r0
        ldr     r0, [sp, #0x34]
        mov     r10, r1
        bl      __extendsfdf2
        ldr     r2, [pc, #0x22C]
        ldr     r3, [pc, #0x22C]
        str     r1, [sp, #0xC]
        mov     r5, r0
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r2, r11
        mov     r3, r10
        bl      __ltdf2
        cmp     r0, #0
        bge     LDLC11
        ldr     r0, [r7, #0x20]
        ldr     r12, [pc, #0x1FC]
        add     r10, r12, #1, 12
        bl      __extendsfdf2
        ldr     r2, [pc, #0x1EC]
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0xC]
        mov     r2, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LDLC11
        ldr     r0, [r7, #0x3C]
        ldr     r8, [r7, #0x2C]
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r8
        bl      __subsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7, #0x3C]
        b       LDLC14
LDLC11:
        ldr     r0, [sp, #0x3C]
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r8
        bl      __gtdf2
        cmp     r0, #0
        ldrle   r0, [r7, #0x3C]
        ble     LDLC14
        ldr     r0, [r7, #0x3C]
        ldr     r8, [r7, #0x2C]
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r8
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7, #0x3C]
        b       LDLC14
LDLC12:
        mov     r0, r8
        bl      __extendsfdf2
        mov     r10, r0
        ldr     r0, [sp, #0x34]
        mov     r9, r1
        bl      __extendsfdf2
        ldr     r2, [pc, #0x124]
        ldr     r3, [pc, #0x124]
        bl      __muldf3
        mov     r8, r0
        mov     r5, r1
        mov     r2, r10
        mov     r3, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LDLC13
        ldr     r0, [r7, #0x3C]
        ldr     r8, [r7, #0x2C]
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r8
        bl      __subsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7, #0x3C]
        b       LDLC14
LDLC13:
        ldr     r0, [sp, #0x3C]
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ldrle   r0, [r7, #0x3C]
        ble     LDLC14
        ldr     r0, [r7, #0x3C]
        ldr     r8, [r7, #0x2C]
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r8
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7, #0x3C]
LDLC14:
        bl      __extendsfdf2
        mov     r2, #0xFE, 12
        orr     r3, r2, #3, 4
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        movgt   r6, r4
        ldr     r0, [r7, #0x34]
        ldr     r8, [r7, #0x30]
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r8
        bl      __subsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7, #0x34]
        ldr     r1, [sp, #0x28]
        str     r0, [r1]
        mov     r0, #0
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDLC15:
        mvn     r0, #7
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLC__2il0floatpacket.1
        .long   LDLC__2il0floatpacket.2
        .long   0x9999999a
        .long   0x3fb99999
        .long   0x3fd66666


        .data
        .align  4


LDLC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLC__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


