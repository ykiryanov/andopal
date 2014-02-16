        .text
        .align  4
        .globl  ippiBidirWeight_H264_16u_P2P1R


ippiBidirWeight_H264_16u_P2P1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        cmp     r0, #0
        beq     LLAQ8
        ldr     r10, [r0]
        cmp     r10, #0
        beq     LLAQ8
        ldr     r9, [r0, #8]
        cmp     r9, #0
        beq     LLAQ8
        ldr     r8, [r0, #0x10]
        cmp     r8, #0
        beq     LLAQ8
        ldr     r7, [r0, #4]
        ldr     r6, [r0, #0x18]
        cmp     r7, r6
        blt     LLAQ1
        ldr     r5, [r0, #0xC]
        cmp     r5, r6
        blt     LLAQ1
        ldr     r4, [r0, #0x14]
        cmp     r4, r6
        str     r4, [sp, #8]
        blt     LLAQ1
        ldr     r4, [r0, #0x1C]
        cmp     r4, #2
        beq     LLAQ2
        cmp     r4, #4
        beq     LLAQ2
        cmp     r4, #8
        beq     LLAQ2
        cmp     r4, #0x10
        beq     LLAQ2
LLAQ0:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLAQ1:
        mvn     r0, #0xD
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLAQ2:
        cmp     r6, #2
        beq     LLAQ3
        cmp     r6, #4
        beq     LLAQ3
        cmp     r6, #8
        beq     LLAQ3
        cmp     r6, #0x10
        bne     LLAQ0
LLAQ3:
        mov     r11, #1
        mov     r11, r11, lsl r1
        cmp     r4, #0
        str     r11, [sp, #4]
        ble     LLAQ7
        mov     r11, #1
        ldr     r11, [sp, #8]
        add     r3, r3, r12
        mov     r12, #0
        add     r3, r3, #1
        add     r1, r1, #1
LLAQ4:
        cmp     r6, #0
        ble     LLAQ6
        mov     r5, #0
        mov     r4, r5
        str     r12, [sp]
LLAQ5:
        ldr     r12, [sp, #4]
        ldrh    r11, [r10, +r5]
        ldrh    r6, [r9, +r5]
        ldr     r7, [r0, #0x20]
        mla     r12, r2, r11, r12
        mov     r11, #1
        mov     r7, r11, lsl r7
        sub     r7, r7, #1
        mla     r12, lr, r6, r12
        mov     r12, r12, asr r1
        add     r12, r12, r3, asr #1
        cmp     r12, r7
        movgt   r12, r7
        cmp     r12, #0
        movlt   r12, #0
        strh    r12, [r8, +r5]
        ldr     r6, [r0, #0x18]
        add     r4, r4, #1
        add     r5, r5, #2
        cmp     r4, r6
        blt     LLAQ5
        ldr     r12, [sp]
        ldr     r7, [r0, #4]
        ldr     r5, [r0, #0xC]
        ldr     r11, [r0, #0x14]
        ldr     r4, [r0, #0x1C]
LLAQ6:
        add     r12, r12, #1
        cmp     r12, r4
        add     r10, r10, r7, lsl #1
        add     r9, r9, r5, lsl #1
        add     r8, r8, r11, lsl #1
        blt     LLAQ4
LLAQ7:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLAQ8:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


