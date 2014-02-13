        .text
        .align  4
        .globl  _ippsLn_32f_I


_ippsLn_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        beq     LBKO9
        cmp     r5, #1
        blt     LBKO5
        ldr     r4, [r6]
        mov     r12, #0xFF, 10
        orr     r7, r12, #1, 2
        mov     r3, r4, lsr #24
        and     r3, r3, #0x80
        mvn     r11, #0x7F
        tst     r3, r11
        mov     r3, r7, lsl #1
        str     r4, [sp, #4]
        str     r3, [sp]
        mov     r8, #0
        bne     LBKO0
        mov     r10, r8
        mov     r9, r10
        b       LBKO3
LBKO0:
        mov     r10, r8
        mov     r9, r10
LBKO1:
        ldr     r2, [pc, #0xEC]
        cmp     r10, #0
        ldr     r2, [r2]
        str     r2, [r8, +r6]
        moveq   r10, #4
LBKO2:
        add     r9, r9, #1
        cmp     r9, r5
        bge     LBKO7
        ldr     r4, [r6, +r9, lsl #2]
        mov     r8, r9, lsl #2
        mov     r3, r4, lsr #24
        and     r3, r3, #0x80
        tst     r3, r11
        str     r4, [sp, #4]
        beq     LBKO3
        b       LBKO1
LBKO3:
        ldr     r2, [sp, #4]
        and     r2, r2, r7
        cmp     r7, r2
        bne     LBKO4
        ldr     r2, [pc, #0x9C]
        ldr     r2, [r2]
        eor     r2, r2, #2, 2
        str     r2, [r8, +r6]
        b       LBKO2
LBKO4:
        ldr     r2, [pc, #0x8C]
        mov     r0, r4
        ldr     r1, [r2]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBKO6
        mov     r0, r4
        bl      __extendsfdf2
        bl      log
        bl      __truncdfsf2
        str     r0, [r8, +r6]
        b       LBKO2
LBKO5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBKO6:
        ldr     r2, [sp]
        cmp     r10, #0
        str     r2, [r8, +r6]
        moveq   r10, #2
        b       LBKO2
LBKO7:
        cmp     r10, #0
        beq     LBKO8
        cmp     r10, #2
        beq     LBKO10
        mov     r0, #8
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBKO8:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBKO9:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBKO10:
        mov     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfNAN_32f
        .long   LBKO__2il0floatpacket.1


        .data
        .align  4


LBKO__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


