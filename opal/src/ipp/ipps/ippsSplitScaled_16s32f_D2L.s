        .text
        .align  4
        .globl  _ippsSplitScaled_16s32f_D2L


_ippsSplitScaled_16s32f_D2L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r2
        mov     r11, r3
        beq     LBLV9
        cmp     r6, #0
        ble     LBLV8
        cmp     r11, #0
        ble     LBLV8
        cmp     r1, #0
        beq     LBLV9
        cmp     r6, #0
        ble     LBLV1
        mov     r4, r1
        mov     lr, r6
LBLV0:
        ldr     r12, [r4], #4
        cmp     r12, #0
        beq     LBLV10
        subs    lr, lr, #1
        bne     LBLV0
LBLV1:
        cmp     r6, #0
        ble     LBLV7
        ldr     lr, [pc, #0x17C]
        ldr     r12, [pc, #0x17C]
        ldr     r5, [lr]
        sub     lr, r11, #5
        ldr     r4, [r12]
        mov     r12, r6
        str     lr, [sp, #0x10]
LBLV2:
        ldr     lr, [r1], #4
        cmp     r11, #0
        ble     LBLV6
        cmp     r11, #5
        mov     r8, #0
        movlt   r10, r8
        blt     LBLV4
        mov     r10, r8
        add     r9, lr, #4
        str     lr, [sp, #0xC]
        str     r1, [sp]
        str     r12, [sp, #4]
        str     r11, [sp, #8]
LBLV3:
        mov     r3, r8, lsl #1
        ldrsh   r0, [r7, +r3]
        add     r8, r6, r8
        add     r10, r10, #4
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        add     r3, r6, r8
        str     r0, [r9, #-4]
        mov     r8, r8, lsl #1
        ldrsh   r0, [r7, +r8]
        mov     r11, r3, lsl #1
        add     r8, r6, r3
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9]
        ldrsh   r0, [r7, +r11]
        mov     r11, r8, lsl #1
        add     r8, r6, r8
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9, #4]
        ldrsh   r0, [r7, +r11]
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9, #8]
        ldr     r3, [sp, #0x10]
        add     r9, r9, #0x10
        cmp     r10, r3
        ble     LBLV3
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp]
        ldr     r12, [sp, #4]
        ldr     r11, [sp, #8]
LBLV4:
        add     r9, lr, r10, lsl #2
        str     r1, [sp]
        str     r12, [sp, #4]
LBLV5:
        mov     r12, r8, lsl #1
        ldrsh   r0, [r7, +r12]
        add     r10, r10, #1
        add     r8, r6, r8
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9], #4
        cmp     r10, r11
        blt     LBLV5
        ldr     r1, [sp]
        ldr     r12, [sp, #4]
LBLV6:
        subs    r12, r12, #1
        add     r7, r7, #2
        bne     LBLV2
LBLV7:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBLV8:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBLV9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBLV10:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LBLV__2il0floatpacket.1
        .long   LBLV__2il0floatpacket.2


        .data
        .align  4


LBLV__2il0floatpacket.1:
        .byte   0x80,0x00,0x80,0x37
LBLV__2il0floatpacket.2:
        .byte   0x80,0x00,0x00,0x38


