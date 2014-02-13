        .text
        .align  4
        .globl  _ippsWTHaarFwd_32f


_ippsWTHaarFwd_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r0, #0
        beq     LAJP5
        cmp     r2, #0
        beq     LAJP5
        cmp     r3, #0
        beq     LAJP5
        cmp     r1, #0
        ble     LAJP6
        sub     r11, r1, #1
        cmp     r11, #0
        mov     r7, #0
        movle   r6, r7
        ble     LAJP3
        ldr     r12, [pc, #0x184]
        sub     lr, r1, #1
        cmp     lr, #8
        blt     LAJP4
        ldr     r4, [r12]
        add     r8, r0, #4
        sub     lr, r1, #9
        add     r12, r3, #4
        str     r8, [sp, #0x14]
        str     r11, [sp, #0x10]
        mov     r6, r7
        add     r10, r2, #4
        add     r9, r0, #0xC
        add     r5, r0, #8
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r8, r12
        mov     r11, lr
LAJP0:
        ldr     r1, [r5, #-8]
        ldr     r0, [r9, #-8]
        add     r6, r6, #3
        add     r7, r7, #6
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r8, #-4]
        ldr     r1, [r5, #-8]
        bl      __addsf3
        str     r0, [r10, #-4]
        ldr     r0, [r9]
        ldr     r1, [r5]
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r8]
        ldr     r1, [r5]
        bl      __addsf3
        str     r0, [r10]
        ldr     r0, [r9, #8]
        ldr     r1, [r5, #8]
        add     r9, r9, #0x18
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r8, #4]
        ldr     r1, [r5, #8]
        add     r8, r8, #0xC
        bl      __addsf3
        str     r0, [r10, #4]
        cmp     r7, r11
        add     r5, r5, #0x18
        add     r10, r10, #0xC
        ble     LAJP0
        ldr     r8, [sp, #0x14]
        ldr     r11, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAJP1:
        add     r5, r3, r6, lsl #2
        add     r10, r2, r6, lsl #2
        add     r9, r0, r7, lsl #2
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LAJP2:
        ldr     r0, [r8, +r7, lsl #2]
        ldr     r1, [r9]
        add     r6, r6, #1
        add     r7, r7, #2
        bl      __subsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r5], #4
        ldr     r1, [r9], #8
        bl      __addsf3
        str     r0, [r10], #4
        cmp     r7, r11
        blt     LAJP2
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAJP3:
        tst     r1, #1
        ldrne   r7, [r0, +r7, lsl #2]
        strne   r7, [r2, +r6, lsl #2]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJP4:
        ldr     r4, [r12]
        mov     r6, r7
        add     r8, r0, #4
        b       LAJP1
LAJP5:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJP6:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LAJP__2il0floatpacket.1


        .data
        .align  4


LAJP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x3F


