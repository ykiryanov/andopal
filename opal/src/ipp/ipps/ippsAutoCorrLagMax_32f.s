        .text
        .align  4
        .globl  _ippsAutoCorrLagMax_32f


_ippsAutoCorrLagMax_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     lr, [sp, #0x44]
        ldr     r12, [sp, #0x48]
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        mov     r8, r2
        mov     r7, r3
        beq     LDHL7
        cmp     lr, #0
        beq     LDHL7
        cmp     r12, #0
        beq     LDHL7
        cmp     r10, #0
        ble     LDHL8
        ldr     r4, [pc, #0x208]
        cmp     r8, r7
        mov     r11, #0
        ldr     r5, [r4]
        bge     LDHL5
        ldr     r0, [pc, #0x1F8]
        sub     r4, r10, #6
        ldr     r6, [r0]
        str     r4, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
LDHL0:
        cmp     r10, #0
        mov     r4, r6
        ble     LDHL4
        cmp     r10, #6
        blt     LDHL6
        rsb     r12, r8, #0
        add     r3, r9, #4
        add     r0, r9, r12, lsl #2
        str     r10, [sp, #4]
        str     r9, [sp]
        ldr     r10, [sp, #0x1C]
        str     r11, [sp, #0x18]
        mov     r9, r6
        mov     r1, #0
        add     r2, r0, #4
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
        mov     r11, r4
        mov     r6, r5
        mov     r4, r0
        mov     r5, r1
        mov     r7, r2
        mov     r8, r3
LDHL1:
        ldr     r1, [r7, #-4]
        ldr     r0, [r8, #-4]
        add     r5, r5, #5
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r8]
        ldr     r2, [r7]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r8, #4]
        ldr     r2, [r7, #4]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r8, #8]
        ldr     r2, [r7, #8]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r8, #0xC]
        ldr     r2, [r7, #0xC]
        mov     r11, r0
        mov     r0, r1
        add     r8, r8, #0x14
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        cmp     r5, r10
        mov     r11, r0
        add     r7, r7, #0x14
        ble     LDHL1
        mov     r0, r4
        mov     r4, r11
        mov     r1, r5
        mov     r5, r6
        mov     r6, r9
        ldr     r11, [sp, #0x18]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r9, [sp]
LDHL2:
        add     r2, r9, r1, lsl #2
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
        str     r9, [sp]
        mov     r7, r0
        mov     r8, r1
        mov     r9, r2
LDHL3:
        ldr     r1, [r7, +r8, lsl #2]
        ldr     r0, [r9], #4
        add     r8, r8, #1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r10
        mov     r4, r0
        blt     LDHL3
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp]
LDHL4:
        mov     r0, r4
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r5, r4
        movgt   r11, r8
        add     r8, r8, #1
        cmp     r8, r7
        blt     LDHL0
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x10]
LDHL5:
        str     r11, [r12]
        mov     r0, #0
        str     r5, [lr]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDHL6:
        rsb     r12, r8, #0
        mov     r1, #0
        add     r0, r9, r12, lsl #2
        b       LDHL2
LDHL7:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDHL8:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LDHL__2il0floatpacket.1
        .long   LDHL__2il0floatpacket.2


        .data
        .align  4


LDHL__2il0floatpacket.1:
        .byte   0xFF,0xFF,0x7F,0xFF
LDHL__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


