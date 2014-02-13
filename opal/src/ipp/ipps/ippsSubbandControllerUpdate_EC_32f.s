        .text
        .align  4
        .globl  _ippsSubbandControllerUpdate_EC_32f


_ippsSubbandControllerUpdate_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r12, [sp, #0x48]
        ldr     lr, [sp, #0x4C]
        cmp     r0, #0
        beq     LDLD12
        cmp     r1, #0
        beq     LDLD12
        cmp     r2, #0
        beq     LDLD12
        cmp     r12, #0
        beq     LDLD12
        cmp     lr, #0
        beq     LDLD12
        and     r0, lr, #0xF
        rsb     r0, r0, #0
        and     r0, r0, #0xF
        ldr     r8, [r0, +lr]
        add     r6, lr, r0
        ldr     r5, [r6, #0x40]
        ldr     r4, [r6, #0x44]
        ldr     r7, [r6, #0x18]
        ldr     r0, [r2]
        cmp     r8, #0
        ble     LDLD3
        cmp     r8, #4
        mov     r10, #0
        blt     LDLD1
        sub     lr, r8, #4
        str     r4, [sp, #0x14]
        add     r11, r0, #4
        mov     r9, r7
        str     lr, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r5, [sp, #0x10]
        str     r6, [sp, #8]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        str     r2, [sp]
        mov     r4, r0
LDLD0:
        ldr     r1, [r11]
        add     r6, r10, #1
        add     r5, r10, #2
        str     r1, [sp, #0x20]
        ldr     r0, [r11, #-4]
        ldr     r8, [r9]
        add     r10, r10, #3
        mov     r1, r0
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        mov     r8, r0
        add     r11, r11, #0x18
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r9], #0xC
        ldr     r0, [r4, +r6, lsl #3]
        ldr     r8, [r7, +r6, lsl #2]
        add     r2, r4, r6, lsl #3
        ldr     r2, [r2, #4]
        mov     r1, r0
        str     r2, [sp, #0x20]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        mov     r8, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r7, +r6, lsl #2]
        ldr     r1, [r4, +r5, lsl #3]
        ldr     r8, [r7, +r5, lsl #2]
        add     r2, r4, r5, lsl #3
        ldr     r6, [r2, #4]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r0, r6
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        str     r0, [r7, +r5, lsl #2]
        cmp     r10, r1
        ble     LDLD0
        mov     r0, r4
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LDLD1:
        mov     lr, r10, lsl #3
        add     lr, lr, #4
        add     r9, lr, r0
        add     r11, r7, r10, lsl #2
        str     r5, [sp, #0x10]
        str     r6, [sp, #8]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        str     r2, [sp]
LDLD2:
        ldr     r1, [r9, #-4]
        ldr     r5, [r9], #8
        ldr     r6, [r11]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r5
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        add     r10, r10, #1
        str     r0, [r11], #4
        cmp     r10, r8
        blt     LDLD2
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LDLD3:
        cmp     r8, #0
        ble     LDLD7
        sub     r9, r12, #4
        mov     r10, r7
        mov     r11, r8
        str     r6, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LDLD4:
        ldr     r6, [r10], #4
        mov     r1, r5
        mov     r0, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDLD5
        mov     r0, r6
        bl      __extendsfdf2
        mov     r3, r1
        mov     r12, #0xFE, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        b       LDLD6
LDLD5:
        mov     r0, r4
        bl      __extendsfdf2
LDLD6:
        str     r0, [r9, #4]
        str     r1, [r9, #8]!
        subs    r11, r11, #1
        bne     LDLD4
        ldr     r6, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LDLD7:
        ldr     r0, [r6, #8]
        sub     r2, r2, #4
        ldr     r1, [pc, #0x12C]
        ldr     r5, [r2, +r0, lsl #2]
        cmp     r8, #0
        ldrle   r4, [r1]
        ble     LDLD9
        ldr     r4, [r1]
        mov     r9, #0
        str     r3, [sp, #4]
LDLD8:
        ldr     r1, [r5]
        ldr     r10, [r5, #4]
        ldr     r11, [r7]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r7], #4
        ldr     r10, [r6, #0x18]
        add     r5, r5, #8
        ldr     r0, [r10, +r9, lsl #2]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        strlt   r4, [r10, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r8
        blt     LDLD8
        ldr     r3, [sp, #4]
LDLD9:
        cmp     r3, #0
        beq     LDLD11
        mov     r2, #1
        cmp     r8, #0
        str     r2, [r6, #0x4C]
        ble     LDLD11
        add     r5, r3, #4
LDLD10:
        ldr     r1, [r5, #-4]
        ldr     r9, [r5], #8
        mov     r0, r1
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        subs    r8, r8, #1
        mov     r4, r0
        bne     LDLD10
LDLD11:
        ldr     r0, [r6, #0x20]
        ldr     r7, [r6, #0x24]
        mov     r1, r7
        bl      __mulsf3
        ldr     r2, [pc, #0x3C]
        mov     r5, r0
        mov     r1, r7
        ldr     r0, [r2]
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r6, #0x20]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDLD12:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLD__2il0floatpacket.1
        .long   LDLD__2il0floatpacket.2


        .data
        .align  4


LDLD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLD__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


