        .text
        .align  4
        .globl  _ippsSumWindow_8u32f


_ippsSumWindow_8u32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [pc, #0x210]
        mov     r7, r0
        cmp     r7, #0
        ldr     r4, [r12]
        mov     r6, r1
        mov     r5, r2
        mov     r9, r3
        beq     LASH8
        cmp     r6, #0
        beq     LASH8
        cmp     r9, #0
        ble     LASH7
        cmp     r9, #6
        mov     r8, #0
        movlt   r10, r8
        blt     LASH1
        mov     r10, r8
        sub     r0, r9, #6
        sub     r11, r7, #1
        str     r7, [sp]
        mov     r7, r0
LASH0:
        ldrb    r0, [r11, #1]
        add     r10, r10, #5
        bl      __floatunssisf
        mov     r1, r4
        bl      __addsf3
        ldrb    r1, [r11, #2]
        mov     r4, r0
        mov     r0, r1
        bl      __floatunssisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldrb    r0, [r11, #3]
        bl      __floatunssisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldrb    r0, [r11, #4]
        bl      __floatunssisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldrb    r0, [r11, #5]!
        bl      __floatunssisf
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r7
        mov     r4, r0
        ble     LASH0
        ldr     r7, [sp]
LASH1:
        add     r11, r10, r7
LASH2:
        ldrb    r0, [r11], #1
        add     r10, r10, #1
        bl      __floatunssisf
        mov     r1, r4
        bl      __addsf3
        cmp     r10, r9
        mov     r4, r0
        blt     LASH2
        cmp     r5, #0
        ble     LASH6
        cmp     r5, #5
        addlt   r9, r7, r9
        blt     LASH4
        add     r9, r7, r9
        sub     r1, r7, #1
        sub     r0, r5, #5
        add     r10, r6, #4
        str     r6, [sp, #4]
        str     r7, [sp]
        sub     r11, r9, #1
        mov     r7, r0
        mov     r6, r1
LASH3:
        str     r4, [r10, #-4]
        ldrb    r3, [r11, #1]
        ldrb    r12, [r6, #1]
        add     r8, r8, #4
        sub     r0, r3, r12
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        str     r4, [r10]
        ldrb    r3, [r11, #2]
        ldrb    r12, [r6, #2]
        sub     r0, r3, r12
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        str     r4, [r10, #4]
        ldrb    r3, [r11, #3]
        ldrb    r12, [r6, #3]
        sub     r0, r3, r12
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        str     r4, [r10, #8]
        ldrb    r3, [r11, #4]!
        ldrb    r12, [r6, #4]!
        add     r10, r10, #0x10
        sub     r0, r3, r12
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r7
        mov     r4, r0
        ble     LASH3
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LASH4:
        add     r6, r6, r8, lsl #2
        add     r7, r8, r7
LASH5:
        str     r4, [r6], #4
        ldrb    r3, [r9, +r8]
        ldrb    r12, [r7], #1
        add     r8, r8, #1
        sub     r0, r3, r12
        bl      __floatsisf
        mov     r1, r4
        bl      __addsf3
        cmp     r8, r5
        mov     r4, r0
        blt     LASH5
LASH6:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LASH7:
        mvn     r0, #0x20
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LASH8:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LASH__2il0floatpacket.1


        .data
        .align  4


LASH__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


