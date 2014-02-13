        .text
        .align  4
        .globl  _ippsLn_32f


_ippsLn_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBKP9
        cmp     r6, #0
        beq     LBKP9
        cmp     r5, #1
        blt     LBKP5
        ldr     r4, [r0]
        mov     lr, #0xFF, 10
        orr     r7, lr, #1, 2
        mov     r12, r4, lsr #24
        and     r12, r12, #0x80
        mvn     r11, #0x7F
        tst     r12, r11
        mov     r12, r7, lsl #1
        str     r4, [sp, #8]
        str     r12, [sp, #4]
        mov     r8, #0
        bne     LBKP0
        mov     r10, r8
        mov     r9, r10
        str     r0, [sp]
        b       LBKP3
LBKP0:
        mov     r10, r8
        mov     r9, r10
        str     r0, [sp]
LBKP1:
        ldr     r0, [pc, #0xF0]
        cmp     r10, #0
        ldr     r0, [r0]
        str     r0, [r8, +r6]
        moveq   r10, #4
LBKP2:
        add     r9, r9, #1
        cmp     r9, r5
        bge     LBKP7
        ldr     r0, [sp]
        mov     r8, r9, lsl #2
        ldr     r4, [r0, +r9, lsl #2]
        mov     r12, r4, lsr #24
        and     r12, r12, #0x80
        tst     r12, r11
        str     r4, [sp, #8]
        beq     LBKP3
        b       LBKP1
LBKP3:
        ldr     r3, [sp, #8]
        and     r3, r3, r7
        cmp     r7, r3
        bne     LBKP4
        ldr     r0, [pc, #0x9C]
        ldr     r0, [r0]
        eor     r0, r0, #2, 2
        str     r0, [r8, +r6]
        b       LBKP2
LBKP4:
        ldr     r3, [pc, #0x8C]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBKP6
        mov     r0, r4
        bl      __extendsfdf2
        bl      log
        bl      __truncdfsf2
        str     r0, [r8, +r6]
        b       LBKP2
LBKP5:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBKP6:
        ldr     r0, [sp, #4]
        cmp     r10, #0
        str     r0, [r8, +r6]
        moveq   r10, #2
        b       LBKP2
LBKP7:
        cmp     r10, #0
        beq     LBKP8
        cmp     r10, #2
        beq     LBKP10
        mov     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBKP8:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBKP9:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBKP10:
        mov     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfNAN_32f
        .long   LBKP__2il0floatpacket.1


        .data
        .align  4


LBKP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


