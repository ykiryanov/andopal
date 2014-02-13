        .text
        .align  4
        .globl  _ippsNormalize_16sc_Sfs


_ippsNormalize_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r9, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        mov     r4, r0
        cmp     r4, #0
        str     r3, [sp, #0x14]
        mov     r6, r1
        mov     r5, r2
        beq     LBBU8
        cmp     r6, #0
        beq     LBBU8
        cmp     r5, #1
        blt     LBBU6
        cmp     r9, #0
        bne     LBBU0
        mvn     r0, #9
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBBU0:
        ldr     lr, [pc, #0x174]
        cmp     r12, #0
        ldr     r7, [lr]
        str     r7, [sp, #0x10]
        andge   r12, r12, #0x7F
        subge   r8, r7, r12, lsl #23
        blt     LBBU7
LBBU1:
        mov     r0, r9
        str     r8, [sp, #0x10]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        cmp     r5, #0
        ble     LBBU5
        mov     r1, r8
        bl      __mulsf3
        ldr     lr, [pc, #0x134]
        ldrsh   r3, [sp, #0x14]
        ldrsh   r12, [sp, #0x16]
        ldr     r10, [lr]
        ldr     r11, [pc, #0x128]
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     r7, lr
        mov     r9, r0
        str     r7, [sp, #8]
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r3, [sp, #0xC]
LBBU2:
        ldr     r3, [sp, #0xC]
        ldrsh   r12, [r4]
        sub     r0, r12, r3
        bl      __floatsisf
        mov     r1, r9
        bl      __mulsf3
        ldr     r3, [sp, #4]
        ldrsh   r12, [r4, #2]
        mov     r7, r0
        sub     r0, r12, r3
        bl      __floatsisf
        mov     r1, r9
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r7
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #8]
        strgth  r3, [r6]
        bgt     LBBU3
        ldr     r1, [r11]
        mov     r0, r7
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp]
        strlth  r3, [r6]
        blt     LBBU3
        mov     r0, r7
        bl      __fixsfsi
        strh    r0, [r6]
LBBU3:
        mov     r0, r8
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #8]
        strgth  r3, [r6, #2]
        bgt     LBBU4
        ldr     r1, [r11]
        mov     r0, r8
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp]
        strlth  r3, [r6, #2]
        blt     LBBU4
        mov     r0, r8
        bl      __fixsfsi
        strh    r0, [r6, #2]
LBBU4:
        subs    r5, r5, #1
        add     r6, r6, #4
        add     r4, r4, #4
        bne     LBBU2
LBBU5:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBBU6:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBBU7:
        rsb     r12, r12, #0
        and     r3, r12, #0x7F
        add     r8, r7, r3, lsl #23
        b       LBBU1
LBBU8:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LBBU__2il0floatpacket.1
        .long   LBBU__2il0floatpacket.2
        .long   LBBU__2il0floatpacket.3


        .data
        .align  4


LBBU__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBBU__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBBU__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7


