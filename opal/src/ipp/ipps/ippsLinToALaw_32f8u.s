        .text
        .align  4
        .globl  _ippsLinToALaw_32f8u


_ippsLinToALaw_32f8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r8, r2
        beq     LBKZ12
        cmp     r9, #0
        beq     LBKZ12
        cmp     r8, #0
        ble     LBKZ11
        cmp     r8, #0
        ble     LBKZ9
        ldr     r5, [pc, #0x194]
        ldr     r4, [pc, #0x194]
        ldr     r12, [pc, #0x194]
        ldr     r6, [r5]
        ldr     r3, [pc, #0x190]
        ldr     r5, [r4]
        ldr     lr, [pc, #0x18C]
        ldr     r12, [r12]
        ldr     r3, [r3]
        ldr     r4, [lr]
        ldr     r10, [pc, #0x180]
        str     r3, [sp]
        str     r12, [sp, #4]
LBKZ0:
        ldr     r0, [r7], #4
        mov     r1, r6
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LBKZ1
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        b       LBKZ3
LBKZ1:
        mov     r1, r4
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        blt     LBKZ3
        ldr     r1, [sp, #4]
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBKZ2
        mov     r0, r11
        ldr     r1, [sp]
        bl      __subsf3
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        b       LBKZ3
LBKZ2:
        mov     r1, r11
        ldr     r0, [sp]
        bl      __addsf3
        bl      __fixsfsi
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
LBKZ3:
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #19
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #0
        movge   lr, #0xD5
        blt     LBKZ10
LBKZ4:
        ldrsh   r12, [r10]
        mov     r12, r12, lsl #16
        cmp     r3, r12, asr #19
        movle   r12, #0
        ble     LBKZ6
        mov     r12, #0
        mov     r11, r10
LBKZ5:
        add     r12, r12, #1
        cmp     r12, #8
        add     r11, r11, #2
        bge     LBKZ8
        ldrsh   r0, [r11]
        mov     r0, r0, lsl #16
        cmp     r3, r0, asr #19
        bgt     LBKZ5
        cmp     r12, #2
        bge     LBKZ7
LBKZ6:
        mov     r3, r3, asr #1
        and     r3, r3, #0xF
        orr     r12, r3, r12, lsl #4
        eor     lr, r12, lr
        strb    lr, [r9]
        b       LBKZ8
LBKZ7:
        mov     r3, r3, asr r12
        and     r3, r3, #0xF
        orr     r12, r3, r12, lsl #4
        eor     lr, r12, lr
        strb    lr, [r9]
LBKZ8:
        subs    r8, r8, #1
        add     r9, r9, #1
        bne     LBKZ0
LBKZ9:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBKZ10:
        mvn     r12, #0
        rsb     r12, r3, r12
        mov     lr, #0x55
        mov     r3, r12, lsl #16
        mov     r3, r3, asr #16
        b       LBKZ4
LBKZ11:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBKZ12:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBKZ__2il0floatpacket.1
        .long   LBKZ__2il0floatpacket.2
        .long   LBKZ__2il0floatpacket.4
        .long   LBKZ__2il0floatpacket.5
        .long   LBKZ__2il0floatpacket.3
        .long   LBKZ_seg_end


        .data
        .align  4


LBKZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x47
LBKZ__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBKZ__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7
LBKZ__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x00
LBKZ__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x3F


        .data
        .align  4


LBKZ_seg_end:
        .byte   0xFF,0x00,0xFF,0x01,0xFF,0x03,0xFF,0x07,0xFF,0x0F,0xFF,0x1F,0xFF,0x3F,0xFF,0x7F
        .byte   0x00,0x00


