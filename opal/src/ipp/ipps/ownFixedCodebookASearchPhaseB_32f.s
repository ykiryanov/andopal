        .text
        .align  4
        .globl  ownFixedCodebookASearchPhaseB_32f


ownFixedCodebookASearchPhaseB_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x90
        ldr     r4, [sp, #0xB4]
        ldr     r10, [sp, #0xC0]
        add     lr, sp, #0x50
        str     r4, [sp, #0x44]
        ldr     r4, [sp, #0xB8]
        add     r12, sp, #0x50
        and     lr, lr, #0x1F
        str     r4, [sp, #0x34]
        ldr     r4, [sp, #0xBC]
        str     r0, [sp, #0x24]
        str     r4, [sp, #0x38]
        ldr     r4, [sp, #0xC4]
        ldr     r0, [sp, #0xCC]
        rsb     lr, lr, #0
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0xC8]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0xD0]
        and     lr, lr, #0x1F
        mov     r6, r1
        mov     r5, r2
        cmp     r10, #1
        str     r3, [sp, #0x18]
        str     r4, [sp, #0x4C]
        str     lr, [sp, #0x30]
        str     r0, [sp, #0x40]
        add     r9, r12, lr
        add     r11, r6, #2, 24
        add     r8, r5, #1, 24
        add     r7, r3, #0x20
        addne   r11, r6, #3, 24
        addne   r8, r5, #3, 24
        ldr     r0, [r7]
        ldr     r12, [pc, #0x364]
        add     r3, r8, r10, lsl #2
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x2C]
        ldr     r4, [r12]
        add     r3, r3, r10, lsl #2
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x28]
        mov     r1, r4
        add     r3, r3, r10, lsl #2
        str     r3, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [r11]
        ldr     r3, [sp, #0x20]
        add     r3, r3, r10, lsl #2
        str     r3, [sp, #0xC]
        bl      __addsf3
        ldr     r3, [sp, #0xC]
        ldr     r1, [r8]
        add     r3, r3, r10, lsl #2
        str     r3, [sp, #8]
        bl      __addsf3
        ldr     r1, [r11, #0x20]
        ldr     r3, [sp, #0x30]
        ldr     r8, [r8, +r10, lsl #2]
        add     r12, sp, #0x50
        str     r0, [r3, +r12]
        mov     r0, r1
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r7, #4]
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r3, [sp, #0x2C]
        ldr     r2, [r11, #0x40]
        ldr     r1, [r3, +r10, lsl #2]
        str     r0, [r9, #4]
        mov     r0, r2
        bl      __addsf3
        ldr     r2, [r7, #8]
        str     r0, [sp, #0x30]
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r3, [sp, #0x28]
        ldr     r1, [r11, #0x60]
        ldr     r2, [r3, +r10, lsl #2]
        str     r0, [r9, #8]
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        ldr     r2, [r7, #0xC]
        mov     r8, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r3, [sp, #0x20]
        ldr     r2, [r11, #0x80]
        ldr     r1, [r3, +r10, lsl #2]
        str     r0, [r9, #0xC]
        mov     r0, r2
        bl      __addsf3
        ldr     r2, [r7, #0x10]
        mov     r8, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r3, [sp, #0xC]
        ldr     r2, [r11, #0xA0]
        ldr     r1, [r3, +r10, lsl #2]
        str     r0, [r9, #0x10]
        mov     r0, r2
        bl      __addsf3
        ldr     r2, [r7, #0x14]
        mov     r8, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r3, [sp, #8]
        ldr     r2, [r11, #0xC0]
        ldr     r1, [r3, +r10, lsl #2]
        str     r0, [r9, #0x14]
        mov     r0, r2
        bl      __addsf3
        ldr     r2, [r7, #0x18]
        mov     r8, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r3, [sp, #8]
        ldr     r11, [r11, #0xE0]
        add     r3, r3, r10, lsl #2
        ldr     r1, [r3, +r10, lsl #2]
        str     r0, [r9, #0x18]
        mov     r0, r11
        mov     r8, #0
        bl      __addsf3
        ldr     r2, [r7, #0x1C]
        mov     r7, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [r9, #0x1C]
        ldr     r3, [sp, #0x24]
        str     r10, [sp]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        mov     r0, r8
        add     r7, r3, #0x20
        str     r0, [sp, #0xC]
        str     r9, [sp, #4]
LDLS0:
        ldr     r0, [sp, #0x38]
        ldr     r1, [r10], #4
        bl      __addsf3
        ldr     r1, [r6], #0x20
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [r5]
        ldr     r3, [sp]
        add     r5, r5, r3, lsl #2
        bl      __addsf3
        ldr     r2, [r11], #4
        mov     r9, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #4]
        mov     r9, r7
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x28]
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x48]
        ldr     r8, [sp, #0x44]
        mov     r2, #0
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x18]
        str     r0, [sp, #0x2C]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x14]
        mov     r10, r1
        mov     r11, r2
LDLS1:
        ldr     r1, [r9], #4
        ldr     r0, [sp, #8]
        bl      __addsf3
        ldr     r5, [r10], #4
        ldr     r1, [r8], #4
        mov     r4, r0
        ldr     r0, [sp, #0x2C]
        bl      __addsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r6]
        str     r0, [sp, #0x30]
        bl      __mulsf3
        ldr     r2, [r7]
        mov     r4, r0
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LDLS2
        ldr     r3, [sp, #0x30]
        str     r3, [r7]
        str     r5, [r6]
        ldr     r0, [sp, #0x28]
        ldr     r3, [sp, #0x3C]
        str     r0, [r3]
        ldr     r0, [sp, #0x4C]
        str     r11, [r0]
        mov     r0, #1
        str     r0, [sp, #0xC]
LDLS2:
        add     r11, r11, #1
        cmp     r11, #8
        blt     LDLS1
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x28]
        ldr     r10, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        add     r8, r8, #1
        cmp     r8, #8
        blt     LDLS0
        ldr     r0, [sp, #0xC]
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLS__2il0floatpacket.1


        .data
        .align  4


LDLS__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x3F


