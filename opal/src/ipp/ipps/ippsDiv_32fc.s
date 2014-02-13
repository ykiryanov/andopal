        .text
        .align  4
        .globl  _ippsDiv_32fc


_ippsDiv_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r10, r2
        mov     r9, r3
        beq     LCHL3
        cmp     r7, #0
        beq     LCHL3
        cmp     r10, #0
        beq     LCHL3
        cmp     r9, #0
        ble     LCHL4
        cmp     r9, #0
        mov     r0, #0
        addle   sp, sp, #0x10
        ldmleia sp!, {r4 - r11, pc}
        ldr     r4, [pc, #0x130]
        ldr     r12, [pc, #0x130]
        ldr     lr, [pc, #0x130]
        ldr     r4, [r4]
        str     r0, [sp]
        str     r4, [sp, #4]
LCHL0:
        ldr     r4, [r8]
        ldr     r5, [r8, #4]
        add     r8, r8, #8
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r5
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #4]
        mov     r6, r0
        bl      __nesf2
        cmp     r0, #0
        beq     LCHL2
        ldr     r12, [pc, #0xD8]
        mov     r1, r6
        ldr     r0, [r12]
        bl      __divsf3
        ldr     r11, [r7, #4]
        ldr     r1, [r7]
        mov     r6, r0
        mov     r0, r4
        str     r1, [sp, #8]
        bl      __mulsf3
        str     r0, [sp, #0xC]
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        str     r0, [sp, #0xC]
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #8]
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0xC]
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r10]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
LCHL1:
        str     r0, [r10, #4]
        subs    r9, r9, #1
        add     r7, r7, #8
        add     r10, r10, #8
        bne     LCHL0
        ldr     r0, [sp]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCHL2:
        ldr     r12, [pc, #0x30]
        ldr     r0, [r12]
        mov     r12, #6
        str     r12, [sp]
        str     r0, [r10]
        b       LCHL1
LCHL3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCHL4:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCHL__2il0floatpacket.1
        .long   LCHL__2il0floatpacket.2
        .long   ippConstantOfNAN_32f


        .data
        .align  4


LCHL__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LCHL__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


