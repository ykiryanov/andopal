        .text
        .align  4
        .globl  _ippsMulC_32f16s_Sfs


_ippsMulC_32f16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r8, [sp, #0x2C]
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBES10
        cmp     r6, #0
        beq     LBES10
        cmp     r5, #0
        ble     LBES9
        cmp     r8, #0
        beq     LBES3
        ldr     r12, [pc, #0x228]
        cmp     r8, #0
        mov     r9, #0
        ble     LBES6
        ldr     r2, [r12]
        ldr     r12, [pc, #0x218]
        cmp     r8, #6
        ldrlt   r10, [r12]
        blt     LBES1
        ldr     r10, [r12]
        sub     r11, r8, #6
LBES0:
        mov     r1, r10
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r10
        bl      __mulsf3
        add     r9, r9, #5
        cmp     r9, r11
        mov     r2, r0
        ble     LBES0
LBES1:
        mov     r0, r2
        mov     r1, r10
        bl      __mulsf3
        add     r9, r9, #1
        cmp     r9, r8
        mov     r2, r0
        blt     LBES1
LBES2:
        mov     r0, r4
        mov     r1, r2
        bl      __mulsf3
        mov     r4, r0
LBES3:
        cmp     r5, #0
        sub     r10, r5, #1
        beq     LBES5
        ldr     r3, [pc, #0x190]
        ldr     lr, [pc, #0x190]
        ldr     r12, [pc, #0x190]
        ldr     r9, [r3]
        ldr     r3, [pc, #0x18C]
        ldr     r8, [lr]
        ldr     r5, [r12]
        ldr     lr, [pc, #0x184]
        ldr     r11, [pc, #0x16C]
        ldr     r12, [pc, #0x180]
        str     r6, [sp, #4]
        str     r4, [sp]
LBES4:
        ldr     r1, [sp]
        ldr     r0, [r7]
        mov     r6, r9
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r9
        bl      __ltsf2
        cmp     r0, #0
        movlt   r6, r4
        mov     r0, r6
        mov     r1, r8
        bl      __gtsf2
        cmp     r0, #0
        mov     r4, r8
        movgt   r4, r6
        mov     r0, r4
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ldrle   r2, [pc, #0x124]
        ldrle   r11, [r2]
        ldrgt   r2, [pc, #0x118]
        ldrgt   r11, [r2]
        mov     r0, r4
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        ldrle   r2, [pc, #0x108]
        ldrle   r6, [r2]
        ldrgt   r2, [pc, #0xE8]
        ldrgt   r6, [r2]
        mov     r0, r4
        bl      __fixsfsi
        tst     r0, #1
        moveq   r11, r5
        mov     r0, r4
        mov     r1, r6
        bl      __addsf3
        mov     r1, r11
        bl      __addsf3
        bl      __fixsfsi
        ldr     r2, [sp, #4]
        sub     r10, r10, #1
        strh    r0, [r2], #2
        cmn     r10, #1
        add     r7, r7, #4
        str     r2, [sp, #4]
        bne     LBES4
LBES5:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBES6:
        ldr     r2, [r12]
        rsb     r10, r8, #0
        cmp     r10, #0
        ble     LBES2
        cmp     r10, #6
        blt     LBES8
        mvn     r12, #5
        rsb     r8, r8, r12
LBES7:
        mov     r1, r2
        mov     r0, r2
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        mov     r1, r0
        bl      __addsf3
        add     r9, r9, #5
        cmp     r9, r8
        mov     r2, r0
        ble     LBES7
LBES8:
        mov     r0, r2
        mov     r1, r2
        bl      __addsf3
        add     r9, r9, #1
        cmp     r9, r10
        mov     r2, r0
        blt     LBES8
        b       LBES2
LBES9:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBES10:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBES__2il0floatpacket.1
        .long   LBES__2il0floatpacket.2
        .long   LBES__2il0floatpacket.3
        .long   LBES__2il0floatpacket.4
        .long   LBES__2il0floatpacket.5
        .long   LBES__2il0floatpacket.7
        .long   LBES__2il0floatpacket.6
        .long   LBES__2il0floatpacket.8


        .data
        .align  4


LBES__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBES__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x3F
LBES__2il0floatpacket.3:
        .byte   0x00,0xFE,0xFF,0x46
LBES__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0xC7
LBES__2il0floatpacket.5:
        .byte   0x00,0x00,0x00,0x00
LBES__2il0floatpacket.6:
        .byte   0x00,0x00,0x00,0xB4
LBES__2il0floatpacket.7:
        .byte   0x00,0x00,0x00,0x34
LBES__2il0floatpacket.8:
        .byte   0x00,0x00,0x00,0xBF


