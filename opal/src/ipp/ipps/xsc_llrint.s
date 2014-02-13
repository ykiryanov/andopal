        .text
        .align  4
        .globl  llrint


llrint:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        str     r0, [sp, #8]
        mov     r2, #0xFF
        orr     r2, r2, #3, 24
        str     r1, [sp, #0xC]
        add     r3, r2, #1, 22
        and     r3, r3, r1, lsr #20
        sub     r2, r3, r2
        cmp     r2, #0x1F
        mov     r3, #0
        bcs     LACA0
        mov     r12, r1, lsl #11
        orr     r12, r12, #2, 2
        orr     r12, r12, r0, lsr #21
        mov     lr, r0, lsl #11
        rsb     r0, r2, #0x1F
        mov     r0, r12, lsr r0
        add     r2, r2, #1
        rsb     r4, lr, #0
        mov     r12, r12, lsl r2
        orr     lr, lr, r4
        and     r2, r0, #1
        orr     lr, r2, lr, lsr #31
        orr     r12, lr, r12, lsr #1
        rsb     r2, r12, #1, 2
        add     r0, r0, r2, lsr #31
        b       LACA3
LACA0:
        cmp     r2, #0x34
        bcs     LACA1
        mov     r12, r1, lsl #12
        sub     r3, r2, #0x14
        mov     r12, r12, lsr #12
        rsb     lr, r2, #0x34
        orr     r12, r12, #1, 12
        mov     r2, r12, lsl r3
        mov     r3, r0, lsl r3
        orr     r2, r2, r0, lsr lr
        and     r0, r2, #1
        orr     r3, r0, r3, lsr #1
        rsb     r0, r3, #1, 2
        mov     lr, r12, lsr lr
        adds    r0, r2, r0, lsr #31
        adc     r3, lr, #0
        b       LACA3
LACA1:
        cmp     r2, #0x3F
        bcs     LACA2
        mov     r3, r1, lsl #11
        orr     r3, r3, #2, 2
        sub     r12, r2, #0x34
        orr     r3, r3, r0, lsr #21
        rsb     r2, r2, #0x3F
        mov     r0, r0, lsl r12
        mov     r3, r3, lsr r2
        b       LACA3
LACA2:
        cmp     r2, #1, 22
        bls     LACA4
        rsb     r2, r0, #0
        orr     r0, r0, r2
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        orr     r0, r1, r0, lsr #31
        sub     r2, r2, r0, lsl #1
        mov     r0, r2, lsr #31
LACA3:
        mov     r1, r1, asr #31
        eor     r0, r0, r1
        subs    r0, r0, r1
        eor     r3, r3, r1, asr #31
        sbc     r1, r3, r1, asr #31
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LACA4:
        mov     r2, #0x3E, 12
        orr     r2, r2, #3, 2
        cmp     r1, r2
        cmpeq   r0, r3
        mov     r2, r1, asr #31
        mvn     r3, #2, 2
        eor     r3, r2, r3
        mvn     r2, r2
        beq     LACA8
        mov     r1, r1, lsl #1
        cmn     r1, #2, 12
        bcs     LACA6
LACA5:
        str     r2, [sp]
        add     r1, sp, #8
        add     r0, sp, #8
        str     r3, [sp, #4]
        mov     r4, sp
        mov     r2, r4
        mov     r3, #0xBB
        bl      __libm_error_support
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        b       LACA7
LACA6:
        cmn     r1, #2, 12
        bne     LACA7
        cmp     r0, #0
        beq     LACA5
LACA7:
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
LACA8:
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}


