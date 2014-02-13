        .text
        .align  4
        .globl  ownsIIRSetTaps_BiQuad_32f


ownsIIRSetTaps_BiQuad_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r4, r1
        ldr     r10, [r4, #0x18]
        mov     r5, r0
        cmp     r10, #0
        ble     LBPL1
        ldr     r3, [pc, #0x170]
        ldr     r2, [pc, #0x170]
        mov     r9, #0
        ldr     r3, [r3]
        add     lr, r5, #0xC
        mov     r12, r5
        mov     r11, #0xC
        mov     r0, #0x10
        mov     r8, r9
        mov     r7, #4
        mov     r6, #8
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r0, [sp, #0x14]
        str     r11, [sp]
        str     r3, [sp, #4]
LBPL0:
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #4]
        ldr     r11, [r2], #0x18
        str     r2, [sp, #0xC]
        mov     r1, r11
        bl      __eqsf2
        cmp     r0, #0
        beq     LBPL2
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r1, [r2], #0x18
        str     r2, [sp, #0x10]
        str     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBPL3
        ldr     r2, [pc, #0xF4]
        mov     r1, r11
        ldr     r0, [r2]
        add     r2, r5, #4
        str     r2, [sp, #0x18]
        bl      __divsf3
        ldr     r1, [sp, #8]
        mov     r11, r0
        bl      __mulsf3
        ldr     r2, [r4, #4]
        add     r3, r5, #8
        str     r3, [sp, #8]
        str     r0, [r2, +r9]
        ldr     r2, [sp, #0x18]
        mov     r1, r11
        add     r9, r9, #0x14
        ldr     r0, [r2, +r8]
        add     r2, r5, #0x10
        str     r2, [sp, #0x18]
        add     r2, r5, #0x14
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        ldr     r2, [r4, #4]
        mov     r1, r11
        str     r0, [r2, +r7]
        ldr     r2, [sp, #8]
        add     r7, r7, #0x14
        ldr     r0, [r2, +r8]
        bl      __mulsf3
        ldr     r2, [r4, #4]
        mov     r1, r11
        str     r0, [r2, +r6]
        ldr     r2, [sp, #0x18]
        add     r6, r6, #0x14
        ldr     r0, [r2, +r8]
        bl      __mulsf3
        ldr     r3, [r4, #4]
        ldr     r2, [sp]
        mov     r1, r11
        str     r0, [r3, +r2]
        ldr     r3, [sp, #0x1C]
        add     r2, r2, #0x14
        ldr     r0, [r3, +r8]
        str     r2, [sp]
        add     r8, r8, #0x18
        bl      __mulsf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [r4, #4]
        subs    r10, r10, #1
        str     r0, [r2, +r3]
        add     r3, r3, #0x14
        str     r3, [sp, #0x14]
        bne     LBPL0
LBPL1:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBPL2:
        mvn     r0, #9
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBPL3:
        mvn     r0, #9
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LBPL__2il0floatpacket.1
        .long   LBPL__2il0floatpacket.2


        .data
        .align  4


LBPL__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBPL__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


