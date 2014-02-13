        .text
        .align  4
        .globl  _ippsSumWindow_16s32f


_ippsSumWindow_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [pc, #0x234]
        mov     r6, r0
        cmp     r6, #0
        ldr     r4, [r12]
        mov     r5, r1
        mov     r11, r2
        mov     r7, r3
        beq     LASI8
        cmp     r5, #0
        beq     LASI8
        cmp     r7, #0
        ble     LASI7
        cmp     r7, #6
        mov     r8, #0
        movlt   r9, r8
        blt     LASI1
        mov     r9, r8
        sub     r0, r7, #6
        mov     r10, r6
        str     r6, [sp]
        mov     r6, r0
LASI0:
        ldrsh   r0, [r10]
        add     r9, r9, #5
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        ldrsh   r1, [r10, #2]
        mov     r4, r0
        mov     r0, r1
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldrsh   r0, [r10, #4]
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldrsh   r0, [r10, #6]
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldrsh   r0, [r10, #8]
        add     r10, r10, #0xA
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r6
        mov     r4, r0
        ble     LASI0
        ldr     r6, [sp]
LASI1:
        add     r10, r6, r9, lsl #1
LASI2:
        ldrsh   r0, [r10], #2
        add     r9, r9, #1
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        cmp     r9, r7
        mov     r4, r0
        blt     LASI2
        cmp     r11, #0
        ble     LASI6
        cmp     r11, #5
        addlt   r7, r6, r7, lsl #1
        blt     LASI4
        add     r7, r6, r7, lsl #1
        sub     r3, r11, #5
        mov     r12, r5
        mov     r10, r7
        mov     r9, r6
        str     r12, [sp, #4]
        str     r3, [sp, #8]
        str     r11, [sp, #0xC]
LASI3:
        ldr     r2, [sp, #4]
        add     r11, r8, #1
        str     r4, [r2], #0x10
        str     r2, [sp, #4]
        ldrsh   r2, [r10], #8
        ldrsh   r3, [r9], #8
        sub     r0, r2, r3
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        str     r4, [r5, +r11, lsl #2]
        mov     r11, r11, lsl #1
        ldrsh   r2, [r7, +r11]
        ldrsh   r3, [r6, +r11]
        add     r11, r8, #2
        sub     r0, r2, r3
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        str     r4, [r5, +r11, lsl #2]
        mov     r11, r11, lsl #1
        ldrsh   r2, [r7, +r11]
        ldrsh   r3, [r6, +r11]
        sub     r0, r2, r3
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        add     r2, r8, #3
        mov     r4, r0
        str     r4, [r5, +r2, lsl #2]
        mov     r3, r2, lsl #1
        ldrsh   r2, [r7, +r3]
        ldrsh   r3, [r6, +r3]
        add     r8, r8, #4
        sub     r0, r2, r3
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #8]
        mov     r4, r0
        cmp     r8, r2
        ble     LASI3
        ldr     r11, [sp, #0xC]
LASI4:
        add     r6, r6, r8, lsl #1
        add     r5, r5, r8, lsl #2
        mov     r9, r8, lsl #1
LASI5:
        str     r4, [r5], #4
        ldrsh   r12, [r6], #2
        ldrsh   r3, [r7, +r9]
        add     r9, r9, #2
        sub     r0, r3, r12
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        add     r8, r8, #1
        cmp     r8, r11
        mov     r4, r0
        blt     LASI5
LASI6:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASI7:
        mvn     r0, #0x20
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASI8:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LASI__2il0floatpacket.1


        .data
        .align  4


LASI__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


