        .text
        .align  4
        .globl  _ippsIIROne_32f


_ippsIIROne_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r2, #0
        mov     r4, r0
        mov     r9, r1
        beq     LBQJ7
        cmp     r9, #0
        beq     LBQJ7
        ldr     r12, [r2]
        ldr     r3, [pc, #0x1E8]
        mov     r8, #0
        subs    r12, r12, r3
        beq     LBQJ4
        adds    r3, r12, #1
        beq     LBQJ0
        mvn     r0, #0x10
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBQJ0:
        ldr     r11, [r2, #4]
        ldr     r7, [r2, #0xC]
        ldr     r0, [r11]
        cmp     r7, #0
        beq     LBQJ2
        ldr     r10, [r2, #8]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r10]
        add     r6, r11, #4
        bl      __addsf3
        add     r2, r7, #1
        cmp     r7, #0
        mov     r5, r0
        add     r2, r11, r2, lsl #2
        ble     LBQJ3
        str     r9, [sp, #0x10]
        mov     r9, r8
        mov     r8, r7
        mov     r7, r6
        add     r11, r10, #4
        str     r4, [sp, #0x14]
        mov     r6, r2
LBQJ1:
        ldr     r1, [sp, #0x14]
        ldr     r0, [r7], #4
        add     r9, r9, #1
        bl      __mulsf3
        ldr     r2, [r6], #4
        mov     r4, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [r11], #4
        bl      __addsf3
        str     r0, [r10], #4
        cmp     r9, r8
        blt     LBQJ1
        ldr     r9, [sp, #0x10]
        b       LBQJ3
LBQJ2:
        mov     r1, r4
        bl      __mulsf3
        mov     r5, r0
LBQJ3:
        mov     r0, #0
        str     r5, [r9]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBQJ4:
        ldr     r3, [r2, #0xC]
        ldr     r11, [r2, #4]
        ldr     r6, [r2, #8]
        cmp     r3, #0
        ble     LBQJ6
        add     r12, r11, #4
        add     r2, r11, #0xC
        add     lr, r11, #0x10
        add     r10, r6, #4
        add     r7, r11, #8
        str     lr, [sp]
        str     r2, [sp, #4]
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r9, [sp, #0x10]
LBQJ5:
        ldr     r0, [r11], #0x14
        ldr     r5, [r6]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #8]
        mov     r5, r0
        ldr     r0, [r2], #0x14
        str     r2, [sp, #8]
        ldr     r9, [r10]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r9, r0
        mov     r1, r5
        ldr     r0, [r2], #0x14
        str     r2, [sp, #4]
        add     r8, r8, #2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [r6], #8
        ldr     r0, [r7], #0x14
        mov     r1, r4
        bl      __mulsf3
        ldr     r3, [sp]
        mov     r4, r0
        ldr     r2, [r3], #0x14
        str     r3, [sp]
        mov     r1, r5
        eor     r0, r2, #2, 2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r10], #8
        ldr     r2, [sp, #0xC]
        mov     r4, r5
        cmp     r8, r2
        blt     LBQJ5
        ldr     r9, [sp, #0x10]
LBQJ6:
        mov     r0, #0
        str     r5, [r9]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBQJ7:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493032


        .data
        .align  4


LBQJ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


