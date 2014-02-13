        .text
        .align  4
        .globl  ownsIIRSetTaps_32f


ownsIIRSetTaps_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r2, [pc, #0x19C]
        mov     r6, r1
        ldr     r7, [r6, #0xC]
        mov     r5, r0
        ldr     r0, [r2]
        add     r11, r5, #4
        ldr     r4, [r11, +r7, lsl #2]
        mov     r1, r4
        bl      __eqsf2
        cmp     r0, #0
        beq     LBPN4
        ldr     r2, [pc, #0x174]
        mov     r1, r4
        ldr     r0, [r2]
        bl      __divsf3
        ldr     r1, [r5]
        mov     r4, r0
        bl      __mulsf3
        ldr     r2, [r6, #4]
        cmp     r7, #1
        str     r0, [r2]
        blt     LBPN3
        sub     r2, r7, #1
        cmp     r2, #4
        mov     r10, #1
        blt     LBPN1
        sub     r3, r7, #4
        mov     r12, #8
        mov     r2, #0xC
        add     r9, r7, #1
        add     r8, r5, #8
        str     r2, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r7, [sp, #4]
        str     r5, [sp]
LBPN0:
        ldr     r0, [r8, #-4]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [r6, #4]
        mov     r1, r4
        str     r0, [r2, +r10, lsl #2]
        ldr     r0, [r11, +r9, lsl #2]
        add     r10, r10, #3
        bl      __mulsf3
        ldr     r2, [r6, #4]
        mov     r1, r4
        str     r0, [r2, +r9, lsl #2]
        ldr     r0, [r8]
        bl      __mulsf3
        ldr     r3, [sp, #0xC]
        ldr     r2, [r6, #4]
        mov     r1, r4
        str     r0, [r3, +r2]
        add     r3, r3, #0xC
        str     r3, [sp, #0xC]
        mov     r2, r9, lsl #2
        add     r7, r2, #4
        ldr     r0, [r11, +r7]
        add     r5, r2, #8
        add     r9, r9, #3
        bl      __mulsf3
        ldr     r2, [r6, #4]
        mov     r1, r4
        str     r0, [r7, +r2]
        ldr     r0, [r8, #4]
        add     r8, r8, #0xC
        bl      __mulsf3
        ldr     r3, [sp, #0x10]
        ldr     r2, [r6, #4]
        mov     r1, r4
        str     r0, [r3, +r2]
        ldr     r0, [r11, +r5]
        add     r3, r3, #0xC
        str     r3, [sp, #0x10]
        bl      __mulsf3
        ldr     r3, [sp, #8]
        ldr     r2, [r6, #4]
        cmp     r10, r3
        str     r0, [r5, +r2]
        ble     LBPN0
        ldr     r7, [sp, #4]
        ldr     r5, [sp]
LBPN1:
        add     r5, r5, r10, lsl #2
        add     r8, r10, r7
LBPN2:
        ldr     r0, [r5], #4
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [r6, #4]
        mov     r1, r4
        str     r0, [r2, +r10, lsl #2]
        ldr     r0, [r11, +r8, lsl #2]
        add     r10, r10, #1
        bl      __mulsf3
        ldr     r2, [r6, #4]
        cmp     r10, r7
        str     r0, [r2, +r8, lsl #2]
        add     r8, r8, #1
        ble     LBPN2
LBPN3:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBPN4:
        mvn     r0, #9
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LBPN__2il0floatpacket.1
        .long   LBPN__2il0floatpacket.2


        .data
        .align  4


LBPN__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBPN__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


