        .text
        .align  4
        .globl  _ippsIIROne_32fc


_ippsIIROne_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        str     r0, [sp, #0x20]
        cmp     r3, #0
        str     r1, [sp, #0x24]
        mov     r7, r2
        beq     LBQI7
        cmp     r7, #0
        beq     LBQI7
        ldr     r12, [r3]
        ldr     r1, [pc, #0x560]
        mov     r0, #0
        str     r0, [sp, #0x14]
        subs    r12, r12, r1
        beq     LBQI4
        adds    r0, r12, #1
        beq     LBQI0
        mvn     r0, #0x10
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBQI0:
        ldr     r10, [r3, #4]
        ldr     r9, [r3, #0xC]
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r11, [r10]
        cmp     r9, #0
        beq     LBQI2
        ldr     r8, [r3, #8]
        mov     r0, r11
        mov     r1, r4
        bl      __mulsf3
        ldr     r3, [r10, #4]
        str     r0, [sp, #0xC]
        mov     r1, r5
        str     r3, [sp]
        ldr     r0, [sp]
        add     r6, r9, #1
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xC]
        add     r6, r10, r6, lsl #3
        bl      __subsf3
        ldr     r1, [r8]
        str     r6, [sp, #0xC]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r5
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r8, #4]
        bl      __addsf3
        cmp     r9, #0
        mov     r11, r0
        ble     LBQI3
        ldr     r3, [sp, #0xC]
        str     r9, [sp, #8]
        ldr     r9, [sp, #0x14]
        add     r1, r8, #4
        sub     r0, r3, #4
        str     r5, [sp, #4]
        str     r7, [sp, #0x10]
        add     r10, r10, #4
        sub     r8, r8, #4
        mov     r5, r0
        mov     r7, r1
LBQI1:
        ldr     r0, [r10, #4]
        mov     r1, r4
        add     r9, r9, #1
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0xC]
        ldr     r0, [r10, #8]
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xC]
        bl      __subsf3
        str     r0, [sp, #0xC]
        ldr     r0, [r5, #4]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xC]
        bl      __subsf3
        str     r0, [sp, #0xC]
        ldr     r0, [r5, #8]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [r7, #4]
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r1, [sp, #4]
        ldr     r0, [r10, #4]
        bl      __mulsf3
        str     r0, [sp, #0xC]
        ldr     r0, [r10, #8]!
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        str     r0, [sp, #0xC]
        ldr     r0, [r5, #4]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xC]
        bl      __subsf3
        str     r0, [sp, #0xC]
        ldr     r0, [r5, #8]!
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0xC]
        bl      __subsf3
        ldr     r1, [r7, #8]!
        bl      __addsf3
        str     r0, [r8, #8]!
        ldr     r2, [sp, #8]
        cmp     r9, r2
        blt     LBQI1
        ldr     r7, [sp, #0x10]
        b       LBQI3
LBQI2:
        mov     r1, r4
        mov     r0, r11
        bl      __mulsf3
        ldr     r10, [r10, #4]
        mov     r6, r0
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r11
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r11, r0
LBQI3:
        mov     r0, #0
        str     r6, [r7]
        str     r11, [r7, #4]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBQI4:
        ldr     r12, [r3, #0xC]
        ldr     lr, [r3, #4]
        ldr     r1, [sp, #0x20]
        ldr     r4, [sp, #0x24]
        ldr     r3, [r3, #8]
        cmp     r12, #0
        ble     LBQI6
        sub     r0, r3, #4
        add     r11, lr, #0x24
        sub     r10, lr, #0x14
        add     r9, lr, #0x1C
        sub     r8, lr, #0x1C
        add     lr, lr, #4
        sub     r3, r3, #0xC
        str     r7, [sp, #0x10]
        str     r3, [sp, #4]
        str     r0, [sp]
        str     lr, [sp, #8]
        str     r12, [sp, #0xC]
        mov     r7, r1
LBQI5:
        ldr     r0, [sp, #0x14]
        mov     r1, r7
        add     r0, r0, #2
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        ldr     r2, [r0, #-4]
        str     r2, [sp, #0x18]
        ldr     r6, [r0]
        ldr     r2, [sp, #4]
        ldr     r0, [sp, #0x18]
        ldr     r5, [r2, #0xC]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #4]
        mov     r5, r0
        ldr     r0, [sp, #0x18]
        ldr     r2, [r2, #0x10]
        mov     r1, r4
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        str     r0, [sp, #0x1C]
        mov     r0, r6
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r3, [sp]
        ldr     r2, [r8, #0x24]
        mov     r1, r7
        ldr     r3, [r3, #0xC]
        mov     r6, r0
        mov     r0, r2
        str     r3, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r3, [sp, #8]
        ldr     r2, [r8, #0x28]
        str     r0, [sp, #0x1C]
        mov     r1, r4
        add     r3, r3, #0x28
        str     r3, [sp, #8]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [r9, #-4]
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [r9]
        str     r0, [sp, #0x1C]
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r1, r4
        str     r0, [r2, #0xC]
        ldr     r2, [sp]
        ldr     r0, [r8, #0x24]
        ldr     r2, [r2, #0x10]
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        ldr     r2, [r8, #0x28]!
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r9]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r9, #-4]
        mov     r1, r6
        add     r9, r9, #0x28
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [sp, #4]
        mov     r1, r7
        str     r0, [r2, #0x10]!
        str     r2, [sp, #4]
        ldr     r0, [r10, #0x24]
        bl      __mulsf3
        ldr     r2, [r10, #0x28]
        str     r0, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [r11, #-4]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x18]
        ldr     r0, [r11]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x18]
        bl      __subsf3
        mov     r1, r0
        ldr     r0, [sp, #0x1C]
        bl      __subsf3
        ldr     r2, [sp]
        mov     r1, r4
        str     r0, [r2, #0xC]
        ldr     r0, [r10, #0x24]
        bl      __mulsf3
        ldr     r2, [r10, #0x28]!
        mov     r4, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [r11]
        mov     r4, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r11, #-4]
        mov     r7, r0
        mov     r1, r6
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp]
        str     r0, [r2, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x14]
        add     r11, r11, #0x28
        mov     r7, r5
        mov     r4, r6
        cmp     r3, r2
        ldr     r2, [sp]
        add     r2, r2, #0x10
        str     r2, [sp]
        blt     LBQI5
        ldr     r7, [sp, #0x10]
LBQI6:
        mov     r0, #0
        str     r5, [r7]
        str     r6, [r7, #4]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBQI7:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493034


        .data
        .align  4


LBQI__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


