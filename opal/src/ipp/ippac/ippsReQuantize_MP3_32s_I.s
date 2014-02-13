        .text
        .align  4
        .globl  _ippsReQuantize_MP3_32s_I


_ippsReQuantize_MP3_32s_I:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     lr, [pc, #0x1C]
        ldr     r5, [pc, #0x1C]
        str     r12, [sp]
        str     lr, [sp, #0xC]
        str     r4, [sp, #4]
        str     r5, [sp, #8]
        bl      ippsReQuantizeSfb_MP3_32s_I
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
        .long   _ipp_pMP3SfbTableShort
        .long   _ipp_pMP3SfbTableLong


