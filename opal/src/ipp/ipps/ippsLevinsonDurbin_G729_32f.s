        .text
        .align  4
        .globl  _ippsLevinsonDurbin_G729_32f


_ippsLevinsonDurbin_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r10, [sp, #0x58]
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r6, r2
        mov     r4, r3
        beq     LDIB12
        cmp     r6, #0
        beq     LDIB12
        cmp     r4, #0
        beq     LDIB12
        cmp     r10, #0
        beq     LDIB12
        cmp     r8, #0
        ble     LDIB11
        ldr     r12, [r9, #4]
        ldr     r1, [r9]
        eor     r0, r12, #2, 2
        bl      __divsf3
        ldr     r12, [pc, #0x3A0]
        str     r0, [r4]
        ldr     r11, [r12]
        str     r11, [r6]
        ldr     r12, [r4]
        str     r12, [r6, #4]
        ldr     r0, [r9, #4]
        ldr     r1, [r4]
        ldr     r5, [r9]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        cmp     r8, #2
        blt     LDIB9
        ldr     r12, [pc, #0x36C]
        ldr     lr, [pc, #0x36C]
        sub     r5, r4, #4
        ldr     r3, [r12]
        mov     r7, #2
        ldr     r4, [lr]
        str     r10, [sp, #0x28]
        str     r8, [sp, #0x2C]
        mov     r12, #0
        mov     lr, #1
        str     r3, [sp, #0x20]
        str     r11, [sp, #0x24]
        str     r9, [sp, #0x30]
        mov     r8, r0
        mov     r10, r6
LDIB0:
        cmp     r7, #0
        mov     r9, r4
        movle   r11, r7, lsl #2
        ble     LDIB4
        cmp     r7, #6
        blt     LDIB10
        ldr     r3, [sp, #0x30]
        mov     r11, r7, lsl #2
        sub     r1, r7, #6
        mov     r0, #0
        add     r2, r10, #4
        str     r5, [sp, #0x14]
        str     r4, [sp, #8]
        str     r7, [sp, #0x1C]
        add     r6, r3, r11
        str     r8, [sp]
        str     r10, [sp, #4]
        mov     r4, r0
        mov     r7, r1
        mov     r5, r2
LDIB1:
        ldr     r1, [r5, #-4]
        rsb     r3, r4, #0
        ldr     r0, [r6, +r3, lsl #2]
        mvn     r3, #1
        rsb     r8, r4, r3
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r5]
        mvn     r3, #0
        rsb     r3, r4, r3
        ldr     r2, [r6, +r3, lsl #2]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r6, +r8, lsl #2]
        ldr     r2, [r5, #4]
        mov     r8, r0
        mov     r0, r1
        mvn     r9, #2
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        rsb     r9, r4, r9
        ldr     r1, [r6, +r9, lsl #2]
        ldr     r2, [r5, #8]
        mov     r8, r0
        mov     r0, r1
        mvn     r9, #3
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, #0xC]
        mov     r8, r0
        rsb     r9, r4, r9
        ldr     r0, [r6, +r9, lsl #2]
        add     r5, r5, #0x14
        add     r4, r4, #5
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        cmp     r4, r7
        mov     r9, r0
        ble     LDIB1
        mov     r0, r4
        ldr     r5, [sp, #0x14]
        ldr     r4, [sp, #8]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp]
        ldr     r10, [sp, #4]
LDIB2:
        add     r1, r10, r0, lsl #2
        str     r8, [sp]
        str     r10, [sp, #4]
        mov     r8, r0
        mov     r10, r1
LDIB3:
        rsb     r2, r8, #0
        ldr     r0, [r6, +r2, lsl #2]
        ldr     r1, [r10], #4
        add     r8, r8, #1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        cmp     r8, r7
        mov     r9, r0
        blt     LDIB3
        ldr     r8, [sp]
        ldr     r10, [sp, #4]
LDIB4:
        mov     r0, r8
        bl      __extendsfdf2
        mov     r3, #0x81, 12
        bic     r1, r1, #2, 2
        orr     r3, r3, #3, 4
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        ldrlt   r6, [sp, #0x24]
        strlt   r6, [r5, +r11]
        blt     LDIB5
        eor     r0, r9, #2, 2
        mov     r1, r8
        bl      __divsf3
        mov     r6, r0
        str     r6, [r5, +r11]
LDIB5:
        ldr     r0, [r5, +r11]
        bl      __extendsfdf2
        ldr     r3, [pc, #0x184]
        bic     r1, r1, #2, 2
        mov     r2, #0xA, 4
        bl      __gtdf2
        cmp     r0, #0
        bgt     LDIB13
        mov     r3, #0
        cmp     r7, #0
        mov     r12, #1
        movlt   r3, r12
        add     r3, r7, r3
        mov     r3, r3, asr #1
        cmp     r3, #1
        blt     LDIB8
        mov     r1, #1
        add     r0, r10, #4
        str     r9, [sp, #0xC]
        str     r4, [sp, #8]
        str     r8, [sp]
        str     r3, [sp, #0x10]
        str     r11, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x1C]
        mov     r8, r0
        mov     r9, r1
        mov     r4, r6
LDIB6:
        ldr     r3, [sp, #0x1C]
        ldr     r5, [r8]
        mov     r0, r4
        sub     r11, r3, r9
        ldr     r6, [r10, +r11, lsl #2]
        add     r9, r9, #1
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        str     r0, [r10, +r11, lsl #2]
        str     r7, [r8], #4
        ldr     r3, [sp, #0x10]
        cmp     r9, r3
        bgt     LDIB7
        ldr     r3, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r4, [r3, +r12]
        b       LDIB6
LDIB7:
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r9, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp]
        ldr     r6, [r5, +r11]
LDIB8:
        str     r6, [r11, +r10]
        ldr     r0, [r5, +r11]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r1, r4
        bl      __lesf2
        cmp     r0, #0
        ldrle   r8, [sp, #0x20]
        ldr     r3, [sp, #0x2C]
        add     r7, r7, #1
        cmp     r7, r3
        ble     LDIB0
        mov     r0, r8
        ldr     r10, [sp, #0x28]
LDIB9:
        str     r0, [r10]
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDIB10:
        ldr     r3, [sp, #0x30]
        mov     r11, r7, lsl #2
        mov     r0, #0
        add     r6, r3, r11
        b       LDIB2
LDIB11:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDIB12:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDIB13:
        ldr     r3, [sp, #0x20]
        ldr     r10, [sp, #0x28]
        mov     r0, #0
        str     r3, [r10]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LDIB__2il0floatpacket.1
        .long   LDIB__2il0floatpacket.3
        .long   LDIB__2il0floatpacket.2
        .long   0x3feffb80


        .data
        .align  4


LDIB__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LDIB__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00
LDIB__2il0floatpacket.3:
        .byte   0x6F,0x12,0x83,0x3A


