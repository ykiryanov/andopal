        .text
        .align  4
        .globl  _ippiSSD4x4_8u32s_C1R


_ippiSSD4x4_8u32s_C1R:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     r0, #0
        beq     LKER0
        cmp     r2, #0
        beq     LKER0
        cmp     lr, #0
        beq     LKER0
        str     lr, [sp]
        ldr     lr, [pc, #0x20]
        mov     r12, r12, asr #2
        ldr     r12, [lr, +r12, lsl #2]
        blx     r12
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LKER0:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        .long   LKER_ownvc_SSD4x4HP_8u32s_C1R


        .data
        .align  4


LKER_ownvc_SSD4x4HP_8u32s_C1R:
        .long   ownvc_SSD4x4_8u32s_C1R
        .long   ownvc_SSD4x4_8u32s_C1R_FH
        .long   ownvc_SSD4x4_8u32s_C1R_HF
        .long   ownvc_SSD4x4_8u32s_C1R_HH


