        .text
        .align  4
        .globl  ownConvert_32s16s_sfs


ownConvert_32s16s_sfs:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r3, #0
        mov     r12, #0
        mov     lr, #4
        bne     LDNH5
        cmp     r2, #4
        blt     LDNH1
        add     r8, r1, #2
        add     r7, r0, #4
        add     r6, r1, #4
        add     r5, r0, #8
        add     r4, r1, #6
        add     r3, r0, #0xC
LDNH0:
        ldr     r10, [r0, +r12, lsl #2]
        mov     r9, r12, lsl #1
        strh    r10, [r1, +r9]
        ldr     r10, [r7, +r12, lsl #2]
        strh    r10, [r8, +r9]
        ldr     r10, [r5, +r12, lsl #2]
        strh    r10, [r6, +r9]
        ldr     r10, [r3, +r12, lsl #2]
        mov     r12, lr
        add     lr, lr, #4
        cmp     r2, lr
        strh    r10, [r4, +r9]
        bge     LDNH0
LDNH1:
        cmp     r12, r2
        bge     LDNH11
        sub     r3, r2, r12
        cmp     r3, #6
        blt     LDNH3
        sub     r4, r2, #6
        add     lr, r1, r12, lsl #1
        add     r3, r0, r12, lsl #2
LDNH2:
        ldr     r5, [r3], #0x14
        add     r6, r12, #1
        strh    r5, [lr], #0xA
        ldr     r5, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        strh    r5, [r1, +r6]
        add     r6, r12, #2
        ldr     r5, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        strh    r5, [r1, +r6]
        add     r5, r12, #3
        ldr     r6, [r0, +r5, lsl #2]
        mov     r7, r5, lsl #1
        add     r5, r12, #4
        strh    r6, [r1, +r7]
        ldr     r6, [r0, +r5, lsl #2]
        add     r12, r12, #5
        mov     r5, r5, lsl #1
        cmp     r12, r4
        strh    r6, [r1, +r5]
        ble     LDNH2
LDNH3:
        add     r1, r1, r12, lsl #1
        add     r0, r0, r12, lsl #2
LDNH4:
        ldr     r3, [r0], #4
        add     r12, r12, #1
        cmp     r12, r2
        strh    r3, [r1], #2
        blt     LDNH4
        ldmia   sp!, {r4 - r11, pc}
LDNH5:
        cmp     r3, #0
        ble     LDNH11
        cmp     r2, #4
        blt     LDNH7
        add     r9, r1, #2
        add     r8, r0, #4
        add     r7, r1, #4
        add     r6, r0, #8
        add     r5, r1, #6
        add     r4, r0, #0xC
LDNH6:
        ldr     r11, [r0, +r12, lsl #2]
        mov     r10, r12, lsl #1
        mov     r11, r11, asr r3
        strh    r11, [r1, +r10]
        ldr     r11, [r8, +r12, lsl #2]
        mov     r11, r11, asr r3
        strh    r11, [r9, +r10]
        ldr     r11, [r6, +r12, lsl #2]
        mov     r11, r11, asr r3
        strh    r11, [r7, +r10]
        ldr     r11, [r4, +r12, lsl #2]
        mov     r12, lr
        add     lr, lr, #4
        mov     r11, r11, asr r3
        cmp     r2, lr
        strh    r11, [r5, +r10]
        bge     LDNH6
LDNH7:
        cmp     r12, r2
        bge     LDNH11
        sub     lr, r2, r12
        cmp     lr, #6
        blt     LDNH9
        sub     r5, r2, #6
        add     r4, r1, r12, lsl #1
        add     lr, r0, r12, lsl #2
LDNH8:
        ldr     r6, [lr], #0x14
        mov     r6, r6, asr r3
        strh    r6, [r4], #0xA
        add     r6, r12, #1
        ldr     r7, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, asr r3
        strh    r7, [r1, +r6]
        add     r6, r12, #2
        ldr     r7, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, asr r3
        strh    r7, [r1, +r6]
        add     r6, r12, #3
        ldr     r7, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, asr r3
        strh    r7, [r1, +r6]
        add     r7, r12, #4
        ldr     r6, [r0, +r7, lsl #2]
        add     r12, r12, #5
        mov     r7, r7, lsl #1
        mov     r6, r6, asr r3
        cmp     r12, r5
        strh    r6, [r1, +r7]
        ble     LDNH8
LDNH9:
        add     r1, r1, r12, lsl #1
        add     r0, r0, r12, lsl #2
LDNH10:
        ldr     lr, [r0], #4
        add     r12, r12, #1
        mov     lr, lr, asr r3
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LDNH10
LDNH11:
        ldmia   sp!, {r4 - r11, pc}


