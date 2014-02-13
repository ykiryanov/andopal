        .text
        .align  4
        .globl  ilogb


ilogb:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x10
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mvn     r2, #2, 2
        mov     r3, #0xFF
        and     r2, r1, r2
        orr     r12, r3, #7, 24
        orr     r1, r3, #3, 24
        and     r3, r2, r12, lsl #20
        mvn     r12, #0xFF, 12
        bic     r12, r12, #0xF, 4
        add     lr, r1, #1, 22
        cmp     lr, r3, lsr #20
        and     r12, r2, r12
        beq     LACH4
        cmp     r2, #0
        bne     LACH0
        cmp     r0, #0
        bne     LACH0
        add     r0, sp, #8
        mov     r2, sp
        add     r1, sp, #8
        mov     r12, #2, 2
        str     r12, [sp]
        mov     r3, #0x9D
        bl      __libm_error_support
        ldr     r0, [sp]
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LACH0:
        rsb     r2, r1, r3, lsr #20
        rsb     r1, r1, #0
        cmp     r1, r2
        beq     LACH2
LACH1:
        mov     r0, r2
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LACH2:
        cmp     r12, #0
        bne     LACH3
        cmp     r0, #0
        beq     LACH1
LACH3:
        clz     r12, r12
        cmp     r12, #0x20
        clzeq   r0, r0
        addeq   r12, r0, #0x14
        subne   r12, r12, #0xC
        sub     r2, r2, r12
        mov     r0, r2
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LACH4:
        mvn     r0, #2, 2
        add     sp, sp, #0x10
        ldr     pc, [sp], #4


