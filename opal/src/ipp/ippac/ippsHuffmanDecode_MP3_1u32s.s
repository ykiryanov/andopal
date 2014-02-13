        .text
        .align  4
        .globl  _ippsHuffmanDecode_MP3_1u32s


_ippsHuffmanDecode_MP3_1u32s:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x24]
        ldr     r4, [sp, #0x20]
        ldr     r5, [pc, #0x18]
        str     r12, [sp]
        str     lr, [sp, #8]
        str     r4, [sp, #4]
        str     r5, [sp, #0xC]
        bl      ippsHuffmanDecodeSfb_MP3_1u32s
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
        .long   _ipp_pMP3SfbTableLong


