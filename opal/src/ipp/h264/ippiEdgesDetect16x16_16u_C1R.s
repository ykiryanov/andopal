        .text
        .align  4
        .globl  ippiEdgesDetect16x16_16u_C1R


ippiEdgesDetect16x16_16u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x2C]
        cmp     r0, #0
        mov     r1, r1, asr #1
        beq     LLCN6
        cmp     r6, #0
        beq     LLCN6
        mov     lr, r1
        mov     r5, #0
        mov     r4, r5
        mov     r12, #0xF
        str     r6, [sp]
LLCN0:
        add     r6, r0, r5, lsl #1
        add     r7, r0, lr, lsl #1
        mov     r9, r5
        mov     r8, #0xF
        str     r3, [sp, #4]
LLCN1:
        ldrh    r10, [r6], #2
        add     r3, r0, r9, lsl #1
        ldrh    r3, [r3, #2]
        ldrh    r11, [r7], #2
        sub     r3, r10, r3
        sub     r10, r10, r11
        eor     r11, r3, r3, asr #31
        sub     r3, r11, r3, asr #31
        eor     r11, r10, r10, asr #31
        cmp     r3, r2
        sub     r11, r11, r10, asr #31
        bgt     LLCN2
        cmp     r11, r2
        ble     LLCN3
LLCN2:
        add     r4, r4, #1
LLCN3:
        subs    r8, r8, #1
        add     r9, r9, #1
        bne     LLCN1
        ldr     r3, [sp, #4]
        cmp     r4, r3
        bgt     LLCN5
        subs    r12, r12, #1
        add     r5, r5, r1
        add     lr, lr, r1
        bne     LLCN0
        ldr     r6, [sp]
        mov     r0, #0
LLCN4:
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LLCN5:
        ldr     r6, [sp]
        mov     r0, #1
        b       LLCN4
LLCN6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


