        .text
        .align  4
        .globl  _ippsPreemphasize_16s


_ippsPreemphasize_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r10, r0
        cmp     r10, #0
        mov     r8, r1
        mov     r9, r2
        beq     LBAM8
        cmp     r8, #1
        blt     LBAM7
        ldrsh   r0, [r10]
        sub     r11, r8, #1
        bl      __floatsisf
        mov     r1, r9
        bl      __mulsf3
        cmp     r11, #1
        mov     r7, r0
        ble     LBAM3
        ldr     lr, [pc, #0x1EC]
        ldr     r3, [pc, #0x1EC]
        mvn     r12, #0xFF
        ldr     r4, [lr]
        bic     r12, r12, #0x7F, 24
        mov     r0, #1
        mvn     lr, r12
        add     r5, r10, #4
        add     r6, r10, #2
        str     r7, [sp, #0x14]
        str     r10, [sp]
        str     lr, [sp, #0x10]
        str     r12, [sp, #8]
        str     r11, [sp, #0xC]
        str     r8, [sp, #4]
        mov     r10, r0
        mov     r7, r9
LBAM0:
        ldrsh   r0, [r5]
        bl      __floatsisf
        mov     r9, r0
        ldrsh   r0, [r6]
        bl      __floatsisf
        mov     r11, r0
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x14]
        mov     r8, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r9
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x14]
        mov     r0, r11
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #0x10]
        strgth  r3, [r6]
        bgt     LBAM1
        ldr     r3, [pc, #0x140]
        mov     r0, r11
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp, #8]
        strlth  r3, [r6]
        blt     LBAM1
        mov     r0, r11
        bl      __fixsfsi
        strh    r0, [r6]
LBAM1:
        mov     r0, r8
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #0x10]
        strgth  r3, [r5]
        bgt     LBAM2
        ldr     r3, [pc, #0xF8]
        mov     r0, r8
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp, #8]
        strlth  r3, [r5]
        blt     LBAM2
        mov     r0, r8
        bl      __fixsfsi
        strh    r0, [r5]
LBAM2:
        ldr     r3, [sp, #0xC]
        add     r10, r10, #2
        add     r5, r5, #4
        cmp     r10, r3
        add     r6, r6, #4
        blt     LBAM0
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #4]
        ldr     r10, [sp]
LBAM3:
        tst     r8, #1
        bne     LBAM6
        sub     r10, r10, #2
        mov     r8, r8, lsl #1
        ldrsh   r0, [r10, +r8]
        mvn     r2, #0xFF
        bic     r4, r2, #0x7F, 24
        bl      __floatsisf
        mov     r1, r7
        bl      __subsf3
        ldr     r1, [pc, #0x7C]
        mov     r5, r0
        ldr     r1, [r1]
        bl      __gtsf2
        cmp     r0, #0
        ble     LBAM4
        mvn     r4, r4
        strh    r4, [r10, +r8]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAM4:
        ldr     r1, [pc, #0x54]
        mov     r0, r5
        ldr     r1, [r1]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBAM5
        strh    r4, [r10, +r8]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAM5:
        mov     r0, r5
        bl      __fixsfsi
        strh    r0, [r10, +r8]
LBAM6:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAM7:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAM8:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LBAM__2il0floatpacket.1
        .long   LBAM__2il0floatpacket.2


        .data
        .align  4


LBAM__2il0floatpacket.1:
        .byte   0x00,0xFE,0xFF,0x46
LBAM__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC7


