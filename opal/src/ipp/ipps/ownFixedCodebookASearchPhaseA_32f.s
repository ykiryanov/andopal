        .text
        .align  4
        .globl  ownFixedCodebookASearchPhaseA_32f


ownFixedCodebookASearchPhaseA_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     lr, [pc, #0x294]
        ldr     r7, [sp, #0x94]
        ldr     r12, [sp, #0x7C]
        ldr     r5, [lr]
        ldr     lr, [sp, #0x84]
        ldr     r4, [pc, #0x284]
        ldr     r8, [sp, #0x80]
        str     lr, [sp, #0x40]
        str     r5, [r7]
        ldr     r4, [r4]
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0x88]
        ldr     r10, [sp, #0x74]
        ldr     r11, [sp, #0x78]
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x8C]
        mov     r9, r0
        ldr     r0, [sp, #0x70]
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x90]
        str     r1, [sp, #0x30]
        ldr     r1, [pc, #0x248]
        str     r2, [sp, #0x1C]
        ldr     r2, [pc, #0x244]
        mov     r6, r3
        str     r6, [sp, #0x3C]
        ldr     r2, [r2]
        add     r11, r9, r11, lsl #5
        str     r2, [sp, #0x44]
        add     r2, r12, #2
        mov     r12, r12, lsl #1
        ldrsh   r12, [r1, +r12]
        add     r2, r9, r2, lsl #5
        mov     r1, r4
        str     r12, [sp, #0x28]
        ldr     r12, [r2, +r8, lsl #2]
        mov     r9, r11
        str     r12, [sp, #0x38]
        ldr     lr, [r2, +lr, lsl #2]
        str     lr, [sp, #0x2C]
        bl      __mulsf3
        str     r0, [sp, #0x34]
        mov     r0, r10
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [pc, #0x1F0]
        mov     r10, #0
        ldr     r2, [r2]
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #0x30]
        str     r11, [sp, #0x14]
        str     r2, [sp, #4]
        str     r0, [sp, #0x18]
        str     r4, [sp]
        str     r8, [sp, #0xC]
LDLT0:
        ldr     r0, [sp, #0x38]
        ldr     r1, [r9], #4
        bl      __addsf3
        ldr     r1, [r7]
        mov     r4, r0
        ldr     r0, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r6], #4
        ldr     r1, [sp]
        mov     r8, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #8]
        mov     r1, r5
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [sp, #4]
        bl      __gtsf2
        cmp     r0, #0
        ble     LDLT1
        ldr     r2, [sp, #0x1C]
        str     r4, [r2]
        ldr     r2, [sp, #0x10]
        str     r11, [r2]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0xC]
        str     r1, [r0]
        ldr     r0, [sp, #0x20]
        str     r10, [r0]
        ldr     r0, [sp, #8]
        ldr     r5, [r2]
        str     r0, [sp, #0x44]
LDLT1:
        ldr     r0, [sp, #0x28]
        add     r10, r10, #1
        cmp     r10, #8
        add     r7, r7, r0, lsl #2
        blt     LDLT0
        ldr     r11, [sp, #0x14]
        ldr     r2, [sp, #4]
        ldr     r0, [sp, #0x18]
        ldr     r4, [sp]
        ldr     r7, [sp, #0x10]
        str     r11, [sp, #0x14]
        ldr     r10, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        mov     r6, #0
        str     r2, [sp, #4]
        str     r0, [sp, #0x18]
        str     r4, [sp]
LDLT2:
        ldr     r2, [sp, #0x14]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [r2, +r6, lsl #2]
        bl      __addsf3
        ldr     r1, [r11]
        mov     r4, r0
        ldr     r0, [sp, #0x18]
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        ldr     r1, [sp]
        mov     r8, r0
        ldr     r2, [r2, +r6, lsl #2]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r9, r0
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #4]
        bl      __gtsf2
        cmp     r0, #0
        ble     LDLT3
        ldr     r2, [sp, #0x1C]
        mov     r10, r8
        str     r4, [r2]
        str     r9, [r7]
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x40]
        str     r2, [r1]
        ldr     r1, [sp, #0x20]
        str     r6, [r1]
LDLT3:
        ldr     r1, [sp, #0x28]
        add     r6, r6, #1
        cmp     r6, #8
        add     r11, r11, r1, lsl #2
        ldrlt   r5, [r7]
        blt     LDLT2
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDLT__2il0floatpacket.2
        .long   LDLT__2il0floatpacket.3
        .long   LDLT_steps.4080.0.0
        .long   LDLT__2il0floatpacket.1
        .long   LDLT__2il0floatpacket.4


        .data
        .align  4


LDLT__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0xBF
LDLT__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F
LDLT__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x3F
LDLT__2il0floatpacket.4:
        .byte   0x00,0x00,0x00,0x00
LDLT_steps.4080.0.0:
        .byte   0x01,0x00,0x08,0x00,0x08,0x00


