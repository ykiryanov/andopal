        .text
        .align  4
        .globl  _ippsMaxEvery_16u_I


_ippsMaxEvery_16u_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        cmp     r0, #0
        beq     LBGC11
        cmp     r1, #0
        beq     LBGC11
        cmp     r2, #1
        blt     LBGC10
        cmp     r2, #8
        ble     LBGC5
        mov     r9, r2, asr #3
        cmp     r9, #0
        and     r8, r2, #7
        ble     LBGC1
        add     r3, r1, #6
        str     r3, [sp, #0x18]
        add     r3, r0, #6
        str     r3, [sp, #0x14]
        add     r3, r1, #8
        str     r3, [sp, #0x10]
        add     r3, r0, #8
        str     r3, [sp, #0xC]
        add     r3, r1, #0xA
        str     r3, [sp, #8]
        add     r3, r0, #0xA
        str     r3, [sp, #4]
        add     r3, r1, #0xC
        add     r7, r0, #4
        str     r3, [sp]
        add     r10, r0, #0xC
        mov     r11, r0
        add     r6, r1, #2
        add     r5, r0, #2
        add     r4, r1, #4
        add     lr, r1, #0xE
        add     r12, r0, #0xE
        mov     r3, r1
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x28]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x1C]
        ldr     r1, [sp]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #0x18]
        str     r11, [sp, #0x34]
        str     r10, [sp, #0x2C]
        str     r9, [sp, #0x30]
LBGC0:
        ldr     r9, [sp, #0x34]
        ldrh    r11, [r3]
        ldrh    r10, [r9], #0x10
        str     r9, [sp, #0x34]
        cmp     r10, r11
        movgt   r11, r10
        strh    r11, [r3], #0x10
        ldrh    r10, [r6]
        ldrh    r9, [r5], #0x10
        cmp     r9, r10
        movgt   r10, r9
        strh    r10, [r6], #0x10
        ldr     r9, [sp, #0x38]
        ldrh    r11, [r4]
        ldrh    r10, [r9], #0x10
        str     r9, [sp, #0x38]
        cmp     r10, r11
        movgt   r11, r10
        strh    r11, [r4], #0x10
        ldr     r9, [sp, #0x14]
        ldrh    r11, [r2]
        ldrh    r10, [r9], #0x10
        str     r9, [sp, #0x14]
        cmp     r10, r11
        movgt   r11, r10
        strh    r11, [r2], #0x10
        ldrh    r10, [r0]
        ldrh    r9, [r8], #0x10
        cmp     r9, r10
        movgt   r10, r9
        strh    r10, [r0], #0x10
        ldr     r10, [sp, #4]
        ldrh    r9, [r10], #0x10
        str     r10, [sp, #4]
        ldrh    r10, [r7]
        cmp     r9, r10
        movgt   r10, r9
        strh    r10, [r7], #0x10
        ldr     r10, [sp, #0x2C]
        ldrh    r9, [r10], #0x10
        str     r10, [sp, #0x2C]
        ldrh    r10, [r1]
        cmp     r9, r10
        movgt   r10, r9
        strh    r10, [r1], #0x10
        ldrh    r10, [lr]
        ldrh    r9, [r12], #0x10
        cmp     r9, r10
        movgt   r10, r9
        strh    r10, [lr], #0x10
        ldr     r9, [sp, #0x30]
        subs    r9, r9, #1
        str     r9, [sp, #0x30]
        bne     LBGC0
        ldr     r8, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x1C]
LBGC1:
        sub     r8, r2, r8
        cmp     r8, r2
        bge     LBGC9
        sub     r3, r2, r8
        cmp     r3, #6
        blt     LBGC3
        sub     lr, r2, #6
        add     r12, r0, r8, lsl #1
        add     r3, r1, r8, lsl #1
LBGC2:
        ldrh    r5, [r3]
        ldrh    r7, [r12]
        ldrh    r6, [r3, #2]
        ldrh    r4, [r3, #4]
        add     r8, r8, #5
        cmp     r7, r5
        movgt   r5, r7
        strh    r5, [r3]
        ldrh    r7, [r12, #2]
        ldrh    r5, [r3, #6]
        cmp     r7, r6
        movgt   r6, r7
        strh    r6, [r3, #2]
        ldrh    r7, [r12, #4]
        ldrh    r6, [r3, #8]
        cmp     r7, r4
        movgt   r4, r7
        strh    r4, [r3, #4]
        ldrh    r4, [r12, #6]
        cmp     r4, r5
        movgt   r5, r4
        strh    r5, [r3, #6]
        ldrh    r4, [r12, #8]
        add     r12, r12, #0xA
        cmp     r4, r6
        movgt   r6, r4
        strh    r6, [r3, #8]
        cmp     r8, lr
        add     r3, r3, #0xA
        ble     LBGC2
LBGC3:
        add     r0, r0, r8, lsl #1
        add     r1, r1, r8, lsl #1
LBGC4:
        ldrh    r12, [r1]
        ldrh    r3, [r0], #2
        add     r8, r8, #1
        cmp     r3, r12
        movgt   r12, r3
        strh    r12, [r1], #2
        cmp     r8, r2
        blt     LBGC4
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBGC5:
        cmp     r2, #6
        mov     r4, #0
        blt     LBGC7
        sub     lr, r2, #6
        mov     r12, r0
        mov     r3, r1
LBGC6:
        ldrh    r6, [r3]
        ldrh    r8, [r12]
        ldrh    r7, [r3, #2]
        ldrh    r5, [r3, #4]
        add     r4, r4, #5
        cmp     r8, r6
        movgt   r6, r8
        strh    r6, [r3]
        ldrh    r8, [r12, #2]
        ldrh    r6, [r3, #6]
        cmp     r8, r7
        movgt   r7, r8
        strh    r7, [r3, #2]
        ldrh    r8, [r12, #4]
        ldrh    r7, [r3, #8]
        cmp     r8, r5
        movgt   r5, r8
        strh    r5, [r3, #4]
        ldrh    r5, [r12, #6]
        cmp     r5, r6
        movgt   r6, r5
        strh    r6, [r3, #6]
        ldrh    r5, [r12, #8]
        add     r12, r12, #0xA
        cmp     r5, r7
        movgt   r7, r5
        strh    r7, [r3, #8]
        cmp     r4, lr
        add     r3, r3, #0xA
        ble     LBGC6
LBGC7:
        add     r0, r0, r4, lsl #1
        add     r1, r1, r4, lsl #1
LBGC8:
        ldrh    r3, [r1]
        ldrh    r12, [r0], #2
        add     r4, r4, #1
        cmp     r12, r3
        movgt   r3, r12
        strh    r3, [r1], #2
        cmp     r4, r2
        blt     LBGC8
LBGC9:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBGC10:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBGC11:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


