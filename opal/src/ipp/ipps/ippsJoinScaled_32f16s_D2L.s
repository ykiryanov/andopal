        .text
        .align  4
        .globl  _ippsJoinScaled_32f16s_D2L


_ippsJoinScaled_32f16s_D2L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        cmp     r3, #0
        beq     LBLX10
        cmp     r1, #0
        ble     LBLX9
        cmp     r2, #0
        ble     LBLX9
        cmp     r0, #0
        beq     LBLX10
        cmp     r1, #0
        ble     LBLX1
        mov     r12, r0
        mov     lr, r1
LBLX0:
        ldr     r4, [r12], #4
        cmp     r4, #0
        beq     LBLX11
        subs    lr, lr, #1
        bne     LBLX0
LBLX1:
        cmp     r2, #0
        ble     LBLX7
        mvn     r12, #0xFF
        bic     lr, r12, #0x7F, 24
        mvn     r12, #0
        mov     r9, #0
        mov     r4, r12, lsl #15
        mvn     lr, lr
        mov     r12, r9
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x34]
        str     r3, [sp, #0x24]
        str     r0, [sp, #0x30]
LBLX2:
        cmp     r1, #0
        ble     LBLX8
        ldr     lr, [pc, #0x18C]
        ldr     r0, [pc, #0x18C]
        ldr     r3, [pc, #0x18C]
        ldr     r10, [lr]
        ldr     r5, [sp, #0x24]
        ldr     lr, [r0]
        ldr     r4, [r3]
        ldr     r3, [pc, #0x17C]
        ldr     r0, [pc, #0x17C]
        ldr     r7, [pc, #0x17C]
        add     r6, r5, r9, lsl #1
        ldr     r3, [r3]
        ldr     r0, [r0]
        ldr     r11, [r7]
        ldr     r5, [sp, #0x30]
        str     r10, [sp]
        ldr     r10, [sp, #0x34]
        mov     r8, r12, lsl #2
        mov     r7, r1
        str     r11, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     lr, [sp, #4]
        str     r12, [sp, #0x20]
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x2C]
LBLX3:
        ldr     r0, [r5], #4
        mov     r1, r4
        ldr     r11, [r0, +r8]
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        strgth  r10, [r6]
        bgt     LBLX6
        mov     r0, r11
        ldr     r1, [sp]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r0, [sp, #0x1C]
        strlth  r0, [r6]
        blt     LBLX6
        ldr     r0, [sp, #0xC]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        mov     r11, r0
        bl      __ltsf2
        ldr     r1, [sp, #0x10]
        cmp     r0, #0
        mvnge   r2, #0
        strge   r2, [sp, #0x18]
        bge     LBLX4
        ldr     r1, [sp, #4]
        mov     r2, #1
        str     r2, [sp, #0x18]
LBLX4:
        mov     r0, r11
        bl      __addsf3
        str     r0, [sp, #8]
        bl      __fixsfsi
        mov     r11, r0
        tst     r11, #1
        beq     LBLX5
        mov     r0, r11
        bl      __floatsisf
        ldr     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        ldreq   r2, [sp, #0x18]
        addeq   r11, r11, r2
LBLX5:
        strh    r11, [r6]
LBLX6:
        subs    r7, r7, #1
        add     r6, r6, #2
        add     r9, r9, #1
        bne     LBLX3
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        add     r12, r12, #1
        str     r10, [sp, #0x34]
        cmp     r12, r2
        blt     LBLX2
LBLX7:
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBLX8:
        add     r12, r12, #1
        cmp     r12, r2
        blt     LBLX2
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBLX9:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBLX10:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBLX11:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LBLX__2il0floatpacket.2
        .long   LBLX__2il0floatpacket.3
        .long   LBLX__2il0floatpacket.1
        .long   LBLX__2il0floatpacket.4
        .long   LBLX__2il0floatpacket.5
        .long   LBLX__2il0floatpacket.6


        .data
        .align  4


LBLX__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBLX__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0xBF
LBLX__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xBF
LBLX__2il0floatpacket.4:
        .byte   0x00,0xFF,0xFF,0x46
LBLX__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F
LBLX__2il0floatpacket.6:
        .byte   0x00,0x00,0x00,0x00


