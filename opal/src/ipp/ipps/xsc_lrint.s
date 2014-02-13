        .text
        .align  4
        .globl  lrint


lrint:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x10
        str     r0, [sp, #8]
        mov     r2, #0xFF
        orr     r2, r2, #3, 24
        str     r1, [sp, #0xC]
        add     r3, r2, #1, 22
        and     r3, r3, r1, lsr #20
        subs    r2, r3, r2
        bmi     LABM6
        mvn     r3, #0xE2, 12
        bic     r3, r3, #0xB, 4
        cmp     r1, r3
        mov     r3, #0xFE, 12
        orr     r3, r3, #0xF, 4
        cmpeq   r0, r3
        bcc     LABM0
        mvn     r3, #2, 2
        bics    r12, r1, r3
        beq     LABM2
        mov     r12, r3, lsl #21
        sub     r12, r12, #0x3E, 8
        cmp     r1, r12
        mov     r12, #0
        cmpeq   r0, r12
        bhi     LABM2
LABM0:
        mov     r3, r1, lsl #11
        orr     r3, r3, #2, 2
        orr     r12, r3, r0, lsr #21
        mov     r3, r0, lsl #11
        rsb     r0, r2, #0x1F
        add     r2, r2, #1
        mov     r0, r12, lsr r0
        mov     r12, r12, lsl r2
        rsb     r2, r3, #0
        orr     r3, r3, r2
        and     r2, r0, #1
        orr     r3, r2, r3, lsr #31
        orr     r12, r3, r12, lsr #1
        rsb     r2, r12, #1, 2
        add     r2, r0, r2, lsr #31
LABM1:
        eor     r0, r2, r1, asr #31
        sub     r0, r0, r1, asr #31
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LABM2:
        eor     r3, r3, r1, asr #31
        mov     r1, r1, lsl #1
        cmn     r1, #2, 12
        bcs     LABM4
LABM3:
        mov     r2, sp
        add     r1, sp, #8
        add     r0, sp, #8
        str     r3, [sp]
        mov     r3, #0xB8
        bl      __libm_error_support
        ldr     r3, [sp]
        mov     r0, r3
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LABM4:
        cmn     r1, #2, 12
        bne     LABM5
        cmp     r0, #0
        beq     LABM3
LABM5:
        mov     r0, r3
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LABM6:
        rsb     r2, r0, #0
        orr     r0, r0, r2
        mov     r2, #0xFF, 10
        orr     r2, r2, #1, 2
        orr     r0, r1, r0, lsr #31
        sub     r2, r2, r0, lsl #1
        mov     r2, r2, lsr #31
        b       LABM1


