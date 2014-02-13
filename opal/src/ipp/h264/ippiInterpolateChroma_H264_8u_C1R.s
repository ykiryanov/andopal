        .text
        .align  4
        .globl  _ippiInterpolateChroma_H264_8u_C1R


_ippiInterpolateChroma_H264_8u_C1R:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x44
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        mov     r4, r0
        cmp     r4, #0
        beq     LLAF2
        cmp     r2, #0
        beq     LLAF2
        orr     r5, lr, r12
        cmp     r5, #7
        bhi     LLAF1
        ldr     r6, [sp, #0x68]
        ldr     r7, [sp, #0x6C]
        bic     r8, r6, #0xE
        and     r5, r7, #1
        orrs    r8, r5, r8
        bne     LLAF0
        cmp     r12, #0
        mov     r5, #1
        moveq   r8, #0
        movne   r8, r5
        cmp     lr, #0
        moveq   r5, #0
        str     r1, [sp, #4]
        ldr     r1, [pc, #0x58]
        orr     r5, r5, r8, lsl #1
        mov     r0, sp
        ldr     r5, [r1, +r5, lsl #2]
        str     r2, [sp, #8]
        str     r3, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r4, [sp]
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x1C]
        blx     r5
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r9, pc}
LLAF0:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r9, pc}
LLAF1:
        mvn     r0, #4
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r9, pc}
LLAF2:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r9, pc}
        .long   h264_interpolate_chroma_type_table_8u_pxmx


