        .text
        .align  4
        .globl  _ippsDiv_32f


_ippsDiv_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        mov     r10, r3
        beq     LCHN5
        cmp     r8, #0
        beq     LCHN5
        cmp     r7, #0
        beq     LCHN5
        cmp     r10, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r10, #0
        mov     r6, #0
        movle   r0, r6
        ldmleia sp!, {r4 - r11, pc}
        ldr     lr, [pc, #0xB4]
        ldr     r11, [pc, #0xB4]
        ldr     r12, [pc, #0xB4]
        ldr     r4, [lr]
LCHN0:
        ldr     r5, [r9], #4
        mov     r1, r4
        mov     r0, r5
        bl      __nesf2
        cmp     r0, #0
        beq     LCHN2
        ldr     r0, [r8]
        mov     r1, r5
        bl      __divsf3
        str     r0, [r7]
LCHN1:
        subs    r10, r10, #1
        add     r7, r7, #4
        add     r8, r8, #4
        bne     LCHN0
        mov     r0, r6
        ldmia   sp!, {r4 - r11, pc}
LCHN2:
        ldr     r5, [r8]
        mov     r1, r4
        mov     r0, r5
        bl      __gtsf2
        cmp     r0, #0
        ble     LCHN3
        ldr     r12, [r11]
        mov     r6, #6
        str     r12, [r7]
        b       LCHN1
LCHN3:
        mov     r0, r5
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LCHN4
        ldr     r12, [r11]
        mov     r6, #6
        eor     r12, r12, #2, 2
        str     r12, [r7]
        b       LCHN1
LCHN4:
        ldr     r12, [pc, #0x1C]
        mov     r6, #6
        ldr     r12, [r12]
        str     r12, [r7]
        b       LCHN1
LCHN5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   LCHN__2il0floatpacket.1
        .long   ippConstantOfINF_32f
        .long   ippConstantOfNAN_32f


        .data
        .align  4


LCHN__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


