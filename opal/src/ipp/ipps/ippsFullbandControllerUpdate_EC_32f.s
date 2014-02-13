        .text
        .align  4
        .globl  _ippsFullbandControllerUpdate_EC_32f


_ippsFullbandControllerUpdate_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r10, r0
        cmp     r10, #0
        mov     r7, r1
        mov     r9, r2
        beq     LDLK12
        cmp     r7, #0
        beq     LDLK12
        cmp     r9, #0
        beq     LDLK12
        cmp     r3, #0
        beq     LDLK12
        and     r12, r3, #0xF
        rsb     lr, r12, #0
        ldr     r12, [pc, #0x3CC]
        and     lr, lr, #0xF
        add     r8, r3, lr
        ldr     r11, [r8, #0x24]
        ldr     r5, [r12]
        mov     r6, #0
        cmp     r11, #0
        mov     r4, r5
        ble     LDLK3
        cmp     r11, #6
        movlt   r2, r6
        sublt   r12, r10, #4
        blt     LDLK1
        mvn     r12, #3
        str     r12, [sp]
        str     r8, [sp, #0x18]
        mov     r2, r6
        mvn     r3, #0
        mvn     r1, #1
        mvn     r0, #2
        sub     r12, r10, #4
        sub     lr, r11, #6
        str     r5, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r7, [sp, #4]
        mov     r8, r4
        str     lr, [sp, #0x20]
        str     r3, [sp, #0x24]
        str     r11, [sp, #0x1C]
        str     r9, [sp, #0x14]
        str     r10, [sp, #8]
        mov     r6, r0
        mov     r7, r1
        mov     r4, r2
        mov     r5, r12
LDLK0:
        rsb     r3, r4, #0
        ldr     r0, [r5, +r3, lsl #2]
        ldr     r3, [sp, #0x24]
        rsb     r10, r4, r7
        mov     r1, r0
        rsb     r9, r4, r3
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r5, +r9, lsl #2]
        ldr     r3, [sp]
        mov     r11, r0
        mov     r0, r1
        rsb     r8, r4, r3
        bl      __mulsf3
        rsb     r9, r4, r6
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r5, +r10, lsl #2]
        mov     r10, r0
        add     r4, r4, #5
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r5, +r9, lsl #2]
        mov     r9, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [r5, +r8, lsl #2]
        mov     r8, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r3, [sp, #0x20]
        mov     r8, r0
        cmp     r4, r3
        ble     LDLK0
        mov     r2, r4
        mov     r4, r8
        mov     r12, r5
        ldr     r5, [sp, #0x10]
        ldr     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #4]
        ldr     r10, [sp, #8]
LDLK1:
        str     r7, [sp, #4]
        str     r10, [sp, #8]
        mov     r7, r2
        mov     r10, r12
LDLK2:
        rsb     r3, r7, #0
        ldr     r1, [r10, +r3, lsl #2]
        add     r7, r7, #1
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        cmp     r7, r11
        mov     r4, r0
        blt     LDLK2
        ldr     r7, [sp, #4]
        ldr     r10, [sp, #8]
LDLK3:
        ldr     r1, [r8, #0x30]
        mov     r0, r4
        bl      __gtsf2
        mov     r3, #0xFE, 12
        orr     r3, r3, #3, 4
        cmp     r0, #0
        str     r3, [sp]
        ldrle   r0, [r8, #0x34]
        ble     LDLK4
        mov     r0, r4
        bl      __extendsfdf2
        mov     r3, r1
        ldr     r1, [sp]
        mov     r2, r0
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
LDLK4:
        str     r0, [r9]
        ldr     r0, [r8, #0x20]
        cmp     r0, #1
        ble     LDLK7
        rsb     r11, r11, #0
        sub     r3, r10, #4
        add     r10, r10, r11, lsl #2
        str     r6, [sp, #0xC]
        ldr     r6, [sp]
        add     r11, r9, #4
        mov     r0, #1
        str     r5, [sp, #0x10]
        add     r9, r3, #4
        add     r10, r10, #4
        str     r7, [sp, #4]
        mov     r5, r0
LDLK5:
        ldr     r1, [r9], #4
        ldr     r7, [r10], #4
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [r8, #0x30]
        mov     r4, r0
        bl      __gtsf2
        cmp     r0, #0
        ldrle   r0, [r8, #0x34]
        ble     LDLK6
        mov     r0, r4
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r6
        bl      __divdf3
        bl      __truncdfsf2
LDLK6:
        str     r0, [r11], #4
        ldr     r0, [r8, #0x20]
        add     r5, r5, #1
        cmp     r5, r0
        blt     LDLK5
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #4]
LDLK7:
        cmp     r0, #0
        ble     LDLK11
        cmp     r0, #6
        blt     LDLK9
        mov     r10, r5
        sub     r4, r0, #6
        add     r9, r7, #4
        mov     r5, r0
LDLK8:
        ldr     r1, [r9, #-4]
        add     r6, r6, #5
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r9]
        mov     r10, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r9, #4]
        mov     r10, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r9, #8]
        mov     r10, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r9, #0xC]
        mov     r10, r0
        add     r9, r9, #0x14
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        cmp     r6, r4
        mov     r10, r0
        ble     LDLK8
        mov     r0, r5
        mov     r5, r10
LDLK9:
        add     r7, r7, r6, lsl #2
        mov     r4, r0
LDLK10:
        ldr     r1, [r7], #4
        add     r6, r6, #1
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        cmp     r6, r4
        mov     r5, r0
        blt     LDLK10
LDLK11:
        ldr     r0, [r8, #0x10]
        ldr     r6, [r8, #0x14]
        mov     r1, r6
        bl      __mulsf3
        ldr     r2, [pc, #0x3C]
        mov     r4, r0
        mov     r1, r6
        ldr     r0, [r2]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8, #0x10]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDLK12:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLK__2il0floatpacket.1
        .long   LDLK__2il0floatpacket.2


        .data
        .align  4


LDLK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDLK__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


