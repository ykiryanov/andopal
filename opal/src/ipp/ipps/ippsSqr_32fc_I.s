        .text
        .align  4
        .globl  _ippsSqr_32fc_I


_ippsSqr_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        mov     r9, r1
        beq     LAWN5
        cmp     r9, #0
        ble     LAWN4
        cmp     r9, #4
        mov     r8, #0
        blt     LAWN1
        ldr     r2, [pc, #0x24C]
        add     r7, r0, #8
        add     r6, r0, #0x10
        ldr     r4, [r2]
        mov     r2, #4
        add     r5, r0, #0x18
        str     r2, [sp, #4]
        str     r9, [sp]
        str     r0, [sp, #8]
LAWN0:
        ldr     r2, [sp, #8]
        add     r9, r7, r8, lsl #3
        ldr     r11, [r2, +r8, lsl #3]
        add     r2, r2, r8, lsl #3
        str     r2, [sp, #0xC]
        ldr     r10, [r2, #4]
        mov     r0, r11
        add     r2, r6, r8, lsl #3
        str     r2, [sp, #0x10]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x14]
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x18]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        bl      __mulsf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        str     r2, [r3, #4]
        ldr     r2, [sp, #8]
        str     r0, [r2, +r8, lsl #3]
        ldr     r11, [r9, #4]
        ldr     r10, [r7, +r8, lsl #3]
        add     r2, r5, r8, lsl #3
        str     r2, [sp, #0x18]
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x14]
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        str     r0, [sp, #0xC]
        mov     r0, r10
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        bl      __mulsf3
        ldr     r2, [sp, #0x14]
        str     r0, [r7, +r8, lsl #3]
        str     r2, [r9, #4]
        ldr     r0, [sp, #0x10]
        ldr     r10, [r6, +r8, lsl #3]
        ldr     r9, [r0, #4]
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x14]
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        bl      __mulsf3
        ldr     r2, [sp, #0x10]
        str     r0, [r6, +r8, lsl #3]
        str     r11, [r2, #4]
        ldr     r0, [sp, #0x18]
        ldr     r10, [r5, +r8, lsl #3]
        ldr     r9, [r0, #4]
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x14]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        mov     r1, r11
        bl      __mulsf3
        str     r0, [r5, +r8, lsl #3]
        ldr     r2, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        str     r0, [r2, #4]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        mov     r8, r2
        add     r2, r2, #4
        cmp     r0, r2
        str     r2, [sp, #4]
        bge     LAWN0
        ldr     r9, [sp]
        ldr     r0, [sp, #8]
LAWN1:
        cmp     r8, r9
        bge     LAWN3
        ldr     r3, [pc, #0x88]
        mov     r2, r8, lsl #3
        sub     r2, r2, #4
        ldr     r7, [r3]
        add     r11, r2, r0
LAWN2:
        ldr     r4, [r11, #8]
        ldr     r5, [r11, #4]
        add     r8, r8, #1
        mov     r1, r4
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r5
        mov     r1, r4
        bl      __subsf3
        mov     r6, r0
        mov     r0, r5
        mov     r1, r4
        bl      __addsf3
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r11, #4]
        str     r10, [r11, #8]!
        cmp     r8, r9
        blt     LAWN2
LAWN3:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWN4:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWN5:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LAWN__2il0floatpacket.1


        .data
        .align  4


LAWN__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x40


