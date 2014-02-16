        .text
        .align  4
        .globl  ippiBidir_H264_16u_P2P1R


ippiBidir_H264_16u_P2P1R:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        beq     LLAP5
        ldr     r6, [r0]
        cmp     r6, #0
        beq     LLAP5
        ldr     r5, [r0, #8]
        cmp     r5, #0
        beq     LLAP5
        ldr     r4, [r0, #0x10]
        cmp     r4, #0
        beq     LLAP5
        ldr     r7, [r0, #0x18]
        cmp     r7, #2
        blt     LLAP4
        cmp     r7, #0x10
        bgt     LLAP4
        ldr     r1, [r0, #0x1C]
        cmp     r1, #2
        blt     LLAP4
        cmp     r1, #0x10
        bgt     LLAP4
        cmp     r1, #0
        ble     LLAP3
        mov     lr, #0
        mov     r12, lr
        mov     r3, #1
LLAP0:
        cmp     r7, #0
        ble     LLAP2
        mov     r2, #0
        mov     r1, r2
LLAP1:
        ldrh    r7, [r5, +r1]
        ldrh    r8, [r6, +r1]
        add     r2, r2, #1
        add     r7, r8, r7
        adds    r9, r7, #1
        mov     r8, r12
        movmi   r8, r3
        add     r8, r7, r8
        add     r7, r8, #1
        mov     r7, r7, asr #1
        strh    r7, [r4, +r1]
        ldr     r7, [r0, #0x18]
        add     r1, r1, #2
        cmp     r2, r7
        blt     LLAP1
        ldr     r1, [r0, #0x1C]
LLAP2:
        ldr     r8, [r0, #4]
        ldr     r2, [r0, #0xC]
        add     lr, lr, #1
        add     r6, r6, r8, lsl #1
        ldr     r8, [r0, #0x14]
        cmp     lr, r1
        add     r5, r5, r2, lsl #1
        add     r4, r4, r8, lsl #1
        blt     LLAP0
LLAP3:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LLAP4:
        mvn     r0, #5
        ldmia   sp!, {r4 - r9, pc}
LLAP5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


