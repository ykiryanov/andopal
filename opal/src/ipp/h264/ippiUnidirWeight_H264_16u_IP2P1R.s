        .text
        .align  4
        .globl  _ippiUnidirWeight_H264_16u_IP2P1R


_ippiUnidirWeight_H264_16u_IP2P1R:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x2C]
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r1, lr
        mvncc   r0, #0xD
        ldmccia sp!, {r4 - r10, pc}
        cmp     r12, #2
        beq     LLAM1
        cmp     r12, #4
        beq     LLAM1
        cmp     r12, #8
        beq     LLAM1
        cmp     r12, #0x10
        beq     LLAM1
LLAM0:
        mvn     r0, #5
        ldmia   sp!, {r4 - r10, pc}
LLAM1:
        cmp     lr, #2
        beq     LLAM2
        cmp     lr, #4
        beq     LLAM2
        cmp     lr, #8
        beq     LLAM2
        cmp     lr, #0x10
        bne     LLAM0
LLAM2:
        cmp     r2, #0
        mov     r7, #0
        mov     r8, #1
        movls   r6, #0
        subhi   r6, r2, #1
        movhi   r6, r8, lsl r6
        cmp     r12, #0
        bls     LLAM6
        mov     r5, r8, lsl r5
        sub     r5, r5, #1
LLAM3:
        cmp     lr, #0
        bls     LLAM5
        mov     r9, #0
        mov     r8, lr
LLAM4:
        ldrh    r10, [r0, +r9]
        mla     r10, r3, r10, r6
        add     r10, r4, r10, asr r2
        cmp     r5, r10
        movlt   r10, r5
        cmp     r10, #0
        movlt   r10, r7
        strh    r10, [r0, +r9]
        subs    r8, r8, #1
        add     r9, r9, #2
        bne     LLAM4
LLAM5:
        subs    r12, r12, #1
        add     r0, r0, r1, lsl #1
        bne     LLAM3
LLAM6:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


