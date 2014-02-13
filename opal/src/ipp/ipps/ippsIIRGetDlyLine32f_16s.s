        .text
        .align  4
        .globl  _ippsIIRGetDlyLine32f_16s


_ippsIIRGetDlyLine32f_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LBRU5
        cmp     r4, #0
        beq     LBRU5
        ldr     r3, [pc, #0x14C]
        ldr     r12, [r5]
        sub     r2, r3, #1
        cmp     r2, r12
        beq     LBRU0
        cmp     r3, r12
        beq     LBRU0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBRU0:
        ldr     r8, [r5, #0x28]
        cmp     r3, r12
        moveq   r8, r8, lsl #1
        cmp     r8, #0
        ble     LBRU4
        cmp     r8, #6
        mov     r6, #0
        movlt   r7, r6
        blt     LBRU2
        mov     r7, r6
        sub     r2, r8, #6
        mov     r3, r4
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r8, [sp]
LBRU1:
        ldr     r2, [r5, #0x10]
        add     r8, r7, #1
        add     r9, r7, #2
        ldr     r0, [r2, +r7, lsl #3]
        add     r2, r2, r6
        ldr     r1, [r2, #4]
        add     r6, r6, #0x28
        add     r10, r7, #3
        bl      __floatdisf
        ldr     r3, [sp, #8]
        add     r11, r7, #4
        add     r7, r7, #5
        str     r0, [r3], #0x14
        ldr     r2, [r5, #0x10]
        str     r3, [sp, #8]
        ldr     r0, [r2, +r8, lsl #3]
        add     r2, r2, r8, lsl #3
        ldr     r1, [r2, #4]
        bl      __floatdisf
        str     r0, [r4, +r8, lsl #2]
        ldr     r2, [r5, #0x10]
        add     r3, r2, r9, lsl #3
        ldr     r1, [r3, #4]
        ldr     r0, [r2, +r9, lsl #3]
        bl      __floatdisf
        str     r0, [r4, +r9, lsl #2]
        ldr     r2, [r5, #0x10]
        add     r3, r2, r10, lsl #3
        ldr     r1, [r3, #4]
        ldr     r0, [r2, +r10, lsl #3]
        bl      __floatdisf
        str     r0, [r4, +r10, lsl #2]
        ldr     r2, [r5, #0x10]
        add     r3, r2, r11, lsl #3
        ldr     r1, [r3, #4]
        ldr     r0, [r2, +r11, lsl #3]
        bl      __floatdisf
        ldr     r2, [sp, #4]
        str     r0, [r4, +r11, lsl #2]
        cmp     r7, r2
        ble     LBRU1
        ldr     r8, [sp]
LBRU2:
        add     r4, r4, r7, lsl #2
        mov     r6, r7, lsl #3
LBRU3:
        ldr     r2, [r5, #0x10]
        add     r1, r2, r6
        ldr     r1, [r1, #4]
        ldr     r0, [r2, +r7, lsl #3]
        add     r6, r6, #8
        add     r7, r7, #1
        bl      __floatdisf
        str     r0, [r4], #4
        cmp     r7, r8
        blt     LBRU3
LBRU4:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBRU5:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493036


