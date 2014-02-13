        .text
        .align  4
        .globl  _ippsJoin_32f16s_D2L


_ippsJoin_32f16s_D2L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        cmp     r3, #0
        beq     LBLY10
        cmp     r1, #0
        ble     LBLY9
        cmp     r2, #0
        ble     LBLY9
        cmp     r0, #0
        beq     LBLY10
        cmp     r1, #0
        ble     LBLY1
        mov     r12, r0
        mov     lr, r1
LBLY0:
        ldr     r4, [r12], #4
        cmp     r4, #0
        beq     LBLY11
        subs    lr, lr, #1
        bne     LBLY0
LBLY1:
        cmp     r2, #0
        ble     LBLY7
        mvn     r12, #0xFF
        bic     lr, r12, #0x7F, 24
        mvn     r12, #0
        mov     r9, #0
        mov     r4, r12, lsl #15
        mvn     lr, lr
        mov     r12, r9
        str     r4, [sp, #4]
        str     lr, [sp, #0x30]
        str     r0, [sp, #0x2C]
LBLY2:
        cmp     r1, #0
        ble     LBLY8
        ldr     r0, [pc, #0x170]
        ldr     lr, [pc, #0x170]
        ldr     r5, [pc, #0x170]
        ldr     r10, [r0]
        ldr     r0, [pc, #0x16C]
        ldr     r4, [lr]
        ldr     lr, [pc, #0x168]
        ldr     r11, [r5]
        ldr     r0, [r0]
        ldr     lr, [lr]
        ldr     r5, [sp, #0x2C]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x30]
        add     r6, r3, r9, lsl #1
        mov     r8, r12, lsl #2
        mov     r7, r1
        str     r0, [sp, #0x18]
        str     lr, [sp, #0xC]
        str     r11, [sp]
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x28]
LBLY3:
        ldr     r0, [r5], #4
        mov     r1, r4
        ldr     r11, [r0, +r8]
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        strgth  r10, [r6]
        bgt     LBLY6
        mov     r0, r11
        ldr     r1, [sp]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r0, [sp, #4]
        strlth  r0, [r6]
        blt     LBLY6
        mov     r0, r11
        ldr     r1, [sp, #0xC]
        bl      __ltsf2
        ldr     r1, [sp, #8]
        cmp     r0, #0
        mvnge   r2, #0
        strge   r2, [sp, #0x14]
        bge     LBLY4
        ldr     r1, [sp, #0x18]
        mov     r2, #1
        str     r2, [sp, #0x14]
LBLY4:
        mov     r0, r11
        bl      __addsf3
        str     r0, [sp, #0x10]
        bl      __fixsfsi
        mov     r11, r0
        tst     r11, #1
        beq     LBLY5
        mov     r0, r11
        bl      __floatsisf
        ldr     r1, [sp, #0x10]
        bl      __eqsf2
        cmp     r0, #0
        ldreq   r2, [sp, #0x14]
        addeq   r11, r11, r2
LBLY5:
        strh    r11, [r6]
LBLY6:
        subs    r7, r7, #1
        add     r6, r6, #2
        add     r9, r9, #1
        bne     LBLY3
        ldr     r12, [sp, #0x1C]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x28]
        add     r12, r12, #1
        cmp     r12, r2
        str     r10, [sp, #0x30]
        blt     LBLY2
LBLY7:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLY8:
        add     r12, r12, #1
        cmp     r12, r2
        blt     LBLY2
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLY9:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLY10:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLY11:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LBLY__2il0floatpacket.3
        .long   LBLY__2il0floatpacket.1
        .long   LBLY__2il0floatpacket.2
        .long   LBLY__2il0floatpacket.5
        .long   LBLY__2il0floatpacket.4


        .data
        .align  4


LBLY__2il0floatpacket.1:
        .byte   0x00,0xFE,0xFF,0x46
LBLY__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC7
LBLY__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x3F
LBLY__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x00
LBLY__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0xBF


