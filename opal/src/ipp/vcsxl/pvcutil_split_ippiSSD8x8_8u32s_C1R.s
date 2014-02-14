        .text
        .align  4
        .globl  ippiSSD8x8_8u32s_C1R


ippiSSD8x8_8u32s_C1R:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     r0, #0
        beq     LEFK0
        cmp     r2, #0
        beq     LEFK0
        cmp     lr, #0
        beq     LEFK0
        str     lr, [sp]
        ldr     lr, [pc, #0x20]
        mov     r12, r12, asr #2
        ldr     r12, [lr, +r12, lsl #2]
        blx     r12
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LEFK0:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        .long   LEFK_ownvc_SSD8x8HP_8u32s_C1R


        .data
        .align  4


LEFK_ownvc_SSD8x8HP_8u32s_C1R:
        .long   ownvc_SSD8x8_8u32s_C1R
        .long   ownvc_SSD8x8_8u32s_C1R_FH
        .long   ownvc_SSD8x8_8u32s_C1R_HF
        .long   ownvc_SSD8x8_8u32s_C1R_HH


