        .text
        .align  4
        .globl  DotProd_32fc


DotProd_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [pc, #0xB4]
        mov     r8, r2
        ldr     r11, [r12]
        cmp     r8, #0
        mov     r12, r11
        ble     LCFT1
        add     r10, r1, #4
        add     r9, r0, #4
        str     r12, [sp, #4]
        str     r3, [sp]
LCFT0:
        ldr     r5, [r10, #-4]
        ldr     r7, [r9, #-4]
        ldr     r6, [r10], #8
        ldr     r4, [r9], #8
        mov     r1, r5
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        mov     r1, r6
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r6
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        subs    r8, r8, #1
        str     r0, [sp, #4]
        bne     LCFT0
        ldr     r12, [sp, #4]
        ldr     r3, [sp]
LCFT1:
        str     r11, [r3]
        str     r12, [r3, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCFT__2il0floatpacket.1


        .data
        .align  4


LCFT__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


