        .text
        .align  4
        .globl  _ippsMulC_Low_32f16s


_ippsMulC_Low_32f16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r2
        beq     LBEK3
        cmp     r5, #0
        beq     LBEK3
        cmp     r3, #0
        ble     LBEK2
        cmp     r3, #0
        sub     r8, r3, #1
        beq     LBEK1
        ldr     lr, [pc, #0xE8]
        ldr     r3, [pc, #0xE8]
        ldr     r12, [pc, #0xE8]
        ldr     r4, [lr]
        ldr     lr, [pc, #0xE4]
        ldr     r9, [pc, #0xE4]
        mov     r7, #0xFF
        orr     r7, r7, #0x7F, 24
        mvn     r10, r7
        str     r10, [sp, #4]
        str     r1, [sp]
LBEK0:
        ldr     r1, [sp]
        ldr     r0, [r6]
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ldrle   r3, [pc, #0xB0]
        ldrle   r11, [r3]
        ldrgt   r3, [pc, #0x9C]
        ldrgt   r11, [r3]
        mov     r0, r9
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ldrle   r3, [pc, #0x8C]
        ldrle   r10, [r3]
        ldrgt   r3, [pc, #0x80]
        ldrgt   r10, [r3]
        mov     r0, r9
        bl      __fixsfsi
        tst     r0, #1
        moveq   r11, r4
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r1, r11
        bl      __addsf3
        bl      __fixsfsi
        ldr     r12, [sp, #4]
        cmp     r0, r7
        mov     r3, r7
        movlt   r3, r0
        cmp     r3, r12
        movgt   r12, r3
        sub     r8, r8, #1
        strh    r12, [r5], #2
        cmn     r8, #1
        add     r6, r6, #4
        bne     LBEK0
LBEK1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBEK2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBEK3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBEK__2il0floatpacket.1
        .long   LBEK__2il0floatpacket.3
        .long   LBEK__2il0floatpacket.5
        .long   LBEK__2il0floatpacket.4
        .long   LBEK__2il0floatpacket.2


        .data
        .align  4


LBEK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBEK__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xB4
LBEK__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x34
LBEK__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0xBF
LBEK__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F


