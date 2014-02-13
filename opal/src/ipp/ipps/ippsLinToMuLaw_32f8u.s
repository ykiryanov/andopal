        .text
        .align  4
        .globl  _ippsLinToMuLaw_32f8u


_ippsLinToMuLaw_32f8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r10, r2
        beq     LBKX8
        cmp     r8, #0
        beq     LBKX8
        cmp     r10, #0
        ble     LBKX7
        cmp     r10, #0
        ble     LBKX6
        ldr     r5, [pc, #0x184]
        ldr     r4, [pc, #0x184]
        ldr     r3, [pc, #0x184]
        ldr     r7, [r5]
        ldr     r12, [pc, #0x180]
        ldr     lr, [pc, #0x180]
        ldr     r5, [r4]
        ldr     r3, [r3]
        ldr     r12, [r12]
        ldr     lr, [lr]
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        sub     r11, r4, #6, 20
        str     r4, [sp, #8]
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r3, [sp, #0xC]
LBKX0:
        ldr     r6, [r9], #4
        mov     r1, r7
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        mov     r4, r0
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #8]
        bgt     LBKX3
        ldr     r1, [sp, #4]
        mov     r0, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBKX1
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        mvn     r3, r3
        b       LBKX3
LBKX1:
        mov     r0, r4
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        bge     LBKX2
        mov     r0, r4
        ldr     r1, [sp]
        bl      __subsf3
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        b       LBKX3
LBKX2:
        mov     r1, r4
        ldr     r0, [sp]
        bl      __addsf3
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
LBKX3:
        cmp     r3, #0
        mvnlt   r3, r3
        movlt   r3, r3, asr #2
        movge   r3, r3, asr #2
        add     r3, r3, #0x21
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r11, r3
        movlt   r3, r11
        mov     lr, r3, asr #6
        cmp     lr, #0
        moveq   r12, #1
        beq     LBKX5
        mov     r12, #1
LBKX4:
        mov     lr, lr, asr #1
        cmp     lr, #0
        add     r12, r12, #1
        bne     LBKX4
LBKX5:
        mov     r12, r12, lsl #16
        mov     r0, r6
        mov     r12, r12, asr #16
        mov     r3, r3, asr r12
        and     r3, r3, #0xF
        rsb     r12, r12, #8
        rsb     r3, r3, #0xF
        orr     r12, r3, r12, lsl #4
        mov     r1, r5
        and     r4, r12, #0xFF
        bl      __gesf2
        cmp     r0, #0
        strltb  r4, [r8]
        orrge   r4, r4, #0x80
        strgeb  r4, [r8]
        subs    r10, r10, #1
        add     r8, r8, #1
        bne     LBKX0
LBKX6:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBKX7:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBKX8:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LBKX__2il0floatpacket.1
        .long   LBKX__2il0floatpacket.4
        .long   LBKX__2il0floatpacket.2
        .long   LBKX__2il0floatpacket.3
        .long   LBKX__2il0floatpacket.5


        .data
        .align  4


LBKX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x47
LBKX__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBKX__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7
LBKX__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x00
LBKX__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F


