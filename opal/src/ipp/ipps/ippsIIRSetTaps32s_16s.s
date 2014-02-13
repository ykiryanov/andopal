        .text
        .align  4
        .globl  _ippsIIRSetTaps32s_16s


_ippsIIRSetTaps32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r9, r0
        cmp     r9, #0
        mov     r5, r1
        mov     r3, r2
        beq     LBNW12
        cmp     r5, #0
        beq     LBNW12
        ldr     r4, [r5]
        ldr     lr, [pc, #0x384]
        cmp     lr, r4
        beq     LBNW0
        add     r12, lr, #0xF7
        cmp     r12, r4
        beq     LBNW0
        mvn     r0, #0x10
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBNW0:
        cmp     lr, r4
        ldr     r4, [r5, #4]
        ldr     r8, [r5, #0x28]
        mvn     r10, #9
        bne     LBNW6
        add     r12, r9, #4
        ldr     r12, [r12, +r8, lsl #2]
        cmp     r12, #0
        bne     LBNW1
        mov     r0, r10
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBNW1:
        mov     r0, r9
        mov     lr, r8, lsl #1
        add     r12, lr, #2
        add     r9, lr, #1
        mov     r2, r12, lsl #1
        mov     r1, r4
        bl      _ippsConvert_32s32f_Sfs
        ldr     r3, [pc, #0x318]
        add     r7, r4, #4
        ldr     r1, [r7, +r8, lsl #2]
        ldr     r0, [r3]
        add     r10, r8, #1
        bl      __divsf3
        ldr     r1, [r4]
        mov     r6, r0
        bl      __mulsf3
        cmp     r10, #1
        str     r0, [r4]
        ble     LBNW5
        sub     r3, r8, #1
        add     r3, r3, #1
        cmp     r3, #5
        mov     r0, #1
        addlt   r11, r4, r8, lsl #2
        blt     LBNW3
        add     r11, r4, r8, lsl #2
        sub     r3, r8, #4
        add     r2, r8, #1
        add     r1, r4, #8
        str     r8, [sp, #4]
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x14]
        add     r10, r11, #8
        str     r11, [sp, #0xC]
        str     r3, [sp, #8]
        str     r9, [sp, #0x10]
        mov     r4, r0
        mov     r5, r1
        mov     r8, r2
LBNW2:
        ldr     r0, [r5, #-4]
        mov     r1, r6
        add     r4, r4, #4
        bl      __mulsf3
        str     r0, [r5, #-4]
        ldr     r0, [r7, +r8, lsl #2]
        mov     r1, r6
        mov     r11, r8, lsl #2
        bl      __mulsf3
        str     r0, [r10, #-4]
        ldr     r0, [r5]
        mov     r1, r6
        add     r8, r8, #4
        bl      __mulsf3
        str     r0, [r5]
        add     r3, r11, #4
        ldr     r0, [r7, +r3]
        mov     r1, r6
        add     r9, r11, #8
        bl      __mulsf3
        str     r0, [r10]
        ldr     r0, [r5, #4]
        mov     r1, r6
        add     r11, r11, #0xC
        bl      __mulsf3
        str     r0, [r5, #4]
        ldr     r0, [r7, +r9]
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r10, #4]
        ldr     r0, [r5, #8]
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r5, #8]
        ldr     r0, [r7, +r11]
        mov     r1, r6
        add     r5, r5, #0x10
        bl      __mulsf3
        ldr     r3, [sp, #8]
        str     r0, [r10, #8]
        cmp     r4, r3
        add     r10, r10, #0x10
        ble     LBNW2
        mov     r0, r4
        ldr     r11, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #4]
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x14]
LBNW3:
        add     r10, r8, #1
        add     r8, r0, r8
        str     r5, [sp, #0x14]
        add     r1, r4, r0, lsl #2
        str     r4, [sp, #0x18]
        mov     r5, r8
        mov     r4, r0
        mov     r8, r1
LBNW4:
        ldr     r0, [r8]
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r8], #4
        ldr     r0, [r7, +r5, lsl #2]
        mov     r1, r6
        bl      __mulsf3
        str     r0, [r11, +r4, lsl #2]
        add     r4, r4, #1
        cmp     r4, r10
        add     r5, r5, #1
        blt     LBNW4
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x14]
LBNW5:
        ldr     r1, [r5, #0xC]
        mov     r0, r4
        mov     r2, r9
        bl      ownsConvert32fTo16s
        b       LBNW9
LBNW6:
        add     r11, r8, r8, lsl #2
        add     r2, r8, r11
        mov     r1, r4
        mov     r0, r9
        bl      _ippsConvert_32s32f_Sfs
        cmp     r8, #0
        ble     LBNW8
        ldr     r3, [pc, #0x14C]
        mov     r1, #0
        mov     r7, r4
        add     r6, r9, #0xC
        mov     r0, r1
        mov     r12, r7
        str     r9, [sp]
        str     r8, [sp, #4]
        str     r12, [sp, #8]
        str     r11, [sp, #0xC]
        str     r10, [sp, #0x10]
        str     r5, [sp, #0x14]
        mov     r8, r0
        mov     r9, r1
LBNW7:
        ldr     r2, [r6], #0x18
        cmp     r2, #0
        beq     LBNW11
        ldr     r3, [sp]
        ldr     r2, [r3], #0x18
        str     r3, [sp]
        cmp     r2, #0
        beq     LBNW10
        ldr     r2, [pc, #0xF4]
        add     r10, r4, #4
        add     r11, r4, #8
        ldr     r0, [r2]
        add     r2, r4, #0xC
        str     r2, [sp, #0x1C]
        ldr     r1, [r2, +r8]
        bl      __divsf3
        ldr     r1, [r7], #0x18
        mov     r5, r0
        bl      __mulsf3
        ldr     r2, [sp, #8]
        mov     r1, r5
        str     r0, [r2], #0x14
        ldr     r0, [r10, +r8]
        str     r2, [sp, #8]
        bl      __mulsf3
        str     r0, [r10, +r9]
        ldr     r0, [r11, +r8]
        mov     r1, r5
        add     r10, r4, #0x10
        bl      __mulsf3
        str     r0, [r11, +r9]
        ldr     r0, [r10, +r8]
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x1C]
        mov     r1, r5
        str     r0, [r2, +r9]
        add     r2, r4, #0x14
        ldr     r0, [r2, +r8]
        add     r8, r8, #0x18
        bl      __mulsf3
        str     r0, [r10, +r9]
        ldr     r2, [sp, #4]
        add     r9, r9, #0x14
        subs    r2, r2, #1
        str     r2, [sp, #4]
        bne     LBNW7
        ldr     r11, [sp, #0xC]
        ldr     r5, [sp, #0x14]
LBNW8:
        ldr     r1, [r5, #0xC]
        mov     r0, r4
        mov     r2, r11
        bl      ownsConvert32fTo16s
LBNW9:
        add     r0, r0, #0xE
        str     r0, [r5, #0x30]
        mov     r10, #0
        mov     r0, r10
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBNW10:
        ldr     r10, [sp, #0x10]
        mov     r0, r10
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBNW11:
        ldr     r10, [sp, #0x10]
        mov     r0, r10
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBNW12:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493039
        .long   LBNW__2il0floatpacket.1


        .data
        .align  4


LBNW__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


