        .text
        .align  4
        .globl  ippiInterpolateLuma_H264_8u_C1R


ippiInterpolateLuma_H264_8u_C1R:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0x44
        ldr     lr, [sp, #0x5C]
        ldr     r12, [sp, #0x60]
        cmp     r0, #0
        mov     r4, r3
        beq     LKZQ2
        cmp     r2, #0
        beq     LKZQ2
        orr     r5, lr, r12
        cmp     r5, #3
        bhi     LKZQ1
        ldr     r5, [sp, #0x64]
        ldr     r6, [sp, #0x68]
        bic     r8, r5, #0x1C
        and     r7, r6, #3
        orrs    r8, r7, r8
        beq     LKZQ0
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r8, pc}
LKZQ0:
        str     r2, [sp, #8]
        ldr     r2, [pc, #0x48]
        orr     r12, lr, r12, lsl #2
        str     r0, [sp]
        ldr     r12, [r2, +r12, lsl #2]
        mov     r3, sp
        str     r1, [sp, #4]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x18]
        str     r6, [sp, #0x1C]
        mov     r0, r3
        blx     r12
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r8, pc}
LKZQ1:
        mvn     r0, #4
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r8, pc}
LKZQ2:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r8, pc}
        .long   h264_interpolate_luma_type_table_8u_pxmx


